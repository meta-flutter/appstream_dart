import 'dart:io';

import 'package:appstream/appstream.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

/// Manages fetching, importing, and querying the Flathub catalog.
class CatalogService extends ChangeNotifier {
  static const _flathubUrls = [
    'https://dl.flathub.org/repo/appstream/x86_64/appstream.xml.gz',
    'https://flathub.org/repo/appstream/x86_64/appstream.xml.gz',
  ];

  static const _maxCacheAge = Duration(hours: 24);

  CatalogDatabase? _db;
  late final String _dataDir;

  /// Active display locale. Null means use system default (no translation).
  String? _locale;

  /// Available translation languages in the database.
  List<String> availableLanguages = [];

  /// Get/set the active locale. Setting notifies listeners to rebuild.
  String? get locale => _locale;
  set locale(String? value) {
    if (_locale != value) {
      _locale = value;
      notifyListeners();
    }
  }

  /// Resolve the effective locale.
  /// Returns null when "Auto (System)" is selected — meaning show all
  /// components with translations applied opportunistically from the
  /// system locale, but no filtering.
  /// Returns a language code only when the user explicitly picks one
  /// from the language picker.
  String? get effectiveLocale => _locale;

  /// The system locale for applying translations (without filtering).
  /// Used to display translated fields when available, even in "Auto" mode.
  String? get displayLocale {
    if (_locale != null) return _locale;
    final sys = Platform.localeName.split('.').first.replaceAll('_', '-');
    if (availableLanguages.contains(sys)) return sys;
    final base = sys.contains('-') ? sys.split('-').first : sys;
    if (availableLanguages.contains(base)) return base;
    return null;
  }

  /// Load available languages from the database.
  Future<void> loadAvailableLanguages() async {
    try {
      final langs = await db.listTranslationLanguages(limit: 500);
      availableLanguages = langs.map((l) => l.language).toList();
      debugPrint('Loaded ${availableLanguages.length} translation languages');
    } catch (e) {
      debugPrint('Failed to load translation languages: $e');
      availableLanguages = [];
    }
  }

  String get dbPath => p.join(_dataDir, 'catalog.db');
  String get xmlPath => p.join(_dataDir, 'appstream.xml');
  String get gzPath => p.join(_dataDir, 'appstream.xml.gz');

  CatalogDatabase get db {
    _db ??= CatalogDatabase.open(dbPath);
    return _db!;
  }

  Future<void> init() async {
    final appDir = await getApplicationSupportDirectory();
    _dataDir = p.join(appDir.path, 'flathub_catalog');
    await Directory(_dataDir).create(recursive: true);
  }

  /// Whether a usable catalog DB already exists.
  bool get hasDatabase {
    final file = File(dbPath);
    if (!file.existsSync()) return false;
    // Consider DB stale after _maxCacheAge.
    final age = DateTime.now().difference(file.lastModifiedSync());
    return age < _maxCacheAge;
  }

  /// Whether cached XML exists and is fresh.
  bool get hasXml {
    final file = File(xmlPath);
    if (!file.existsSync()) return false;
    final age = DateTime.now().difference(file.lastModifiedSync());
    return age < _maxCacheAge;
  }

  /// Download the appstream XML with progress callbacks.
  /// [onProgress] receives (bytesReceived, totalBytes). totalBytes may be 0.
  Future<void> downloadXml({
    required ValueChanged<(int received, int total)> onProgress,
  }) async {
    final client = http.Client();
    try {
      for (final url in _flathubUrls) {
        try {
          final request = http.Request('GET', Uri.parse(url));
          final response = await client.send(request);
          if (response.statusCode != 200) {
            await response.stream.drain<void>();
            continue;
          }

          final total = response.contentLength ?? 0;
          final sink = File(gzPath).openWrite();
          var received = 0;

          await for (final chunk in response.stream) {
            sink.add(chunk);
            received += chunk.length;
            onProgress((received, total));
          }
          await sink.close();

          // Decompress.
          onProgress((received, 0)); // signal decompressing
          final gzBytes = await File(gzPath).readAsBytes();
          final xmlBytes = gzip.decode(gzBytes);
          await File(xmlPath).writeAsBytes(xmlBytes);
          return;
        } catch (_) {
          continue;
        }
      }
      throw Exception('Failed to download from any Flathub mirror');
    } finally {
      client.close();
    }
  }

  /// Import XML into SQLite DB, streaming progress.
  /// [onProgress] receives (componentCount, estimatedTotal).
  Stream<(int count, int estimated)> importToDatabase() async* {
    // Close any existing DB handle so we don't read stale data after import
    await close();
    Appstream.initialize();

    final xmlSize = File(xmlPath).lengthSync();
    final estimatedTotal = (xmlSize / 18000).round().clamp(100, 100000);
    var count = 0;

    await for (final event in Appstream.parseToSqlite(
      xmlPath: xmlPath,
      dbPath: dbPath,
      language: '*',
      batchSize: 200,
    )) {
      switch (event) {
        case ComponentParsed():
          count++;
          yield (count, estimatedTotal);
        case ParseDone(:final count):
          yield (count, count);
        case ParseFailed(:final message):
          throw Exception(message);
      }
    }
  }

  Future<void> close() async {
    await _db?.close();
    _db = null;
  }
}