import 'package:drift/drift.dart';

/// Main components table — one row per AppStream component.
@DataClassName('ComponentRow')
class Components extends Table {
  TextColumn get id => text()();
  IntColumn get componentType => integer().named('component_type').withDefault(const Constant(0))();
  IntColumn get priority => integer().withDefault(const Constant(0))();
  TextColumn get merge => text().nullable()();
  TextColumn get name => text()();
  TextColumn get nameVariantSuffix => text().named('name_variant_suffix').nullable()();
  TextColumn get summary => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get pkgname => text().nullable()();
  TextColumn get sourcePkgname => text().named('source_pkgname').nullable()();
  TextColumn get projectLicense => text().named('project_license').nullable()();
  TextColumn get metadataLicense => text().named('metadata_license').nullable()();
  TextColumn get projectGroup => text().named('project_group').nullable()();
  TextColumn get mediaBaseurl => text().named('media_baseurl').nullable()();
  TextColumn get architecture => text().nullable()();
  IntColumn get bundleType => integer().named('bundle_type').nullable()();
  TextColumn get bundleId => text().named('bundle_id').nullable()();
  TextColumn get developerId => text().named('developer_id').nullable()();
  TextColumn get developerName => text().named('developer_name').nullable()();
  IntColumn get launchableType => integer().named('launchable_type').nullable()();
  TextColumn get launchableValue => text().named('launchable_value').nullable()();
  TextColumn get contentRatingType => text().named('content_rating_type').nullable()();
  TextColumn get agreement => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Interned categories.
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().unique()();
}

/// Join table: component ↔ category.
@DataClassName('ComponentCategoryRow')
class ComponentCategories extends Table {
  TextColumn get componentId => text().named('component_id')();
  IntColumn get categoryId => integer().named('category_id')();

  @override
  Set<Column> get primaryKey => {componentId, categoryId};
}

/// Interned keywords.
class Keywords extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().unique()();
}

/// Join table: component ↔ keyword.
@DataClassName('ComponentKeywordRow')
class ComponentKeywords extends Table {
  TextColumn get componentId => text().named('component_id')();
  IntColumn get keywordId => integer().named('keyword_id')();

  @override
  Set<Column> get primaryKey => {componentId, keywordId};
}

/// Component URLs (homepage, bugtracker, etc.).
@DataClassName('ComponentUrlRow')
class ComponentUrls extends Table {
  TextColumn get componentId => text().named('component_id')();
  IntColumn get urlType => integer().named('url_type')();
  TextColumn get url => text()();

  @override
  Set<Column> get primaryKey => {componentId, urlType};
}

/// Component icons.
@DataClassName('ComponentIconRow')
class ComponentIcons extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get componentId => text().named('component_id')();
  IntColumn get iconType => integer().named('icon_type')();
  TextColumn get value => text()();
  IntColumn get width => integer().nullable()();
  IntColumn get height => integer().nullable()();
  IntColumn get scale => integer().nullable()();
}

/// Release versions.
@DataClassName('ReleaseRow')
class Releases extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get componentId => text().named('component_id')();
  IntColumn get releaseType => integer().named('release_type').nullable()();
  TextColumn get version => text().nullable()();
  TextColumn get date => text().nullable()();
  TextColumn get timestamp => text().nullable()();
  TextColumn get dateEol => text().named('date_eol').nullable()();
  IntColumn get urgency => integer().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get url => text().nullable()();
}

/// Release issues / CVEs.
@DataClassName('ReleaseIssueRow')
class ReleaseIssues extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get releaseId => integer().named('release_id')();
  IntColumn get issueType => integer().named('issue_type').nullable()();
  TextColumn get url => text().nullable()();
  TextColumn get value => text().nullable()();
}

/// Screenshots.
@DataClassName('ScreenshotRow')
class Screenshots extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get componentId => text().named('component_id')();
  BoolColumn get isDefault => boolean().named('is_default').withDefault(const Constant(false))();
  TextColumn get caption => text().nullable()();
}

/// Screenshot images.
@DataClassName('ScreenshotImageRow')
class ScreenshotImages extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get screenshotId => integer().named('screenshot_id')();
  TextColumn get url => text()();
  TextColumn get type => text().nullable()();
  IntColumn get width => integer().nullable()();
  IntColumn get height => integer().nullable()();
}

/// Screenshot videos.
@DataClassName('ScreenshotVideoRow')
class ScreenshotVideos extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get screenshotId => integer().named('screenshot_id')();
  TextColumn get url => text()();
  TextColumn get codec => text().nullable()();
  TextColumn get container => text().nullable()();
  IntColumn get width => integer().nullable()();
  IntColumn get height => integer().nullable()();
}

/// Content rating attributes (OARS).
@DataClassName('ContentRatingAttrRow')
class ContentRatingAttrs extends Table {
  TextColumn get componentId => text().named('component_id')();
  TextColumn get attrId => text().named('attr_id')();
  TextColumn get value => text()();

  @override
  Set<Column> get primaryKey => {componentId, attrId};
}

/// Component languages.
@DataClassName('ComponentLanguageRow')
class ComponentLanguages extends Table {
  TextColumn get componentId => text().named('component_id')();
  TextColumn get language => text()();

  @override
  Set<Column> get primaryKey => {componentId, language};
}

/// Branding colors.
@DataClassName('BrandingColorRow')
class BrandingColors extends Table {
  TextColumn get componentId => text().named('component_id')();
  TextColumn get schemePreference => text().named('scheme_preference')();
  TextColumn get color => text()();

  @override
  Set<Column> get primaryKey => {componentId, schemePreference};
}

/// Component extends (what other components this extends).
@DataClassName('ComponentExtendRow')
class ComponentExtends extends Table {
  TextColumn get componentId => text().named('component_id')();
  TextColumn get extendsId => text().named('extends_id')();

  @override
  Set<Column> get primaryKey => {componentId, extendsId};
}

/// Component suggests.
@DataClassName('ComponentSuggestRow')
class ComponentSuggests extends Table {
  TextColumn get componentId => text().named('component_id')();
  TextColumn get suggestedId => text().named('suggested_id')();

  @override
  Set<Column> get primaryKey => {componentId, suggestedId};
}

/// Component relations (requires/recommends).
@DataClassName('ComponentRelationRow')
class ComponentRelations extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get componentId => text().named('component_id')();
  TextColumn get relationKind => text().named('relation_kind')();
  TextColumn get relationType => text().named('relation_type')();
  TextColumn get value => text().nullable()();
  TextColumn get compare => text().nullable()();
  TextColumn get version => text().nullable()();
}

/// Custom key-value metadata.
@DataClassName('ComponentCustomRow')
class ComponentCustom extends Table {
  TextColumn get componentId => text().named('component_id')();
  TextColumn get key => text()();
  TextColumn get value => text()();

  @override
  Set<Column> get primaryKey => {componentId, key};
}