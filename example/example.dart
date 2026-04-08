/// Example: Parse Flathub AppStream XML and query the catalog.
///
/// On first run this downloads `appstream.xml.gz` from Flathub and
/// gunzips it to ./appstream.xml. Subsequent runs reuse the local copy.
library;

import 'dart:io';

import 'package:appstream_dart/appstream.dart';
import 'package:http/http.dart' as http;

const _flathubUrl =
    'https://dl.flathub.org/repo/appstream/x86_64/appstream.xml.gz';

Future<void> _ensureCatalog(String path) async {
  if (File(path).existsSync()) return;
  print('Downloading $_flathubUrl ...');
  final resp = await http.get(Uri.parse(_flathubUrl));
  if (resp.statusCode != 200) {
    throw StateError('Download failed: HTTP ${resp.statusCode}');
  }
  final xml = gzip.decode(resp.bodyBytes);
  await File(path).writeAsBytes(xml);
  print('Saved ${xml.length} bytes to $path');
}

Future<void> main() async {
  // Initialize the native library (must be called once)
  Appstream.initialize();

  // Make sure the input catalog exists locally before parsing.
  await _ensureCatalog('appstream.xml');

  // Parse XML to SQLite with all translations
  print('Parsing...');
  await for (final event in Appstream.parseToSqlite(
    xmlPath: 'appstream.xml',
    dbPath: 'catalog.db',
    language: '*', // store all translations (use '' for defaults only)
  )) {
    switch (event) {
      case ComponentParsed(:final component):
        // Progress: each component as it's parsed
        print('  ${component.id}: ${component.name}');
      case ParseDone(:final count):
        print('Done: $count components');
      case ParseFailed(:final message):
        print('Error: $message');
        exit(1);
    }
  }

  // Query the catalog via Drift ORM
  final db = CatalogDatabase.open('catalog.db');

  // Full-text search
  final results = await db.searchComponents('calculator');
  for (final r in results) {
    print('${r.component.name} (${r.component.id})');
  }

  // Get component detail
  final detail = await db.getComponentDetail('org.gnome.Calculator');
  if (detail != null) {
    print('${detail.component.name}: ${detail.component.summary}');
    print('Categories: ${detail.categories.join(', ')}');
    print('Screenshots: ${detail.screenshotImages.length}');
  }

  // Browse by category
  final categories = await db.listCategories();
  for (final cat in categories.take(5)) {
    print('${cat.name}: ${cat.count} apps');
  }

  // Get a translation (requires --lang '*' or specific language at parse time)
  final germanName =
      await db.getTranslation('org.gnome.Calculator', 'name', 'de');
  print('German name: ${germanName ?? '(not available)'}');

  // List available translation languages
  final langs = await db.listTranslationLanguages(limit: 10);
  print('Top languages: ${langs.map((l) => l.language).join(', ')}');

  // Database metrics
  final metrics = await db.getMetrics();
  print('Components: ${metrics.componentCount}');
  print('FTS ready: ${metrics.ftsReady}');

  await db.close();
}
