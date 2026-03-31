import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';

import 'tables.dart';

part 'database.g.dart';

/// Detailed component with related data for display.
class ComponentDetail {
  final ComponentRow component;
  final List<String> categories;
  final List<String> keywords;
  final List<String> languages;
  final List<ComponentUrlRow> urls;
  final List<ComponentIconRow> icons;
  final List<ReleaseRow> releases;
  final List<ScreenshotImageRow> screenshotImages;

  ComponentDetail({
    required this.component,
    required this.categories,
    required this.keywords,
    required this.languages,
    required this.urls,
    required this.icons,
    required this.releases,
    required this.screenshotImages,
  });
}

/// Database-level statistics.
class CatalogMetrics {
  final int componentCount;
  final int categoryCount;
  final int keywordCount;
  final int releaseCount;
  final int iconCount;
  final int urlCount;
  final int screenshotCount;
  final int languageCount;
  final Map<int, int> componentsByType;
  final bool ftsReady;

  CatalogMetrics({
    required this.componentCount,
    required this.categoryCount,
    required this.keywordCount,
    required this.releaseCount,
    required this.iconCount,
    required this.urlCount,
    required this.screenshotCount,
    required this.languageCount,
    required this.componentsByType,
    required this.ftsReady,
  });
}

@DriftDatabase(tables: [
  Components,
  Categories,
  ComponentCategories,
  Keywords,
  ComponentKeywords,
  ComponentUrls,
  ComponentIcons,
  Releases,
  ReleaseIssues,
  Screenshots,
  ScreenshotImages,
  ScreenshotVideos,
  ContentRatingAttrs,
  ComponentLanguages,
  BrandingColors,
  ComponentExtends,
  ComponentSuggests,
  ComponentRelations,
  ComponentCustom,
  ComponentFieldTranslations,
])
class CatalogDatabase extends _$CatalogDatabase {
  /// Base URL used for cached icon resolution when a component's
  /// `media_baseurl` is not set.  Pass `null` to omit the fallback
  /// (only components that carry their own base URL will resolve).
  final String? iconBaseUrl;

  CatalogDatabase(super.e, {this.iconBaseUrl});

  /// Open an existing catalog database file (created by the C++ parser).
  factory CatalogDatabase.open(String path, {String? iconBaseUrl}) {
    return CatalogDatabase(
      NativeDatabase(File(path), setup: (db) {
        db.execute('PRAGMA journal_mode=WAL');
      }),
      iconBaseUrl: iconBaseUrl,
    );
  }

  // Schema is created by C++ — we never run migrations.
  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          // No-op: schema already exists from C++ writer.
        },
      );

  // ──────────────────────────────────────────────
  // Icon URL helper
  // ──────────────────────────────────────────────

  /// SQL subquery that picks the best icon URL per component.
  /// Prefers REMOTE (type 5) icons, then CACHED (type 2) composed with
  /// the component's media_baseurl (falling back to [iconBaseUrl] if set),
  /// then STOCK name (type 1).
  /// Within each type, picks the largest available size.
  String get _iconSubquery {
    final baseFallback = iconBaseUrl != null
        ? "COALESCE(c.media_baseurl, '${iconBaseUrl!.replaceAll("'", "''")}')"
        : 'c.media_baseurl';
    return '(SELECT CASE ci.icon_type '
        "  WHEN 5 THEN ci.value "
        "  WHEN 2 THEN $baseFallback || '/' || "
        "    COALESCE(ci.width,'128') || 'x' || COALESCE(ci.height,'128') || '/' || ci.value "
        "  ELSE ci.value "
        'END '
        'FROM component_icons ci '
        'WHERE ci.component_id = c.id '
        'ORDER BY ci.icon_type = 5 DESC, ci.icon_type = 2 DESC, ci.width DESC '
        'LIMIT 1)';
  }

  // ──────────────────────────────────────────────
  // List components (no search filter)
  // ──────────────────────────────────────────────

  /// List components ordered by name, with icon URLs.
  Future<List<({ComponentRow component, String? iconUrl})>> listComponents({
    int limit = 50,
    int offset = 0,
  }) {
    return customSelect(
      'SELECT c.*, $_iconSubquery AS icon_url '
      'FROM components c '
      'ORDER BY c.name '
      'LIMIT ? OFFSET ?',
      variables: [Variable.withInt(limit), Variable.withInt(offset)],
      readsFrom: {components, componentIcons},
    ).map((row) => (
          component: components.map(row.data),
          iconUrl: row.readNullable<String>('icon_url'),
        )).get();
  }

  // ──────────────────────────────────────────────
  // Full-text search (uses FTS5 table built by C++)
  // ──────────────────────────────────────────────

  /// Sanitize a user query for FTS5 MATCH by wrapping each token in
  /// double-quotes to prevent FTS5 syntax errors from special characters.
  static String _sanitizeFts5Query(String query) {
    final trimmed = query.trim();
    if (trimmed.isEmpty) return '""';
    // Split into tokens and quote each one to neutralize FTS5 operators
    return trimmed
        .split(RegExp(r'\s+'))
        .map((token) => '"${token.replaceAll('"', '""')}"')
        .join(' ');
  }

  /// Search components using FTS5 full-text search.
  Future<List<({ComponentRow component, String? iconUrl})>> searchComponents(
    String query, {
    int limit = 20,
  }) {
    final safeQuery = _sanitizeFts5Query(query);
    return customSelect(
      'SELECT c.*, $_iconSubquery AS icon_url '
      'FROM components_fts fts '
      'JOIN components c ON c.rowid = fts.rowid '
      'WHERE components_fts MATCH ? '
      'ORDER BY rank '
      'LIMIT ?',
      variables: [Variable.withString(safeQuery), Variable.withInt(limit)],
      readsFrom: {components, componentIcons},
    ).map((row) {
      return (
        component: components.map(row.data),
        iconUrl: row.readNullable<String>('icon_url'),
      );
    }).get();
  }

  /// Search with snippet highlighting. If [locale] is provided, only
  /// returns components that have translations for that language.
  Future<List<({ComponentRow component, String snippet, String? iconUrl})>>
      searchWithSnippets(
    String query, {
    int limit = 20,
    String? locale,
  }) {
    final safeQuery = _sanitizeFts5Query(query);
    final hasLocale = locale != null && locale.isNotEmpty;
    final base = hasLocale
        ? (locale.contains('-') ? locale.split('-').first : locale)
        : '';
    final sql = 'SELECT c.*, '
        "snippet(components_fts, 1, '<b>', '</b>', '...', 40) AS snip, "
        '$_iconSubquery AS icon_url '
        'FROM components_fts fts '
        'JOIN components c ON c.rowid = fts.rowid '
        'WHERE components_fts MATCH ? '
        '${hasLocale ? 'AND EXISTS (SELECT 1 FROM component_field_translations t WHERE t.component_id = c.id AND t.language IN (?, ?)) ' : ''}'
        'ORDER BY rank '
        'LIMIT ?';
    final vars = <Variable>[
      Variable.withString(safeQuery),
      if (hasLocale) ...[
        Variable.withString(locale),
        Variable.withString(base),
      ],
      Variable.withInt(limit),
    ];
    return customSelect(
      sql,
      variables: vars,
      readsFrom: {components, componentIcons, componentFieldTranslations},
    ).map((row) {
      return (
        component: components.map(row.data),
        snippet: row.read<String>('snip'),
        iconUrl: row.readNullable<String>('icon_url'),
      );
    }).get();
  }

  // ──────────────────────────────────────────────
  // Component detail
  // ──────────────────────────────────────────────

  /// Get a single component by ID with all related data.
  Future<ComponentDetail?> getComponentDetail(String componentId) async {
    final comp = await (select(components)
          ..where((c) => c.id.equals(componentId)))
        .getSingleOrNull();
    if (comp == null) return null;

    final cats = await _categoriesForComponent(componentId);
    final kws = await _keywordsForComponent(componentId);
    final langs = await languagesForComponent(componentId);
    final urls = await (select(componentUrls)
          ..where((u) => u.componentId.equals(componentId)))
        .get();
    final icons = await (select(componentIcons)
          ..where((i) => i.componentId.equals(componentId)))
        .get();
    final rels = await (select(releases)
          ..where((r) => r.componentId.equals(componentId))
          ..orderBy([(r) => OrderingTerm.desc(r.timestamp)]))
        .get();
    final ssImages = await _screenshotImagesForComponent(componentId);

    return ComponentDetail(
      component: comp,
      categories: cats,
      keywords: kws,
      languages: langs,
      urls: urls,
      icons: icons,
      releases: rels,
      screenshotImages: ssImages,
    );
  }

  Future<List<String>> _categoriesForComponent(String componentId) {
    final query = select(componentCategories).join([
      innerJoin(categories, categories.id.equalsExp(componentCategories.categoryId)),
    ])
      ..where(componentCategories.componentId.equals(componentId));

    return query.map((row) => row.readTable(categories).name).get();
  }

  Future<List<String>> _keywordsForComponent(String componentId) {
    final query = select(componentKeywords).join([
      innerJoin(keywords, keywords.id.equalsExp(componentKeywords.keywordId)),
    ])
      ..where(componentKeywords.componentId.equals(componentId));

    return query.map((row) => row.readTable(keywords).name).get();
  }

  Future<List<ScreenshotImageRow>> _screenshotImagesForComponent(String componentId) {
    final query = select(screenshotImages).join([
      innerJoin(screenshots, screenshots.id.equalsExp(screenshotImages.screenshotId)),
    ])
      ..where(screenshots.componentId.equals(componentId));

    return query.map((row) => row.readTable(screenshotImages)).get();
  }

  // ──────────────────────────────────────────────
  // Browse by category
  // ──────────────────────────────────────────────

  /// List all categories with component counts.
  Future<List<({String name, int count})>> listCategories() {
    return customSelect(
      'SELECT cat.name, COUNT(*) AS cnt '
      'FROM categories cat '
      'JOIN component_categories cc ON cc.category_id = cat.id '
      'GROUP BY cat.name '
      'ORDER BY cnt DESC',
      readsFrom: {categories, componentCategories},
    ).map((row) => (name: row.read<String>('name'), count: row.read<int>('cnt'))).get();
  }

  /// List components in a given category.
  Future<List<({ComponentRow component, String? iconUrl})>> componentsByCategory(
    String categoryName, {
    int limit = 50,
  }) {
    return customSelect(
      'SELECT c.*, $_iconSubquery AS icon_url '
      'FROM components c '
      'JOIN component_categories cc ON cc.component_id = c.id '
      'JOIN categories cat ON cat.id = cc.category_id '
      'WHERE cat.name = ? '
      'ORDER BY c.name '
      'LIMIT ?',
      variables: [Variable.withString(categoryName), Variable.withInt(limit)],
      readsFrom: {components, componentCategories, categories, componentIcons},
    ).map((row) => (
          component: components.map(row.data),
          iconUrl: row.readNullable<String>('icon_url'),
        )).get();
  }

  // ──────────────────────────────────────────────
  // Language queries
  // ──────────────────────────────────────────────

  /// List all languages with the number of components supporting each.
  Future<List<({String language, int count})>> listLanguages({int limit = 50}) {
    return customSelect(
      'SELECT language, COUNT(*) AS cnt '
      'FROM component_languages '
      'GROUP BY language '
      'ORDER BY cnt DESC '
      'LIMIT ?',
      variables: [Variable.withInt(limit)],
      readsFrom: {componentLanguages},
    ).map((row) => (language: row.read<String>('language'), count: row.read<int>('cnt'))).get();
  }

  /// Get all languages supported by a component.
  Future<List<String>> languagesForComponent(String componentId) {
    return (select(componentLanguages)
          ..where((l) => l.componentId.equals(componentId)))
        .map((row) => row.language)
        .get();
  }

  /// Find components that support a specific language.
  Future<List<({ComponentRow component, String? iconUrl})>> componentsByLanguage(
    String language, {
    int limit = 50,
  }) {
    return customSelect(
      'SELECT c.*, $_iconSubquery AS icon_url '
      'FROM components c '
      'JOIN component_languages cl ON cl.component_id = c.id '
      'WHERE cl.language = ? '
      'ORDER BY c.name '
      'LIMIT ?',
      variables: [Variable.withString(language), Variable.withInt(limit)],
      readsFrom: {components, componentLanguages, componentIcons},
    ).map((row) => (
          component: components.map(row.data),
          iconUrl: row.readNullable<String>('icon_url'),
        )).get();
  }

  // ──────────────────────────────────────────────
  // Browse by component type
  // ──────────────────────────────────────────────

  /// List components of a given type.
  Future<List<({ComponentRow component, String? iconUrl})>> componentsByType(
    int type, {
    int limit = 50,
  }) {
    return customSelect(
      'SELECT c.*, $_iconSubquery AS icon_url '
      'FROM components c '
      'WHERE c.component_type = ? '
      'ORDER BY c.name '
      'LIMIT ?',
      variables: [Variable.withInt(type), Variable.withInt(limit)],
      readsFrom: {components, componentIcons},
    ).map((row) => (
          component: components.map(row.data),
          iconUrl: row.readNullable<String>('icon_url'),
        )).get();
  }

  // ──────────────────────────────────────────────
  // Recent releases
  // ──────────────────────────────────────────────

  /// Get the most recent releases across all components.
  Future<List<({ReleaseRow release, String componentName})>> recentReleases({int limit = 20}) {
    return customSelect(
      'SELECT r.*, c.name AS comp_name '
      'FROM releases r '
      'JOIN components c ON c.id = r.component_id '
      'WHERE r.timestamp IS NOT NULL AND r.timestamp != \'\' '
      'ORDER BY r.timestamp DESC '
      'LIMIT ?',
      variables: [Variable.withInt(limit)],
      readsFrom: {releases, components},
    ).map((row) {
      return (
        release: releases.map(row.data),
        componentName: row.read<String>('comp_name'),
      );
    }).get();
  }

  // ──────────────────────────────────────────────
  // Metrics / statistics
  // ──────────────────────────────────────────────

  /// Gather database-wide metrics.
  Future<CatalogMetrics> getMetrics() async {
    Future<int> countTable(String sql) =>
        customSelect(sql).map((row) => row.read<int>('c')).getSingle();

    final results = await Future.wait([
      countTable('SELECT COUNT(*) AS c FROM components'),
      countTable('SELECT COUNT(*) AS c FROM categories'),
      countTable('SELECT COUNT(*) AS c FROM keywords'),
      countTable('SELECT COUNT(*) AS c FROM releases'),
      countTable('SELECT COUNT(*) AS c FROM component_icons'),
      countTable('SELECT COUNT(*) AS c FROM component_urls'),
      countTable('SELECT COUNT(*) AS c FROM screenshots'),
      countTable('SELECT COUNT(*) AS c FROM component_languages'),
    ]);

    // Component type breakdown.
    final typeRows = await customSelect(
      'SELECT component_type, COUNT(*) AS cnt FROM components GROUP BY component_type',
      readsFrom: {components},
    ).get();

    final byType = <int, int>{
      for (final row in typeRows)
        row.read<int>('component_type'): row.read<int>('cnt'),
    };

    // Check FTS readiness.
    final ftsCheck = await customSelect(
      "SELECT COUNT(*) AS c FROM sqlite_master WHERE name='components_fts'",
    ).getSingle();

    return CatalogMetrics(
      componentCount: results[0],
      categoryCount: results[1],
      keywordCount: results[2],
      releaseCount: results[3],
      iconCount: results[4],
      urlCount: results[5],
      screenshotCount: results[6],
      languageCount: results[7],
      componentsByType: byType,
      ftsReady: ftsCheck.read<int>('c') > 0,
    );
  }

  // ──────────────────────────────────────────────
  // Localized queries
  // ──────────────────────────────────────────────

  /// Get a translated field value for a component, with locale fallback.
  /// Tries the full locale (e.g. "pt-BR"), then the base language ("pt"),
  /// then returns null (caller should use the default field value).
  Future<String?> getTranslation(
      String componentId, String field, String locale) {
    final base = locale.contains('-') ? locale.split('-').first : locale;
    return customSelect(
      'SELECT value FROM component_field_translations '
      'WHERE component_id = ? AND field = ? AND language IN (?, ?) '
      'ORDER BY CASE language WHEN ? THEN 0 ELSE 1 END '
      'LIMIT 1',
      variables: [
        Variable.withString(componentId),
        Variable.withString(field),
        Variable.withString(locale),
        Variable.withString(base),
        Variable.withString(locale),
      ],
      readsFrom: {componentFieldTranslations},
    ).map((row) => row.read<String>('value')).getSingleOrNull();
  }

  /// List available languages for translations in the database.
  Future<List<({String language, int count})>> listTranslationLanguages(
      {int limit = 50}) {
    return customSelect(
      'SELECT language, COUNT(*) AS cnt '
      'FROM component_field_translations '
      'GROUP BY language '
      'ORDER BY cnt DESC '
      'LIMIT ?',
      variables: [Variable.withInt(limit)],
      readsFrom: {componentFieldTranslations},
    )
        .map((row) =>
            (language: row.read<String>('language'), count: row.read<int>('cnt')))
        .get();
  }

  /// List components with localized name/summary, falling back to defaults.
  Future<List<({ComponentRow component, String? iconUrl, String displayName, String? displaySummary})>>
      listComponentsLocalized({
    required String locale,
    int limit = 50,
    int offset = 0,
  }) {
    final base = locale.contains('-') ? locale.split('-').first : locale;
    return customSelect(
      'SELECT c.*, $_iconSubquery AS icon_url, '
      'COALESCE('
      '  (SELECT value FROM component_field_translations '
      '   WHERE component_id = c.id AND field = \'name\' AND language IN (?, ?) '
      '   ORDER BY CASE language WHEN ? THEN 0 ELSE 1 END LIMIT 1), '
      '  c.name) AS display_name, '
      'COALESCE('
      '  (SELECT value FROM component_field_translations '
      '   WHERE component_id = c.id AND field = \'summary\' AND language IN (?, ?) '
      '   ORDER BY CASE language WHEN ? THEN 0 ELSE 1 END LIMIT 1), '
      '  c.summary) AS display_summary '
      'FROM components c '
      'ORDER BY display_name '
      'LIMIT ? OFFSET ?',
      variables: [
        Variable.withString(locale),
        Variable.withString(base),
        Variable.withString(locale),
        Variable.withString(locale),
        Variable.withString(base),
        Variable.withString(locale),
        Variable.withInt(limit),
        Variable.withInt(offset),
      ],
      readsFrom: {components, componentIcons, componentFieldTranslations},
    ).map((row) => (
          component: components.map(row.data),
          iconUrl: row.readNullable<String>('icon_url'),
          displayName: row.read<String>('display_name'),
          displaySummary: row.readNullable<String>('display_summary'),
        )).get();
  }

  static const _langExistsClause =
      'EXISTS (SELECT 1 FROM component_field_translations t '
      'WHERE t.component_id = c.id AND t.language IN (?, ?))';

  /// List only components that have translations for a given language.
  Future<List<({ComponentRow component, String? iconUrl})>>
      componentsByTranslationLanguage(
    String locale, {
    int limit = 50,
  }) {
    final base = locale.contains('-') ? locale.split('-').first : locale;
    return customSelect(
      'SELECT c.*, $_iconSubquery AS icon_url '
      'FROM components c '
      'WHERE $_langExistsClause '
      'ORDER BY c.name '
      'LIMIT ?',
      variables: [
        Variable.withString(locale),
        Variable.withString(base),
        Variable.withInt(limit),
      ],
      readsFrom: {components, componentIcons, componentFieldTranslations},
    ).map((row) => (
          component: components.map(row.data),
          iconUrl: row.readNullable<String>('icon_url'),
        )).get();
  }

  /// List categories that have components with translations for a given language.
  Future<List<({String name, int count})>> listCategoriesForLanguage(
      String locale) {
    final base = locale.contains('-') ? locale.split('-').first : locale;
    return customSelect(
      'SELECT cat.name, COUNT(*) AS cnt '
      'FROM categories cat '
      'JOIN component_categories cc ON cc.category_id = cat.id '
      'JOIN components c ON c.id = cc.component_id '
      'WHERE $_langExistsClause '
      'GROUP BY cat.name '
      'ORDER BY cnt DESC',
      variables: [
        Variable.withString(locale),
        Variable.withString(base),
      ],
      readsFrom: {
        categories,
        componentCategories,
        components,
        componentFieldTranslations
      },
    )
        .map((row) =>
            (name: row.read<String>('name'), count: row.read<int>('cnt')))
        .get();
  }

  /// List components in a category that have translations for a given language.
  Future<List<({ComponentRow component, String? iconUrl})>>
      componentsByCategoryAndLanguage(
    String categoryName,
    String locale, {
    int limit = 50,
  }) {
    final base = locale.contains('-') ? locale.split('-').first : locale;
    return customSelect(
      'SELECT c.*, $_iconSubquery AS icon_url '
      'FROM components c '
      'JOIN component_categories cc ON cc.component_id = c.id '
      'JOIN categories cat ON cat.id = cc.category_id '
      'WHERE cat.name = ? AND $_langExistsClause '
      'ORDER BY c.name '
      'LIMIT ?',
      variables: [
        Variable.withString(categoryName),
        Variable.withString(locale),
        Variable.withString(base),
        Variable.withInt(limit),
      ],
      readsFrom: {
        components,
        componentCategories,
        categories,
        componentIcons,
        componentFieldTranslations
      },
    ).map((row) => (
          component: components.map(row.data),
          iconUrl: row.readNullable<String>('icon_url'),
        )).get();
  }
}