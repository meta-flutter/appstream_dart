// SPDX-License-Identifier: Apache-2.0
// SPDX-FileCopyrightText: 2026 Joel Winarske <joel.winarske@gmail.com>

import 'package:drift/drift.dart';

/// Main components table — one row per AppStream component.
@DataClassName('ComponentRow')
class Components extends Table {
  /// Unique AppStream component identifier (e.g. `org.example.App`).
  TextColumn get id => text()();

  /// AppStream component type as an integer (desktop-application, runtime, etc.).
  IntColumn get componentType =>
      integer().named('component_type').withDefault(const Constant(0))();

  /// Merge priority for catalog deduplication.
  IntColumn get priority => integer().withDefault(const Constant(0))();

  /// Merge strategy hint (`append`, `replace`, or null).
  TextColumn get merge => text().nullable()();

  /// Human-readable display name.
  TextColumn get name => text()();

  /// Optional variant suffix appended to the name for disambiguation.
  TextColumn get nameVariantSuffix =>
      text().named('name_variant_suffix').nullable()();

  /// One-line summary of the component.
  TextColumn get summary => text().nullable()();

  /// Long description in AppStream markup (HTML subset).
  TextColumn get description => text().nullable()();

  /// Primary distribution package name.
  TextColumn get pkgname => text().nullable()();

  /// Source package name.
  TextColumn get sourcePkgname => text().named('source_pkgname').nullable()();

  /// SPDX license expression for the project.
  TextColumn get projectLicense => text().named('project_license').nullable()();

  /// SPDX license expression for the metadata itself.
  TextColumn get metadataLicense =>
      text().named('metadata_license').nullable()();

  /// Project group (e.g. `GNOME`, `KDE`).
  TextColumn get projectGroup => text().named('project_group').nullable()();

  /// Base URL for cached media assets (icons, screenshots).
  TextColumn get mediaBaseurl => text().named('media_baseurl').nullable()();

  /// Target architecture (e.g. `x86_64`), if constrained.
  TextColumn get architecture => text().nullable()();

  /// Bundle type as an integer (flatpak, snap, etc.).
  IntColumn get bundleType => integer().named('bundle_type').nullable()();

  /// Bundle identifier string.
  TextColumn get bundleId => text().named('bundle_id').nullable()();

  /// Developer / publisher identifier.
  TextColumn get developerId => text().named('developer_id').nullable()();

  /// Human-readable developer / publisher name.
  TextColumn get developerName => text().named('developer_name').nullable()();

  /// Launchable type as an integer (desktop-id, service, etc.).
  IntColumn get launchableType =>
      integer().named('launchable_type').nullable()();

  /// Launchable value (e.g. the `.desktop` file name).
  TextColumn get launchableValue =>
      text().named('launchable_value').nullable()();

  /// Content rating system identifier (e.g. `oars-1.1`).
  TextColumn get contentRatingType =>
      text().named('content_rating_type').nullable()();

  /// EULA or agreement text, if provided.
  TextColumn get agreement => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Interned categories.
class Categories extends Table {
  /// Auto-incrementing primary key.
  IntColumn get id => integer().autoIncrement()();

  /// Category name (unique), e.g. `Game`, `Utility`, `Development`.
  TextColumn get name => text().unique()();
}

/// Join table: component ↔ category.
@DataClassName('ComponentCategoryRow')
class ComponentCategories extends Table {
  /// Foreign key to [Components.id].
  TextColumn get componentId => text().named('component_id')();

  /// Foreign key to [Categories.id].
  IntColumn get categoryId => integer().named('category_id')();

  @override
  Set<Column> get primaryKey => {componentId, categoryId};
}

/// Interned keywords.
class Keywords extends Table {
  /// Auto-incrementing primary key.
  IntColumn get id => integer().autoIncrement()();

  /// Keyword text (unique).
  TextColumn get name => text().unique()();
}

/// Join table: component ↔ keyword.
@DataClassName('ComponentKeywordRow')
class ComponentKeywords extends Table {
  /// Foreign key to [Components.id].
  TextColumn get componentId => text().named('component_id')();

  /// Foreign key to [Keywords.id].
  IntColumn get keywordId => integer().named('keyword_id')();

  @override
  Set<Column> get primaryKey => {componentId, keywordId};
}

/// Component URLs (homepage, bugtracker, etc.).
@DataClassName('ComponentUrlRow')
class ComponentUrls extends Table {
  /// Foreign key to [Components.id].
  TextColumn get componentId => text().named('component_id')();

  /// URL type as an integer (homepage, bugtracker, donation, etc.).
  IntColumn get urlType => integer().named('url_type')();

  /// The URL value.
  TextColumn get url => text()();

  @override
  Set<Column> get primaryKey => {componentId, urlType};
}

/// Component icons.
@DataClassName('ComponentIconRow')
class ComponentIcons extends Table {
  /// Auto-incrementing primary key.
  IntColumn get id => integer().autoIncrement()();

  /// Foreign key to [Components.id].
  TextColumn get componentId => text().named('component_id')();

  /// Icon type as an integer (stock, cached, remote, etc.).
  IntColumn get iconType => integer().named('icon_type')();

  /// Icon filename or URL, depending on [iconType].
  TextColumn get value => text()();

  /// Icon width in pixels, if known.
  IntColumn get width => integer().nullable()();

  /// Icon height in pixels, if known.
  IntColumn get height => integer().nullable()();

  /// HiDPI scale factor (e.g. 2 for @2x), if specified.
  IntColumn get scale => integer().nullable()();
}

/// Release versions.
@DataClassName('ReleaseRow')
class Releases extends Table {
  /// Auto-incrementing primary key.
  IntColumn get id => integer().autoIncrement()();

  /// Foreign key to [Components.id].
  TextColumn get componentId => text().named('component_id')();

  /// Release type as an integer (stable, development, snapshot).
  IntColumn get releaseType => integer().named('release_type').nullable()();

  /// Version string (e.g. `1.2.3`).
  TextColumn get version => text().nullable()();

  /// Human-readable release date string.
  TextColumn get date => text().nullable()();

  /// ISO 8601 timestamp derived from the Unix epoch attribute.
  TextColumn get timestamp => text().nullable()();

  /// End-of-life date, if declared.
  TextColumn get dateEol => text().named('date_eol').nullable()();

  /// Release urgency as an integer (low, medium, high, critical).
  IntColumn get urgency => integer().nullable()();

  /// Release notes in AppStream markup.
  TextColumn get description => text().nullable()();

  /// URL to release announcement or changelog.
  TextColumn get url => text().nullable()();
}

/// Release issues / CVEs.
@DataClassName('ReleaseIssueRow')
class ReleaseIssues extends Table {
  /// Auto-incrementing primary key.
  IntColumn get id => integer().autoIncrement()();

  /// Foreign key to [Releases.id].
  IntColumn get releaseId => integer().named('release_id')();

  /// Issue type as an integer (generic, CVE).
  IntColumn get issueType => integer().named('issue_type').nullable()();

  /// URL to the issue tracker entry or CVE record.
  TextColumn get url => text().nullable()();

  /// Issue identifier text (e.g. `CVE-2025-12345`).
  TextColumn get value => text().nullable()();
}

/// Screenshots.
@DataClassName('ScreenshotRow')
class Screenshots extends Table {
  /// Auto-incrementing primary key.
  IntColumn get id => integer().autoIncrement()();

  /// Foreign key to [Components.id].
  TextColumn get componentId => text().named('component_id')();

  /// Whether this is the default screenshot shown in listings.
  BoolColumn get isDefault =>
      boolean().named('is_default').withDefault(const Constant(false))();

  /// Optional caption text describing the screenshot.
  TextColumn get caption => text().nullable()();
}

/// Screenshot images.
@DataClassName('ScreenshotImageRow')
class ScreenshotImages extends Table {
  /// Auto-incrementing primary key.
  IntColumn get id => integer().autoIncrement()();

  /// Foreign key to [Screenshots.id].
  IntColumn get screenshotId => integer().named('screenshot_id')();

  /// Image URL.
  TextColumn get url => text()();

  /// Image type (`source` or `thumbnail`).
  TextColumn get type => text().nullable()();

  /// Image width in pixels.
  IntColumn get width => integer().nullable()();

  /// Image height in pixels.
  IntColumn get height => integer().nullable()();
}

/// Screenshot videos.
@DataClassName('ScreenshotVideoRow')
class ScreenshotVideos extends Table {
  /// Auto-incrementing primary key.
  IntColumn get id => integer().autoIncrement()();

  /// Foreign key to [Screenshots.id].
  IntColumn get screenshotId => integer().named('screenshot_id')();

  /// Video URL.
  TextColumn get url => text()();

  /// Video codec (e.g. `av1`, `vp9`).
  TextColumn get codec => text().nullable()();

  /// Container format (e.g. `webm`, `mkv`).
  TextColumn get container => text().nullable()();

  /// Video width in pixels.
  IntColumn get width => integer().nullable()();

  /// Video height in pixels.
  IntColumn get height => integer().nullable()();
}

/// Content rating attributes (OARS).
@DataClassName('ContentRatingAttrRow')
class ContentRatingAttrs extends Table {
  /// Foreign key to [Components.id].
  TextColumn get componentId => text().named('component_id')();

  /// OARS attribute identifier (e.g. `violence-cartoon`).
  TextColumn get attrId => text().named('attr_id')();

  /// Rating level (`none`, `mild`, `moderate`, `intense`).
  TextColumn get value => text()();

  @override
  Set<Column> get primaryKey => {componentId, attrId};
}

/// Component languages.
@DataClassName('ComponentLanguageRow')
class ComponentLanguages extends Table {
  /// Foreign key to [Components.id].
  TextColumn get componentId => text().named('component_id')();

  /// BCP 47 language tag (e.g. `en`, `pt-BR`).
  TextColumn get language => text()();

  @override
  Set<Column> get primaryKey => {componentId, language};
}

/// Branding colors.
@DataClassName('BrandingColorRow')
class BrandingColors extends Table {
  /// Foreign key to [Components.id].
  TextColumn get componentId => text().named('component_id')();

  /// Color scheme preference (`light` or `dark`).
  TextColumn get schemePreference => text().named('scheme_preference')();

  /// CSS color value (e.g. `#3584e4`).
  TextColumn get color => text()();

  @override
  Set<Column> get primaryKey => {componentId, schemePreference};
}

/// Component extends (what other components this extends).
@DataClassName('ComponentExtendRow')
class ComponentExtends extends Table {
  /// Foreign key to [Components.id].
  TextColumn get componentId => text().named('component_id')();

  /// Component ID that this component extends.
  TextColumn get extendsId => text().named('extends_id')();

  @override
  Set<Column> get primaryKey => {componentId, extendsId};
}

/// Component suggests.
@DataClassName('ComponentSuggestRow')
class ComponentSuggests extends Table {
  /// Foreign key to [Components.id].
  TextColumn get componentId => text().named('component_id')();

  /// Component ID of the suggested component.
  TextColumn get suggestedId => text().named('suggested_id')();

  @override
  Set<Column> get primaryKey => {componentId, suggestedId};
}

/// Component relations (requires/recommends).
@DataClassName('ComponentRelationRow')
class ComponentRelations extends Table {
  /// Auto-incrementing primary key.
  IntColumn get id => integer().autoIncrement()();

  /// Foreign key to [Components.id].
  TextColumn get componentId => text().named('component_id')();

  /// Relation kind (`requires`, `recommends`, `supports`).
  TextColumn get relationKind => text().named('relation_kind')();

  /// Relation item type (`id`, `modalias`, `kernel`, `memory`, etc.).
  TextColumn get relationType => text().named('relation_type')();

  /// Relation item value.
  TextColumn get value => text().nullable()();

  /// Version comparison operator (`ge`, `le`, `eq`, etc.).
  TextColumn get compare => text().nullable()();

  /// Version string for the comparison.
  TextColumn get version => text().nullable()();
}

/// Custom key-value metadata.
@DataClassName('ComponentCustomRow')
class ComponentCustom extends Table {
  /// Foreign key to [Components.id].
  TextColumn get componentId => text().named('component_id')();

  /// Custom metadata key.
  TextColumn get key => text()();

  /// Custom metadata value.
  TextColumn get value => text()();

  @override
  Set<Column> get primaryKey => {componentId, key};
}

/// Localized field translations (xml:lang variants of name, summary, etc.).
@DataClassName('ComponentFieldTranslationRow')
class ComponentFieldTranslations extends Table {
  /// Foreign key to [Components.id].
  TextColumn get componentId => text().named('component_id')();

  /// Field name being translated (e.g. `name`, `summary`, `description`).
  TextColumn get field => text()();

  /// BCP 47 language tag of the translation.
  TextColumn get language => text()();

  /// Translated text.
  TextColumn get value => text()();

  @override
  Set<Column> get primaryKey => {componentId, field, language};
}
