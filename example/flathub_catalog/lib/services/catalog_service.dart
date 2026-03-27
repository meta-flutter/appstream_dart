import 'dart:io';

import 'package:appstream/appstream.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

/// Manages fetching, importing, and querying the Flathub catalog.
class CatalogService {
  static const _flathubUrls = [
    'https://dl.flathub.org/repo/appstream/x86_64/appstream.xml.gz',
    'https://flathub.org/repo/appstream/x86_64/appstream.xml.gz',
  ];

  static const _maxCacheAge = Duration(hours: 24);

  CatalogDatabase? _db;
  late final String _dataDir;

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
    Appstream.initialize();

    final xmlSize = File(xmlPath).lengthSync();
    final estimatedTotal = (xmlSize / 18000).round().clamp(100, 100000);
    var count = 0;

    await for (final event in Appstream.parseToSqlite(
      xmlPath: xmlPath,
      dbPath: dbPath,
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