/// Catalog query CLI — demonstrates Drift-based SQLite queries on the
/// AppStream catalog database produced by `bin/main.dart`.
///
/// Usage:
///   dart run bin/query.dart [--db <path>] <command> [args...]
///
/// Commands:
///   search <term>           Full-text search for components
///   detail <component-id>   Show full component detail
///   categories [name]       List all categories, or components in a category
///   languages [code]        List languages, or components supporting a language
///   releases                Show most recent releases
///   metrics                 Show database-wide statistics
library;

import 'dart:io';

import 'package:appstream_dart/appstream.dart';

const _typeNames = {
  0: 'Unknown',
  1: 'Generic',
  2: 'Desktop App',
  3: 'Console App',
  4: 'Web App',
  5: 'Addon',
  6: 'Font',
  7: 'Codec',
  8: 'Input Method',
  9: 'Firmware',
  10: 'Driver',
  11: 'Localization',
  12: 'Service',
  13: 'Repository',
  14: 'OS',
  15: 'Icon Theme',
  16: 'Runtime',
};

const _urlTypeNames = {
  0: 'Unknown',
  1: 'Homepage',
  2: 'Bugtracker',
  3: 'FAQ',
  4: 'Help',
  5: 'Donation',
  6: 'Translate',
  7: 'Contact',
  8: 'VCS Browser',
  9: 'Contribute',
};

Future<void> main(List<String> args) async {
  String dbPath = 'catalog.db';
  final positional = <String>[];

  for (var i = 0; i < args.length; i++) {
    switch (args[i]) {
      case '--db':
        if (++i >= args.length) {
          stderr.writeln('--db requires a value');
          exit(1);
        }
        dbPath = args[i];
      case '--help' || '-h':
        _printUsage();
        exit(0);
      default:
        positional.add(args[i]);
    }
  }

  if (positional.isEmpty) {
    _printUsage();
    exit(1);
  }

  if (!File(dbPath).existsSync()) {
    stderr.writeln('Error: Database not found: $dbPath');
    stderr.writeln('Run `dart run bin/main.dart` first to build the catalog.');
    exit(1);
  }

  final db = CatalogDatabase.open(dbPath);

  try {
    final command = positional[0];
    final commandArgs = positional.sublist(1);

    switch (command) {
      case 'search':
        await _cmdSearch(db, commandArgs);
      case 'detail':
        await _cmdDetail(db, commandArgs);
      case 'categories' || 'category':
        if (commandArgs.isEmpty) {
          await _cmdCategories(db);
        } else {
          await _cmdCategory(db, commandArgs);
        }
      case 'languages' || 'language':
        if (commandArgs.isEmpty) {
          await _cmdLanguages(db);
        } else {
          await _cmdLanguage(db, commandArgs);
        }
      case 'releases':
        await _cmdReleases(db);
      case 'metrics':
        await _cmdMetrics(db);
      default:
        stderr.writeln('Unknown command: $command');
        _printUsage();
        exit(1);
    }
  } finally {
    await db.close();
  }
}

// ================================================================
// Commands
// ================================================================

Future<void> _cmdSearch(CatalogDatabase db, List<String> args) async {
  if (args.isEmpty) {
    stderr.writeln('Usage: search <term>');
    exit(1);
  }
  final query = args.join(' ');
  final results = await db.searchWithSnippets(query);

  if (results.isEmpty) {
    print('No results for "$query".');
    return;
  }

  print('Search results for "$query" (${results.length} matches):\n');
  for (final (:component, :snippet, :iconUrl) in results) {
    final typeName = _typeNames[component.componentType] ?? '?';
    print('  ${component.id}');
    print('    ${component.name} [$typeName]');
    print('    $snippet');
    if (iconUrl != null) print('    Icon: $iconUrl');
    print('');
  }
}

Future<void> _cmdDetail(CatalogDatabase db, List<String> args) async {
  if (args.isEmpty) {
    stderr.writeln('Usage: detail <component-id>');
    exit(1);
  }
  final id = args[0];
  final detail = await db.getComponentDetail(id);

  if (detail == null) {
    stderr.writeln('Component not found: $id');
    exit(1);
  }

  final c = detail.component;
  final typeName = _typeNames[c.componentType] ?? 'Unknown';

  print(c.name);
  print('=' * c.name.length);
  print('ID:       ${c.id}');
  print('Type:     $typeName');
  if (c.summary != null) print('Summary:  ${c.summary}');
  if (c.projectLicense != null) print('License:  ${c.projectLicense}');
  if (c.developerName != null) print('Developer: ${c.developerName}');
  if (c.projectGroup != null) print('Project:  ${c.projectGroup}');

  if (detail.categories.isNotEmpty) {
    print('\nCategories: ${detail.categories.join(', ')}');
  }

  if (detail.keywords.isNotEmpty) {
    print('Keywords:   ${detail.keywords.join(', ')}');
  }

  if (detail.languages.isNotEmpty) {
    final langDisplay = detail.languages.length > 20
        ? '${detail.languages.take(20).join(', ')} ... (${detail.languages.length} total)'
        : detail.languages.join(', ');
    print('Languages:  $langDisplay');
  }

  if (detail.urls.isNotEmpty) {
    print('\nURLs:');
    for (final url in detail.urls) {
      final label = _urlTypeNames[url.urlType] ?? 'URL';
      print('  $label: ${url.url}');
    }
  }

  if (detail.icons.isNotEmpty) {
    print('\nIcons:');
    for (final icon in detail.icons) {
      final size = (icon.width != null && icon.height != null)
          ? ' (${icon.width}x${icon.height})'
          : '';
      print('  ${icon.value}$size');
    }
  }

  if (detail.releases.isNotEmpty) {
    print('\nReleases:');
    for (final rel in detail.releases.take(5)) {
      final date = rel.timestamp ?? rel.date ?? '';
      final dateShort = date.contains('T') ? date.split('T').first : date;
      print('  ${rel.version ?? '?'}  $dateShort');
    }
    if (detail.releases.length > 5) {
      print('  ... and ${detail.releases.length - 5} more');
    }
  }

  if (detail.screenshotImages.isNotEmpty) {
    print('\nScreenshots:');
    for (final img in detail.screenshotImages.take(5)) {
      final size = (img.width != null && img.height != null)
          ? ' (${img.width}x${img.height})'
          : '';
      print('  ${img.url}$size');
    }
  }

  if (c.description != null) {
    print('\nDescription:');
    // Strip basic HTML tags for CLI display.
    final plain = c.description!
        .replaceAll(RegExp(r'<[^>]+>'), ' ')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
    _printWrapped(plain, indent: 2, width: 78);
  }
}

Future<void> _cmdCategories(CatalogDatabase db) async {
  final cats = await db.listCategories();
  print('Categories (${cats.length}):\n');
  for (final (:name, :count) in cats) {
    print('  ${name.padRight(30)} $count components');
  }
}

Future<void> _cmdCategory(CatalogDatabase db, List<String> args) async {
  if (args.isEmpty) {
    stderr.writeln('Usage: category <name>');
    exit(1);
  }
  final name = args.join(' ');
  final limit = 50;
  final comps = await db.componentsByCategory(name, limit: limit + 1);

  if (comps.isEmpty) {
    print('No components in category "$name".');
    return;
  }

  final truncated = comps.length > limit;
  final display = truncated ? comps.sublist(0, limit) : comps;
  print(
    'Category "$name" (showing ${display.length}${truncated ? '+' : ''} components):\n',
  );
  for (final (:component, :iconUrl) in display) {
    final summary = component.summary ?? '';
    final trimmed = summary.length > 60
        ? '${summary.substring(0, 57)}...'
        : summary;
    print('  ${component.id}');
    print('    ${component.name} — $trimmed');
    if (iconUrl != null) print('    Icon: $iconUrl');
  }
  if (truncated) {
    print('\n  ... more results available');
  }
}

Future<void> _cmdLanguages(CatalogDatabase db) async {
  final langs = await db.listLanguages(limit: 100);

  if (langs.isEmpty) {
    print('No language data in database.');
    return;
  }

  print('Languages (${langs.length}):\n');
  for (final (:language, :count) in langs) {
    print('  ${language.padRight(10)} $count components');
  }
}

Future<void> _cmdLanguage(CatalogDatabase db, List<String> args) async {
  if (args.isEmpty) {
    stderr.writeln('Usage: language <code>');
    exit(1);
  }
  final lang = args[0];
  final limit = 50;
  final comps = await db.componentsByLanguage(lang, limit: limit + 1);

  if (comps.isEmpty) {
    print('No components support language "$lang".');
    return;
  }

  final truncated = comps.length > limit;
  final display = truncated ? comps.sublist(0, limit) : comps;
  print(
    'Components supporting "$lang" (showing ${display.length}${truncated ? '+' : ''}):\n',
  );
  for (final (:component, :iconUrl) in display) {
    final summary = component.summary ?? '';
    final trimmed = summary.length > 60
        ? '${summary.substring(0, 57)}...'
        : summary;
    print('  ${component.id}');
    print('    ${component.name} — $trimmed');
    if (iconUrl != null) print('    Icon: $iconUrl');
  }
  if (truncated) {
    print('\n  ... more results available');
  }
}

Future<void> _cmdReleases(CatalogDatabase db) async {
  final rels = await db.recentReleases();

  if (rels.isEmpty) {
    print('No releases with dates found.');
    return;
  }

  print('Recent releases:\n');
  for (final (:release, :componentName) in rels) {
    final date = release.timestamp ?? release.date ?? '?';
    // Trim the time portion for cleaner display.
    final dateShort = date.contains('T') ? date.split('T').first : date;
    final ver = release.version ?? '?';
    print('  $dateShort  $componentName v$ver');
    print('         ${release.componentId}');
  }
}

Future<void> _cmdMetrics(CatalogDatabase db) async {
  final m = await db.getMetrics();

  print('Catalog Metrics');
  print('===============\n');
  print('  Components:   ${m.componentCount}');
  print('  Categories:   ${m.categoryCount}');
  print('  Keywords:     ${m.keywordCount}');
  print('  Releases:     ${m.releaseCount}');
  print('  Icons:        ${m.iconCount}');
  print('  URLs:         ${m.urlCount}');
  print('  Screenshots:  ${m.screenshotCount}');
  print('  Languages:    ${m.languageCount}');
  print('  FTS ready:    ${m.ftsReady ? "yes" : "no"}');

  if (m.componentsByType.isNotEmpty) {
    print('\nComponents by type:');
    final sorted = m.componentsByType.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    for (final entry in sorted) {
      final name = _typeNames[entry.key] ?? 'Type ${entry.key}';
      print('  ${name.padRight(20)} ${entry.value}');
    }
  }
}

// ================================================================
// Helpers
// ================================================================

void _printWrapped(String text, {int indent = 0, int width = 80}) {
  final prefix = ' ' * indent;
  final maxLen = width - indent;
  final words = text.split(' ');
  final buf = StringBuffer();
  var lineLen = 0;

  for (final word in words) {
    if (lineLen + word.length + 1 > maxLen && lineLen > 0) {
      print('$prefix$buf');
      buf.clear();
      lineLen = 0;
    }
    if (lineLen > 0) {
      buf.write(' ');
      lineLen++;
    }
    buf.write(word);
    lineLen += word.length;
  }
  if (buf.isNotEmpty) print('$prefix$buf');
}

void _printUsage() {
  print('appstream query — browse the Flathub catalog via Drift/SQLite');
  print('');
  print('Usage: dart run bin/query.dart [--db <path>] <command> [args...]');
  print('');
  print('Commands:');
  print('  search <term>           Full-text search for components');
  print('  detail <component-id>   Show full component detail');
  print(
    '  categories [name]       List all categories, or components in a category',
  );
  print(
    '  languages [code]        List languages, or components supporting a language',
  );
  print('  releases                Show most recent releases');
  print('  metrics                 Show database-wide statistics');
  print('');
  print('Options:');
  print('  --db <path>    Path to catalog.db (default: catalog.db)');
  print('  -h, --help     Show this help');
  print('');
  print('Examples:');
  print('  dart run bin/query.dart search firefox');
  print('  dart run bin/query.dart detail org.mozilla.firefox');
  print('  dart run bin/query.dart categories');
  print('  dart run bin/query.dart categories Game');
  print('  dart run bin/query.dart languages');
  print('  dart run bin/query.dart languages de');
  print('  dart run bin/query.dart releases');
  print('  dart run bin/query.dart metrics');
}
