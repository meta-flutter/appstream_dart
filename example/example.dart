/// Example: Parse Flathub AppStream XML and query the catalog.
///
/// Prerequisites:
/// - SQLite3 development libraries installed
/// - An AppStream XML file (download from Flathub or use the CLI:
///   `dart run bin/main.dart`)
library;

import 'package:appstream_dart/appstream.dart';

Future<void> main() async {
  // Initialize the native library (must be called once)
  Appstream.initialize();

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
