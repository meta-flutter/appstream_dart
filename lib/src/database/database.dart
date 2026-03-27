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
])
class CatalogDatabase extends _$CatalogDatabase {
  CatalogDatabase(super.e);

  /// Open an existing catalog database file (created by the C++ parser).
  factory CatalogDatabase.open(String path) {
    return CatalogDatabase(
      NativeDatabase(File(path), setup: (db) {
        db.execute('PRAGMA journal_mode=WAL');
      }),
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

  /// Default CDN base URL for cached icons when media_baseurl is not set.
  static const defaultIconBaseUrl =
      'https://dl.flathub.org/repo/appstream/x86_64/icons';

  /// SQL subquery that picks the best icon URL per component.
  /// Prefers REMOTE (type 5) icons, then CACHED (type 2) composed with
  /// the component's media_baseurl (falling back to the Flathub CDN),
  /// then STOCK name (type 1).
  /// Within each type, picks the largest available size.
  static const _iconSubquery =
      '(SELECT CASE ci.icon_type '
      "  WHEN 5 THEN ci.value "
      "  WHEN 2 THEN COALESCE(c.media_baseurl, '$defaultIconBaseUrl') || '/' || "
      "    COALESCE(ci.width,'128') || 'x' || COALESCE(ci.height,'128') || '/' || ci.value "
      "  ELSE ci.value "
      'END '
      'FROM component_icons ci '
      'WHERE ci.component_id = c.id '
      'ORDER BY ci.icon_type = 5 DESC, ci.icon_type = 2 DESC, ci.width DESC '
      'LIMIT 1)';

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

  /// Search components using FTS5 full-text search.
  Future<List<({ComponentRow component, String? iconUrl})>> searchComponents(
    String query, {
    int limit = 20,
  }) {
    return customSelect(
      'SELECT c.*, $_iconSubquery AS icon_url '
      'FROM components_fts fts '
      'JOIN components c ON c.rowid = fts.rowid '
      'WHERE components_fts MATCH ? '
      'ORDER BY rank '
      'LIMIT ?',
      variables: [Variable.withString(query), Variable.withInt(limit)],
      readsFrom: {components, componentIcons},
    ).map((row) {
      return (
        component: components.map(row.data),
        iconUrl: row.readNullable<String>('icon_url'),
      );
    }).get();
  }

  /// Search with snippet highlighting.
  Future<List<({ComponentRow component, String snippet, String? iconUrl})>>
      searchWithSnippets(
    String query, {
    int limit = 20,
  }) {
    return customSelect(
      'SELECT c.*, '
      "snippet(components_fts, 1, '<b>', '</b>', '...', 40) AS snip, "
      '$_iconSubquery AS icon_url '
      'FROM components_fts fts '
      'JOIN components c ON c.rowid = fts.rowid '
      'WHERE components_fts MATCH ? '
      'ORDER BY rank '
      'LIMIT ?',
      variables: [Variable.withString(query), Variable.withInt(limit)],
      readsFrom: {components, componentIcons},
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
    Future<int> countOf(String table) => customSelect(
          'SELECT COUNT(*) AS c FROM $table',
        ).map((row) => row.read<int>('c')).getSingle();

    final results = await Future.wait([
      countOf('components'),
      countOf('categories'),
      countOf('keywords'),
      countOf('releases'),
      countOf('component_icons'),
      countOf('component_urls'),
      countOf('screenshots'),
      countOf('component_languages'),
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
}