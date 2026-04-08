// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ComponentsTable extends Components
    with TableInfo<$ComponentsTable, ComponentRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ComponentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _componentTypeMeta = const VerificationMeta(
    'componentType',
  );
  @override
  late final GeneratedColumn<int> componentType = GeneratedColumn<int>(
    'component_type',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _priorityMeta = const VerificationMeta(
    'priority',
  );
  @override
  late final GeneratedColumn<int> priority = GeneratedColumn<int>(
    'priority',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _mergeMeta = const VerificationMeta('merge');
  @override
  late final GeneratedColumn<String> merge = GeneratedColumn<String>(
    'merge',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameVariantSuffixMeta = const VerificationMeta(
    'nameVariantSuffix',
  );
  @override
  late final GeneratedColumn<String> nameVariantSuffix =
      GeneratedColumn<String>(
        'name_variant_suffix',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _summaryMeta = const VerificationMeta(
    'summary',
  );
  @override
  late final GeneratedColumn<String> summary = GeneratedColumn<String>(
    'summary',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pkgnameMeta = const VerificationMeta(
    'pkgname',
  );
  @override
  late final GeneratedColumn<String> pkgname = GeneratedColumn<String>(
    'pkgname',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sourcePkgnameMeta = const VerificationMeta(
    'sourcePkgname',
  );
  @override
  late final GeneratedColumn<String> sourcePkgname = GeneratedColumn<String>(
    'source_pkgname',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _projectLicenseMeta = const VerificationMeta(
    'projectLicense',
  );
  @override
  late final GeneratedColumn<String> projectLicense = GeneratedColumn<String>(
    'project_license',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _metadataLicenseMeta = const VerificationMeta(
    'metadataLicense',
  );
  @override
  late final GeneratedColumn<String> metadataLicense = GeneratedColumn<String>(
    'metadata_license',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _projectGroupMeta = const VerificationMeta(
    'projectGroup',
  );
  @override
  late final GeneratedColumn<String> projectGroup = GeneratedColumn<String>(
    'project_group',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _mediaBaseurlMeta = const VerificationMeta(
    'mediaBaseurl',
  );
  @override
  late final GeneratedColumn<String> mediaBaseurl = GeneratedColumn<String>(
    'media_baseurl',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _architectureMeta = const VerificationMeta(
    'architecture',
  );
  @override
  late final GeneratedColumn<String> architecture = GeneratedColumn<String>(
    'architecture',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bundleTypeMeta = const VerificationMeta(
    'bundleType',
  );
  @override
  late final GeneratedColumn<int> bundleType = GeneratedColumn<int>(
    'bundle_type',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bundleIdMeta = const VerificationMeta(
    'bundleId',
  );
  @override
  late final GeneratedColumn<String> bundleId = GeneratedColumn<String>(
    'bundle_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _developerIdMeta = const VerificationMeta(
    'developerId',
  );
  @override
  late final GeneratedColumn<String> developerId = GeneratedColumn<String>(
    'developer_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _developerNameMeta = const VerificationMeta(
    'developerName',
  );
  @override
  late final GeneratedColumn<String> developerName = GeneratedColumn<String>(
    'developer_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _launchableTypeMeta = const VerificationMeta(
    'launchableType',
  );
  @override
  late final GeneratedColumn<int> launchableType = GeneratedColumn<int>(
    'launchable_type',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _launchableValueMeta = const VerificationMeta(
    'launchableValue',
  );
  @override
  late final GeneratedColumn<String> launchableValue = GeneratedColumn<String>(
    'launchable_value',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _contentRatingTypeMeta = const VerificationMeta(
    'contentRatingType',
  );
  @override
  late final GeneratedColumn<String> contentRatingType =
      GeneratedColumn<String>(
        'content_rating_type',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _agreementMeta = const VerificationMeta(
    'agreement',
  );
  @override
  late final GeneratedColumn<String> agreement = GeneratedColumn<String>(
    'agreement',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    componentType,
    priority,
    merge,
    name,
    nameVariantSuffix,
    summary,
    description,
    pkgname,
    sourcePkgname,
    projectLicense,
    metadataLicense,
    projectGroup,
    mediaBaseurl,
    architecture,
    bundleType,
    bundleId,
    developerId,
    developerName,
    launchableType,
    launchableValue,
    contentRatingType,
    agreement,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'components';
  @override
  VerificationContext validateIntegrity(
    Insertable<ComponentRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('component_type')) {
      context.handle(
        _componentTypeMeta,
        componentType.isAcceptableOrUnknown(
          data['component_type']!,
          _componentTypeMeta,
        ),
      );
    }
    if (data.containsKey('priority')) {
      context.handle(
        _priorityMeta,
        priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta),
      );
    }
    if (data.containsKey('merge')) {
      context.handle(
        _mergeMeta,
        merge.isAcceptableOrUnknown(data['merge']!, _mergeMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('name_variant_suffix')) {
      context.handle(
        _nameVariantSuffixMeta,
        nameVariantSuffix.isAcceptableOrUnknown(
          data['name_variant_suffix']!,
          _nameVariantSuffixMeta,
        ),
      );
    }
    if (data.containsKey('summary')) {
      context.handle(
        _summaryMeta,
        summary.isAcceptableOrUnknown(data['summary']!, _summaryMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('pkgname')) {
      context.handle(
        _pkgnameMeta,
        pkgname.isAcceptableOrUnknown(data['pkgname']!, _pkgnameMeta),
      );
    }
    if (data.containsKey('source_pkgname')) {
      context.handle(
        _sourcePkgnameMeta,
        sourcePkgname.isAcceptableOrUnknown(
          data['source_pkgname']!,
          _sourcePkgnameMeta,
        ),
      );
    }
    if (data.containsKey('project_license')) {
      context.handle(
        _projectLicenseMeta,
        projectLicense.isAcceptableOrUnknown(
          data['project_license']!,
          _projectLicenseMeta,
        ),
      );
    }
    if (data.containsKey('metadata_license')) {
      context.handle(
        _metadataLicenseMeta,
        metadataLicense.isAcceptableOrUnknown(
          data['metadata_license']!,
          _metadataLicenseMeta,
        ),
      );
    }
    if (data.containsKey('project_group')) {
      context.handle(
        _projectGroupMeta,
        projectGroup.isAcceptableOrUnknown(
          data['project_group']!,
          _projectGroupMeta,
        ),
      );
    }
    if (data.containsKey('media_baseurl')) {
      context.handle(
        _mediaBaseurlMeta,
        mediaBaseurl.isAcceptableOrUnknown(
          data['media_baseurl']!,
          _mediaBaseurlMeta,
        ),
      );
    }
    if (data.containsKey('architecture')) {
      context.handle(
        _architectureMeta,
        architecture.isAcceptableOrUnknown(
          data['architecture']!,
          _architectureMeta,
        ),
      );
    }
    if (data.containsKey('bundle_type')) {
      context.handle(
        _bundleTypeMeta,
        bundleType.isAcceptableOrUnknown(data['bundle_type']!, _bundleTypeMeta),
      );
    }
    if (data.containsKey('bundle_id')) {
      context.handle(
        _bundleIdMeta,
        bundleId.isAcceptableOrUnknown(data['bundle_id']!, _bundleIdMeta),
      );
    }
    if (data.containsKey('developer_id')) {
      context.handle(
        _developerIdMeta,
        developerId.isAcceptableOrUnknown(
          data['developer_id']!,
          _developerIdMeta,
        ),
      );
    }
    if (data.containsKey('developer_name')) {
      context.handle(
        _developerNameMeta,
        developerName.isAcceptableOrUnknown(
          data['developer_name']!,
          _developerNameMeta,
        ),
      );
    }
    if (data.containsKey('launchable_type')) {
      context.handle(
        _launchableTypeMeta,
        launchableType.isAcceptableOrUnknown(
          data['launchable_type']!,
          _launchableTypeMeta,
        ),
      );
    }
    if (data.containsKey('launchable_value')) {
      context.handle(
        _launchableValueMeta,
        launchableValue.isAcceptableOrUnknown(
          data['launchable_value']!,
          _launchableValueMeta,
        ),
      );
    }
    if (data.containsKey('content_rating_type')) {
      context.handle(
        _contentRatingTypeMeta,
        contentRatingType.isAcceptableOrUnknown(
          data['content_rating_type']!,
          _contentRatingTypeMeta,
        ),
      );
    }
    if (data.containsKey('agreement')) {
      context.handle(
        _agreementMeta,
        agreement.isAcceptableOrUnknown(data['agreement']!, _agreementMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ComponentRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ComponentRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      componentType: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}component_type'],
      )!,
      priority: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}priority'],
      )!,
      merge: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}merge'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      nameVariantSuffix: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_variant_suffix'],
      ),
      summary: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}summary'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      pkgname: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pkgname'],
      ),
      sourcePkgname: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_pkgname'],
      ),
      projectLicense: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}project_license'],
      ),
      metadataLicense: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}metadata_license'],
      ),
      projectGroup: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}project_group'],
      ),
      mediaBaseurl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}media_baseurl'],
      ),
      architecture: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}architecture'],
      ),
      bundleType: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}bundle_type'],
      ),
      bundleId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bundle_id'],
      ),
      developerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}developer_id'],
      ),
      developerName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}developer_name'],
      ),
      launchableType: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}launchable_type'],
      ),
      launchableValue: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}launchable_value'],
      ),
      contentRatingType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content_rating_type'],
      ),
      agreement: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}agreement'],
      ),
    );
  }

  @override
  $ComponentsTable createAlias(String alias) {
    return $ComponentsTable(attachedDatabase, alias);
  }
}

class ComponentRow extends DataClass implements Insertable<ComponentRow> {
  final String id;
  final int componentType;
  final int priority;
  final String? merge;
  final String name;
  final String? nameVariantSuffix;
  final String? summary;
  final String? description;
  final String? pkgname;
  final String? sourcePkgname;
  final String? projectLicense;
  final String? metadataLicense;
  final String? projectGroup;
  final String? mediaBaseurl;
  final String? architecture;
  final int? bundleType;
  final String? bundleId;
  final String? developerId;
  final String? developerName;
  final int? launchableType;
  final String? launchableValue;
  final String? contentRatingType;
  final String? agreement;
  const ComponentRow({
    required this.id,
    required this.componentType,
    required this.priority,
    this.merge,
    required this.name,
    this.nameVariantSuffix,
    this.summary,
    this.description,
    this.pkgname,
    this.sourcePkgname,
    this.projectLicense,
    this.metadataLicense,
    this.projectGroup,
    this.mediaBaseurl,
    this.architecture,
    this.bundleType,
    this.bundleId,
    this.developerId,
    this.developerName,
    this.launchableType,
    this.launchableValue,
    this.contentRatingType,
    this.agreement,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['component_type'] = Variable<int>(componentType);
    map['priority'] = Variable<int>(priority);
    if (!nullToAbsent || merge != null) {
      map['merge'] = Variable<String>(merge);
    }
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || nameVariantSuffix != null) {
      map['name_variant_suffix'] = Variable<String>(nameVariantSuffix);
    }
    if (!nullToAbsent || summary != null) {
      map['summary'] = Variable<String>(summary);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || pkgname != null) {
      map['pkgname'] = Variable<String>(pkgname);
    }
    if (!nullToAbsent || sourcePkgname != null) {
      map['source_pkgname'] = Variable<String>(sourcePkgname);
    }
    if (!nullToAbsent || projectLicense != null) {
      map['project_license'] = Variable<String>(projectLicense);
    }
    if (!nullToAbsent || metadataLicense != null) {
      map['metadata_license'] = Variable<String>(metadataLicense);
    }
    if (!nullToAbsent || projectGroup != null) {
      map['project_group'] = Variable<String>(projectGroup);
    }
    if (!nullToAbsent || mediaBaseurl != null) {
      map['media_baseurl'] = Variable<String>(mediaBaseurl);
    }
    if (!nullToAbsent || architecture != null) {
      map['architecture'] = Variable<String>(architecture);
    }
    if (!nullToAbsent || bundleType != null) {
      map['bundle_type'] = Variable<int>(bundleType);
    }
    if (!nullToAbsent || bundleId != null) {
      map['bundle_id'] = Variable<String>(bundleId);
    }
    if (!nullToAbsent || developerId != null) {
      map['developer_id'] = Variable<String>(developerId);
    }
    if (!nullToAbsent || developerName != null) {
      map['developer_name'] = Variable<String>(developerName);
    }
    if (!nullToAbsent || launchableType != null) {
      map['launchable_type'] = Variable<int>(launchableType);
    }
    if (!nullToAbsent || launchableValue != null) {
      map['launchable_value'] = Variable<String>(launchableValue);
    }
    if (!nullToAbsent || contentRatingType != null) {
      map['content_rating_type'] = Variable<String>(contentRatingType);
    }
    if (!nullToAbsent || agreement != null) {
      map['agreement'] = Variable<String>(agreement);
    }
    return map;
  }

  ComponentsCompanion toCompanion(bool nullToAbsent) {
    return ComponentsCompanion(
      id: Value(id),
      componentType: Value(componentType),
      priority: Value(priority),
      merge: merge == null && nullToAbsent
          ? const Value.absent()
          : Value(merge),
      name: Value(name),
      nameVariantSuffix: nameVariantSuffix == null && nullToAbsent
          ? const Value.absent()
          : Value(nameVariantSuffix),
      summary: summary == null && nullToAbsent
          ? const Value.absent()
          : Value(summary),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      pkgname: pkgname == null && nullToAbsent
          ? const Value.absent()
          : Value(pkgname),
      sourcePkgname: sourcePkgname == null && nullToAbsent
          ? const Value.absent()
          : Value(sourcePkgname),
      projectLicense: projectLicense == null && nullToAbsent
          ? const Value.absent()
          : Value(projectLicense),
      metadataLicense: metadataLicense == null && nullToAbsent
          ? const Value.absent()
          : Value(metadataLicense),
      projectGroup: projectGroup == null && nullToAbsent
          ? const Value.absent()
          : Value(projectGroup),
      mediaBaseurl: mediaBaseurl == null && nullToAbsent
          ? const Value.absent()
          : Value(mediaBaseurl),
      architecture: architecture == null && nullToAbsent
          ? const Value.absent()
          : Value(architecture),
      bundleType: bundleType == null && nullToAbsent
          ? const Value.absent()
          : Value(bundleType),
      bundleId: bundleId == null && nullToAbsent
          ? const Value.absent()
          : Value(bundleId),
      developerId: developerId == null && nullToAbsent
          ? const Value.absent()
          : Value(developerId),
      developerName: developerName == null && nullToAbsent
          ? const Value.absent()
          : Value(developerName),
      launchableType: launchableType == null && nullToAbsent
          ? const Value.absent()
          : Value(launchableType),
      launchableValue: launchableValue == null && nullToAbsent
          ? const Value.absent()
          : Value(launchableValue),
      contentRatingType: contentRatingType == null && nullToAbsent
          ? const Value.absent()
          : Value(contentRatingType),
      agreement: agreement == null && nullToAbsent
          ? const Value.absent()
          : Value(agreement),
    );
  }

  factory ComponentRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ComponentRow(
      id: serializer.fromJson<String>(json['id']),
      componentType: serializer.fromJson<int>(json['componentType']),
      priority: serializer.fromJson<int>(json['priority']),
      merge: serializer.fromJson<String?>(json['merge']),
      name: serializer.fromJson<String>(json['name']),
      nameVariantSuffix: serializer.fromJson<String?>(
        json['nameVariantSuffix'],
      ),
      summary: serializer.fromJson<String?>(json['summary']),
      description: serializer.fromJson<String?>(json['description']),
      pkgname: serializer.fromJson<String?>(json['pkgname']),
      sourcePkgname: serializer.fromJson<String?>(json['sourcePkgname']),
      projectLicense: serializer.fromJson<String?>(json['projectLicense']),
      metadataLicense: serializer.fromJson<String?>(json['metadataLicense']),
      projectGroup: serializer.fromJson<String?>(json['projectGroup']),
      mediaBaseurl: serializer.fromJson<String?>(json['mediaBaseurl']),
      architecture: serializer.fromJson<String?>(json['architecture']),
      bundleType: serializer.fromJson<int?>(json['bundleType']),
      bundleId: serializer.fromJson<String?>(json['bundleId']),
      developerId: serializer.fromJson<String?>(json['developerId']),
      developerName: serializer.fromJson<String?>(json['developerName']),
      launchableType: serializer.fromJson<int?>(json['launchableType']),
      launchableValue: serializer.fromJson<String?>(json['launchableValue']),
      contentRatingType: serializer.fromJson<String?>(
        json['contentRatingType'],
      ),
      agreement: serializer.fromJson<String?>(json['agreement']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'componentType': serializer.toJson<int>(componentType),
      'priority': serializer.toJson<int>(priority),
      'merge': serializer.toJson<String?>(merge),
      'name': serializer.toJson<String>(name),
      'nameVariantSuffix': serializer.toJson<String?>(nameVariantSuffix),
      'summary': serializer.toJson<String?>(summary),
      'description': serializer.toJson<String?>(description),
      'pkgname': serializer.toJson<String?>(pkgname),
      'sourcePkgname': serializer.toJson<String?>(sourcePkgname),
      'projectLicense': serializer.toJson<String?>(projectLicense),
      'metadataLicense': serializer.toJson<String?>(metadataLicense),
      'projectGroup': serializer.toJson<String?>(projectGroup),
      'mediaBaseurl': serializer.toJson<String?>(mediaBaseurl),
      'architecture': serializer.toJson<String?>(architecture),
      'bundleType': serializer.toJson<int?>(bundleType),
      'bundleId': serializer.toJson<String?>(bundleId),
      'developerId': serializer.toJson<String?>(developerId),
      'developerName': serializer.toJson<String?>(developerName),
      'launchableType': serializer.toJson<int?>(launchableType),
      'launchableValue': serializer.toJson<String?>(launchableValue),
      'contentRatingType': serializer.toJson<String?>(contentRatingType),
      'agreement': serializer.toJson<String?>(agreement),
    };
  }

  ComponentRow copyWith({
    String? id,
    int? componentType,
    int? priority,
    Value<String?> merge = const Value.absent(),
    String? name,
    Value<String?> nameVariantSuffix = const Value.absent(),
    Value<String?> summary = const Value.absent(),
    Value<String?> description = const Value.absent(),
    Value<String?> pkgname = const Value.absent(),
    Value<String?> sourcePkgname = const Value.absent(),
    Value<String?> projectLicense = const Value.absent(),
    Value<String?> metadataLicense = const Value.absent(),
    Value<String?> projectGroup = const Value.absent(),
    Value<String?> mediaBaseurl = const Value.absent(),
    Value<String?> architecture = const Value.absent(),
    Value<int?> bundleType = const Value.absent(),
    Value<String?> bundleId = const Value.absent(),
    Value<String?> developerId = const Value.absent(),
    Value<String?> developerName = const Value.absent(),
    Value<int?> launchableType = const Value.absent(),
    Value<String?> launchableValue = const Value.absent(),
    Value<String?> contentRatingType = const Value.absent(),
    Value<String?> agreement = const Value.absent(),
  }) => ComponentRow(
    id: id ?? this.id,
    componentType: componentType ?? this.componentType,
    priority: priority ?? this.priority,
    merge: merge.present ? merge.value : this.merge,
    name: name ?? this.name,
    nameVariantSuffix: nameVariantSuffix.present
        ? nameVariantSuffix.value
        : this.nameVariantSuffix,
    summary: summary.present ? summary.value : this.summary,
    description: description.present ? description.value : this.description,
    pkgname: pkgname.present ? pkgname.value : this.pkgname,
    sourcePkgname: sourcePkgname.present
        ? sourcePkgname.value
        : this.sourcePkgname,
    projectLicense: projectLicense.present
        ? projectLicense.value
        : this.projectLicense,
    metadataLicense: metadataLicense.present
        ? metadataLicense.value
        : this.metadataLicense,
    projectGroup: projectGroup.present ? projectGroup.value : this.projectGroup,
    mediaBaseurl: mediaBaseurl.present ? mediaBaseurl.value : this.mediaBaseurl,
    architecture: architecture.present ? architecture.value : this.architecture,
    bundleType: bundleType.present ? bundleType.value : this.bundleType,
    bundleId: bundleId.present ? bundleId.value : this.bundleId,
    developerId: developerId.present ? developerId.value : this.developerId,
    developerName: developerName.present
        ? developerName.value
        : this.developerName,
    launchableType: launchableType.present
        ? launchableType.value
        : this.launchableType,
    launchableValue: launchableValue.present
        ? launchableValue.value
        : this.launchableValue,
    contentRatingType: contentRatingType.present
        ? contentRatingType.value
        : this.contentRatingType,
    agreement: agreement.present ? agreement.value : this.agreement,
  );
  ComponentRow copyWithCompanion(ComponentsCompanion data) {
    return ComponentRow(
      id: data.id.present ? data.id.value : this.id,
      componentType: data.componentType.present
          ? data.componentType.value
          : this.componentType,
      priority: data.priority.present ? data.priority.value : this.priority,
      merge: data.merge.present ? data.merge.value : this.merge,
      name: data.name.present ? data.name.value : this.name,
      nameVariantSuffix: data.nameVariantSuffix.present
          ? data.nameVariantSuffix.value
          : this.nameVariantSuffix,
      summary: data.summary.present ? data.summary.value : this.summary,
      description: data.description.present
          ? data.description.value
          : this.description,
      pkgname: data.pkgname.present ? data.pkgname.value : this.pkgname,
      sourcePkgname: data.sourcePkgname.present
          ? data.sourcePkgname.value
          : this.sourcePkgname,
      projectLicense: data.projectLicense.present
          ? data.projectLicense.value
          : this.projectLicense,
      metadataLicense: data.metadataLicense.present
          ? data.metadataLicense.value
          : this.metadataLicense,
      projectGroup: data.projectGroup.present
          ? data.projectGroup.value
          : this.projectGroup,
      mediaBaseurl: data.mediaBaseurl.present
          ? data.mediaBaseurl.value
          : this.mediaBaseurl,
      architecture: data.architecture.present
          ? data.architecture.value
          : this.architecture,
      bundleType: data.bundleType.present
          ? data.bundleType.value
          : this.bundleType,
      bundleId: data.bundleId.present ? data.bundleId.value : this.bundleId,
      developerId: data.developerId.present
          ? data.developerId.value
          : this.developerId,
      developerName: data.developerName.present
          ? data.developerName.value
          : this.developerName,
      launchableType: data.launchableType.present
          ? data.launchableType.value
          : this.launchableType,
      launchableValue: data.launchableValue.present
          ? data.launchableValue.value
          : this.launchableValue,
      contentRatingType: data.contentRatingType.present
          ? data.contentRatingType.value
          : this.contentRatingType,
      agreement: data.agreement.present ? data.agreement.value : this.agreement,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ComponentRow(')
          ..write('id: $id, ')
          ..write('componentType: $componentType, ')
          ..write('priority: $priority, ')
          ..write('merge: $merge, ')
          ..write('name: $name, ')
          ..write('nameVariantSuffix: $nameVariantSuffix, ')
          ..write('summary: $summary, ')
          ..write('description: $description, ')
          ..write('pkgname: $pkgname, ')
          ..write('sourcePkgname: $sourcePkgname, ')
          ..write('projectLicense: $projectLicense, ')
          ..write('metadataLicense: $metadataLicense, ')
          ..write('projectGroup: $projectGroup, ')
          ..write('mediaBaseurl: $mediaBaseurl, ')
          ..write('architecture: $architecture, ')
          ..write('bundleType: $bundleType, ')
          ..write('bundleId: $bundleId, ')
          ..write('developerId: $developerId, ')
          ..write('developerName: $developerName, ')
          ..write('launchableType: $launchableType, ')
          ..write('launchableValue: $launchableValue, ')
          ..write('contentRatingType: $contentRatingType, ')
          ..write('agreement: $agreement')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    componentType,
    priority,
    merge,
    name,
    nameVariantSuffix,
    summary,
    description,
    pkgname,
    sourcePkgname,
    projectLicense,
    metadataLicense,
    projectGroup,
    mediaBaseurl,
    architecture,
    bundleType,
    bundleId,
    developerId,
    developerName,
    launchableType,
    launchableValue,
    contentRatingType,
    agreement,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ComponentRow &&
          other.id == this.id &&
          other.componentType == this.componentType &&
          other.priority == this.priority &&
          other.merge == this.merge &&
          other.name == this.name &&
          other.nameVariantSuffix == this.nameVariantSuffix &&
          other.summary == this.summary &&
          other.description == this.description &&
          other.pkgname == this.pkgname &&
          other.sourcePkgname == this.sourcePkgname &&
          other.projectLicense == this.projectLicense &&
          other.metadataLicense == this.metadataLicense &&
          other.projectGroup == this.projectGroup &&
          other.mediaBaseurl == this.mediaBaseurl &&
          other.architecture == this.architecture &&
          other.bundleType == this.bundleType &&
          other.bundleId == this.bundleId &&
          other.developerId == this.developerId &&
          other.developerName == this.developerName &&
          other.launchableType == this.launchableType &&
          other.launchableValue == this.launchableValue &&
          other.contentRatingType == this.contentRatingType &&
          other.agreement == this.agreement);
}

class ComponentsCompanion extends UpdateCompanion<ComponentRow> {
  final Value<String> id;
  final Value<int> componentType;
  final Value<int> priority;
  final Value<String?> merge;
  final Value<String> name;
  final Value<String?> nameVariantSuffix;
  final Value<String?> summary;
  final Value<String?> description;
  final Value<String?> pkgname;
  final Value<String?> sourcePkgname;
  final Value<String?> projectLicense;
  final Value<String?> metadataLicense;
  final Value<String?> projectGroup;
  final Value<String?> mediaBaseurl;
  final Value<String?> architecture;
  final Value<int?> bundleType;
  final Value<String?> bundleId;
  final Value<String?> developerId;
  final Value<String?> developerName;
  final Value<int?> launchableType;
  final Value<String?> launchableValue;
  final Value<String?> contentRatingType;
  final Value<String?> agreement;
  final Value<int> rowid;
  const ComponentsCompanion({
    this.id = const Value.absent(),
    this.componentType = const Value.absent(),
    this.priority = const Value.absent(),
    this.merge = const Value.absent(),
    this.name = const Value.absent(),
    this.nameVariantSuffix = const Value.absent(),
    this.summary = const Value.absent(),
    this.description = const Value.absent(),
    this.pkgname = const Value.absent(),
    this.sourcePkgname = const Value.absent(),
    this.projectLicense = const Value.absent(),
    this.metadataLicense = const Value.absent(),
    this.projectGroup = const Value.absent(),
    this.mediaBaseurl = const Value.absent(),
    this.architecture = const Value.absent(),
    this.bundleType = const Value.absent(),
    this.bundleId = const Value.absent(),
    this.developerId = const Value.absent(),
    this.developerName = const Value.absent(),
    this.launchableType = const Value.absent(),
    this.launchableValue = const Value.absent(),
    this.contentRatingType = const Value.absent(),
    this.agreement = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ComponentsCompanion.insert({
    required String id,
    this.componentType = const Value.absent(),
    this.priority = const Value.absent(),
    this.merge = const Value.absent(),
    required String name,
    this.nameVariantSuffix = const Value.absent(),
    this.summary = const Value.absent(),
    this.description = const Value.absent(),
    this.pkgname = const Value.absent(),
    this.sourcePkgname = const Value.absent(),
    this.projectLicense = const Value.absent(),
    this.metadataLicense = const Value.absent(),
    this.projectGroup = const Value.absent(),
    this.mediaBaseurl = const Value.absent(),
    this.architecture = const Value.absent(),
    this.bundleType = const Value.absent(),
    this.bundleId = const Value.absent(),
    this.developerId = const Value.absent(),
    this.developerName = const Value.absent(),
    this.launchableType = const Value.absent(),
    this.launchableValue = const Value.absent(),
    this.contentRatingType = const Value.absent(),
    this.agreement = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name);
  static Insertable<ComponentRow> custom({
    Expression<String>? id,
    Expression<int>? componentType,
    Expression<int>? priority,
    Expression<String>? merge,
    Expression<String>? name,
    Expression<String>? nameVariantSuffix,
    Expression<String>? summary,
    Expression<String>? description,
    Expression<String>? pkgname,
    Expression<String>? sourcePkgname,
    Expression<String>? projectLicense,
    Expression<String>? metadataLicense,
    Expression<String>? projectGroup,
    Expression<String>? mediaBaseurl,
    Expression<String>? architecture,
    Expression<int>? bundleType,
    Expression<String>? bundleId,
    Expression<String>? developerId,
    Expression<String>? developerName,
    Expression<int>? launchableType,
    Expression<String>? launchableValue,
    Expression<String>? contentRatingType,
    Expression<String>? agreement,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (componentType != null) 'component_type': componentType,
      if (priority != null) 'priority': priority,
      if (merge != null) 'merge': merge,
      if (name != null) 'name': name,
      if (nameVariantSuffix != null) 'name_variant_suffix': nameVariantSuffix,
      if (summary != null) 'summary': summary,
      if (description != null) 'description': description,
      if (pkgname != null) 'pkgname': pkgname,
      if (sourcePkgname != null) 'source_pkgname': sourcePkgname,
      if (projectLicense != null) 'project_license': projectLicense,
      if (metadataLicense != null) 'metadata_license': metadataLicense,
      if (projectGroup != null) 'project_group': projectGroup,
      if (mediaBaseurl != null) 'media_baseurl': mediaBaseurl,
      if (architecture != null) 'architecture': architecture,
      if (bundleType != null) 'bundle_type': bundleType,
      if (bundleId != null) 'bundle_id': bundleId,
      if (developerId != null) 'developer_id': developerId,
      if (developerName != null) 'developer_name': developerName,
      if (launchableType != null) 'launchable_type': launchableType,
      if (launchableValue != null) 'launchable_value': launchableValue,
      if (contentRatingType != null) 'content_rating_type': contentRatingType,
      if (agreement != null) 'agreement': agreement,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ComponentsCompanion copyWith({
    Value<String>? id,
    Value<int>? componentType,
    Value<int>? priority,
    Value<String?>? merge,
    Value<String>? name,
    Value<String?>? nameVariantSuffix,
    Value<String?>? summary,
    Value<String?>? description,
    Value<String?>? pkgname,
    Value<String?>? sourcePkgname,
    Value<String?>? projectLicense,
    Value<String?>? metadataLicense,
    Value<String?>? projectGroup,
    Value<String?>? mediaBaseurl,
    Value<String?>? architecture,
    Value<int?>? bundleType,
    Value<String?>? bundleId,
    Value<String?>? developerId,
    Value<String?>? developerName,
    Value<int?>? launchableType,
    Value<String?>? launchableValue,
    Value<String?>? contentRatingType,
    Value<String?>? agreement,
    Value<int>? rowid,
  }) {
    return ComponentsCompanion(
      id: id ?? this.id,
      componentType: componentType ?? this.componentType,
      priority: priority ?? this.priority,
      merge: merge ?? this.merge,
      name: name ?? this.name,
      nameVariantSuffix: nameVariantSuffix ?? this.nameVariantSuffix,
      summary: summary ?? this.summary,
      description: description ?? this.description,
      pkgname: pkgname ?? this.pkgname,
      sourcePkgname: sourcePkgname ?? this.sourcePkgname,
      projectLicense: projectLicense ?? this.projectLicense,
      metadataLicense: metadataLicense ?? this.metadataLicense,
      projectGroup: projectGroup ?? this.projectGroup,
      mediaBaseurl: mediaBaseurl ?? this.mediaBaseurl,
      architecture: architecture ?? this.architecture,
      bundleType: bundleType ?? this.bundleType,
      bundleId: bundleId ?? this.bundleId,
      developerId: developerId ?? this.developerId,
      developerName: developerName ?? this.developerName,
      launchableType: launchableType ?? this.launchableType,
      launchableValue: launchableValue ?? this.launchableValue,
      contentRatingType: contentRatingType ?? this.contentRatingType,
      agreement: agreement ?? this.agreement,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (componentType.present) {
      map['component_type'] = Variable<int>(componentType.value);
    }
    if (priority.present) {
      map['priority'] = Variable<int>(priority.value);
    }
    if (merge.present) {
      map['merge'] = Variable<String>(merge.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (nameVariantSuffix.present) {
      map['name_variant_suffix'] = Variable<String>(nameVariantSuffix.value);
    }
    if (summary.present) {
      map['summary'] = Variable<String>(summary.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (pkgname.present) {
      map['pkgname'] = Variable<String>(pkgname.value);
    }
    if (sourcePkgname.present) {
      map['source_pkgname'] = Variable<String>(sourcePkgname.value);
    }
    if (projectLicense.present) {
      map['project_license'] = Variable<String>(projectLicense.value);
    }
    if (metadataLicense.present) {
      map['metadata_license'] = Variable<String>(metadataLicense.value);
    }
    if (projectGroup.present) {
      map['project_group'] = Variable<String>(projectGroup.value);
    }
    if (mediaBaseurl.present) {
      map['media_baseurl'] = Variable<String>(mediaBaseurl.value);
    }
    if (architecture.present) {
      map['architecture'] = Variable<String>(architecture.value);
    }
    if (bundleType.present) {
      map['bundle_type'] = Variable<int>(bundleType.value);
    }
    if (bundleId.present) {
      map['bundle_id'] = Variable<String>(bundleId.value);
    }
    if (developerId.present) {
      map['developer_id'] = Variable<String>(developerId.value);
    }
    if (developerName.present) {
      map['developer_name'] = Variable<String>(developerName.value);
    }
    if (launchableType.present) {
      map['launchable_type'] = Variable<int>(launchableType.value);
    }
    if (launchableValue.present) {
      map['launchable_value'] = Variable<String>(launchableValue.value);
    }
    if (contentRatingType.present) {
      map['content_rating_type'] = Variable<String>(contentRatingType.value);
    }
    if (agreement.present) {
      map['agreement'] = Variable<String>(agreement.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ComponentsCompanion(')
          ..write('id: $id, ')
          ..write('componentType: $componentType, ')
          ..write('priority: $priority, ')
          ..write('merge: $merge, ')
          ..write('name: $name, ')
          ..write('nameVariantSuffix: $nameVariantSuffix, ')
          ..write('summary: $summary, ')
          ..write('description: $description, ')
          ..write('pkgname: $pkgname, ')
          ..write('sourcePkgname: $sourcePkgname, ')
          ..write('projectLicense: $projectLicense, ')
          ..write('metadataLicense: $metadataLicense, ')
          ..write('projectGroup: $projectGroup, ')
          ..write('mediaBaseurl: $mediaBaseurl, ')
          ..write('architecture: $architecture, ')
          ..write('bundleType: $bundleType, ')
          ..write('bundleId: $bundleId, ')
          ..write('developerId: $developerId, ')
          ..write('developerName: $developerName, ')
          ..write('launchableType: $launchableType, ')
          ..write('launchableValue: $launchableValue, ')
          ..write('contentRatingType: $contentRatingType, ')
          ..write('agreement: $agreement, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<Category> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Category(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class Category extends DataClass implements Insertable<Category> {
  final int id;
  final String name;
  const Category({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(id: Value(id), name: Value(name));
  }

  factory Category.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Category copyWith({int? id, String? name}) =>
      Category(id: id ?? this.id, name: name ?? this.name);
  Category copyWithCompanion(CategoriesCompanion data) {
    return Category(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category && other.id == this.id && other.name == this.name);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<int> id;
  final Value<String> name;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<Category> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  CategoriesCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return CategoriesCompanion(id: id ?? this.id, name: name ?? this.name);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $ComponentCategoriesTable extends ComponentCategories
    with TableInfo<$ComponentCategoriesTable, ComponentCategoryRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ComponentCategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _componentIdMeta = const VerificationMeta(
    'componentId',
  );
  @override
  late final GeneratedColumn<String> componentId = GeneratedColumn<String>(
    'component_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
    'category_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [componentId, categoryId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'component_categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<ComponentCategoryRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('component_id')) {
      context.handle(
        _componentIdMeta,
        componentId.isAcceptableOrUnknown(
          data['component_id']!,
          _componentIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_componentIdMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {componentId, categoryId};
  @override
  ComponentCategoryRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ComponentCategoryRow(
      componentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}component_id'],
      )!,
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}category_id'],
      )!,
    );
  }

  @override
  $ComponentCategoriesTable createAlias(String alias) {
    return $ComponentCategoriesTable(attachedDatabase, alias);
  }
}

class ComponentCategoryRow extends DataClass
    implements Insertable<ComponentCategoryRow> {
  final String componentId;
  final int categoryId;
  const ComponentCategoryRow({
    required this.componentId,
    required this.categoryId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['component_id'] = Variable<String>(componentId);
    map['category_id'] = Variable<int>(categoryId);
    return map;
  }

  ComponentCategoriesCompanion toCompanion(bool nullToAbsent) {
    return ComponentCategoriesCompanion(
      componentId: Value(componentId),
      categoryId: Value(categoryId),
    );
  }

  factory ComponentCategoryRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ComponentCategoryRow(
      componentId: serializer.fromJson<String>(json['componentId']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'componentId': serializer.toJson<String>(componentId),
      'categoryId': serializer.toJson<int>(categoryId),
    };
  }

  ComponentCategoryRow copyWith({String? componentId, int? categoryId}) =>
      ComponentCategoryRow(
        componentId: componentId ?? this.componentId,
        categoryId: categoryId ?? this.categoryId,
      );
  ComponentCategoryRow copyWithCompanion(ComponentCategoriesCompanion data) {
    return ComponentCategoryRow(
      componentId: data.componentId.present
          ? data.componentId.value
          : this.componentId,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ComponentCategoryRow(')
          ..write('componentId: $componentId, ')
          ..write('categoryId: $categoryId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(componentId, categoryId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ComponentCategoryRow &&
          other.componentId == this.componentId &&
          other.categoryId == this.categoryId);
}

class ComponentCategoriesCompanion
    extends UpdateCompanion<ComponentCategoryRow> {
  final Value<String> componentId;
  final Value<int> categoryId;
  final Value<int> rowid;
  const ComponentCategoriesCompanion({
    this.componentId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ComponentCategoriesCompanion.insert({
    required String componentId,
    required int categoryId,
    this.rowid = const Value.absent(),
  }) : componentId = Value(componentId),
       categoryId = Value(categoryId);
  static Insertable<ComponentCategoryRow> custom({
    Expression<String>? componentId,
    Expression<int>? categoryId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (componentId != null) 'component_id': componentId,
      if (categoryId != null) 'category_id': categoryId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ComponentCategoriesCompanion copyWith({
    Value<String>? componentId,
    Value<int>? categoryId,
    Value<int>? rowid,
  }) {
    return ComponentCategoriesCompanion(
      componentId: componentId ?? this.componentId,
      categoryId: categoryId ?? this.categoryId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (componentId.present) {
      map['component_id'] = Variable<String>(componentId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ComponentCategoriesCompanion(')
          ..write('componentId: $componentId, ')
          ..write('categoryId: $categoryId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $KeywordsTable extends Keywords with TableInfo<$KeywordsTable, Keyword> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $KeywordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'keywords';
  @override
  VerificationContext validateIntegrity(
    Insertable<Keyword> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Keyword map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Keyword(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $KeywordsTable createAlias(String alias) {
    return $KeywordsTable(attachedDatabase, alias);
  }
}

class Keyword extends DataClass implements Insertable<Keyword> {
  final int id;
  final String name;
  const Keyword({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  KeywordsCompanion toCompanion(bool nullToAbsent) {
    return KeywordsCompanion(id: Value(id), name: Value(name));
  }

  factory Keyword.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Keyword(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Keyword copyWith({int? id, String? name}) =>
      Keyword(id: id ?? this.id, name: name ?? this.name);
  Keyword copyWithCompanion(KeywordsCompanion data) {
    return Keyword(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Keyword(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Keyword && other.id == this.id && other.name == this.name);
}

class KeywordsCompanion extends UpdateCompanion<Keyword> {
  final Value<int> id;
  final Value<String> name;
  const KeywordsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  KeywordsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<Keyword> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  KeywordsCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return KeywordsCompanion(id: id ?? this.id, name: name ?? this.name);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('KeywordsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $ComponentKeywordsTable extends ComponentKeywords
    with TableInfo<$ComponentKeywordsTable, ComponentKeywordRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ComponentKeywordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _componentIdMeta = const VerificationMeta(
    'componentId',
  );
  @override
  late final GeneratedColumn<String> componentId = GeneratedColumn<String>(
    'component_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _keywordIdMeta = const VerificationMeta(
    'keywordId',
  );
  @override
  late final GeneratedColumn<int> keywordId = GeneratedColumn<int>(
    'keyword_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [componentId, keywordId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'component_keywords';
  @override
  VerificationContext validateIntegrity(
    Insertable<ComponentKeywordRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('component_id')) {
      context.handle(
        _componentIdMeta,
        componentId.isAcceptableOrUnknown(
          data['component_id']!,
          _componentIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_componentIdMeta);
    }
    if (data.containsKey('keyword_id')) {
      context.handle(
        _keywordIdMeta,
        keywordId.isAcceptableOrUnknown(data['keyword_id']!, _keywordIdMeta),
      );
    } else if (isInserting) {
      context.missing(_keywordIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {componentId, keywordId};
  @override
  ComponentKeywordRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ComponentKeywordRow(
      componentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}component_id'],
      )!,
      keywordId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}keyword_id'],
      )!,
    );
  }

  @override
  $ComponentKeywordsTable createAlias(String alias) {
    return $ComponentKeywordsTable(attachedDatabase, alias);
  }
}

class ComponentKeywordRow extends DataClass
    implements Insertable<ComponentKeywordRow> {
  final String componentId;
  final int keywordId;
  const ComponentKeywordRow({
    required this.componentId,
    required this.keywordId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['component_id'] = Variable<String>(componentId);
    map['keyword_id'] = Variable<int>(keywordId);
    return map;
  }

  ComponentKeywordsCompanion toCompanion(bool nullToAbsent) {
    return ComponentKeywordsCompanion(
      componentId: Value(componentId),
      keywordId: Value(keywordId),
    );
  }

  factory ComponentKeywordRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ComponentKeywordRow(
      componentId: serializer.fromJson<String>(json['componentId']),
      keywordId: serializer.fromJson<int>(json['keywordId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'componentId': serializer.toJson<String>(componentId),
      'keywordId': serializer.toJson<int>(keywordId),
    };
  }

  ComponentKeywordRow copyWith({String? componentId, int? keywordId}) =>
      ComponentKeywordRow(
        componentId: componentId ?? this.componentId,
        keywordId: keywordId ?? this.keywordId,
      );
  ComponentKeywordRow copyWithCompanion(ComponentKeywordsCompanion data) {
    return ComponentKeywordRow(
      componentId: data.componentId.present
          ? data.componentId.value
          : this.componentId,
      keywordId: data.keywordId.present ? data.keywordId.value : this.keywordId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ComponentKeywordRow(')
          ..write('componentId: $componentId, ')
          ..write('keywordId: $keywordId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(componentId, keywordId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ComponentKeywordRow &&
          other.componentId == this.componentId &&
          other.keywordId == this.keywordId);
}

class ComponentKeywordsCompanion extends UpdateCompanion<ComponentKeywordRow> {
  final Value<String> componentId;
  final Value<int> keywordId;
  final Value<int> rowid;
  const ComponentKeywordsCompanion({
    this.componentId = const Value.absent(),
    this.keywordId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ComponentKeywordsCompanion.insert({
    required String componentId,
    required int keywordId,
    this.rowid = const Value.absent(),
  }) : componentId = Value(componentId),
       keywordId = Value(keywordId);
  static Insertable<ComponentKeywordRow> custom({
    Expression<String>? componentId,
    Expression<int>? keywordId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (componentId != null) 'component_id': componentId,
      if (keywordId != null) 'keyword_id': keywordId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ComponentKeywordsCompanion copyWith({
    Value<String>? componentId,
    Value<int>? keywordId,
    Value<int>? rowid,
  }) {
    return ComponentKeywordsCompanion(
      componentId: componentId ?? this.componentId,
      keywordId: keywordId ?? this.keywordId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (componentId.present) {
      map['component_id'] = Variable<String>(componentId.value);
    }
    if (keywordId.present) {
      map['keyword_id'] = Variable<int>(keywordId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ComponentKeywordsCompanion(')
          ..write('componentId: $componentId, ')
          ..write('keywordId: $keywordId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ComponentUrlsTable extends ComponentUrls
    with TableInfo<$ComponentUrlsTable, ComponentUrlRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ComponentUrlsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _componentIdMeta = const VerificationMeta(
    'componentId',
  );
  @override
  late final GeneratedColumn<String> componentId = GeneratedColumn<String>(
    'component_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _urlTypeMeta = const VerificationMeta(
    'urlType',
  );
  @override
  late final GeneratedColumn<int> urlType = GeneratedColumn<int>(
    'url_type',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [componentId, urlType, url];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'component_urls';
  @override
  VerificationContext validateIntegrity(
    Insertable<ComponentUrlRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('component_id')) {
      context.handle(
        _componentIdMeta,
        componentId.isAcceptableOrUnknown(
          data['component_id']!,
          _componentIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_componentIdMeta);
    }
    if (data.containsKey('url_type')) {
      context.handle(
        _urlTypeMeta,
        urlType.isAcceptableOrUnknown(data['url_type']!, _urlTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_urlTypeMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {componentId, urlType};
  @override
  ComponentUrlRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ComponentUrlRow(
      componentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}component_id'],
      )!,
      urlType: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}url_type'],
      )!,
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      )!,
    );
  }

  @override
  $ComponentUrlsTable createAlias(String alias) {
    return $ComponentUrlsTable(attachedDatabase, alias);
  }
}

class ComponentUrlRow extends DataClass implements Insertable<ComponentUrlRow> {
  final String componentId;
  final int urlType;
  final String url;
  const ComponentUrlRow({
    required this.componentId,
    required this.urlType,
    required this.url,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['component_id'] = Variable<String>(componentId);
    map['url_type'] = Variable<int>(urlType);
    map['url'] = Variable<String>(url);
    return map;
  }

  ComponentUrlsCompanion toCompanion(bool nullToAbsent) {
    return ComponentUrlsCompanion(
      componentId: Value(componentId),
      urlType: Value(urlType),
      url: Value(url),
    );
  }

  factory ComponentUrlRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ComponentUrlRow(
      componentId: serializer.fromJson<String>(json['componentId']),
      urlType: serializer.fromJson<int>(json['urlType']),
      url: serializer.fromJson<String>(json['url']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'componentId': serializer.toJson<String>(componentId),
      'urlType': serializer.toJson<int>(urlType),
      'url': serializer.toJson<String>(url),
    };
  }

  ComponentUrlRow copyWith({String? componentId, int? urlType, String? url}) =>
      ComponentUrlRow(
        componentId: componentId ?? this.componentId,
        urlType: urlType ?? this.urlType,
        url: url ?? this.url,
      );
  ComponentUrlRow copyWithCompanion(ComponentUrlsCompanion data) {
    return ComponentUrlRow(
      componentId: data.componentId.present
          ? data.componentId.value
          : this.componentId,
      urlType: data.urlType.present ? data.urlType.value : this.urlType,
      url: data.url.present ? data.url.value : this.url,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ComponentUrlRow(')
          ..write('componentId: $componentId, ')
          ..write('urlType: $urlType, ')
          ..write('url: $url')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(componentId, urlType, url);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ComponentUrlRow &&
          other.componentId == this.componentId &&
          other.urlType == this.urlType &&
          other.url == this.url);
}

class ComponentUrlsCompanion extends UpdateCompanion<ComponentUrlRow> {
  final Value<String> componentId;
  final Value<int> urlType;
  final Value<String> url;
  final Value<int> rowid;
  const ComponentUrlsCompanion({
    this.componentId = const Value.absent(),
    this.urlType = const Value.absent(),
    this.url = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ComponentUrlsCompanion.insert({
    required String componentId,
    required int urlType,
    required String url,
    this.rowid = const Value.absent(),
  }) : componentId = Value(componentId),
       urlType = Value(urlType),
       url = Value(url);
  static Insertable<ComponentUrlRow> custom({
    Expression<String>? componentId,
    Expression<int>? urlType,
    Expression<String>? url,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (componentId != null) 'component_id': componentId,
      if (urlType != null) 'url_type': urlType,
      if (url != null) 'url': url,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ComponentUrlsCompanion copyWith({
    Value<String>? componentId,
    Value<int>? urlType,
    Value<String>? url,
    Value<int>? rowid,
  }) {
    return ComponentUrlsCompanion(
      componentId: componentId ?? this.componentId,
      urlType: urlType ?? this.urlType,
      url: url ?? this.url,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (componentId.present) {
      map['component_id'] = Variable<String>(componentId.value);
    }
    if (urlType.present) {
      map['url_type'] = Variable<int>(urlType.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ComponentUrlsCompanion(')
          ..write('componentId: $componentId, ')
          ..write('urlType: $urlType, ')
          ..write('url: $url, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ComponentIconsTable extends ComponentIcons
    with TableInfo<$ComponentIconsTable, ComponentIconRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ComponentIconsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _componentIdMeta = const VerificationMeta(
    'componentId',
  );
  @override
  late final GeneratedColumn<String> componentId = GeneratedColumn<String>(
    'component_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _iconTypeMeta = const VerificationMeta(
    'iconType',
  );
  @override
  late final GeneratedColumn<int> iconType = GeneratedColumn<int>(
    'icon_type',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _widthMeta = const VerificationMeta('width');
  @override
  late final GeneratedColumn<int> width = GeneratedColumn<int>(
    'width',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<int> height = GeneratedColumn<int>(
    'height',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _scaleMeta = const VerificationMeta('scale');
  @override
  late final GeneratedColumn<int> scale = GeneratedColumn<int>(
    'scale',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    componentId,
    iconType,
    value,
    width,
    height,
    scale,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'component_icons';
  @override
  VerificationContext validateIntegrity(
    Insertable<ComponentIconRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('component_id')) {
      context.handle(
        _componentIdMeta,
        componentId.isAcceptableOrUnknown(
          data['component_id']!,
          _componentIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_componentIdMeta);
    }
    if (data.containsKey('icon_type')) {
      context.handle(
        _iconTypeMeta,
        iconType.isAcceptableOrUnknown(data['icon_type']!, _iconTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_iconTypeMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('width')) {
      context.handle(
        _widthMeta,
        width.isAcceptableOrUnknown(data['width']!, _widthMeta),
      );
    }
    if (data.containsKey('height')) {
      context.handle(
        _heightMeta,
        height.isAcceptableOrUnknown(data['height']!, _heightMeta),
      );
    }
    if (data.containsKey('scale')) {
      context.handle(
        _scaleMeta,
        scale.isAcceptableOrUnknown(data['scale']!, _scaleMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ComponentIconRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ComponentIconRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      componentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}component_id'],
      )!,
      iconType: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}icon_type'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
      width: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}width'],
      ),
      height: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}height'],
      ),
      scale: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}scale'],
      ),
    );
  }

  @override
  $ComponentIconsTable createAlias(String alias) {
    return $ComponentIconsTable(attachedDatabase, alias);
  }
}

class ComponentIconRow extends DataClass
    implements Insertable<ComponentIconRow> {
  final int id;
  final String componentId;
  final int iconType;
  final String value;
  final int? width;
  final int? height;
  final int? scale;
  const ComponentIconRow({
    required this.id,
    required this.componentId,
    required this.iconType,
    required this.value,
    this.width,
    this.height,
    this.scale,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['component_id'] = Variable<String>(componentId);
    map['icon_type'] = Variable<int>(iconType);
    map['value'] = Variable<String>(value);
    if (!nullToAbsent || width != null) {
      map['width'] = Variable<int>(width);
    }
    if (!nullToAbsent || height != null) {
      map['height'] = Variable<int>(height);
    }
    if (!nullToAbsent || scale != null) {
      map['scale'] = Variable<int>(scale);
    }
    return map;
  }

  ComponentIconsCompanion toCompanion(bool nullToAbsent) {
    return ComponentIconsCompanion(
      id: Value(id),
      componentId: Value(componentId),
      iconType: Value(iconType),
      value: Value(value),
      width: width == null && nullToAbsent
          ? const Value.absent()
          : Value(width),
      height: height == null && nullToAbsent
          ? const Value.absent()
          : Value(height),
      scale: scale == null && nullToAbsent
          ? const Value.absent()
          : Value(scale),
    );
  }

  factory ComponentIconRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ComponentIconRow(
      id: serializer.fromJson<int>(json['id']),
      componentId: serializer.fromJson<String>(json['componentId']),
      iconType: serializer.fromJson<int>(json['iconType']),
      value: serializer.fromJson<String>(json['value']),
      width: serializer.fromJson<int?>(json['width']),
      height: serializer.fromJson<int?>(json['height']),
      scale: serializer.fromJson<int?>(json['scale']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'componentId': serializer.toJson<String>(componentId),
      'iconType': serializer.toJson<int>(iconType),
      'value': serializer.toJson<String>(value),
      'width': serializer.toJson<int?>(width),
      'height': serializer.toJson<int?>(height),
      'scale': serializer.toJson<int?>(scale),
    };
  }

  ComponentIconRow copyWith({
    int? id,
    String? componentId,
    int? iconType,
    String? value,
    Value<int?> width = const Value.absent(),
    Value<int?> height = const Value.absent(),
    Value<int?> scale = const Value.absent(),
  }) => ComponentIconRow(
    id: id ?? this.id,
    componentId: componentId ?? this.componentId,
    iconType: iconType ?? this.iconType,
    value: value ?? this.value,
    width: width.present ? width.value : this.width,
    height: height.present ? height.value : this.height,
    scale: scale.present ? scale.value : this.scale,
  );
  ComponentIconRow copyWithCompanion(ComponentIconsCompanion data) {
    return ComponentIconRow(
      id: data.id.present ? data.id.value : this.id,
      componentId: data.componentId.present
          ? data.componentId.value
          : this.componentId,
      iconType: data.iconType.present ? data.iconType.value : this.iconType,
      value: data.value.present ? data.value.value : this.value,
      width: data.width.present ? data.width.value : this.width,
      height: data.height.present ? data.height.value : this.height,
      scale: data.scale.present ? data.scale.value : this.scale,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ComponentIconRow(')
          ..write('id: $id, ')
          ..write('componentId: $componentId, ')
          ..write('iconType: $iconType, ')
          ..write('value: $value, ')
          ..write('width: $width, ')
          ..write('height: $height, ')
          ..write('scale: $scale')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, componentId, iconType, value, width, height, scale);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ComponentIconRow &&
          other.id == this.id &&
          other.componentId == this.componentId &&
          other.iconType == this.iconType &&
          other.value == this.value &&
          other.width == this.width &&
          other.height == this.height &&
          other.scale == this.scale);
}

class ComponentIconsCompanion extends UpdateCompanion<ComponentIconRow> {
  final Value<int> id;
  final Value<String> componentId;
  final Value<int> iconType;
  final Value<String> value;
  final Value<int?> width;
  final Value<int?> height;
  final Value<int?> scale;
  const ComponentIconsCompanion({
    this.id = const Value.absent(),
    this.componentId = const Value.absent(),
    this.iconType = const Value.absent(),
    this.value = const Value.absent(),
    this.width = const Value.absent(),
    this.height = const Value.absent(),
    this.scale = const Value.absent(),
  });
  ComponentIconsCompanion.insert({
    this.id = const Value.absent(),
    required String componentId,
    required int iconType,
    required String value,
    this.width = const Value.absent(),
    this.height = const Value.absent(),
    this.scale = const Value.absent(),
  }) : componentId = Value(componentId),
       iconType = Value(iconType),
       value = Value(value);
  static Insertable<ComponentIconRow> custom({
    Expression<int>? id,
    Expression<String>? componentId,
    Expression<int>? iconType,
    Expression<String>? value,
    Expression<int>? width,
    Expression<int>? height,
    Expression<int>? scale,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (componentId != null) 'component_id': componentId,
      if (iconType != null) 'icon_type': iconType,
      if (value != null) 'value': value,
      if (width != null) 'width': width,
      if (height != null) 'height': height,
      if (scale != null) 'scale': scale,
    });
  }

  ComponentIconsCompanion copyWith({
    Value<int>? id,
    Value<String>? componentId,
    Value<int>? iconType,
    Value<String>? value,
    Value<int?>? width,
    Value<int?>? height,
    Value<int?>? scale,
  }) {
    return ComponentIconsCompanion(
      id: id ?? this.id,
      componentId: componentId ?? this.componentId,
      iconType: iconType ?? this.iconType,
      value: value ?? this.value,
      width: width ?? this.width,
      height: height ?? this.height,
      scale: scale ?? this.scale,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (componentId.present) {
      map['component_id'] = Variable<String>(componentId.value);
    }
    if (iconType.present) {
      map['icon_type'] = Variable<int>(iconType.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (width.present) {
      map['width'] = Variable<int>(width.value);
    }
    if (height.present) {
      map['height'] = Variable<int>(height.value);
    }
    if (scale.present) {
      map['scale'] = Variable<int>(scale.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ComponentIconsCompanion(')
          ..write('id: $id, ')
          ..write('componentId: $componentId, ')
          ..write('iconType: $iconType, ')
          ..write('value: $value, ')
          ..write('width: $width, ')
          ..write('height: $height, ')
          ..write('scale: $scale')
          ..write(')'))
        .toString();
  }
}

class $ReleasesTable extends Releases
    with TableInfo<$ReleasesTable, ReleaseRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReleasesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _componentIdMeta = const VerificationMeta(
    'componentId',
  );
  @override
  late final GeneratedColumn<String> componentId = GeneratedColumn<String>(
    'component_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _releaseTypeMeta = const VerificationMeta(
    'releaseType',
  );
  @override
  late final GeneratedColumn<int> releaseType = GeneratedColumn<int>(
    'release_type',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<String> version = GeneratedColumn<String>(
    'version',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
    'date',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<String> timestamp = GeneratedColumn<String>(
    'timestamp',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dateEolMeta = const VerificationMeta(
    'dateEol',
  );
  @override
  late final GeneratedColumn<String> dateEol = GeneratedColumn<String>(
    'date_eol',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _urgencyMeta = const VerificationMeta(
    'urgency',
  );
  @override
  late final GeneratedColumn<int> urgency = GeneratedColumn<int>(
    'urgency',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    componentId,
    releaseType,
    version,
    date,
    timestamp,
    dateEol,
    urgency,
    description,
    url,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'releases';
  @override
  VerificationContext validateIntegrity(
    Insertable<ReleaseRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('component_id')) {
      context.handle(
        _componentIdMeta,
        componentId.isAcceptableOrUnknown(
          data['component_id']!,
          _componentIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_componentIdMeta);
    }
    if (data.containsKey('release_type')) {
      context.handle(
        _releaseTypeMeta,
        releaseType.isAcceptableOrUnknown(
          data['release_type']!,
          _releaseTypeMeta,
        ),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    }
    if (data.containsKey('date_eol')) {
      context.handle(
        _dateEolMeta,
        dateEol.isAcceptableOrUnknown(data['date_eol']!, _dateEolMeta),
      );
    }
    if (data.containsKey('urgency')) {
      context.handle(
        _urgencyMeta,
        urgency.isAcceptableOrUnknown(data['urgency']!, _urgencyMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReleaseRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReleaseRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      componentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}component_id'],
      )!,
      releaseType: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}release_type'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}version'],
      ),
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date'],
      ),
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}timestamp'],
      ),
      dateEol: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date_eol'],
      ),
      urgency: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}urgency'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      ),
    );
  }

  @override
  $ReleasesTable createAlias(String alias) {
    return $ReleasesTable(attachedDatabase, alias);
  }
}

class ReleaseRow extends DataClass implements Insertable<ReleaseRow> {
  final int id;
  final String componentId;
  final int? releaseType;
  final String? version;
  final String? date;
  final String? timestamp;
  final String? dateEol;
  final int? urgency;
  final String? description;
  final String? url;
  const ReleaseRow({
    required this.id,
    required this.componentId,
    this.releaseType,
    this.version,
    this.date,
    this.timestamp,
    this.dateEol,
    this.urgency,
    this.description,
    this.url,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['component_id'] = Variable<String>(componentId);
    if (!nullToAbsent || releaseType != null) {
      map['release_type'] = Variable<int>(releaseType);
    }
    if (!nullToAbsent || version != null) {
      map['version'] = Variable<String>(version);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<String>(date);
    }
    if (!nullToAbsent || timestamp != null) {
      map['timestamp'] = Variable<String>(timestamp);
    }
    if (!nullToAbsent || dateEol != null) {
      map['date_eol'] = Variable<String>(dateEol);
    }
    if (!nullToAbsent || urgency != null) {
      map['urgency'] = Variable<int>(urgency);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    return map;
  }

  ReleasesCompanion toCompanion(bool nullToAbsent) {
    return ReleasesCompanion(
      id: Value(id),
      componentId: Value(componentId),
      releaseType: releaseType == null && nullToAbsent
          ? const Value.absent()
          : Value(releaseType),
      version: version == null && nullToAbsent
          ? const Value.absent()
          : Value(version),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      timestamp: timestamp == null && nullToAbsent
          ? const Value.absent()
          : Value(timestamp),
      dateEol: dateEol == null && nullToAbsent
          ? const Value.absent()
          : Value(dateEol),
      urgency: urgency == null && nullToAbsent
          ? const Value.absent()
          : Value(urgency),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
    );
  }

  factory ReleaseRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReleaseRow(
      id: serializer.fromJson<int>(json['id']),
      componentId: serializer.fromJson<String>(json['componentId']),
      releaseType: serializer.fromJson<int?>(json['releaseType']),
      version: serializer.fromJson<String?>(json['version']),
      date: serializer.fromJson<String?>(json['date']),
      timestamp: serializer.fromJson<String?>(json['timestamp']),
      dateEol: serializer.fromJson<String?>(json['dateEol']),
      urgency: serializer.fromJson<int?>(json['urgency']),
      description: serializer.fromJson<String?>(json['description']),
      url: serializer.fromJson<String?>(json['url']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'componentId': serializer.toJson<String>(componentId),
      'releaseType': serializer.toJson<int?>(releaseType),
      'version': serializer.toJson<String?>(version),
      'date': serializer.toJson<String?>(date),
      'timestamp': serializer.toJson<String?>(timestamp),
      'dateEol': serializer.toJson<String?>(dateEol),
      'urgency': serializer.toJson<int?>(urgency),
      'description': serializer.toJson<String?>(description),
      'url': serializer.toJson<String?>(url),
    };
  }

  ReleaseRow copyWith({
    int? id,
    String? componentId,
    Value<int?> releaseType = const Value.absent(),
    Value<String?> version = const Value.absent(),
    Value<String?> date = const Value.absent(),
    Value<String?> timestamp = const Value.absent(),
    Value<String?> dateEol = const Value.absent(),
    Value<int?> urgency = const Value.absent(),
    Value<String?> description = const Value.absent(),
    Value<String?> url = const Value.absent(),
  }) => ReleaseRow(
    id: id ?? this.id,
    componentId: componentId ?? this.componentId,
    releaseType: releaseType.present ? releaseType.value : this.releaseType,
    version: version.present ? version.value : this.version,
    date: date.present ? date.value : this.date,
    timestamp: timestamp.present ? timestamp.value : this.timestamp,
    dateEol: dateEol.present ? dateEol.value : this.dateEol,
    urgency: urgency.present ? urgency.value : this.urgency,
    description: description.present ? description.value : this.description,
    url: url.present ? url.value : this.url,
  );
  ReleaseRow copyWithCompanion(ReleasesCompanion data) {
    return ReleaseRow(
      id: data.id.present ? data.id.value : this.id,
      componentId: data.componentId.present
          ? data.componentId.value
          : this.componentId,
      releaseType: data.releaseType.present
          ? data.releaseType.value
          : this.releaseType,
      version: data.version.present ? data.version.value : this.version,
      date: data.date.present ? data.date.value : this.date,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      dateEol: data.dateEol.present ? data.dateEol.value : this.dateEol,
      urgency: data.urgency.present ? data.urgency.value : this.urgency,
      description: data.description.present
          ? data.description.value
          : this.description,
      url: data.url.present ? data.url.value : this.url,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReleaseRow(')
          ..write('id: $id, ')
          ..write('componentId: $componentId, ')
          ..write('releaseType: $releaseType, ')
          ..write('version: $version, ')
          ..write('date: $date, ')
          ..write('timestamp: $timestamp, ')
          ..write('dateEol: $dateEol, ')
          ..write('urgency: $urgency, ')
          ..write('description: $description, ')
          ..write('url: $url')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    componentId,
    releaseType,
    version,
    date,
    timestamp,
    dateEol,
    urgency,
    description,
    url,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReleaseRow &&
          other.id == this.id &&
          other.componentId == this.componentId &&
          other.releaseType == this.releaseType &&
          other.version == this.version &&
          other.date == this.date &&
          other.timestamp == this.timestamp &&
          other.dateEol == this.dateEol &&
          other.urgency == this.urgency &&
          other.description == this.description &&
          other.url == this.url);
}

class ReleasesCompanion extends UpdateCompanion<ReleaseRow> {
  final Value<int> id;
  final Value<String> componentId;
  final Value<int?> releaseType;
  final Value<String?> version;
  final Value<String?> date;
  final Value<String?> timestamp;
  final Value<String?> dateEol;
  final Value<int?> urgency;
  final Value<String?> description;
  final Value<String?> url;
  const ReleasesCompanion({
    this.id = const Value.absent(),
    this.componentId = const Value.absent(),
    this.releaseType = const Value.absent(),
    this.version = const Value.absent(),
    this.date = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.dateEol = const Value.absent(),
    this.urgency = const Value.absent(),
    this.description = const Value.absent(),
    this.url = const Value.absent(),
  });
  ReleasesCompanion.insert({
    this.id = const Value.absent(),
    required String componentId,
    this.releaseType = const Value.absent(),
    this.version = const Value.absent(),
    this.date = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.dateEol = const Value.absent(),
    this.urgency = const Value.absent(),
    this.description = const Value.absent(),
    this.url = const Value.absent(),
  }) : componentId = Value(componentId);
  static Insertable<ReleaseRow> custom({
    Expression<int>? id,
    Expression<String>? componentId,
    Expression<int>? releaseType,
    Expression<String>? version,
    Expression<String>? date,
    Expression<String>? timestamp,
    Expression<String>? dateEol,
    Expression<int>? urgency,
    Expression<String>? description,
    Expression<String>? url,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (componentId != null) 'component_id': componentId,
      if (releaseType != null) 'release_type': releaseType,
      if (version != null) 'version': version,
      if (date != null) 'date': date,
      if (timestamp != null) 'timestamp': timestamp,
      if (dateEol != null) 'date_eol': dateEol,
      if (urgency != null) 'urgency': urgency,
      if (description != null) 'description': description,
      if (url != null) 'url': url,
    });
  }

  ReleasesCompanion copyWith({
    Value<int>? id,
    Value<String>? componentId,
    Value<int?>? releaseType,
    Value<String?>? version,
    Value<String?>? date,
    Value<String?>? timestamp,
    Value<String?>? dateEol,
    Value<int?>? urgency,
    Value<String?>? description,
    Value<String?>? url,
  }) {
    return ReleasesCompanion(
      id: id ?? this.id,
      componentId: componentId ?? this.componentId,
      releaseType: releaseType ?? this.releaseType,
      version: version ?? this.version,
      date: date ?? this.date,
      timestamp: timestamp ?? this.timestamp,
      dateEol: dateEol ?? this.dateEol,
      urgency: urgency ?? this.urgency,
      description: description ?? this.description,
      url: url ?? this.url,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (componentId.present) {
      map['component_id'] = Variable<String>(componentId.value);
    }
    if (releaseType.present) {
      map['release_type'] = Variable<int>(releaseType.value);
    }
    if (version.present) {
      map['version'] = Variable<String>(version.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<String>(timestamp.value);
    }
    if (dateEol.present) {
      map['date_eol'] = Variable<String>(dateEol.value);
    }
    if (urgency.present) {
      map['urgency'] = Variable<int>(urgency.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReleasesCompanion(')
          ..write('id: $id, ')
          ..write('componentId: $componentId, ')
          ..write('releaseType: $releaseType, ')
          ..write('version: $version, ')
          ..write('date: $date, ')
          ..write('timestamp: $timestamp, ')
          ..write('dateEol: $dateEol, ')
          ..write('urgency: $urgency, ')
          ..write('description: $description, ')
          ..write('url: $url')
          ..write(')'))
        .toString();
  }
}

class $ReleaseIssuesTable extends ReleaseIssues
    with TableInfo<$ReleaseIssuesTable, ReleaseIssueRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReleaseIssuesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _releaseIdMeta = const VerificationMeta(
    'releaseId',
  );
  @override
  late final GeneratedColumn<int> releaseId = GeneratedColumn<int>(
    'release_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _issueTypeMeta = const VerificationMeta(
    'issueType',
  );
  @override
  late final GeneratedColumn<int> issueType = GeneratedColumn<int>(
    'issue_type',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, releaseId, issueType, url, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'release_issues';
  @override
  VerificationContext validateIntegrity(
    Insertable<ReleaseIssueRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('release_id')) {
      context.handle(
        _releaseIdMeta,
        releaseId.isAcceptableOrUnknown(data['release_id']!, _releaseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_releaseIdMeta);
    }
    if (data.containsKey('issue_type')) {
      context.handle(
        _issueTypeMeta,
        issueType.isAcceptableOrUnknown(data['issue_type']!, _issueTypeMeta),
      );
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReleaseIssueRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReleaseIssueRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      releaseId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}release_id'],
      )!,
      issueType: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}issue_type'],
      ),
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      ),
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      ),
    );
  }

  @override
  $ReleaseIssuesTable createAlias(String alias) {
    return $ReleaseIssuesTable(attachedDatabase, alias);
  }
}

class ReleaseIssueRow extends DataClass implements Insertable<ReleaseIssueRow> {
  final int id;
  final int releaseId;
  final int? issueType;
  final String? url;
  final String? value;
  const ReleaseIssueRow({
    required this.id,
    required this.releaseId,
    this.issueType,
    this.url,
    this.value,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['release_id'] = Variable<int>(releaseId);
    if (!nullToAbsent || issueType != null) {
      map['issue_type'] = Variable<int>(issueType);
    }
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    if (!nullToAbsent || value != null) {
      map['value'] = Variable<String>(value);
    }
    return map;
  }

  ReleaseIssuesCompanion toCompanion(bool nullToAbsent) {
    return ReleaseIssuesCompanion(
      id: Value(id),
      releaseId: Value(releaseId),
      issueType: issueType == null && nullToAbsent
          ? const Value.absent()
          : Value(issueType),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
      value: value == null && nullToAbsent
          ? const Value.absent()
          : Value(value),
    );
  }

  factory ReleaseIssueRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReleaseIssueRow(
      id: serializer.fromJson<int>(json['id']),
      releaseId: serializer.fromJson<int>(json['releaseId']),
      issueType: serializer.fromJson<int?>(json['issueType']),
      url: serializer.fromJson<String?>(json['url']),
      value: serializer.fromJson<String?>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'releaseId': serializer.toJson<int>(releaseId),
      'issueType': serializer.toJson<int?>(issueType),
      'url': serializer.toJson<String?>(url),
      'value': serializer.toJson<String?>(value),
    };
  }

  ReleaseIssueRow copyWith({
    int? id,
    int? releaseId,
    Value<int?> issueType = const Value.absent(),
    Value<String?> url = const Value.absent(),
    Value<String?> value = const Value.absent(),
  }) => ReleaseIssueRow(
    id: id ?? this.id,
    releaseId: releaseId ?? this.releaseId,
    issueType: issueType.present ? issueType.value : this.issueType,
    url: url.present ? url.value : this.url,
    value: value.present ? value.value : this.value,
  );
  ReleaseIssueRow copyWithCompanion(ReleaseIssuesCompanion data) {
    return ReleaseIssueRow(
      id: data.id.present ? data.id.value : this.id,
      releaseId: data.releaseId.present ? data.releaseId.value : this.releaseId,
      issueType: data.issueType.present ? data.issueType.value : this.issueType,
      url: data.url.present ? data.url.value : this.url,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReleaseIssueRow(')
          ..write('id: $id, ')
          ..write('releaseId: $releaseId, ')
          ..write('issueType: $issueType, ')
          ..write('url: $url, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, releaseId, issueType, url, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReleaseIssueRow &&
          other.id == this.id &&
          other.releaseId == this.releaseId &&
          other.issueType == this.issueType &&
          other.url == this.url &&
          other.value == this.value);
}

class ReleaseIssuesCompanion extends UpdateCompanion<ReleaseIssueRow> {
  final Value<int> id;
  final Value<int> releaseId;
  final Value<int?> issueType;
  final Value<String?> url;
  final Value<String?> value;
  const ReleaseIssuesCompanion({
    this.id = const Value.absent(),
    this.releaseId = const Value.absent(),
    this.issueType = const Value.absent(),
    this.url = const Value.absent(),
    this.value = const Value.absent(),
  });
  ReleaseIssuesCompanion.insert({
    this.id = const Value.absent(),
    required int releaseId,
    this.issueType = const Value.absent(),
    this.url = const Value.absent(),
    this.value = const Value.absent(),
  }) : releaseId = Value(releaseId);
  static Insertable<ReleaseIssueRow> custom({
    Expression<int>? id,
    Expression<int>? releaseId,
    Expression<int>? issueType,
    Expression<String>? url,
    Expression<String>? value,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (releaseId != null) 'release_id': releaseId,
      if (issueType != null) 'issue_type': issueType,
      if (url != null) 'url': url,
      if (value != null) 'value': value,
    });
  }

  ReleaseIssuesCompanion copyWith({
    Value<int>? id,
    Value<int>? releaseId,
    Value<int?>? issueType,
    Value<String?>? url,
    Value<String?>? value,
  }) {
    return ReleaseIssuesCompanion(
      id: id ?? this.id,
      releaseId: releaseId ?? this.releaseId,
      issueType: issueType ?? this.issueType,
      url: url ?? this.url,
      value: value ?? this.value,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (releaseId.present) {
      map['release_id'] = Variable<int>(releaseId.value);
    }
    if (issueType.present) {
      map['issue_type'] = Variable<int>(issueType.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReleaseIssuesCompanion(')
          ..write('id: $id, ')
          ..write('releaseId: $releaseId, ')
          ..write('issueType: $issueType, ')
          ..write('url: $url, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }
}

class $ScreenshotsTable extends Screenshots
    with TableInfo<$ScreenshotsTable, ScreenshotRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ScreenshotsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _componentIdMeta = const VerificationMeta(
    'componentId',
  );
  @override
  late final GeneratedColumn<String> componentId = GeneratedColumn<String>(
    'component_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isDefaultMeta = const VerificationMeta(
    'isDefault',
  );
  @override
  late final GeneratedColumn<bool> isDefault = GeneratedColumn<bool>(
    'is_default',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_default" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _captionMeta = const VerificationMeta(
    'caption',
  );
  @override
  late final GeneratedColumn<String> caption = GeneratedColumn<String>(
    'caption',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, componentId, isDefault, caption];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'screenshots';
  @override
  VerificationContext validateIntegrity(
    Insertable<ScreenshotRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('component_id')) {
      context.handle(
        _componentIdMeta,
        componentId.isAcceptableOrUnknown(
          data['component_id']!,
          _componentIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_componentIdMeta);
    }
    if (data.containsKey('is_default')) {
      context.handle(
        _isDefaultMeta,
        isDefault.isAcceptableOrUnknown(data['is_default']!, _isDefaultMeta),
      );
    }
    if (data.containsKey('caption')) {
      context.handle(
        _captionMeta,
        caption.isAcceptableOrUnknown(data['caption']!, _captionMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ScreenshotRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ScreenshotRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      componentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}component_id'],
      )!,
      isDefault: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_default'],
      )!,
      caption: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}caption'],
      ),
    );
  }

  @override
  $ScreenshotsTable createAlias(String alias) {
    return $ScreenshotsTable(attachedDatabase, alias);
  }
}

class ScreenshotRow extends DataClass implements Insertable<ScreenshotRow> {
  final int id;
  final String componentId;
  final bool isDefault;
  final String? caption;
  const ScreenshotRow({
    required this.id,
    required this.componentId,
    required this.isDefault,
    this.caption,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['component_id'] = Variable<String>(componentId);
    map['is_default'] = Variable<bool>(isDefault);
    if (!nullToAbsent || caption != null) {
      map['caption'] = Variable<String>(caption);
    }
    return map;
  }

  ScreenshotsCompanion toCompanion(bool nullToAbsent) {
    return ScreenshotsCompanion(
      id: Value(id),
      componentId: Value(componentId),
      isDefault: Value(isDefault),
      caption: caption == null && nullToAbsent
          ? const Value.absent()
          : Value(caption),
    );
  }

  factory ScreenshotRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ScreenshotRow(
      id: serializer.fromJson<int>(json['id']),
      componentId: serializer.fromJson<String>(json['componentId']),
      isDefault: serializer.fromJson<bool>(json['isDefault']),
      caption: serializer.fromJson<String?>(json['caption']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'componentId': serializer.toJson<String>(componentId),
      'isDefault': serializer.toJson<bool>(isDefault),
      'caption': serializer.toJson<String?>(caption),
    };
  }

  ScreenshotRow copyWith({
    int? id,
    String? componentId,
    bool? isDefault,
    Value<String?> caption = const Value.absent(),
  }) => ScreenshotRow(
    id: id ?? this.id,
    componentId: componentId ?? this.componentId,
    isDefault: isDefault ?? this.isDefault,
    caption: caption.present ? caption.value : this.caption,
  );
  ScreenshotRow copyWithCompanion(ScreenshotsCompanion data) {
    return ScreenshotRow(
      id: data.id.present ? data.id.value : this.id,
      componentId: data.componentId.present
          ? data.componentId.value
          : this.componentId,
      isDefault: data.isDefault.present ? data.isDefault.value : this.isDefault,
      caption: data.caption.present ? data.caption.value : this.caption,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ScreenshotRow(')
          ..write('id: $id, ')
          ..write('componentId: $componentId, ')
          ..write('isDefault: $isDefault, ')
          ..write('caption: $caption')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, componentId, isDefault, caption);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ScreenshotRow &&
          other.id == this.id &&
          other.componentId == this.componentId &&
          other.isDefault == this.isDefault &&
          other.caption == this.caption);
}

class ScreenshotsCompanion extends UpdateCompanion<ScreenshotRow> {
  final Value<int> id;
  final Value<String> componentId;
  final Value<bool> isDefault;
  final Value<String?> caption;
  const ScreenshotsCompanion({
    this.id = const Value.absent(),
    this.componentId = const Value.absent(),
    this.isDefault = const Value.absent(),
    this.caption = const Value.absent(),
  });
  ScreenshotsCompanion.insert({
    this.id = const Value.absent(),
    required String componentId,
    this.isDefault = const Value.absent(),
    this.caption = const Value.absent(),
  }) : componentId = Value(componentId);
  static Insertable<ScreenshotRow> custom({
    Expression<int>? id,
    Expression<String>? componentId,
    Expression<bool>? isDefault,
    Expression<String>? caption,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (componentId != null) 'component_id': componentId,
      if (isDefault != null) 'is_default': isDefault,
      if (caption != null) 'caption': caption,
    });
  }

  ScreenshotsCompanion copyWith({
    Value<int>? id,
    Value<String>? componentId,
    Value<bool>? isDefault,
    Value<String?>? caption,
  }) {
    return ScreenshotsCompanion(
      id: id ?? this.id,
      componentId: componentId ?? this.componentId,
      isDefault: isDefault ?? this.isDefault,
      caption: caption ?? this.caption,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (componentId.present) {
      map['component_id'] = Variable<String>(componentId.value);
    }
    if (isDefault.present) {
      map['is_default'] = Variable<bool>(isDefault.value);
    }
    if (caption.present) {
      map['caption'] = Variable<String>(caption.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScreenshotsCompanion(')
          ..write('id: $id, ')
          ..write('componentId: $componentId, ')
          ..write('isDefault: $isDefault, ')
          ..write('caption: $caption')
          ..write(')'))
        .toString();
  }
}

class $ScreenshotImagesTable extends ScreenshotImages
    with TableInfo<$ScreenshotImagesTable, ScreenshotImageRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ScreenshotImagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _screenshotIdMeta = const VerificationMeta(
    'screenshotId',
  );
  @override
  late final GeneratedColumn<int> screenshotId = GeneratedColumn<int>(
    'screenshot_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _widthMeta = const VerificationMeta('width');
  @override
  late final GeneratedColumn<int> width = GeneratedColumn<int>(
    'width',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<int> height = GeneratedColumn<int>(
    'height',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    screenshotId,
    url,
    type,
    width,
    height,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'screenshot_images';
  @override
  VerificationContext validateIntegrity(
    Insertable<ScreenshotImageRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('screenshot_id')) {
      context.handle(
        _screenshotIdMeta,
        screenshotId.isAcceptableOrUnknown(
          data['screenshot_id']!,
          _screenshotIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_screenshotIdMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    }
    if (data.containsKey('width')) {
      context.handle(
        _widthMeta,
        width.isAcceptableOrUnknown(data['width']!, _widthMeta),
      );
    }
    if (data.containsKey('height')) {
      context.handle(
        _heightMeta,
        height.isAcceptableOrUnknown(data['height']!, _heightMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ScreenshotImageRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ScreenshotImageRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      screenshotId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}screenshot_id'],
      )!,
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      ),
      width: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}width'],
      ),
      height: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}height'],
      ),
    );
  }

  @override
  $ScreenshotImagesTable createAlias(String alias) {
    return $ScreenshotImagesTable(attachedDatabase, alias);
  }
}

class ScreenshotImageRow extends DataClass
    implements Insertable<ScreenshotImageRow> {
  final int id;
  final int screenshotId;
  final String url;
  final String? type;
  final int? width;
  final int? height;
  const ScreenshotImageRow({
    required this.id,
    required this.screenshotId,
    required this.url,
    this.type,
    this.width,
    this.height,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['screenshot_id'] = Variable<int>(screenshotId);
    map['url'] = Variable<String>(url);
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    if (!nullToAbsent || width != null) {
      map['width'] = Variable<int>(width);
    }
    if (!nullToAbsent || height != null) {
      map['height'] = Variable<int>(height);
    }
    return map;
  }

  ScreenshotImagesCompanion toCompanion(bool nullToAbsent) {
    return ScreenshotImagesCompanion(
      id: Value(id),
      screenshotId: Value(screenshotId),
      url: Value(url),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      width: width == null && nullToAbsent
          ? const Value.absent()
          : Value(width),
      height: height == null && nullToAbsent
          ? const Value.absent()
          : Value(height),
    );
  }

  factory ScreenshotImageRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ScreenshotImageRow(
      id: serializer.fromJson<int>(json['id']),
      screenshotId: serializer.fromJson<int>(json['screenshotId']),
      url: serializer.fromJson<String>(json['url']),
      type: serializer.fromJson<String?>(json['type']),
      width: serializer.fromJson<int?>(json['width']),
      height: serializer.fromJson<int?>(json['height']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'screenshotId': serializer.toJson<int>(screenshotId),
      'url': serializer.toJson<String>(url),
      'type': serializer.toJson<String?>(type),
      'width': serializer.toJson<int?>(width),
      'height': serializer.toJson<int?>(height),
    };
  }

  ScreenshotImageRow copyWith({
    int? id,
    int? screenshotId,
    String? url,
    Value<String?> type = const Value.absent(),
    Value<int?> width = const Value.absent(),
    Value<int?> height = const Value.absent(),
  }) => ScreenshotImageRow(
    id: id ?? this.id,
    screenshotId: screenshotId ?? this.screenshotId,
    url: url ?? this.url,
    type: type.present ? type.value : this.type,
    width: width.present ? width.value : this.width,
    height: height.present ? height.value : this.height,
  );
  ScreenshotImageRow copyWithCompanion(ScreenshotImagesCompanion data) {
    return ScreenshotImageRow(
      id: data.id.present ? data.id.value : this.id,
      screenshotId: data.screenshotId.present
          ? data.screenshotId.value
          : this.screenshotId,
      url: data.url.present ? data.url.value : this.url,
      type: data.type.present ? data.type.value : this.type,
      width: data.width.present ? data.width.value : this.width,
      height: data.height.present ? data.height.value : this.height,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ScreenshotImageRow(')
          ..write('id: $id, ')
          ..write('screenshotId: $screenshotId, ')
          ..write('url: $url, ')
          ..write('type: $type, ')
          ..write('width: $width, ')
          ..write('height: $height')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, screenshotId, url, type, width, height);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ScreenshotImageRow &&
          other.id == this.id &&
          other.screenshotId == this.screenshotId &&
          other.url == this.url &&
          other.type == this.type &&
          other.width == this.width &&
          other.height == this.height);
}

class ScreenshotImagesCompanion extends UpdateCompanion<ScreenshotImageRow> {
  final Value<int> id;
  final Value<int> screenshotId;
  final Value<String> url;
  final Value<String?> type;
  final Value<int?> width;
  final Value<int?> height;
  const ScreenshotImagesCompanion({
    this.id = const Value.absent(),
    this.screenshotId = const Value.absent(),
    this.url = const Value.absent(),
    this.type = const Value.absent(),
    this.width = const Value.absent(),
    this.height = const Value.absent(),
  });
  ScreenshotImagesCompanion.insert({
    this.id = const Value.absent(),
    required int screenshotId,
    required String url,
    this.type = const Value.absent(),
    this.width = const Value.absent(),
    this.height = const Value.absent(),
  }) : screenshotId = Value(screenshotId),
       url = Value(url);
  static Insertable<ScreenshotImageRow> custom({
    Expression<int>? id,
    Expression<int>? screenshotId,
    Expression<String>? url,
    Expression<String>? type,
    Expression<int>? width,
    Expression<int>? height,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (screenshotId != null) 'screenshot_id': screenshotId,
      if (url != null) 'url': url,
      if (type != null) 'type': type,
      if (width != null) 'width': width,
      if (height != null) 'height': height,
    });
  }

  ScreenshotImagesCompanion copyWith({
    Value<int>? id,
    Value<int>? screenshotId,
    Value<String>? url,
    Value<String?>? type,
    Value<int?>? width,
    Value<int?>? height,
  }) {
    return ScreenshotImagesCompanion(
      id: id ?? this.id,
      screenshotId: screenshotId ?? this.screenshotId,
      url: url ?? this.url,
      type: type ?? this.type,
      width: width ?? this.width,
      height: height ?? this.height,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (screenshotId.present) {
      map['screenshot_id'] = Variable<int>(screenshotId.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (width.present) {
      map['width'] = Variable<int>(width.value);
    }
    if (height.present) {
      map['height'] = Variable<int>(height.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScreenshotImagesCompanion(')
          ..write('id: $id, ')
          ..write('screenshotId: $screenshotId, ')
          ..write('url: $url, ')
          ..write('type: $type, ')
          ..write('width: $width, ')
          ..write('height: $height')
          ..write(')'))
        .toString();
  }
}

class $ScreenshotVideosTable extends ScreenshotVideos
    with TableInfo<$ScreenshotVideosTable, ScreenshotVideoRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ScreenshotVideosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _screenshotIdMeta = const VerificationMeta(
    'screenshotId',
  );
  @override
  late final GeneratedColumn<int> screenshotId = GeneratedColumn<int>(
    'screenshot_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _codecMeta = const VerificationMeta('codec');
  @override
  late final GeneratedColumn<String> codec = GeneratedColumn<String>(
    'codec',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _containerMeta = const VerificationMeta(
    'container',
  );
  @override
  late final GeneratedColumn<String> container = GeneratedColumn<String>(
    'container',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _widthMeta = const VerificationMeta('width');
  @override
  late final GeneratedColumn<int> width = GeneratedColumn<int>(
    'width',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<int> height = GeneratedColumn<int>(
    'height',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    screenshotId,
    url,
    codec,
    container,
    width,
    height,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'screenshot_videos';
  @override
  VerificationContext validateIntegrity(
    Insertable<ScreenshotVideoRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('screenshot_id')) {
      context.handle(
        _screenshotIdMeta,
        screenshotId.isAcceptableOrUnknown(
          data['screenshot_id']!,
          _screenshotIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_screenshotIdMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('codec')) {
      context.handle(
        _codecMeta,
        codec.isAcceptableOrUnknown(data['codec']!, _codecMeta),
      );
    }
    if (data.containsKey('container')) {
      context.handle(
        _containerMeta,
        container.isAcceptableOrUnknown(data['container']!, _containerMeta),
      );
    }
    if (data.containsKey('width')) {
      context.handle(
        _widthMeta,
        width.isAcceptableOrUnknown(data['width']!, _widthMeta),
      );
    }
    if (data.containsKey('height')) {
      context.handle(
        _heightMeta,
        height.isAcceptableOrUnknown(data['height']!, _heightMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ScreenshotVideoRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ScreenshotVideoRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      screenshotId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}screenshot_id'],
      )!,
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      )!,
      codec: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}codec'],
      ),
      container: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}container'],
      ),
      width: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}width'],
      ),
      height: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}height'],
      ),
    );
  }

  @override
  $ScreenshotVideosTable createAlias(String alias) {
    return $ScreenshotVideosTable(attachedDatabase, alias);
  }
}

class ScreenshotVideoRow extends DataClass
    implements Insertable<ScreenshotVideoRow> {
  final int id;
  final int screenshotId;
  final String url;
  final String? codec;
  final String? container;
  final int? width;
  final int? height;
  const ScreenshotVideoRow({
    required this.id,
    required this.screenshotId,
    required this.url,
    this.codec,
    this.container,
    this.width,
    this.height,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['screenshot_id'] = Variable<int>(screenshotId);
    map['url'] = Variable<String>(url);
    if (!nullToAbsent || codec != null) {
      map['codec'] = Variable<String>(codec);
    }
    if (!nullToAbsent || container != null) {
      map['container'] = Variable<String>(container);
    }
    if (!nullToAbsent || width != null) {
      map['width'] = Variable<int>(width);
    }
    if (!nullToAbsent || height != null) {
      map['height'] = Variable<int>(height);
    }
    return map;
  }

  ScreenshotVideosCompanion toCompanion(bool nullToAbsent) {
    return ScreenshotVideosCompanion(
      id: Value(id),
      screenshotId: Value(screenshotId),
      url: Value(url),
      codec: codec == null && nullToAbsent
          ? const Value.absent()
          : Value(codec),
      container: container == null && nullToAbsent
          ? const Value.absent()
          : Value(container),
      width: width == null && nullToAbsent
          ? const Value.absent()
          : Value(width),
      height: height == null && nullToAbsent
          ? const Value.absent()
          : Value(height),
    );
  }

  factory ScreenshotVideoRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ScreenshotVideoRow(
      id: serializer.fromJson<int>(json['id']),
      screenshotId: serializer.fromJson<int>(json['screenshotId']),
      url: serializer.fromJson<String>(json['url']),
      codec: serializer.fromJson<String?>(json['codec']),
      container: serializer.fromJson<String?>(json['container']),
      width: serializer.fromJson<int?>(json['width']),
      height: serializer.fromJson<int?>(json['height']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'screenshotId': serializer.toJson<int>(screenshotId),
      'url': serializer.toJson<String>(url),
      'codec': serializer.toJson<String?>(codec),
      'container': serializer.toJson<String?>(container),
      'width': serializer.toJson<int?>(width),
      'height': serializer.toJson<int?>(height),
    };
  }

  ScreenshotVideoRow copyWith({
    int? id,
    int? screenshotId,
    String? url,
    Value<String?> codec = const Value.absent(),
    Value<String?> container = const Value.absent(),
    Value<int?> width = const Value.absent(),
    Value<int?> height = const Value.absent(),
  }) => ScreenshotVideoRow(
    id: id ?? this.id,
    screenshotId: screenshotId ?? this.screenshotId,
    url: url ?? this.url,
    codec: codec.present ? codec.value : this.codec,
    container: container.present ? container.value : this.container,
    width: width.present ? width.value : this.width,
    height: height.present ? height.value : this.height,
  );
  ScreenshotVideoRow copyWithCompanion(ScreenshotVideosCompanion data) {
    return ScreenshotVideoRow(
      id: data.id.present ? data.id.value : this.id,
      screenshotId: data.screenshotId.present
          ? data.screenshotId.value
          : this.screenshotId,
      url: data.url.present ? data.url.value : this.url,
      codec: data.codec.present ? data.codec.value : this.codec,
      container: data.container.present ? data.container.value : this.container,
      width: data.width.present ? data.width.value : this.width,
      height: data.height.present ? data.height.value : this.height,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ScreenshotVideoRow(')
          ..write('id: $id, ')
          ..write('screenshotId: $screenshotId, ')
          ..write('url: $url, ')
          ..write('codec: $codec, ')
          ..write('container: $container, ')
          ..write('width: $width, ')
          ..write('height: $height')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, screenshotId, url, codec, container, width, height);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ScreenshotVideoRow &&
          other.id == this.id &&
          other.screenshotId == this.screenshotId &&
          other.url == this.url &&
          other.codec == this.codec &&
          other.container == this.container &&
          other.width == this.width &&
          other.height == this.height);
}

class ScreenshotVideosCompanion extends UpdateCompanion<ScreenshotVideoRow> {
  final Value<int> id;
  final Value<int> screenshotId;
  final Value<String> url;
  final Value<String?> codec;
  final Value<String?> container;
  final Value<int?> width;
  final Value<int?> height;
  const ScreenshotVideosCompanion({
    this.id = const Value.absent(),
    this.screenshotId = const Value.absent(),
    this.url = const Value.absent(),
    this.codec = const Value.absent(),
    this.container = const Value.absent(),
    this.width = const Value.absent(),
    this.height = const Value.absent(),
  });
  ScreenshotVideosCompanion.insert({
    this.id = const Value.absent(),
    required int screenshotId,
    required String url,
    this.codec = const Value.absent(),
    this.container = const Value.absent(),
    this.width = const Value.absent(),
    this.height = const Value.absent(),
  }) : screenshotId = Value(screenshotId),
       url = Value(url);
  static Insertable<ScreenshotVideoRow> custom({
    Expression<int>? id,
    Expression<int>? screenshotId,
    Expression<String>? url,
    Expression<String>? codec,
    Expression<String>? container,
    Expression<int>? width,
    Expression<int>? height,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (screenshotId != null) 'screenshot_id': screenshotId,
      if (url != null) 'url': url,
      if (codec != null) 'codec': codec,
      if (container != null) 'container': container,
      if (width != null) 'width': width,
      if (height != null) 'height': height,
    });
  }

  ScreenshotVideosCompanion copyWith({
    Value<int>? id,
    Value<int>? screenshotId,
    Value<String>? url,
    Value<String?>? codec,
    Value<String?>? container,
    Value<int?>? width,
    Value<int?>? height,
  }) {
    return ScreenshotVideosCompanion(
      id: id ?? this.id,
      screenshotId: screenshotId ?? this.screenshotId,
      url: url ?? this.url,
      codec: codec ?? this.codec,
      container: container ?? this.container,
      width: width ?? this.width,
      height: height ?? this.height,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (screenshotId.present) {
      map['screenshot_id'] = Variable<int>(screenshotId.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (codec.present) {
      map['codec'] = Variable<String>(codec.value);
    }
    if (container.present) {
      map['container'] = Variable<String>(container.value);
    }
    if (width.present) {
      map['width'] = Variable<int>(width.value);
    }
    if (height.present) {
      map['height'] = Variable<int>(height.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScreenshotVideosCompanion(')
          ..write('id: $id, ')
          ..write('screenshotId: $screenshotId, ')
          ..write('url: $url, ')
          ..write('codec: $codec, ')
          ..write('container: $container, ')
          ..write('width: $width, ')
          ..write('height: $height')
          ..write(')'))
        .toString();
  }
}

class $ContentRatingAttrsTable extends ContentRatingAttrs
    with TableInfo<$ContentRatingAttrsTable, ContentRatingAttrRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ContentRatingAttrsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _componentIdMeta = const VerificationMeta(
    'componentId',
  );
  @override
  late final GeneratedColumn<String> componentId = GeneratedColumn<String>(
    'component_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _attrIdMeta = const VerificationMeta('attrId');
  @override
  late final GeneratedColumn<String> attrId = GeneratedColumn<String>(
    'attr_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [componentId, attrId, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'content_rating_attrs';
  @override
  VerificationContext validateIntegrity(
    Insertable<ContentRatingAttrRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('component_id')) {
      context.handle(
        _componentIdMeta,
        componentId.isAcceptableOrUnknown(
          data['component_id']!,
          _componentIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_componentIdMeta);
    }
    if (data.containsKey('attr_id')) {
      context.handle(
        _attrIdMeta,
        attrId.isAcceptableOrUnknown(data['attr_id']!, _attrIdMeta),
      );
    } else if (isInserting) {
      context.missing(_attrIdMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {componentId, attrId};
  @override
  ContentRatingAttrRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ContentRatingAttrRow(
      componentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}component_id'],
      )!,
      attrId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}attr_id'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $ContentRatingAttrsTable createAlias(String alias) {
    return $ContentRatingAttrsTable(attachedDatabase, alias);
  }
}

class ContentRatingAttrRow extends DataClass
    implements Insertable<ContentRatingAttrRow> {
  final String componentId;
  final String attrId;
  final String value;
  const ContentRatingAttrRow({
    required this.componentId,
    required this.attrId,
    required this.value,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['component_id'] = Variable<String>(componentId);
    map['attr_id'] = Variable<String>(attrId);
    map['value'] = Variable<String>(value);
    return map;
  }

  ContentRatingAttrsCompanion toCompanion(bool nullToAbsent) {
    return ContentRatingAttrsCompanion(
      componentId: Value(componentId),
      attrId: Value(attrId),
      value: Value(value),
    );
  }

  factory ContentRatingAttrRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ContentRatingAttrRow(
      componentId: serializer.fromJson<String>(json['componentId']),
      attrId: serializer.fromJson<String>(json['attrId']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'componentId': serializer.toJson<String>(componentId),
      'attrId': serializer.toJson<String>(attrId),
      'value': serializer.toJson<String>(value),
    };
  }

  ContentRatingAttrRow copyWith({
    String? componentId,
    String? attrId,
    String? value,
  }) => ContentRatingAttrRow(
    componentId: componentId ?? this.componentId,
    attrId: attrId ?? this.attrId,
    value: value ?? this.value,
  );
  ContentRatingAttrRow copyWithCompanion(ContentRatingAttrsCompanion data) {
    return ContentRatingAttrRow(
      componentId: data.componentId.present
          ? data.componentId.value
          : this.componentId,
      attrId: data.attrId.present ? data.attrId.value : this.attrId,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ContentRatingAttrRow(')
          ..write('componentId: $componentId, ')
          ..write('attrId: $attrId, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(componentId, attrId, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ContentRatingAttrRow &&
          other.componentId == this.componentId &&
          other.attrId == this.attrId &&
          other.value == this.value);
}

class ContentRatingAttrsCompanion
    extends UpdateCompanion<ContentRatingAttrRow> {
  final Value<String> componentId;
  final Value<String> attrId;
  final Value<String> value;
  final Value<int> rowid;
  const ContentRatingAttrsCompanion({
    this.componentId = const Value.absent(),
    this.attrId = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ContentRatingAttrsCompanion.insert({
    required String componentId,
    required String attrId,
    required String value,
    this.rowid = const Value.absent(),
  }) : componentId = Value(componentId),
       attrId = Value(attrId),
       value = Value(value);
  static Insertable<ContentRatingAttrRow> custom({
    Expression<String>? componentId,
    Expression<String>? attrId,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (componentId != null) 'component_id': componentId,
      if (attrId != null) 'attr_id': attrId,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ContentRatingAttrsCompanion copyWith({
    Value<String>? componentId,
    Value<String>? attrId,
    Value<String>? value,
    Value<int>? rowid,
  }) {
    return ContentRatingAttrsCompanion(
      componentId: componentId ?? this.componentId,
      attrId: attrId ?? this.attrId,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (componentId.present) {
      map['component_id'] = Variable<String>(componentId.value);
    }
    if (attrId.present) {
      map['attr_id'] = Variable<String>(attrId.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ContentRatingAttrsCompanion(')
          ..write('componentId: $componentId, ')
          ..write('attrId: $attrId, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ComponentLanguagesTable extends ComponentLanguages
    with TableInfo<$ComponentLanguagesTable, ComponentLanguageRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ComponentLanguagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _componentIdMeta = const VerificationMeta(
    'componentId',
  );
  @override
  late final GeneratedColumn<String> componentId = GeneratedColumn<String>(
    'component_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _languageMeta = const VerificationMeta(
    'language',
  );
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
    'language',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [componentId, language];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'component_languages';
  @override
  VerificationContext validateIntegrity(
    Insertable<ComponentLanguageRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('component_id')) {
      context.handle(
        _componentIdMeta,
        componentId.isAcceptableOrUnknown(
          data['component_id']!,
          _componentIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_componentIdMeta);
    }
    if (data.containsKey('language')) {
      context.handle(
        _languageMeta,
        language.isAcceptableOrUnknown(data['language']!, _languageMeta),
      );
    } else if (isInserting) {
      context.missing(_languageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {componentId, language};
  @override
  ComponentLanguageRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ComponentLanguageRow(
      componentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}component_id'],
      )!,
      language: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}language'],
      )!,
    );
  }

  @override
  $ComponentLanguagesTable createAlias(String alias) {
    return $ComponentLanguagesTable(attachedDatabase, alias);
  }
}

class ComponentLanguageRow extends DataClass
    implements Insertable<ComponentLanguageRow> {
  final String componentId;
  final String language;
  const ComponentLanguageRow({
    required this.componentId,
    required this.language,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['component_id'] = Variable<String>(componentId);
    map['language'] = Variable<String>(language);
    return map;
  }

  ComponentLanguagesCompanion toCompanion(bool nullToAbsent) {
    return ComponentLanguagesCompanion(
      componentId: Value(componentId),
      language: Value(language),
    );
  }

  factory ComponentLanguageRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ComponentLanguageRow(
      componentId: serializer.fromJson<String>(json['componentId']),
      language: serializer.fromJson<String>(json['language']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'componentId': serializer.toJson<String>(componentId),
      'language': serializer.toJson<String>(language),
    };
  }

  ComponentLanguageRow copyWith({String? componentId, String? language}) =>
      ComponentLanguageRow(
        componentId: componentId ?? this.componentId,
        language: language ?? this.language,
      );
  ComponentLanguageRow copyWithCompanion(ComponentLanguagesCompanion data) {
    return ComponentLanguageRow(
      componentId: data.componentId.present
          ? data.componentId.value
          : this.componentId,
      language: data.language.present ? data.language.value : this.language,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ComponentLanguageRow(')
          ..write('componentId: $componentId, ')
          ..write('language: $language')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(componentId, language);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ComponentLanguageRow &&
          other.componentId == this.componentId &&
          other.language == this.language);
}

class ComponentLanguagesCompanion
    extends UpdateCompanion<ComponentLanguageRow> {
  final Value<String> componentId;
  final Value<String> language;
  final Value<int> rowid;
  const ComponentLanguagesCompanion({
    this.componentId = const Value.absent(),
    this.language = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ComponentLanguagesCompanion.insert({
    required String componentId,
    required String language,
    this.rowid = const Value.absent(),
  }) : componentId = Value(componentId),
       language = Value(language);
  static Insertable<ComponentLanguageRow> custom({
    Expression<String>? componentId,
    Expression<String>? language,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (componentId != null) 'component_id': componentId,
      if (language != null) 'language': language,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ComponentLanguagesCompanion copyWith({
    Value<String>? componentId,
    Value<String>? language,
    Value<int>? rowid,
  }) {
    return ComponentLanguagesCompanion(
      componentId: componentId ?? this.componentId,
      language: language ?? this.language,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (componentId.present) {
      map['component_id'] = Variable<String>(componentId.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ComponentLanguagesCompanion(')
          ..write('componentId: $componentId, ')
          ..write('language: $language, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BrandingColorsTable extends BrandingColors
    with TableInfo<$BrandingColorsTable, BrandingColorRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BrandingColorsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _componentIdMeta = const VerificationMeta(
    'componentId',
  );
  @override
  late final GeneratedColumn<String> componentId = GeneratedColumn<String>(
    'component_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _schemePreferenceMeta = const VerificationMeta(
    'schemePreference',
  );
  @override
  late final GeneratedColumn<String> schemePreference = GeneratedColumn<String>(
    'scheme_preference',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
    'color',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [componentId, schemePreference, color];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'branding_colors';
  @override
  VerificationContext validateIntegrity(
    Insertable<BrandingColorRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('component_id')) {
      context.handle(
        _componentIdMeta,
        componentId.isAcceptableOrUnknown(
          data['component_id']!,
          _componentIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_componentIdMeta);
    }
    if (data.containsKey('scheme_preference')) {
      context.handle(
        _schemePreferenceMeta,
        schemePreference.isAcceptableOrUnknown(
          data['scheme_preference']!,
          _schemePreferenceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_schemePreferenceMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
        _colorMeta,
        color.isAcceptableOrUnknown(data['color']!, _colorMeta),
      );
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {componentId, schemePreference};
  @override
  BrandingColorRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BrandingColorRow(
      componentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}component_id'],
      )!,
      schemePreference: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}scheme_preference'],
      )!,
      color: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}color'],
      )!,
    );
  }

  @override
  $BrandingColorsTable createAlias(String alias) {
    return $BrandingColorsTable(attachedDatabase, alias);
  }
}

class BrandingColorRow extends DataClass
    implements Insertable<BrandingColorRow> {
  final String componentId;
  final String schemePreference;
  final String color;
  const BrandingColorRow({
    required this.componentId,
    required this.schemePreference,
    required this.color,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['component_id'] = Variable<String>(componentId);
    map['scheme_preference'] = Variable<String>(schemePreference);
    map['color'] = Variable<String>(color);
    return map;
  }

  BrandingColorsCompanion toCompanion(bool nullToAbsent) {
    return BrandingColorsCompanion(
      componentId: Value(componentId),
      schemePreference: Value(schemePreference),
      color: Value(color),
    );
  }

  factory BrandingColorRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BrandingColorRow(
      componentId: serializer.fromJson<String>(json['componentId']),
      schemePreference: serializer.fromJson<String>(json['schemePreference']),
      color: serializer.fromJson<String>(json['color']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'componentId': serializer.toJson<String>(componentId),
      'schemePreference': serializer.toJson<String>(schemePreference),
      'color': serializer.toJson<String>(color),
    };
  }

  BrandingColorRow copyWith({
    String? componentId,
    String? schemePreference,
    String? color,
  }) => BrandingColorRow(
    componentId: componentId ?? this.componentId,
    schemePreference: schemePreference ?? this.schemePreference,
    color: color ?? this.color,
  );
  BrandingColorRow copyWithCompanion(BrandingColorsCompanion data) {
    return BrandingColorRow(
      componentId: data.componentId.present
          ? data.componentId.value
          : this.componentId,
      schemePreference: data.schemePreference.present
          ? data.schemePreference.value
          : this.schemePreference,
      color: data.color.present ? data.color.value : this.color,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BrandingColorRow(')
          ..write('componentId: $componentId, ')
          ..write('schemePreference: $schemePreference, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(componentId, schemePreference, color);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BrandingColorRow &&
          other.componentId == this.componentId &&
          other.schemePreference == this.schemePreference &&
          other.color == this.color);
}

class BrandingColorsCompanion extends UpdateCompanion<BrandingColorRow> {
  final Value<String> componentId;
  final Value<String> schemePreference;
  final Value<String> color;
  final Value<int> rowid;
  const BrandingColorsCompanion({
    this.componentId = const Value.absent(),
    this.schemePreference = const Value.absent(),
    this.color = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BrandingColorsCompanion.insert({
    required String componentId,
    required String schemePreference,
    required String color,
    this.rowid = const Value.absent(),
  }) : componentId = Value(componentId),
       schemePreference = Value(schemePreference),
       color = Value(color);
  static Insertable<BrandingColorRow> custom({
    Expression<String>? componentId,
    Expression<String>? schemePreference,
    Expression<String>? color,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (componentId != null) 'component_id': componentId,
      if (schemePreference != null) 'scheme_preference': schemePreference,
      if (color != null) 'color': color,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BrandingColorsCompanion copyWith({
    Value<String>? componentId,
    Value<String>? schemePreference,
    Value<String>? color,
    Value<int>? rowid,
  }) {
    return BrandingColorsCompanion(
      componentId: componentId ?? this.componentId,
      schemePreference: schemePreference ?? this.schemePreference,
      color: color ?? this.color,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (componentId.present) {
      map['component_id'] = Variable<String>(componentId.value);
    }
    if (schemePreference.present) {
      map['scheme_preference'] = Variable<String>(schemePreference.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BrandingColorsCompanion(')
          ..write('componentId: $componentId, ')
          ..write('schemePreference: $schemePreference, ')
          ..write('color: $color, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ComponentExtendsTable extends ComponentExtends
    with TableInfo<$ComponentExtendsTable, ComponentExtendRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ComponentExtendsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _componentIdMeta = const VerificationMeta(
    'componentId',
  );
  @override
  late final GeneratedColumn<String> componentId = GeneratedColumn<String>(
    'component_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _extendsIdMeta = const VerificationMeta(
    'extendsId',
  );
  @override
  late final GeneratedColumn<String> extendsId = GeneratedColumn<String>(
    'extends_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [componentId, extendsId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'component_extends';
  @override
  VerificationContext validateIntegrity(
    Insertable<ComponentExtendRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('component_id')) {
      context.handle(
        _componentIdMeta,
        componentId.isAcceptableOrUnknown(
          data['component_id']!,
          _componentIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_componentIdMeta);
    }
    if (data.containsKey('extends_id')) {
      context.handle(
        _extendsIdMeta,
        extendsId.isAcceptableOrUnknown(data['extends_id']!, _extendsIdMeta),
      );
    } else if (isInserting) {
      context.missing(_extendsIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {componentId, extendsId};
  @override
  ComponentExtendRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ComponentExtendRow(
      componentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}component_id'],
      )!,
      extendsId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}extends_id'],
      )!,
    );
  }

  @override
  $ComponentExtendsTable createAlias(String alias) {
    return $ComponentExtendsTable(attachedDatabase, alias);
  }
}

class ComponentExtendRow extends DataClass
    implements Insertable<ComponentExtendRow> {
  final String componentId;
  final String extendsId;
  const ComponentExtendRow({
    required this.componentId,
    required this.extendsId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['component_id'] = Variable<String>(componentId);
    map['extends_id'] = Variable<String>(extendsId);
    return map;
  }

  ComponentExtendsCompanion toCompanion(bool nullToAbsent) {
    return ComponentExtendsCompanion(
      componentId: Value(componentId),
      extendsId: Value(extendsId),
    );
  }

  factory ComponentExtendRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ComponentExtendRow(
      componentId: serializer.fromJson<String>(json['componentId']),
      extendsId: serializer.fromJson<String>(json['extendsId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'componentId': serializer.toJson<String>(componentId),
      'extendsId': serializer.toJson<String>(extendsId),
    };
  }

  ComponentExtendRow copyWith({String? componentId, String? extendsId}) =>
      ComponentExtendRow(
        componentId: componentId ?? this.componentId,
        extendsId: extendsId ?? this.extendsId,
      );
  ComponentExtendRow copyWithCompanion(ComponentExtendsCompanion data) {
    return ComponentExtendRow(
      componentId: data.componentId.present
          ? data.componentId.value
          : this.componentId,
      extendsId: data.extendsId.present ? data.extendsId.value : this.extendsId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ComponentExtendRow(')
          ..write('componentId: $componentId, ')
          ..write('extendsId: $extendsId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(componentId, extendsId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ComponentExtendRow &&
          other.componentId == this.componentId &&
          other.extendsId == this.extendsId);
}

class ComponentExtendsCompanion extends UpdateCompanion<ComponentExtendRow> {
  final Value<String> componentId;
  final Value<String> extendsId;
  final Value<int> rowid;
  const ComponentExtendsCompanion({
    this.componentId = const Value.absent(),
    this.extendsId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ComponentExtendsCompanion.insert({
    required String componentId,
    required String extendsId,
    this.rowid = const Value.absent(),
  }) : componentId = Value(componentId),
       extendsId = Value(extendsId);
  static Insertable<ComponentExtendRow> custom({
    Expression<String>? componentId,
    Expression<String>? extendsId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (componentId != null) 'component_id': componentId,
      if (extendsId != null) 'extends_id': extendsId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ComponentExtendsCompanion copyWith({
    Value<String>? componentId,
    Value<String>? extendsId,
    Value<int>? rowid,
  }) {
    return ComponentExtendsCompanion(
      componentId: componentId ?? this.componentId,
      extendsId: extendsId ?? this.extendsId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (componentId.present) {
      map['component_id'] = Variable<String>(componentId.value);
    }
    if (extendsId.present) {
      map['extends_id'] = Variable<String>(extendsId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ComponentExtendsCompanion(')
          ..write('componentId: $componentId, ')
          ..write('extendsId: $extendsId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ComponentSuggestsTable extends ComponentSuggests
    with TableInfo<$ComponentSuggestsTable, ComponentSuggestRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ComponentSuggestsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _componentIdMeta = const VerificationMeta(
    'componentId',
  );
  @override
  late final GeneratedColumn<String> componentId = GeneratedColumn<String>(
    'component_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _suggestedIdMeta = const VerificationMeta(
    'suggestedId',
  );
  @override
  late final GeneratedColumn<String> suggestedId = GeneratedColumn<String>(
    'suggested_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [componentId, suggestedId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'component_suggests';
  @override
  VerificationContext validateIntegrity(
    Insertable<ComponentSuggestRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('component_id')) {
      context.handle(
        _componentIdMeta,
        componentId.isAcceptableOrUnknown(
          data['component_id']!,
          _componentIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_componentIdMeta);
    }
    if (data.containsKey('suggested_id')) {
      context.handle(
        _suggestedIdMeta,
        suggestedId.isAcceptableOrUnknown(
          data['suggested_id']!,
          _suggestedIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_suggestedIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {componentId, suggestedId};
  @override
  ComponentSuggestRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ComponentSuggestRow(
      componentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}component_id'],
      )!,
      suggestedId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}suggested_id'],
      )!,
    );
  }

  @override
  $ComponentSuggestsTable createAlias(String alias) {
    return $ComponentSuggestsTable(attachedDatabase, alias);
  }
}

class ComponentSuggestRow extends DataClass
    implements Insertable<ComponentSuggestRow> {
  final String componentId;
  final String suggestedId;
  const ComponentSuggestRow({
    required this.componentId,
    required this.suggestedId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['component_id'] = Variable<String>(componentId);
    map['suggested_id'] = Variable<String>(suggestedId);
    return map;
  }

  ComponentSuggestsCompanion toCompanion(bool nullToAbsent) {
    return ComponentSuggestsCompanion(
      componentId: Value(componentId),
      suggestedId: Value(suggestedId),
    );
  }

  factory ComponentSuggestRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ComponentSuggestRow(
      componentId: serializer.fromJson<String>(json['componentId']),
      suggestedId: serializer.fromJson<String>(json['suggestedId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'componentId': serializer.toJson<String>(componentId),
      'suggestedId': serializer.toJson<String>(suggestedId),
    };
  }

  ComponentSuggestRow copyWith({String? componentId, String? suggestedId}) =>
      ComponentSuggestRow(
        componentId: componentId ?? this.componentId,
        suggestedId: suggestedId ?? this.suggestedId,
      );
  ComponentSuggestRow copyWithCompanion(ComponentSuggestsCompanion data) {
    return ComponentSuggestRow(
      componentId: data.componentId.present
          ? data.componentId.value
          : this.componentId,
      suggestedId: data.suggestedId.present
          ? data.suggestedId.value
          : this.suggestedId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ComponentSuggestRow(')
          ..write('componentId: $componentId, ')
          ..write('suggestedId: $suggestedId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(componentId, suggestedId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ComponentSuggestRow &&
          other.componentId == this.componentId &&
          other.suggestedId == this.suggestedId);
}

class ComponentSuggestsCompanion extends UpdateCompanion<ComponentSuggestRow> {
  final Value<String> componentId;
  final Value<String> suggestedId;
  final Value<int> rowid;
  const ComponentSuggestsCompanion({
    this.componentId = const Value.absent(),
    this.suggestedId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ComponentSuggestsCompanion.insert({
    required String componentId,
    required String suggestedId,
    this.rowid = const Value.absent(),
  }) : componentId = Value(componentId),
       suggestedId = Value(suggestedId);
  static Insertable<ComponentSuggestRow> custom({
    Expression<String>? componentId,
    Expression<String>? suggestedId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (componentId != null) 'component_id': componentId,
      if (suggestedId != null) 'suggested_id': suggestedId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ComponentSuggestsCompanion copyWith({
    Value<String>? componentId,
    Value<String>? suggestedId,
    Value<int>? rowid,
  }) {
    return ComponentSuggestsCompanion(
      componentId: componentId ?? this.componentId,
      suggestedId: suggestedId ?? this.suggestedId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (componentId.present) {
      map['component_id'] = Variable<String>(componentId.value);
    }
    if (suggestedId.present) {
      map['suggested_id'] = Variable<String>(suggestedId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ComponentSuggestsCompanion(')
          ..write('componentId: $componentId, ')
          ..write('suggestedId: $suggestedId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ComponentRelationsTable extends ComponentRelations
    with TableInfo<$ComponentRelationsTable, ComponentRelationRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ComponentRelationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _componentIdMeta = const VerificationMeta(
    'componentId',
  );
  @override
  late final GeneratedColumn<String> componentId = GeneratedColumn<String>(
    'component_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _relationKindMeta = const VerificationMeta(
    'relationKind',
  );
  @override
  late final GeneratedColumn<String> relationKind = GeneratedColumn<String>(
    'relation_kind',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _relationTypeMeta = const VerificationMeta(
    'relationType',
  );
  @override
  late final GeneratedColumn<String> relationType = GeneratedColumn<String>(
    'relation_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _compareMeta = const VerificationMeta(
    'compare',
  );
  @override
  late final GeneratedColumn<String> compare = GeneratedColumn<String>(
    'compare',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<String> version = GeneratedColumn<String>(
    'version',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    componentId,
    relationKind,
    relationType,
    value,
    compare,
    version,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'component_relations';
  @override
  VerificationContext validateIntegrity(
    Insertable<ComponentRelationRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('component_id')) {
      context.handle(
        _componentIdMeta,
        componentId.isAcceptableOrUnknown(
          data['component_id']!,
          _componentIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_componentIdMeta);
    }
    if (data.containsKey('relation_kind')) {
      context.handle(
        _relationKindMeta,
        relationKind.isAcceptableOrUnknown(
          data['relation_kind']!,
          _relationKindMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_relationKindMeta);
    }
    if (data.containsKey('relation_type')) {
      context.handle(
        _relationTypeMeta,
        relationType.isAcceptableOrUnknown(
          data['relation_type']!,
          _relationTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_relationTypeMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    }
    if (data.containsKey('compare')) {
      context.handle(
        _compareMeta,
        compare.isAcceptableOrUnknown(data['compare']!, _compareMeta),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ComponentRelationRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ComponentRelationRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      componentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}component_id'],
      )!,
      relationKind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}relation_kind'],
      )!,
      relationType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}relation_type'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      ),
      compare: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}compare'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}version'],
      ),
    );
  }

  @override
  $ComponentRelationsTable createAlias(String alias) {
    return $ComponentRelationsTable(attachedDatabase, alias);
  }
}

class ComponentRelationRow extends DataClass
    implements Insertable<ComponentRelationRow> {
  final int id;
  final String componentId;
  final String relationKind;
  final String relationType;
  final String? value;
  final String? compare;
  final String? version;
  const ComponentRelationRow({
    required this.id,
    required this.componentId,
    required this.relationKind,
    required this.relationType,
    this.value,
    this.compare,
    this.version,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['component_id'] = Variable<String>(componentId);
    map['relation_kind'] = Variable<String>(relationKind);
    map['relation_type'] = Variable<String>(relationType);
    if (!nullToAbsent || value != null) {
      map['value'] = Variable<String>(value);
    }
    if (!nullToAbsent || compare != null) {
      map['compare'] = Variable<String>(compare);
    }
    if (!nullToAbsent || version != null) {
      map['version'] = Variable<String>(version);
    }
    return map;
  }

  ComponentRelationsCompanion toCompanion(bool nullToAbsent) {
    return ComponentRelationsCompanion(
      id: Value(id),
      componentId: Value(componentId),
      relationKind: Value(relationKind),
      relationType: Value(relationType),
      value: value == null && nullToAbsent
          ? const Value.absent()
          : Value(value),
      compare: compare == null && nullToAbsent
          ? const Value.absent()
          : Value(compare),
      version: version == null && nullToAbsent
          ? const Value.absent()
          : Value(version),
    );
  }

  factory ComponentRelationRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ComponentRelationRow(
      id: serializer.fromJson<int>(json['id']),
      componentId: serializer.fromJson<String>(json['componentId']),
      relationKind: serializer.fromJson<String>(json['relationKind']),
      relationType: serializer.fromJson<String>(json['relationType']),
      value: serializer.fromJson<String?>(json['value']),
      compare: serializer.fromJson<String?>(json['compare']),
      version: serializer.fromJson<String?>(json['version']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'componentId': serializer.toJson<String>(componentId),
      'relationKind': serializer.toJson<String>(relationKind),
      'relationType': serializer.toJson<String>(relationType),
      'value': serializer.toJson<String?>(value),
      'compare': serializer.toJson<String?>(compare),
      'version': serializer.toJson<String?>(version),
    };
  }

  ComponentRelationRow copyWith({
    int? id,
    String? componentId,
    String? relationKind,
    String? relationType,
    Value<String?> value = const Value.absent(),
    Value<String?> compare = const Value.absent(),
    Value<String?> version = const Value.absent(),
  }) => ComponentRelationRow(
    id: id ?? this.id,
    componentId: componentId ?? this.componentId,
    relationKind: relationKind ?? this.relationKind,
    relationType: relationType ?? this.relationType,
    value: value.present ? value.value : this.value,
    compare: compare.present ? compare.value : this.compare,
    version: version.present ? version.value : this.version,
  );
  ComponentRelationRow copyWithCompanion(ComponentRelationsCompanion data) {
    return ComponentRelationRow(
      id: data.id.present ? data.id.value : this.id,
      componentId: data.componentId.present
          ? data.componentId.value
          : this.componentId,
      relationKind: data.relationKind.present
          ? data.relationKind.value
          : this.relationKind,
      relationType: data.relationType.present
          ? data.relationType.value
          : this.relationType,
      value: data.value.present ? data.value.value : this.value,
      compare: data.compare.present ? data.compare.value : this.compare,
      version: data.version.present ? data.version.value : this.version,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ComponentRelationRow(')
          ..write('id: $id, ')
          ..write('componentId: $componentId, ')
          ..write('relationKind: $relationKind, ')
          ..write('relationType: $relationType, ')
          ..write('value: $value, ')
          ..write('compare: $compare, ')
          ..write('version: $version')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    componentId,
    relationKind,
    relationType,
    value,
    compare,
    version,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ComponentRelationRow &&
          other.id == this.id &&
          other.componentId == this.componentId &&
          other.relationKind == this.relationKind &&
          other.relationType == this.relationType &&
          other.value == this.value &&
          other.compare == this.compare &&
          other.version == this.version);
}

class ComponentRelationsCompanion
    extends UpdateCompanion<ComponentRelationRow> {
  final Value<int> id;
  final Value<String> componentId;
  final Value<String> relationKind;
  final Value<String> relationType;
  final Value<String?> value;
  final Value<String?> compare;
  final Value<String?> version;
  const ComponentRelationsCompanion({
    this.id = const Value.absent(),
    this.componentId = const Value.absent(),
    this.relationKind = const Value.absent(),
    this.relationType = const Value.absent(),
    this.value = const Value.absent(),
    this.compare = const Value.absent(),
    this.version = const Value.absent(),
  });
  ComponentRelationsCompanion.insert({
    this.id = const Value.absent(),
    required String componentId,
    required String relationKind,
    required String relationType,
    this.value = const Value.absent(),
    this.compare = const Value.absent(),
    this.version = const Value.absent(),
  }) : componentId = Value(componentId),
       relationKind = Value(relationKind),
       relationType = Value(relationType);
  static Insertable<ComponentRelationRow> custom({
    Expression<int>? id,
    Expression<String>? componentId,
    Expression<String>? relationKind,
    Expression<String>? relationType,
    Expression<String>? value,
    Expression<String>? compare,
    Expression<String>? version,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (componentId != null) 'component_id': componentId,
      if (relationKind != null) 'relation_kind': relationKind,
      if (relationType != null) 'relation_type': relationType,
      if (value != null) 'value': value,
      if (compare != null) 'compare': compare,
      if (version != null) 'version': version,
    });
  }

  ComponentRelationsCompanion copyWith({
    Value<int>? id,
    Value<String>? componentId,
    Value<String>? relationKind,
    Value<String>? relationType,
    Value<String?>? value,
    Value<String?>? compare,
    Value<String?>? version,
  }) {
    return ComponentRelationsCompanion(
      id: id ?? this.id,
      componentId: componentId ?? this.componentId,
      relationKind: relationKind ?? this.relationKind,
      relationType: relationType ?? this.relationType,
      value: value ?? this.value,
      compare: compare ?? this.compare,
      version: version ?? this.version,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (componentId.present) {
      map['component_id'] = Variable<String>(componentId.value);
    }
    if (relationKind.present) {
      map['relation_kind'] = Variable<String>(relationKind.value);
    }
    if (relationType.present) {
      map['relation_type'] = Variable<String>(relationType.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (compare.present) {
      map['compare'] = Variable<String>(compare.value);
    }
    if (version.present) {
      map['version'] = Variable<String>(version.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ComponentRelationsCompanion(')
          ..write('id: $id, ')
          ..write('componentId: $componentId, ')
          ..write('relationKind: $relationKind, ')
          ..write('relationType: $relationType, ')
          ..write('value: $value, ')
          ..write('compare: $compare, ')
          ..write('version: $version')
          ..write(')'))
        .toString();
  }
}

class $ComponentCustomTable extends ComponentCustom
    with TableInfo<$ComponentCustomTable, ComponentCustomRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ComponentCustomTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _componentIdMeta = const VerificationMeta(
    'componentId',
  );
  @override
  late final GeneratedColumn<String> componentId = GeneratedColumn<String>(
    'component_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [componentId, key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'component_custom';
  @override
  VerificationContext validateIntegrity(
    Insertable<ComponentCustomRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('component_id')) {
      context.handle(
        _componentIdMeta,
        componentId.isAcceptableOrUnknown(
          data['component_id']!,
          _componentIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_componentIdMeta);
    }
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {componentId, key};
  @override
  ComponentCustomRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ComponentCustomRow(
      componentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}component_id'],
      )!,
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $ComponentCustomTable createAlias(String alias) {
    return $ComponentCustomTable(attachedDatabase, alias);
  }
}

class ComponentCustomRow extends DataClass
    implements Insertable<ComponentCustomRow> {
  final String componentId;
  final String key;
  final String value;
  const ComponentCustomRow({
    required this.componentId,
    required this.key,
    required this.value,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['component_id'] = Variable<String>(componentId);
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  ComponentCustomCompanion toCompanion(bool nullToAbsent) {
    return ComponentCustomCompanion(
      componentId: Value(componentId),
      key: Value(key),
      value: Value(value),
    );
  }

  factory ComponentCustomRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ComponentCustomRow(
      componentId: serializer.fromJson<String>(json['componentId']),
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'componentId': serializer.toJson<String>(componentId),
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  ComponentCustomRow copyWith({
    String? componentId,
    String? key,
    String? value,
  }) => ComponentCustomRow(
    componentId: componentId ?? this.componentId,
    key: key ?? this.key,
    value: value ?? this.value,
  );
  ComponentCustomRow copyWithCompanion(ComponentCustomCompanion data) {
    return ComponentCustomRow(
      componentId: data.componentId.present
          ? data.componentId.value
          : this.componentId,
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ComponentCustomRow(')
          ..write('componentId: $componentId, ')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(componentId, key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ComponentCustomRow &&
          other.componentId == this.componentId &&
          other.key == this.key &&
          other.value == this.value);
}

class ComponentCustomCompanion extends UpdateCompanion<ComponentCustomRow> {
  final Value<String> componentId;
  final Value<String> key;
  final Value<String> value;
  final Value<int> rowid;
  const ComponentCustomCompanion({
    this.componentId = const Value.absent(),
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ComponentCustomCompanion.insert({
    required String componentId,
    required String key,
    required String value,
    this.rowid = const Value.absent(),
  }) : componentId = Value(componentId),
       key = Value(key),
       value = Value(value);
  static Insertable<ComponentCustomRow> custom({
    Expression<String>? componentId,
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (componentId != null) 'component_id': componentId,
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ComponentCustomCompanion copyWith({
    Value<String>? componentId,
    Value<String>? key,
    Value<String>? value,
    Value<int>? rowid,
  }) {
    return ComponentCustomCompanion(
      componentId: componentId ?? this.componentId,
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (componentId.present) {
      map['component_id'] = Variable<String>(componentId.value);
    }
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ComponentCustomCompanion(')
          ..write('componentId: $componentId, ')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ComponentFieldTranslationsTable extends ComponentFieldTranslations
    with
        TableInfo<
          $ComponentFieldTranslationsTable,
          ComponentFieldTranslationRow
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ComponentFieldTranslationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _componentIdMeta = const VerificationMeta(
    'componentId',
  );
  @override
  late final GeneratedColumn<String> componentId = GeneratedColumn<String>(
    'component_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fieldMeta = const VerificationMeta('field');
  @override
  late final GeneratedColumn<String> field = GeneratedColumn<String>(
    'field',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _languageMeta = const VerificationMeta(
    'language',
  );
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
    'language',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [componentId, field, language, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'component_field_translations';
  @override
  VerificationContext validateIntegrity(
    Insertable<ComponentFieldTranslationRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('component_id')) {
      context.handle(
        _componentIdMeta,
        componentId.isAcceptableOrUnknown(
          data['component_id']!,
          _componentIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_componentIdMeta);
    }
    if (data.containsKey('field')) {
      context.handle(
        _fieldMeta,
        field.isAcceptableOrUnknown(data['field']!, _fieldMeta),
      );
    } else if (isInserting) {
      context.missing(_fieldMeta);
    }
    if (data.containsKey('language')) {
      context.handle(
        _languageMeta,
        language.isAcceptableOrUnknown(data['language']!, _languageMeta),
      );
    } else if (isInserting) {
      context.missing(_languageMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {componentId, field, language};
  @override
  ComponentFieldTranslationRow map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ComponentFieldTranslationRow(
      componentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}component_id'],
      )!,
      field: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}field'],
      )!,
      language: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}language'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $ComponentFieldTranslationsTable createAlias(String alias) {
    return $ComponentFieldTranslationsTable(attachedDatabase, alias);
  }
}

class ComponentFieldTranslationRow extends DataClass
    implements Insertable<ComponentFieldTranslationRow> {
  final String componentId;
  final String field;
  final String language;
  final String value;
  const ComponentFieldTranslationRow({
    required this.componentId,
    required this.field,
    required this.language,
    required this.value,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['component_id'] = Variable<String>(componentId);
    map['field'] = Variable<String>(field);
    map['language'] = Variable<String>(language);
    map['value'] = Variable<String>(value);
    return map;
  }

  ComponentFieldTranslationsCompanion toCompanion(bool nullToAbsent) {
    return ComponentFieldTranslationsCompanion(
      componentId: Value(componentId),
      field: Value(field),
      language: Value(language),
      value: Value(value),
    );
  }

  factory ComponentFieldTranslationRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ComponentFieldTranslationRow(
      componentId: serializer.fromJson<String>(json['componentId']),
      field: serializer.fromJson<String>(json['field']),
      language: serializer.fromJson<String>(json['language']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'componentId': serializer.toJson<String>(componentId),
      'field': serializer.toJson<String>(field),
      'language': serializer.toJson<String>(language),
      'value': serializer.toJson<String>(value),
    };
  }

  ComponentFieldTranslationRow copyWith({
    String? componentId,
    String? field,
    String? language,
    String? value,
  }) => ComponentFieldTranslationRow(
    componentId: componentId ?? this.componentId,
    field: field ?? this.field,
    language: language ?? this.language,
    value: value ?? this.value,
  );
  ComponentFieldTranslationRow copyWithCompanion(
    ComponentFieldTranslationsCompanion data,
  ) {
    return ComponentFieldTranslationRow(
      componentId: data.componentId.present
          ? data.componentId.value
          : this.componentId,
      field: data.field.present ? data.field.value : this.field,
      language: data.language.present ? data.language.value : this.language,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ComponentFieldTranslationRow(')
          ..write('componentId: $componentId, ')
          ..write('field: $field, ')
          ..write('language: $language, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(componentId, field, language, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ComponentFieldTranslationRow &&
          other.componentId == this.componentId &&
          other.field == this.field &&
          other.language == this.language &&
          other.value == this.value);
}

class ComponentFieldTranslationsCompanion
    extends UpdateCompanion<ComponentFieldTranslationRow> {
  final Value<String> componentId;
  final Value<String> field;
  final Value<String> language;
  final Value<String> value;
  final Value<int> rowid;
  const ComponentFieldTranslationsCompanion({
    this.componentId = const Value.absent(),
    this.field = const Value.absent(),
    this.language = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ComponentFieldTranslationsCompanion.insert({
    required String componentId,
    required String field,
    required String language,
    required String value,
    this.rowid = const Value.absent(),
  }) : componentId = Value(componentId),
       field = Value(field),
       language = Value(language),
       value = Value(value);
  static Insertable<ComponentFieldTranslationRow> custom({
    Expression<String>? componentId,
    Expression<String>? field,
    Expression<String>? language,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (componentId != null) 'component_id': componentId,
      if (field != null) 'field': field,
      if (language != null) 'language': language,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ComponentFieldTranslationsCompanion copyWith({
    Value<String>? componentId,
    Value<String>? field,
    Value<String>? language,
    Value<String>? value,
    Value<int>? rowid,
  }) {
    return ComponentFieldTranslationsCompanion(
      componentId: componentId ?? this.componentId,
      field: field ?? this.field,
      language: language ?? this.language,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (componentId.present) {
      map['component_id'] = Variable<String>(componentId.value);
    }
    if (field.present) {
      map['field'] = Variable<String>(field.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ComponentFieldTranslationsCompanion(')
          ..write('componentId: $componentId, ')
          ..write('field: $field, ')
          ..write('language: $language, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$CatalogDatabase extends GeneratedDatabase {
  _$CatalogDatabase(QueryExecutor e) : super(e);
  $CatalogDatabaseManager get managers => $CatalogDatabaseManager(this);
  late final $ComponentsTable components = $ComponentsTable(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $ComponentCategoriesTable componentCategories =
      $ComponentCategoriesTable(this);
  late final $KeywordsTable keywords = $KeywordsTable(this);
  late final $ComponentKeywordsTable componentKeywords =
      $ComponentKeywordsTable(this);
  late final $ComponentUrlsTable componentUrls = $ComponentUrlsTable(this);
  late final $ComponentIconsTable componentIcons = $ComponentIconsTable(this);
  late final $ReleasesTable releases = $ReleasesTable(this);
  late final $ReleaseIssuesTable releaseIssues = $ReleaseIssuesTable(this);
  late final $ScreenshotsTable screenshots = $ScreenshotsTable(this);
  late final $ScreenshotImagesTable screenshotImages = $ScreenshotImagesTable(
    this,
  );
  late final $ScreenshotVideosTable screenshotVideos = $ScreenshotVideosTable(
    this,
  );
  late final $ContentRatingAttrsTable contentRatingAttrs =
      $ContentRatingAttrsTable(this);
  late final $ComponentLanguagesTable componentLanguages =
      $ComponentLanguagesTable(this);
  late final $BrandingColorsTable brandingColors = $BrandingColorsTable(this);
  late final $ComponentExtendsTable componentExtends = $ComponentExtendsTable(
    this,
  );
  late final $ComponentSuggestsTable componentSuggests =
      $ComponentSuggestsTable(this);
  late final $ComponentRelationsTable componentRelations =
      $ComponentRelationsTable(this);
  late final $ComponentCustomTable componentCustom = $ComponentCustomTable(
    this,
  );
  late final $ComponentFieldTranslationsTable componentFieldTranslations =
      $ComponentFieldTranslationsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    components,
    categories,
    componentCategories,
    keywords,
    componentKeywords,
    componentUrls,
    componentIcons,
    releases,
    releaseIssues,
    screenshots,
    screenshotImages,
    screenshotVideos,
    contentRatingAttrs,
    componentLanguages,
    brandingColors,
    componentExtends,
    componentSuggests,
    componentRelations,
    componentCustom,
    componentFieldTranslations,
  ];
}

typedef $$ComponentsTableCreateCompanionBuilder =
    ComponentsCompanion Function({
      required String id,
      Value<int> componentType,
      Value<int> priority,
      Value<String?> merge,
      required String name,
      Value<String?> nameVariantSuffix,
      Value<String?> summary,
      Value<String?> description,
      Value<String?> pkgname,
      Value<String?> sourcePkgname,
      Value<String?> projectLicense,
      Value<String?> metadataLicense,
      Value<String?> projectGroup,
      Value<String?> mediaBaseurl,
      Value<String?> architecture,
      Value<int?> bundleType,
      Value<String?> bundleId,
      Value<String?> developerId,
      Value<String?> developerName,
      Value<int?> launchableType,
      Value<String?> launchableValue,
      Value<String?> contentRatingType,
      Value<String?> agreement,
      Value<int> rowid,
    });
typedef $$ComponentsTableUpdateCompanionBuilder =
    ComponentsCompanion Function({
      Value<String> id,
      Value<int> componentType,
      Value<int> priority,
      Value<String?> merge,
      Value<String> name,
      Value<String?> nameVariantSuffix,
      Value<String?> summary,
      Value<String?> description,
      Value<String?> pkgname,
      Value<String?> sourcePkgname,
      Value<String?> projectLicense,
      Value<String?> metadataLicense,
      Value<String?> projectGroup,
      Value<String?> mediaBaseurl,
      Value<String?> architecture,
      Value<int?> bundleType,
      Value<String?> bundleId,
      Value<String?> developerId,
      Value<String?> developerName,
      Value<int?> launchableType,
      Value<String?> launchableValue,
      Value<String?> contentRatingType,
      Value<String?> agreement,
      Value<int> rowid,
    });

class $$ComponentsTableFilterComposer
    extends Composer<_$CatalogDatabase, $ComponentsTable> {
  $$ComponentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get componentType => $composableBuilder(
    column: $table.componentType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get merge => $composableBuilder(
    column: $table.merge,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameVariantSuffix => $composableBuilder(
    column: $table.nameVariantSuffix,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get summary => $composableBuilder(
    column: $table.summary,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pkgname => $composableBuilder(
    column: $table.pkgname,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourcePkgname => $composableBuilder(
    column: $table.sourcePkgname,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get projectLicense => $composableBuilder(
    column: $table.projectLicense,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get metadataLicense => $composableBuilder(
    column: $table.metadataLicense,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get projectGroup => $composableBuilder(
    column: $table.projectGroup,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mediaBaseurl => $composableBuilder(
    column: $table.mediaBaseurl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get architecture => $composableBuilder(
    column: $table.architecture,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get bundleType => $composableBuilder(
    column: $table.bundleType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bundleId => $composableBuilder(
    column: $table.bundleId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get developerId => $composableBuilder(
    column: $table.developerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get developerName => $composableBuilder(
    column: $table.developerName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get launchableType => $composableBuilder(
    column: $table.launchableType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get launchableValue => $composableBuilder(
    column: $table.launchableValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contentRatingType => $composableBuilder(
    column: $table.contentRatingType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get agreement => $composableBuilder(
    column: $table.agreement,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ComponentsTableOrderingComposer
    extends Composer<_$CatalogDatabase, $ComponentsTable> {
  $$ComponentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get componentType => $composableBuilder(
    column: $table.componentType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get merge => $composableBuilder(
    column: $table.merge,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameVariantSuffix => $composableBuilder(
    column: $table.nameVariantSuffix,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get summary => $composableBuilder(
    column: $table.summary,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pkgname => $composableBuilder(
    column: $table.pkgname,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourcePkgname => $composableBuilder(
    column: $table.sourcePkgname,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get projectLicense => $composableBuilder(
    column: $table.projectLicense,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get metadataLicense => $composableBuilder(
    column: $table.metadataLicense,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get projectGroup => $composableBuilder(
    column: $table.projectGroup,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mediaBaseurl => $composableBuilder(
    column: $table.mediaBaseurl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get architecture => $composableBuilder(
    column: $table.architecture,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get bundleType => $composableBuilder(
    column: $table.bundleType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bundleId => $composableBuilder(
    column: $table.bundleId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get developerId => $composableBuilder(
    column: $table.developerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get developerName => $composableBuilder(
    column: $table.developerName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get launchableType => $composableBuilder(
    column: $table.launchableType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get launchableValue => $composableBuilder(
    column: $table.launchableValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contentRatingType => $composableBuilder(
    column: $table.contentRatingType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get agreement => $composableBuilder(
    column: $table.agreement,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ComponentsTableAnnotationComposer
    extends Composer<_$CatalogDatabase, $ComponentsTable> {
  $$ComponentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get componentType => $composableBuilder(
    column: $table.componentType,
    builder: (column) => column,
  );

  GeneratedColumn<int> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  GeneratedColumn<String> get merge =>
      $composableBuilder(column: $table.merge, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get nameVariantSuffix => $composableBuilder(
    column: $table.nameVariantSuffix,
    builder: (column) => column,
  );

  GeneratedColumn<String> get summary =>
      $composableBuilder(column: $table.summary, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get pkgname =>
      $composableBuilder(column: $table.pkgname, builder: (column) => column);

  GeneratedColumn<String> get sourcePkgname => $composableBuilder(
    column: $table.sourcePkgname,
    builder: (column) => column,
  );

  GeneratedColumn<String> get projectLicense => $composableBuilder(
    column: $table.projectLicense,
    builder: (column) => column,
  );

  GeneratedColumn<String> get metadataLicense => $composableBuilder(
    column: $table.metadataLicense,
    builder: (column) => column,
  );

  GeneratedColumn<String> get projectGroup => $composableBuilder(
    column: $table.projectGroup,
    builder: (column) => column,
  );

  GeneratedColumn<String> get mediaBaseurl => $composableBuilder(
    column: $table.mediaBaseurl,
    builder: (column) => column,
  );

  GeneratedColumn<String> get architecture => $composableBuilder(
    column: $table.architecture,
    builder: (column) => column,
  );

  GeneratedColumn<int> get bundleType => $composableBuilder(
    column: $table.bundleType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get bundleId =>
      $composableBuilder(column: $table.bundleId, builder: (column) => column);

  GeneratedColumn<String> get developerId => $composableBuilder(
    column: $table.developerId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get developerName => $composableBuilder(
    column: $table.developerName,
    builder: (column) => column,
  );

  GeneratedColumn<int> get launchableType => $composableBuilder(
    column: $table.launchableType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get launchableValue => $composableBuilder(
    column: $table.launchableValue,
    builder: (column) => column,
  );

  GeneratedColumn<String> get contentRatingType => $composableBuilder(
    column: $table.contentRatingType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get agreement =>
      $composableBuilder(column: $table.agreement, builder: (column) => column);
}

class $$ComponentsTableTableManager
    extends
        RootTableManager<
          _$CatalogDatabase,
          $ComponentsTable,
          ComponentRow,
          $$ComponentsTableFilterComposer,
          $$ComponentsTableOrderingComposer,
          $$ComponentsTableAnnotationComposer,
          $$ComponentsTableCreateCompanionBuilder,
          $$ComponentsTableUpdateCompanionBuilder,
          (
            ComponentRow,
            BaseReferences<_$CatalogDatabase, $ComponentsTable, ComponentRow>,
          ),
          ComponentRow,
          PrefetchHooks Function()
        > {
  $$ComponentsTableTableManager(_$CatalogDatabase db, $ComponentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ComponentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ComponentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ComponentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<int> componentType = const Value.absent(),
                Value<int> priority = const Value.absent(),
                Value<String?> merge = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> nameVariantSuffix = const Value.absent(),
                Value<String?> summary = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> pkgname = const Value.absent(),
                Value<String?> sourcePkgname = const Value.absent(),
                Value<String?> projectLicense = const Value.absent(),
                Value<String?> metadataLicense = const Value.absent(),
                Value<String?> projectGroup = const Value.absent(),
                Value<String?> mediaBaseurl = const Value.absent(),
                Value<String?> architecture = const Value.absent(),
                Value<int?> bundleType = const Value.absent(),
                Value<String?> bundleId = const Value.absent(),
                Value<String?> developerId = const Value.absent(),
                Value<String?> developerName = const Value.absent(),
                Value<int?> launchableType = const Value.absent(),
                Value<String?> launchableValue = const Value.absent(),
                Value<String?> contentRatingType = const Value.absent(),
                Value<String?> agreement = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ComponentsCompanion(
                id: id,
                componentType: componentType,
                priority: priority,
                merge: merge,
                name: name,
                nameVariantSuffix: nameVariantSuffix,
                summary: summary,
                description: description,
                pkgname: pkgname,
                sourcePkgname: sourcePkgname,
                projectLicense: projectLicense,
                metadataLicense: metadataLicense,
                projectGroup: projectGroup,
                mediaBaseurl: mediaBaseurl,
                architecture: architecture,
                bundleType: bundleType,
                bundleId: bundleId,
                developerId: developerId,
                developerName: developerName,
                launchableType: launchableType,
                launchableValue: launchableValue,
                contentRatingType: contentRatingType,
                agreement: agreement,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<int> componentType = const Value.absent(),
                Value<int> priority = const Value.absent(),
                Value<String?> merge = const Value.absent(),
                required String name,
                Value<String?> nameVariantSuffix = const Value.absent(),
                Value<String?> summary = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> pkgname = const Value.absent(),
                Value<String?> sourcePkgname = const Value.absent(),
                Value<String?> projectLicense = const Value.absent(),
                Value<String?> metadataLicense = const Value.absent(),
                Value<String?> projectGroup = const Value.absent(),
                Value<String?> mediaBaseurl = const Value.absent(),
                Value<String?> architecture = const Value.absent(),
                Value<int?> bundleType = const Value.absent(),
                Value<String?> bundleId = const Value.absent(),
                Value<String?> developerId = const Value.absent(),
                Value<String?> developerName = const Value.absent(),
                Value<int?> launchableType = const Value.absent(),
                Value<String?> launchableValue = const Value.absent(),
                Value<String?> contentRatingType = const Value.absent(),
                Value<String?> agreement = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ComponentsCompanion.insert(
                id: id,
                componentType: componentType,
                priority: priority,
                merge: merge,
                name: name,
                nameVariantSuffix: nameVariantSuffix,
                summary: summary,
                description: description,
                pkgname: pkgname,
                sourcePkgname: sourcePkgname,
                projectLicense: projectLicense,
                metadataLicense: metadataLicense,
                projectGroup: projectGroup,
                mediaBaseurl: mediaBaseurl,
                architecture: architecture,
                bundleType: bundleType,
                bundleId: bundleId,
                developerId: developerId,
                developerName: developerName,
                launchableType: launchableType,
                launchableValue: launchableValue,
                contentRatingType: contentRatingType,
                agreement: agreement,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ComponentsTableProcessedTableManager =
    ProcessedTableManager<
      _$CatalogDatabase,
      $ComponentsTable,
      ComponentRow,
      $$ComponentsTableFilterComposer,
      $$ComponentsTableOrderingComposer,
      $$ComponentsTableAnnotationComposer,
      $$ComponentsTableCreateCompanionBuilder,
      $$ComponentsTableUpdateCompanionBuilder,
      (
        ComponentRow,
        BaseReferences<_$CatalogDatabase, $ComponentsTable, ComponentRow>,
      ),
      ComponentRow,
      PrefetchHooks Function()
    >;
typedef $$CategoriesTableCreateCompanionBuilder =
    CategoriesCompanion Function({Value<int> id, required String name});
typedef $$CategoriesTableUpdateCompanionBuilder =
    CategoriesCompanion Function({Value<int> id, Value<String> name});

class $$CategoriesTableFilterComposer
    extends Composer<_$CatalogDatabase, $CategoriesTable> {
  $$CategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CategoriesTableOrderingComposer
    extends Composer<_$CatalogDatabase, $CategoriesTable> {
  $$CategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CategoriesTableAnnotationComposer
    extends Composer<_$CatalogDatabase, $CategoriesTable> {
  $$CategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);
}

class $$CategoriesTableTableManager
    extends
        RootTableManager<
          _$CatalogDatabase,
          $CategoriesTable,
          Category,
          $$CategoriesTableFilterComposer,
          $$CategoriesTableOrderingComposer,
          $$CategoriesTableAnnotationComposer,
          $$CategoriesTableCreateCompanionBuilder,
          $$CategoriesTableUpdateCompanionBuilder,
          (
            Category,
            BaseReferences<_$CatalogDatabase, $CategoriesTable, Category>,
          ),
          Category,
          PrefetchHooks Function()
        > {
  $$CategoriesTableTableManager(_$CatalogDatabase db, $CategoriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => CategoriesCompanion(id: id, name: name),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String name}) =>
                  CategoriesCompanion.insert(id: id, name: name),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$CatalogDatabase,
      $CategoriesTable,
      Category,
      $$CategoriesTableFilterComposer,
      $$CategoriesTableOrderingComposer,
      $$CategoriesTableAnnotationComposer,
      $$CategoriesTableCreateCompanionBuilder,
      $$CategoriesTableUpdateCompanionBuilder,
      (Category, BaseReferences<_$CatalogDatabase, $CategoriesTable, Category>),
      Category,
      PrefetchHooks Function()
    >;
typedef $$ComponentCategoriesTableCreateCompanionBuilder =
    ComponentCategoriesCompanion Function({
      required String componentId,
      required int categoryId,
      Value<int> rowid,
    });
typedef $$ComponentCategoriesTableUpdateCompanionBuilder =
    ComponentCategoriesCompanion Function({
      Value<String> componentId,
      Value<int> categoryId,
      Value<int> rowid,
    });

class $$ComponentCategoriesTableFilterComposer
    extends Composer<_$CatalogDatabase, $ComponentCategoriesTable> {
  $$ComponentCategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get componentId => $composableBuilder(
    column: $table.componentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ComponentCategoriesTableOrderingComposer
    extends Composer<_$CatalogDatabase, $ComponentCategoriesTable> {
  $$ComponentCategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get componentId => $composableBuilder(
    column: $table.componentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ComponentCategoriesTableAnnotationComposer
    extends Composer<_$CatalogDatabase, $ComponentCategoriesTable> {
  $$ComponentCategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get componentId => $composableBuilder(
    column: $table.componentId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => column,
  );
}

class $$ComponentCategoriesTableTableManager
    extends
        RootTableManager<
          _$CatalogDatabase,
          $ComponentCategoriesTable,
          ComponentCategoryRow,
          $$ComponentCategoriesTableFilterComposer,
          $$ComponentCategoriesTableOrderingComposer,
          $$ComponentCategoriesTableAnnotationComposer,
          $$ComponentCategoriesTableCreateCompanionBuilder,
          $$ComponentCategoriesTableUpdateCompanionBuilder,
          (
            ComponentCategoryRow,
            BaseReferences<
              _$CatalogDatabase,
              $ComponentCategoriesTable,
              ComponentCategoryRow
            >,
          ),
          ComponentCategoryRow,
          PrefetchHooks Function()
        > {
  $$ComponentCategoriesTableTableManager(
    _$CatalogDatabase db,
    $ComponentCategoriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ComponentCategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ComponentCategoriesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ComponentCategoriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> componentId = const Value.absent(),
                Value<int> categoryId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ComponentCategoriesCompanion(
                componentId: componentId,
                categoryId: categoryId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String componentId,
                required int categoryId,
                Value<int> rowid = const Value.absent(),
              }) => ComponentCategoriesCompanion.insert(
                componentId: componentId,
                categoryId: categoryId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ComponentCategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$CatalogDatabase,
      $ComponentCategoriesTable,
      ComponentCategoryRow,
      $$ComponentCategoriesTableFilterComposer,
      $$ComponentCategoriesTableOrderingComposer,
      $$ComponentCategoriesTableAnnotationComposer,
      $$ComponentCategoriesTableCreateCompanionBuilder,
      $$ComponentCategoriesTableUpdateCompanionBuilder,
      (
        ComponentCategoryRow,
        BaseReferences<
          _$CatalogDatabase,
          $ComponentCategoriesTable,
          ComponentCategoryRow
        >,
      ),
      ComponentCategoryRow,
      PrefetchHooks Function()
    >;
typedef $$KeywordsTableCreateCompanionBuilder =
    KeywordsCompanion Function({Value<int> id, required String name});
typedef $$KeywordsTableUpdateCompanionBuilder =
    KeywordsCompanion Function({Value<int> id, Value<String> name});

class $$KeywordsTableFilterComposer
    extends Composer<_$CatalogDatabase, $KeywordsTable> {
  $$KeywordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );
}

class $$KeywordsTableOrderingComposer
    extends Composer<_$CatalogDatabase, $KeywordsTable> {
  $$KeywordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$KeywordsTableAnnotationComposer
    extends Composer<_$CatalogDatabase, $KeywordsTable> {
  $$KeywordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);
}

class $$KeywordsTableTableManager
    extends
        RootTableManager<
          _$CatalogDatabase,
          $KeywordsTable,
          Keyword,
          $$KeywordsTableFilterComposer,
          $$KeywordsTableOrderingComposer,
          $$KeywordsTableAnnotationComposer,
          $$KeywordsTableCreateCompanionBuilder,
          $$KeywordsTableUpdateCompanionBuilder,
          (Keyword, BaseReferences<_$CatalogDatabase, $KeywordsTable, Keyword>),
          Keyword,
          PrefetchHooks Function()
        > {
  $$KeywordsTableTableManager(_$CatalogDatabase db, $KeywordsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$KeywordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$KeywordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$KeywordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => KeywordsCompanion(id: id, name: name),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String name}) =>
                  KeywordsCompanion.insert(id: id, name: name),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$KeywordsTableProcessedTableManager =
    ProcessedTableManager<
      _$CatalogDatabase,
      $KeywordsTable,
      Keyword,
      $$KeywordsTableFilterComposer,
      $$KeywordsTableOrderingComposer,
      $$KeywordsTableAnnotationComposer,
      $$KeywordsTableCreateCompanionBuilder,
      $$KeywordsTableUpdateCompanionBuilder,
      (Keyword, BaseReferences<_$CatalogDatabase, $KeywordsTable, Keyword>),
      Keyword,
      PrefetchHooks Function()
    >;
typedef $$ComponentKeywordsTableCreateCompanionBuilder =
    ComponentKeywordsCompanion Function({
      required String componentId,
      required int keywordId,
      Value<int> rowid,
    });
typedef $$ComponentKeywordsTableUpdateCompanionBuilder =
    ComponentKeywordsCompanion Function({
      Value<String> componentId,
      Value<int> keywordId,
      Value<int> rowid,
    });

class $$ComponentKeywordsTableFilterComposer
    extends Composer<_$CatalogDatabase, $ComponentKeywordsTable> {
  $$ComponentKeywordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get componentId => $composableBuilder(
    column: $table.componentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get keywordId => $composableBuilder(
    column: $table.keywordId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ComponentKeywordsTableOrderingComposer
    extends Composer<_$CatalogDatabase, $ComponentKeywordsTable> {
  $$ComponentKeywordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get componentId => $composableBuilder(
    column: $table.componentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get keywordId => $composableBuilder(
    column: $table.keywordId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ComponentKeywordsTableAnnotationComposer
    extends Composer<_$CatalogDatabase, $ComponentKeywordsTable> {
  $$ComponentKeywordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get componentId => $composableBuilder(
    column: $table.componentId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get keywordId =>
      $composableBuilder(column: $table.keywordId, builder: (column) => column);
}

class $$ComponentKeywordsTableTableManager
    extends
        RootTableManager<
          _$CatalogDatabase,
          $ComponentKeywordsTable,
          ComponentKeywordRow,
          $$ComponentKeywordsTableFilterComposer,
          $$ComponentKeywordsTableOrderingComposer,
          $$ComponentKeywordsTableAnnotationComposer,
          $$ComponentKeywordsTableCreateCompanionBuilder,
          $$ComponentKeywordsTableUpdateCompanionBuilder,
          (
            ComponentKeywordRow,
            BaseReferences<
              _$CatalogDatabase,
              $ComponentKeywordsTable,
              ComponentKeywordRow
            >,
          ),
          ComponentKeywordRow,
          PrefetchHooks Function()
        > {
  $$ComponentKeywordsTableTableManager(
    _$CatalogDatabase db,
    $ComponentKeywordsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ComponentKeywordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ComponentKeywordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ComponentKeywordsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> componentId = const Value.absent(),
                Value<int> keywordId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ComponentKeywordsCompanion(
                componentId: componentId,
                keywordId: keywordId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String componentId,
                required int keywordId,
                Value<int> rowid = const Value.absent(),
              }) => ComponentKeywordsCompanion.insert(
                componentId: componentId,
                keywordId: keywordId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ComponentKeywordsTableProcessedTableManager =
    ProcessedTableManager<
      _$CatalogDatabase,
      $ComponentKeywordsTable,
      ComponentKeywordRow,
      $$ComponentKeywordsTableFilterComposer,
      $$ComponentKeywordsTableOrderingComposer,
      $$ComponentKeywordsTableAnnotationComposer,
      $$ComponentKeywordsTableCreateCompanionBuilder,
      $$ComponentKeywordsTableUpdateCompanionBuilder,
      (
        ComponentKeywordRow,
        BaseReferences<
          _$CatalogDatabase,
          $ComponentKeywordsTable,
          ComponentKeywordRow
        >,
      ),
      ComponentKeywordRow,
      PrefetchHooks Function()
    >;
typedef $$ComponentUrlsTableCreateCompanionBuilder =
    ComponentUrlsCompanion Function({
      required String componentId,
      required int urlType,
      required String url,
      Value<int> rowid,
    });
typedef $$ComponentUrlsTableUpdateCompanionBuilder =
    ComponentUrlsCompanion Function({
      Value<String> componentId,
      Value<int> urlType,
      Value<String> url,
      Value<int> rowid,
    });

class $$ComponentUrlsTableFilterComposer
    extends Composer<_$CatalogDatabase, $ComponentUrlsTable> {
  $$ComponentUrlsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get componentId => $composableBuilder(
    column: $table.componentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get urlType => $composableBuilder(
    column: $table.urlType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ComponentUrlsTableOrderingComposer
    extends Composer<_$CatalogDatabase, $ComponentUrlsTable> {
  $$ComponentUrlsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get componentId => $composableBuilder(
    column: $table.componentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get urlType => $composableBuilder(
    column: $table.urlType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ComponentUrlsTableAnnotationComposer
    extends Composer<_$CatalogDatabase, $ComponentUrlsTable> {
  $$ComponentUrlsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get componentId => $composableBuilder(
    column: $table.componentId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get urlType =>
      $composableBuilder(column: $table.urlType, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);
}

class $$ComponentUrlsTableTableManager
    extends
        RootTableManager<
          _$CatalogDatabase,
          $ComponentUrlsTable,
          ComponentUrlRow,
          $$ComponentUrlsTableFilterComposer,
          $$ComponentUrlsTableOrderingComposer,
          $$ComponentUrlsTableAnnotationComposer,
          $$ComponentUrlsTableCreateCompanionBuilder,
          $$ComponentUrlsTableUpdateCompanionBuilder,
          (
            ComponentUrlRow,
            BaseReferences<
              _$CatalogDatabase,
              $ComponentUrlsTable,
              ComponentUrlRow
            >,
          ),
          ComponentUrlRow,
          PrefetchHooks Function()
        > {
  $$ComponentUrlsTableTableManager(
    _$CatalogDatabase db,
    $ComponentUrlsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ComponentUrlsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ComponentUrlsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ComponentUrlsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> componentId = const Value.absent(),
                Value<int> urlType = const Value.absent(),
                Value<String> url = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ComponentUrlsCompanion(
                componentId: componentId,
                urlType: urlType,
                url: url,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String componentId,
                required int urlType,
                required String url,
                Value<int> rowid = const Value.absent(),
              }) => ComponentUrlsCompanion.insert(
                componentId: componentId,
                urlType: urlType,
                url: url,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ComponentUrlsTableProcessedTableManager =
    ProcessedTableManager<
      _$CatalogDatabase,
      $ComponentUrlsTable,
      ComponentUrlRow,
      $$ComponentUrlsTableFilterComposer,
      $$ComponentUrlsTableOrderingComposer,
      $$ComponentUrlsTableAnnotationComposer,
      $$ComponentUrlsTableCreateCompanionBuilder,
      $$ComponentUrlsTableUpdateCompanionBuilder,
      (
        ComponentUrlRow,
        BaseReferences<_$CatalogDatabase, $ComponentUrlsTable, ComponentUrlRow>,
      ),
      ComponentUrlRow,
      PrefetchHooks Function()
    >;
typedef $$ComponentIconsTableCreateCompanionBuilder =
    ComponentIconsCompanion Function({
      Value<int> id,
      required String componentId,
      required int iconType,
      required String value,
      Value<int?> width,
      Value<int?> height,
      Value<int?> scale,
    });
typedef $$ComponentIconsTableUpdateCompanionBuilder =
    ComponentIconsCompanion Function({
      Value<int> id,
      Value<String> componentId,
      Value<int> iconType,
      Value<String> value,
      Value<int?> width,
      Value<int?> height,
      Value<int?> scale,
    });

class $$ComponentIconsTableFilterComposer
    extends Composer<_$CatalogDatabase, $ComponentIconsTable> {
  $$ComponentIconsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get componentId => $composableBuilder(
    column: $table.componentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get iconType => $composableBuilder(
    column: $table.iconType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get width => $composableBuilder(
    column: $table.width,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get scale => $composableBuilder(
    column: $table.scale,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ComponentIconsTableOrderingComposer
    extends Composer<_$CatalogDatabase, $ComponentIconsTable> {
  $$ComponentIconsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get componentId => $composableBuilder(
    column: $table.componentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get iconType => $composableBuilder(
    column: $table.iconType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get width => $composableBuilder(
    column: $table.width,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get scale => $composableBuilder(
    column: $table.scale,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ComponentIconsTableAnnotationComposer
    extends Composer<_$CatalogDatabase, $ComponentIconsTable> {
  $$ComponentIconsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get componentId => $composableBuilder(
    column: $table.componentId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get iconType =>
      $composableBuilder(column: $table.iconType, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<int> get width =>
      $composableBuilder(column: $table.width, builder: (column) => column);

  GeneratedColumn<int> get height =>
      $composableBuilder(column: $table.height, builder: (column) => column);

  GeneratedColumn<int> get scale =>
      $composableBuilder(column: $table.scale, builder: (column) => column);
}

class $$ComponentIconsTableTableManager
    extends
        RootTableManager<
          _$CatalogDatabase,
          $ComponentIconsTable,
          ComponentIconRow,
          $$ComponentIconsTableFilterComposer,
          $$ComponentIconsTableOrderingComposer,
          $$ComponentIconsTableAnnotationComposer,
          $$ComponentIconsTableCreateCompanionBuilder,
          $$ComponentIconsTableUpdateCompanionBuilder,
          (
            ComponentIconRow,
            BaseReferences<
              _$CatalogDatabase,
              $ComponentIconsTable,
              ComponentIconRow
            >,
          ),
          ComponentIconRow,
          PrefetchHooks Function()
        > {
  $$ComponentIconsTableTableManager(
    _$CatalogDatabase db,
    $ComponentIconsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ComponentIconsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ComponentIconsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ComponentIconsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> componentId = const Value.absent(),
                Value<int> iconType = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<int?> width = const Value.absent(),
                Value<int?> height = const Value.absent(),
                Value<int?> scale = const Value.absent(),
              }) => ComponentIconsCompanion(
                id: id,
                componentId: componentId,
                iconType: iconType,
                value: value,
                width: width,
                height: height,
                scale: scale,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String componentId,
                required int iconType,
                required String value,
                Value<int?> width = const Value.absent(),
                Value<int?> height = const Value.absent(),
                Value<int?> scale = const Value.absent(),
              }) => ComponentIconsCompanion.insert(
                id: id,
                componentId: componentId,
                iconType: iconType,
                value: value,
                width: width,
                height: height,
                scale: scale,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ComponentIconsTableProcessedTableManager =
    ProcessedTableManager<
      _$CatalogDatabase,
      $ComponentIconsTable,
      ComponentIconRow,
      $$ComponentIconsTableFilterComposer,
      $$ComponentIconsTableOrderingComposer,
      $$ComponentIconsTableAnnotationComposer,
      $$ComponentIconsTableCreateCompanionBuilder,
      $$ComponentIconsTableUpdateCompanionBuilder,
      (
        ComponentIconRow,
        BaseReferences<
          _$CatalogDatabase,
          $ComponentIconsTable,
          ComponentIconRow
        >,
      ),
      ComponentIconRow,
      PrefetchHooks Function()
    >;
typedef $$ReleasesTableCreateCompanionBuilder =
    ReleasesCompanion Function({
      Value<int> id,
      required String componentId,
      Value<int?> releaseType,
      Value<String?> version,
      Value<String?> date,
      Value<String?> timestamp,
      Value<String?> dateEol,
      Value<int?> urgency,
      Value<String?> description,
      Value<String?> url,
    });
typedef $$ReleasesTableUpdateCompanionBuilder =
    ReleasesCompanion Function({
      Value<int> id,
      Value<String> componentId,
      Value<int?> releaseType,
      Value<String?> version,
      Value<String?> date,
      Value<String?> timestamp,
      Value<String?> dateEol,
      Value<int?> urgency,
      Value<String?> description,
      Value<String?> url,
    });

class $$ReleasesTableFilterComposer
    extends Composer<_$CatalogDatabase, $ReleasesTable> {
  $$ReleasesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get componentId => $composableBuilder(
    column: $table.componentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get releaseType => $composableBuilder(
    column: $table.releaseType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dateEol => $composableBuilder(
    column: $table.dateEol,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get urgency => $composableBuilder(
    column: $table.urgency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ReleasesTableOrderingComposer
    extends Composer<_$CatalogDatabase, $ReleasesTable> {
  $$ReleasesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get componentId => $composableBuilder(
    column: $table.componentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get releaseType => $composableBuilder(
    column: $table.releaseType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dateEol => $composableBuilder(
    column: $table.dateEol,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get urgency => $composableBuilder(
    column: $table.urgency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ReleasesTableAnnotationComposer
    extends Composer<_$CatalogDatabase, $ReleasesTable> {
  $$ReleasesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get componentId => $composableBuilder(
    column: $table.componentId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get releaseType => $composableBuilder(
    column: $table.releaseType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<String> get dateEol =>
      $composableBuilder(column: $table.dateEol, builder: (column) => column);

  GeneratedColumn<int> get urgency =>
      $composableBuilder(column: $table.urgency, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);
}

class $$ReleasesTableTableManager
    extends
        RootTableManager<
          _$CatalogDatabase,
          $ReleasesTable,
          ReleaseRow,
          $$ReleasesTableFilterComposer,
          $$ReleasesTableOrderingComposer,
          $$ReleasesTableAnnotationComposer,
          $$ReleasesTableCreateCompanionBuilder,
          $$ReleasesTableUpdateCompanionBuilder,
          (
            ReleaseRow,
            BaseReferences<_$CatalogDatabase, $ReleasesTable, ReleaseRow>,
          ),
          ReleaseRow,
          PrefetchHooks Function()
        > {
  $$ReleasesTableTableManager(_$CatalogDatabase db, $ReleasesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReleasesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReleasesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReleasesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> componentId = const Value.absent(),
                Value<int?> releaseType = const Value.absent(),
                Value<String?> version = const Value.absent(),
                Value<String?> date = const Value.absent(),
                Value<String?> timestamp = const Value.absent(),
                Value<String?> dateEol = const Value.absent(),
                Value<int?> urgency = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> url = const Value.absent(),
              }) => ReleasesCompanion(
                id: id,
                componentId: componentId,
                releaseType: releaseType,
                version: version,
                date: date,
                timestamp: timestamp,
                dateEol: dateEol,
                urgency: urgency,
                description: description,
                url: url,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String componentId,
                Value<int?> releaseType = const Value.absent(),
                Value<String?> version = const Value.absent(),
                Value<String?> date = const Value.absent(),
                Value<String?> timestamp = const Value.absent(),
                Value<String?> dateEol = const Value.absent(),
                Value<int?> urgency = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> url = const Value.absent(),
              }) => ReleasesCompanion.insert(
                id: id,
                componentId: componentId,
                releaseType: releaseType,
                version: version,
                date: date,
                timestamp: timestamp,
                dateEol: dateEol,
                urgency: urgency,
                description: description,
                url: url,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ReleasesTableProcessedTableManager =
    ProcessedTableManager<
      _$CatalogDatabase,
      $ReleasesTable,
      ReleaseRow,
      $$ReleasesTableFilterComposer,
      $$ReleasesTableOrderingComposer,
      $$ReleasesTableAnnotationComposer,
      $$ReleasesTableCreateCompanionBuilder,
      $$ReleasesTableUpdateCompanionBuilder,
      (
        ReleaseRow,
        BaseReferences<_$CatalogDatabase, $ReleasesTable, ReleaseRow>,
      ),
      ReleaseRow,
      PrefetchHooks Function()
    >;
typedef $$ReleaseIssuesTableCreateCompanionBuilder =
    ReleaseIssuesCompanion Function({
      Value<int> id,
      required int releaseId,
      Value<int?> issueType,
      Value<String?> url,
      Value<String?> value,
    });
typedef $$ReleaseIssuesTableUpdateCompanionBuilder =
    ReleaseIssuesCompanion Function({
      Value<int> id,
      Value<int> releaseId,
      Value<int?> issueType,
      Value<String?> url,
      Value<String?> value,
    });

class $$ReleaseIssuesTableFilterComposer
    extends Composer<_$CatalogDatabase, $ReleaseIssuesTable> {
  $$ReleaseIssuesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get releaseId => $composableBuilder(
    column: $table.releaseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get issueType => $composableBuilder(
    column: $table.issueType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ReleaseIssuesTableOrderingComposer
    extends Composer<_$CatalogDatabase, $ReleaseIssuesTable> {
  $$ReleaseIssuesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get releaseId => $composableBuilder(
    column: $table.releaseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get issueType => $composableBuilder(
    column: $table.issueType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ReleaseIssuesTableAnnotationComposer
    extends Composer<_$CatalogDatabase, $ReleaseIssuesTable> {
  $$ReleaseIssuesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get releaseId =>
      $composableBuilder(column: $table.releaseId, builder: (column) => column);

  GeneratedColumn<int> get issueType =>
      $composableBuilder(column: $table.issueType, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$ReleaseIssuesTableTableManager
    extends
        RootTableManager<
          _$CatalogDatabase,
          $ReleaseIssuesTable,
          ReleaseIssueRow,
          $$ReleaseIssuesTableFilterComposer,
          $$ReleaseIssuesTableOrderingComposer,
          $$ReleaseIssuesTableAnnotationComposer,
          $$ReleaseIssuesTableCreateCompanionBuilder,
          $$ReleaseIssuesTableUpdateCompanionBuilder,
          (
            ReleaseIssueRow,
            BaseReferences<
              _$CatalogDatabase,
              $ReleaseIssuesTable,
              ReleaseIssueRow
            >,
          ),
          ReleaseIssueRow,
          PrefetchHooks Function()
        > {
  $$ReleaseIssuesTableTableManager(
    _$CatalogDatabase db,
    $ReleaseIssuesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReleaseIssuesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReleaseIssuesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReleaseIssuesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> releaseId = const Value.absent(),
                Value<int?> issueType = const Value.absent(),
                Value<String?> url = const Value.absent(),
                Value<String?> value = const Value.absent(),
              }) => ReleaseIssuesCompanion(
                id: id,
                releaseId: releaseId,
                issueType: issueType,
                url: url,
                value: value,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int releaseId,
                Value<int?> issueType = const Value.absent(),
                Value<String?> url = const Value.absent(),
                Value<String?> value = const Value.absent(),
              }) => ReleaseIssuesCompanion.insert(
                id: id,
                releaseId: releaseId,
                issueType: issueType,
                url: url,
                value: value,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ReleaseIssuesTableProcessedTableManager =
    ProcessedTableManager<
      _$CatalogDatabase,
      $ReleaseIssuesTable,
      ReleaseIssueRow,
      $$ReleaseIssuesTableFilterComposer,
      $$ReleaseIssuesTableOrderingComposer,
      $$ReleaseIssuesTableAnnotationComposer,
      $$ReleaseIssuesTableCreateCompanionBuilder,
      $$ReleaseIssuesTableUpdateCompanionBuilder,
      (
        ReleaseIssueRow,
        BaseReferences<_$CatalogDatabase, $ReleaseIssuesTable, ReleaseIssueRow>,
      ),
      ReleaseIssueRow,
      PrefetchHooks Function()
    >;
typedef $$ScreenshotsTableCreateCompanionBuilder =
    ScreenshotsCompanion Function({
      Value<int> id,
      required String componentId,
      Value<bool> isDefault,
      Value<String?> caption,
    });
typedef $$ScreenshotsTableUpdateCompanionBuilder =
    ScreenshotsCompanion Function({
      Value<int> id,
      Value<String> componentId,
      Value<bool> isDefault,
      Value<String?> caption,
    });

class $$ScreenshotsTableFilterComposer
    extends Composer<_$CatalogDatabase, $ScreenshotsTable> {
  $$ScreenshotsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get componentId => $composableBuilder(
    column: $table.componentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDefault => $composableBuilder(
    column: $table.isDefault,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get caption => $composableBuilder(
    column: $table.caption,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ScreenshotsTableOrderingComposer
    extends Composer<_$CatalogDatabase, $ScreenshotsTable> {
  $$ScreenshotsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get componentId => $composableBuilder(
    column: $table.componentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDefault => $composableBuilder(
    column: $table.isDefault,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get caption => $composableBuilder(
    column: $table.caption,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ScreenshotsTableAnnotationComposer
    extends Composer<_$CatalogDatabase, $ScreenshotsTable> {
  $$ScreenshotsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get componentId => $composableBuilder(
    column: $table.componentId,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isDefault =>
      $composableBuilder(column: $table.isDefault, builder: (column) => column);

  GeneratedColumn<String> get caption =>
      $composableBuilder(column: $table.caption, builder: (column) => column);
}

class $$ScreenshotsTableTableManager
    extends
        RootTableManager<
          _$CatalogDatabase,
          $ScreenshotsTable,
          ScreenshotRow,
          $$ScreenshotsTableFilterComposer,
          $$ScreenshotsTableOrderingComposer,
          $$ScreenshotsTableAnnotationComposer,
          $$ScreenshotsTableCreateCompanionBuilder,
          $$ScreenshotsTableUpdateCompanionBuilder,
          (
            ScreenshotRow,
            BaseReferences<_$CatalogDatabase, $ScreenshotsTable, ScreenshotRow>,
          ),
          ScreenshotRow,
          PrefetchHooks Function()
        > {
  $$ScreenshotsTableTableManager(_$CatalogDatabase db, $ScreenshotsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ScreenshotsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ScreenshotsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ScreenshotsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> componentId = const Value.absent(),
                Value<bool> isDefault = const Value.absent(),
                Value<String?> caption = const Value.absent(),
              }) => ScreenshotsCompanion(
                id: id,
                componentId: componentId,
                isDefault: isDefault,
                caption: caption,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String componentId,
                Value<bool> isDefault = const Value.absent(),
                Value<String?> caption = const Value.absent(),
              }) => ScreenshotsCompanion.insert(
                id: id,
                componentId: componentId,
                isDefault: isDefault,
                caption: caption,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ScreenshotsTableProcessedTableManager =
    ProcessedTableManager<
      _$CatalogDatabase,
      $ScreenshotsTable,
      ScreenshotRow,
      $$ScreenshotsTableFilterComposer,
      $$ScreenshotsTableOrderingComposer,
      $$ScreenshotsTableAnnotationComposer,
      $$ScreenshotsTableCreateCompanionBuilder,
      $$ScreenshotsTableUpdateCompanionBuilder,
      (
        ScreenshotRow,
        BaseReferences<_$CatalogDatabase, $ScreenshotsTable, ScreenshotRow>,
      ),
      ScreenshotRow,
      PrefetchHooks Function()
    >;
typedef $$ScreenshotImagesTableCreateCompanionBuilder =
    ScreenshotImagesCompanion Function({
      Value<int> id,
      required int screenshotId,
      required String url,
      Value<String?> type,
      Value<int?> width,
      Value<int?> height,
    });
typedef $$ScreenshotImagesTableUpdateCompanionBuilder =
    ScreenshotImagesCompanion Function({
      Value<int> id,
      Value<int> screenshotId,
      Value<String> url,
      Value<String?> type,
      Value<int?> width,
      Value<int?> height,
    });

class $$ScreenshotImagesTableFilterComposer
    extends Composer<_$CatalogDatabase, $ScreenshotImagesTable> {
  $$ScreenshotImagesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get screenshotId => $composableBuilder(
    column: $table.screenshotId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get width => $composableBuilder(
    column: $table.width,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ScreenshotImagesTableOrderingComposer
    extends Composer<_$CatalogDatabase, $ScreenshotImagesTable> {
  $$ScreenshotImagesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get screenshotId => $composableBuilder(
    column: $table.screenshotId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get width => $composableBuilder(
    column: $table.width,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ScreenshotImagesTableAnnotationComposer
    extends Composer<_$CatalogDatabase, $ScreenshotImagesTable> {
  $$ScreenshotImagesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get screenshotId => $composableBuilder(
    column: $table.screenshotId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<int> get width =>
      $composableBuilder(column: $table.width, builder: (column) => column);

  GeneratedColumn<int> get height =>
      $composableBuilder(column: $table.height, builder: (column) => column);
}

class $$ScreenshotImagesTableTableManager
    extends
        RootTableManager<
          _$CatalogDatabase,
          $ScreenshotImagesTable,
          ScreenshotImageRow,
          $$ScreenshotImagesTableFilterComposer,
          $$ScreenshotImagesTableOrderingComposer,
          $$ScreenshotImagesTableAnnotationComposer,
          $$ScreenshotImagesTableCreateCompanionBuilder,
          $$ScreenshotImagesTableUpdateCompanionBuilder,
          (
            ScreenshotImageRow,
            BaseReferences<
              _$CatalogDatabase,
              $ScreenshotImagesTable,
              ScreenshotImageRow
            >,
          ),
          ScreenshotImageRow,
          PrefetchHooks Function()
        > {
  $$ScreenshotImagesTableTableManager(
    _$CatalogDatabase db,
    $ScreenshotImagesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ScreenshotImagesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ScreenshotImagesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ScreenshotImagesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> screenshotId = const Value.absent(),
                Value<String> url = const Value.absent(),
                Value<String?> type = const Value.absent(),
                Value<int?> width = const Value.absent(),
                Value<int?> height = const Value.absent(),
              }) => ScreenshotImagesCompanion(
                id: id,
                screenshotId: screenshotId,
                url: url,
                type: type,
                width: width,
                height: height,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int screenshotId,
                required String url,
                Value<String?> type = const Value.absent(),
                Value<int?> width = const Value.absent(),
                Value<int?> height = const Value.absent(),
              }) => ScreenshotImagesCompanion.insert(
                id: id,
                screenshotId: screenshotId,
                url: url,
                type: type,
                width: width,
                height: height,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ScreenshotImagesTableProcessedTableManager =
    ProcessedTableManager<
      _$CatalogDatabase,
      $ScreenshotImagesTable,
      ScreenshotImageRow,
      $$ScreenshotImagesTableFilterComposer,
      $$ScreenshotImagesTableOrderingComposer,
      $$ScreenshotImagesTableAnnotationComposer,
      $$ScreenshotImagesTableCreateCompanionBuilder,
      $$ScreenshotImagesTableUpdateCompanionBuilder,
      (
        ScreenshotImageRow,
        BaseReferences<
          _$CatalogDatabase,
          $ScreenshotImagesTable,
          ScreenshotImageRow
        >,
      ),
      ScreenshotImageRow,
      PrefetchHooks Function()
    >;
typedef $$ScreenshotVideosTableCreateCompanionBuilder =
    ScreenshotVideosCompanion Function({
      Value<int> id,
      required int screenshotId,
      required String url,
      Value<String?> codec,
      Value<String?> container,
      Value<int?> width,
      Value<int?> height,
    });
typedef $$ScreenshotVideosTableUpdateCompanionBuilder =
    ScreenshotVideosCompanion Function({
      Value<int> id,
      Value<int> screenshotId,
      Value<String> url,
      Value<String?> codec,
      Value<String?> container,
      Value<int?> width,
      Value<int?> height,
    });

class $$ScreenshotVideosTableFilterComposer
    extends Composer<_$CatalogDatabase, $ScreenshotVideosTable> {
  $$ScreenshotVideosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get screenshotId => $composableBuilder(
    column: $table.screenshotId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get codec => $composableBuilder(
    column: $table.codec,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get container => $composableBuilder(
    column: $table.container,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get width => $composableBuilder(
    column: $table.width,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ScreenshotVideosTableOrderingComposer
    extends Composer<_$CatalogDatabase, $ScreenshotVideosTable> {
  $$ScreenshotVideosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get screenshotId => $composableBuilder(
    column: $table.screenshotId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get codec => $composableBuilder(
    column: $table.codec,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get container => $composableBuilder(
    column: $table.container,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get width => $composableBuilder(
    column: $table.width,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ScreenshotVideosTableAnnotationComposer
    extends Composer<_$CatalogDatabase, $ScreenshotVideosTable> {
  $$ScreenshotVideosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get screenshotId => $composableBuilder(
    column: $table.screenshotId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get codec =>
      $composableBuilder(column: $table.codec, builder: (column) => column);

  GeneratedColumn<String> get container =>
      $composableBuilder(column: $table.container, builder: (column) => column);

  GeneratedColumn<int> get width =>
      $composableBuilder(column: $table.width, builder: (column) => column);

  GeneratedColumn<int> get height =>
      $composableBuilder(column: $table.height, builder: (column) => column);
}

class $$ScreenshotVideosTableTableManager
    extends
        RootTableManager<
          _$CatalogDatabase,
          $ScreenshotVideosTable,
          ScreenshotVideoRow,
          $$ScreenshotVideosTableFilterComposer,
          $$ScreenshotVideosTableOrderingComposer,
          $$ScreenshotVideosTableAnnotationComposer,
          $$ScreenshotVideosTableCreateCompanionBuilder,
          $$ScreenshotVideosTableUpdateCompanionBuilder,
          (
            ScreenshotVideoRow,
            BaseReferences<
              _$CatalogDatabase,
              $ScreenshotVideosTable,
              ScreenshotVideoRow
            >,
          ),
          ScreenshotVideoRow,
          PrefetchHooks Function()
        > {
  $$ScreenshotVideosTableTableManager(
    _$CatalogDatabase db,
    $ScreenshotVideosTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ScreenshotVideosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ScreenshotVideosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ScreenshotVideosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> screenshotId = const Value.absent(),
                Value<String> url = const Value.absent(),
                Value<String?> codec = const Value.absent(),
                Value<String?> container = const Value.absent(),
                Value<int?> width = const Value.absent(),
                Value<int?> height = const Value.absent(),
              }) => ScreenshotVideosCompanion(
                id: id,
                screenshotId: screenshotId,
                url: url,
                codec: codec,
                container: container,
                width: width,
                height: height,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int screenshotId,
                required String url,
                Value<String?> codec = const Value.absent(),
                Value<String?> container = const Value.absent(),
                Value<int?> width = const Value.absent(),
                Value<int?> height = const Value.absent(),
              }) => ScreenshotVideosCompanion.insert(
                id: id,
                screenshotId: screenshotId,
                url: url,
                codec: codec,
                container: container,
                width: width,
                height: height,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ScreenshotVideosTableProcessedTableManager =
    ProcessedTableManager<
      _$CatalogDatabase,
      $ScreenshotVideosTable,
      ScreenshotVideoRow,
      $$ScreenshotVideosTableFilterComposer,
      $$ScreenshotVideosTableOrderingComposer,
      $$ScreenshotVideosTableAnnotationComposer,
      $$ScreenshotVideosTableCreateCompanionBuilder,
      $$ScreenshotVideosTableUpdateCompanionBuilder,
      (
        ScreenshotVideoRow,
        BaseReferences<
          _$CatalogDatabase,
          $ScreenshotVideosTable,
          ScreenshotVideoRow
        >,
      ),
      ScreenshotVideoRow,
      PrefetchHooks Function()
    >;
typedef $$ContentRatingAttrsTableCreateCompanionBuilder =
    ContentRatingAttrsCompanion Function({
      required String componentId,
      required String attrId,
      required String value,
      Value<int> rowid,
    });
typedef $$ContentRatingAttrsTableUpdateCompanionBuilder =
    ContentRatingAttrsCompanion Function({
      Value<String> componentId,
      Value<String> attrId,
      Value<String> value,
      Value<int> rowid,
    });

class $$ContentRatingAttrsTableFilterComposer
    extends Composer<_$CatalogDatabase, $ContentRatingAttrsTable> {
  $$ContentRatingAttrsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get componentId => $composableBuilder(
    column: $table.componentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get attrId => $composableBuilder(
    column: $table.attrId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ContentRatingAttrsTableOrderingComposer
    extends Composer<_$CatalogDatabase, $ContentRatingAttrsTable> {
  $$ContentRatingAttrsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get componentId => $composableBuilder(
    column: $table.componentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get attrId => $composableBuilder(
    column: $table.attrId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ContentRatingAttrsTableAnnotationComposer
    extends Composer<_$CatalogDatabase, $ContentRatingAttrsTable> {
  $$ContentRatingAttrsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get componentId => $composableBuilder(
    column: $table.componentId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get attrId =>
      $composableBuilder(column: $table.attrId, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$ContentRatingAttrsTableTableManager
    extends
        RootTableManager<
          _$CatalogDatabase,
          $ContentRatingAttrsTable,
          ContentRatingAttrRow,
          $$ContentRatingAttrsTableFilterComposer,
          $$ContentRatingAttrsTableOrderingComposer,
          $$ContentRatingAttrsTableAnnotationComposer,
          $$ContentRatingAttrsTableCreateCompanionBuilder,
          $$ContentRatingAttrsTableUpdateCompanionBuilder,
          (
            ContentRatingAttrRow,
            BaseReferences<
              _$CatalogDatabase,
              $ContentRatingAttrsTable,
              ContentRatingAttrRow
            >,
          ),
          ContentRatingAttrRow,
          PrefetchHooks Function()
        > {
  $$ContentRatingAttrsTableTableManager(
    _$CatalogDatabase db,
    $ContentRatingAttrsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ContentRatingAttrsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ContentRatingAttrsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ContentRatingAttrsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> componentId = const Value.absent(),
                Value<String> attrId = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ContentRatingAttrsCompanion(
                componentId: componentId,
                attrId: attrId,
                value: value,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String componentId,
                required String attrId,
                required String value,
                Value<int> rowid = const Value.absent(),
              }) => ContentRatingAttrsCompanion.insert(
                componentId: componentId,
                attrId: attrId,
                value: value,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ContentRatingAttrsTableProcessedTableManager =
    ProcessedTableManager<
      _$CatalogDatabase,
      $ContentRatingAttrsTable,
      ContentRatingAttrRow,
      $$ContentRatingAttrsTableFilterComposer,
      $$ContentRatingAttrsTableOrderingComposer,
      $$ContentRatingAttrsTableAnnotationComposer,
      $$ContentRatingAttrsTableCreateCompanionBuilder,
      $$ContentRatingAttrsTableUpdateCompanionBuilder,
      (
        ContentRatingAttrRow,
        BaseReferences<
          _$CatalogDatabase,
          $ContentRatingAttrsTable,
          ContentRatingAttrRow
        >,
      ),
      ContentRatingAttrRow,
      PrefetchHooks Function()
    >;
typedef $$ComponentLanguagesTableCreateCompanionBuilder =
    ComponentLanguagesCompanion Function({
      required String componentId,
      required String language,
      Value<int> rowid,
    });
typedef $$ComponentLanguagesTableUpdateCompanionBuilder =
    ComponentLanguagesCompanion Function({
      Value<String> componentId,
      Value<String> language,
      Value<int> rowid,
    });

class $$ComponentLanguagesTableFilterComposer
    extends Composer<_$CatalogDatabase, $ComponentLanguagesTable> {
  $$ComponentLanguagesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get componentId => $composableBuilder(
    column: $table.componentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ComponentLanguagesTableOrderingComposer
    extends Composer<_$CatalogDatabase, $ComponentLanguagesTable> {
  $$ComponentLanguagesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get componentId => $composableBuilder(
    column: $table.componentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ComponentLanguagesTableAnnotationComposer
    extends Composer<_$CatalogDatabase, $ComponentLanguagesTable> {
  $$ComponentLanguagesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get componentId => $composableBuilder(
    column: $table.componentId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get language =>
      $composableBuilder(column: $table.language, builder: (column) => column);
}

class $$ComponentLanguagesTableTableManager
    extends
        RootTableManager<
          _$CatalogDatabase,
          $ComponentLanguagesTable,
          ComponentLanguageRow,
          $$ComponentLanguagesTableFilterComposer,
          $$ComponentLanguagesTableOrderingComposer,
          $$ComponentLanguagesTableAnnotationComposer,
          $$ComponentLanguagesTableCreateCompanionBuilder,
          $$ComponentLanguagesTableUpdateCompanionBuilder,
          (
            ComponentLanguageRow,
            BaseReferences<
              _$CatalogDatabase,
              $ComponentLanguagesTable,
              ComponentLanguageRow
            >,
          ),
          ComponentLanguageRow,
          PrefetchHooks Function()
        > {
  $$ComponentLanguagesTableTableManager(
    _$CatalogDatabase db,
    $ComponentLanguagesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ComponentLanguagesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ComponentLanguagesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ComponentLanguagesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> componentId = const Value.absent(),
                Value<String> language = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ComponentLanguagesCompanion(
                componentId: componentId,
                language: language,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String componentId,
                required String language,
                Value<int> rowid = const Value.absent(),
              }) => ComponentLanguagesCompanion.insert(
                componentId: componentId,
                language: language,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ComponentLanguagesTableProcessedTableManager =
    ProcessedTableManager<
      _$CatalogDatabase,
      $ComponentLanguagesTable,
      ComponentLanguageRow,
      $$ComponentLanguagesTableFilterComposer,
      $$ComponentLanguagesTableOrderingComposer,
      $$ComponentLanguagesTableAnnotationComposer,
      $$ComponentLanguagesTableCreateCompanionBuilder,
      $$ComponentLanguagesTableUpdateCompanionBuilder,
      (
        ComponentLanguageRow,
        BaseReferences<
          _$CatalogDatabase,
          $ComponentLanguagesTable,
          ComponentLanguageRow
        >,
      ),
      ComponentLanguageRow,
      PrefetchHooks Function()
    >;
typedef $$BrandingColorsTableCreateCompanionBuilder =
    BrandingColorsCompanion Function({
      required String componentId,
      required String schemePreference,
      required String color,
      Value<int> rowid,
    });
typedef $$BrandingColorsTableUpdateCompanionBuilder =
    BrandingColorsCompanion Function({
      Value<String> componentId,
      Value<String> schemePreference,
      Value<String> color,
      Value<int> rowid,
    });

class $$BrandingColorsTableFilterComposer
    extends Composer<_$CatalogDatabase, $BrandingColorsTable> {
  $$BrandingColorsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get componentId => $composableBuilder(
    column: $table.componentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get schemePreference => $composableBuilder(
    column: $table.schemePreference,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BrandingColorsTableOrderingComposer
    extends Composer<_$CatalogDatabase, $BrandingColorsTable> {
  $$BrandingColorsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get componentId => $composableBuilder(
    column: $table.componentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get schemePreference => $composableBuilder(
    column: $table.schemePreference,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BrandingColorsTableAnnotationComposer
    extends Composer<_$CatalogDatabase, $BrandingColorsTable> {
  $$BrandingColorsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get componentId => $composableBuilder(
    column: $table.componentId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get schemePreference => $composableBuilder(
    column: $table.schemePreference,
    builder: (column) => column,
  );

  GeneratedColumn<String> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);
}

class $$BrandingColorsTableTableManager
    extends
        RootTableManager<
          _$CatalogDatabase,
          $BrandingColorsTable,
          BrandingColorRow,
          $$BrandingColorsTableFilterComposer,
          $$BrandingColorsTableOrderingComposer,
          $$BrandingColorsTableAnnotationComposer,
          $$BrandingColorsTableCreateCompanionBuilder,
          $$BrandingColorsTableUpdateCompanionBuilder,
          (
            BrandingColorRow,
            BaseReferences<
              _$CatalogDatabase,
              $BrandingColorsTable,
              BrandingColorRow
            >,
          ),
          BrandingColorRow,
          PrefetchHooks Function()
        > {
  $$BrandingColorsTableTableManager(
    _$CatalogDatabase db,
    $BrandingColorsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BrandingColorsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BrandingColorsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BrandingColorsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> componentId = const Value.absent(),
                Value<String> schemePreference = const Value.absent(),
                Value<String> color = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BrandingColorsCompanion(
                componentId: componentId,
                schemePreference: schemePreference,
                color: color,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String componentId,
                required String schemePreference,
                required String color,
                Value<int> rowid = const Value.absent(),
              }) => BrandingColorsCompanion.insert(
                componentId: componentId,
                schemePreference: schemePreference,
                color: color,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BrandingColorsTableProcessedTableManager =
    ProcessedTableManager<
      _$CatalogDatabase,
      $BrandingColorsTable,
      BrandingColorRow,
      $$BrandingColorsTableFilterComposer,
      $$BrandingColorsTableOrderingComposer,
      $$BrandingColorsTableAnnotationComposer,
      $$BrandingColorsTableCreateCompanionBuilder,
      $$BrandingColorsTableUpdateCompanionBuilder,
      (
        BrandingColorRow,
        BaseReferences<
          _$CatalogDatabase,
          $BrandingColorsTable,
          BrandingColorRow
        >,
      ),
      BrandingColorRow,
      PrefetchHooks Function()
    >;
typedef $$ComponentExtendsTableCreateCompanionBuilder =
    ComponentExtendsCompanion Function({
      required String componentId,
      required String extendsId,
      Value<int> rowid,
    });
typedef $$ComponentExtendsTableUpdateCompanionBuilder =
    ComponentExtendsCompanion Function({
      Value<String> componentId,
      Value<String> extendsId,
      Value<int> rowid,
    });

class $$ComponentExtendsTableFilterComposer
    extends Composer<_$CatalogDatabase, $ComponentExtendsTable> {
  $$ComponentExtendsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get componentId => $composableBuilder(
    column: $table.componentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get extendsId => $composableBuilder(
    column: $table.extendsId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ComponentExtendsTableOrderingComposer
    extends Composer<_$CatalogDatabase, $ComponentExtendsTable> {
  $$ComponentExtendsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get componentId => $composableBuilder(
    column: $table.componentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get extendsId => $composableBuilder(
    column: $table.extendsId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ComponentExtendsTableAnnotationComposer
    extends Composer<_$CatalogDatabase, $ComponentExtendsTable> {
  $$ComponentExtendsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get componentId => $composableBuilder(
    column: $table.componentId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get extendsId =>
      $composableBuilder(column: $table.extendsId, builder: (column) => column);
}

class $$ComponentExtendsTableTableManager
    extends
        RootTableManager<
          _$CatalogDatabase,
          $ComponentExtendsTable,
          ComponentExtendRow,
          $$ComponentExtendsTableFilterComposer,
          $$ComponentExtendsTableOrderingComposer,
          $$ComponentExtendsTableAnnotationComposer,
          $$ComponentExtendsTableCreateCompanionBuilder,
          $$ComponentExtendsTableUpdateCompanionBuilder,
          (
            ComponentExtendRow,
            BaseReferences<
              _$CatalogDatabase,
              $ComponentExtendsTable,
              ComponentExtendRow
            >,
          ),
          ComponentExtendRow,
          PrefetchHooks Function()
        > {
  $$ComponentExtendsTableTableManager(
    _$CatalogDatabase db,
    $ComponentExtendsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ComponentExtendsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ComponentExtendsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ComponentExtendsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> componentId = const Value.absent(),
                Value<String> extendsId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ComponentExtendsCompanion(
                componentId: componentId,
                extendsId: extendsId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String componentId,
                required String extendsId,
                Value<int> rowid = const Value.absent(),
              }) => ComponentExtendsCompanion.insert(
                componentId: componentId,
                extendsId: extendsId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ComponentExtendsTableProcessedTableManager =
    ProcessedTableManager<
      _$CatalogDatabase,
      $ComponentExtendsTable,
      ComponentExtendRow,
      $$ComponentExtendsTableFilterComposer,
      $$ComponentExtendsTableOrderingComposer,
      $$ComponentExtendsTableAnnotationComposer,
      $$ComponentExtendsTableCreateCompanionBuilder,
      $$ComponentExtendsTableUpdateCompanionBuilder,
      (
        ComponentExtendRow,
        BaseReferences<
          _$CatalogDatabase,
          $ComponentExtendsTable,
          ComponentExtendRow
        >,
      ),
      ComponentExtendRow,
      PrefetchHooks Function()
    >;
typedef $$ComponentSuggestsTableCreateCompanionBuilder =
    ComponentSuggestsCompanion Function({
      required String componentId,
      required String suggestedId,
      Value<int> rowid,
    });
typedef $$ComponentSuggestsTableUpdateCompanionBuilder =
    ComponentSuggestsCompanion Function({
      Value<String> componentId,
      Value<String> suggestedId,
      Value<int> rowid,
    });

class $$ComponentSuggestsTableFilterComposer
    extends Composer<_$CatalogDatabase, $ComponentSuggestsTable> {
  $$ComponentSuggestsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get componentId => $composableBuilder(
    column: $table.componentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get suggestedId => $composableBuilder(
    column: $table.suggestedId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ComponentSuggestsTableOrderingComposer
    extends Composer<_$CatalogDatabase, $ComponentSuggestsTable> {
  $$ComponentSuggestsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get componentId => $composableBuilder(
    column: $table.componentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get suggestedId => $composableBuilder(
    column: $table.suggestedId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ComponentSuggestsTableAnnotationComposer
    extends Composer<_$CatalogDatabase, $ComponentSuggestsTable> {
  $$ComponentSuggestsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get componentId => $composableBuilder(
    column: $table.componentId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get suggestedId => $composableBuilder(
    column: $table.suggestedId,
    builder: (column) => column,
  );
}

class $$ComponentSuggestsTableTableManager
    extends
        RootTableManager<
          _$CatalogDatabase,
          $ComponentSuggestsTable,
          ComponentSuggestRow,
          $$ComponentSuggestsTableFilterComposer,
          $$ComponentSuggestsTableOrderingComposer,
          $$ComponentSuggestsTableAnnotationComposer,
          $$ComponentSuggestsTableCreateCompanionBuilder,
          $$ComponentSuggestsTableUpdateCompanionBuilder,
          (
            ComponentSuggestRow,
            BaseReferences<
              _$CatalogDatabase,
              $ComponentSuggestsTable,
              ComponentSuggestRow
            >,
          ),
          ComponentSuggestRow,
          PrefetchHooks Function()
        > {
  $$ComponentSuggestsTableTableManager(
    _$CatalogDatabase db,
    $ComponentSuggestsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ComponentSuggestsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ComponentSuggestsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ComponentSuggestsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> componentId = const Value.absent(),
                Value<String> suggestedId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ComponentSuggestsCompanion(
                componentId: componentId,
                suggestedId: suggestedId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String componentId,
                required String suggestedId,
                Value<int> rowid = const Value.absent(),
              }) => ComponentSuggestsCompanion.insert(
                componentId: componentId,
                suggestedId: suggestedId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ComponentSuggestsTableProcessedTableManager =
    ProcessedTableManager<
      _$CatalogDatabase,
      $ComponentSuggestsTable,
      ComponentSuggestRow,
      $$ComponentSuggestsTableFilterComposer,
      $$ComponentSuggestsTableOrderingComposer,
      $$ComponentSuggestsTableAnnotationComposer,
      $$ComponentSuggestsTableCreateCompanionBuilder,
      $$ComponentSuggestsTableUpdateCompanionBuilder,
      (
        ComponentSuggestRow,
        BaseReferences<
          _$CatalogDatabase,
          $ComponentSuggestsTable,
          ComponentSuggestRow
        >,
      ),
      ComponentSuggestRow,
      PrefetchHooks Function()
    >;
typedef $$ComponentRelationsTableCreateCompanionBuilder =
    ComponentRelationsCompanion Function({
      Value<int> id,
      required String componentId,
      required String relationKind,
      required String relationType,
      Value<String?> value,
      Value<String?> compare,
      Value<String?> version,
    });
typedef $$ComponentRelationsTableUpdateCompanionBuilder =
    ComponentRelationsCompanion Function({
      Value<int> id,
      Value<String> componentId,
      Value<String> relationKind,
      Value<String> relationType,
      Value<String?> value,
      Value<String?> compare,
      Value<String?> version,
    });

class $$ComponentRelationsTableFilterComposer
    extends Composer<_$CatalogDatabase, $ComponentRelationsTable> {
  $$ComponentRelationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get componentId => $composableBuilder(
    column: $table.componentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get relationKind => $composableBuilder(
    column: $table.relationKind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get relationType => $composableBuilder(
    column: $table.relationType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get compare => $composableBuilder(
    column: $table.compare,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ComponentRelationsTableOrderingComposer
    extends Composer<_$CatalogDatabase, $ComponentRelationsTable> {
  $$ComponentRelationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get componentId => $composableBuilder(
    column: $table.componentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get relationKind => $composableBuilder(
    column: $table.relationKind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get relationType => $composableBuilder(
    column: $table.relationType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get compare => $composableBuilder(
    column: $table.compare,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ComponentRelationsTableAnnotationComposer
    extends Composer<_$CatalogDatabase, $ComponentRelationsTable> {
  $$ComponentRelationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get componentId => $composableBuilder(
    column: $table.componentId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get relationKind => $composableBuilder(
    column: $table.relationKind,
    builder: (column) => column,
  );

  GeneratedColumn<String> get relationType => $composableBuilder(
    column: $table.relationType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<String> get compare =>
      $composableBuilder(column: $table.compare, builder: (column) => column);

  GeneratedColumn<String> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);
}

class $$ComponentRelationsTableTableManager
    extends
        RootTableManager<
          _$CatalogDatabase,
          $ComponentRelationsTable,
          ComponentRelationRow,
          $$ComponentRelationsTableFilterComposer,
          $$ComponentRelationsTableOrderingComposer,
          $$ComponentRelationsTableAnnotationComposer,
          $$ComponentRelationsTableCreateCompanionBuilder,
          $$ComponentRelationsTableUpdateCompanionBuilder,
          (
            ComponentRelationRow,
            BaseReferences<
              _$CatalogDatabase,
              $ComponentRelationsTable,
              ComponentRelationRow
            >,
          ),
          ComponentRelationRow,
          PrefetchHooks Function()
        > {
  $$ComponentRelationsTableTableManager(
    _$CatalogDatabase db,
    $ComponentRelationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ComponentRelationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ComponentRelationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ComponentRelationsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> componentId = const Value.absent(),
                Value<String> relationKind = const Value.absent(),
                Value<String> relationType = const Value.absent(),
                Value<String?> value = const Value.absent(),
                Value<String?> compare = const Value.absent(),
                Value<String?> version = const Value.absent(),
              }) => ComponentRelationsCompanion(
                id: id,
                componentId: componentId,
                relationKind: relationKind,
                relationType: relationType,
                value: value,
                compare: compare,
                version: version,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String componentId,
                required String relationKind,
                required String relationType,
                Value<String?> value = const Value.absent(),
                Value<String?> compare = const Value.absent(),
                Value<String?> version = const Value.absent(),
              }) => ComponentRelationsCompanion.insert(
                id: id,
                componentId: componentId,
                relationKind: relationKind,
                relationType: relationType,
                value: value,
                compare: compare,
                version: version,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ComponentRelationsTableProcessedTableManager =
    ProcessedTableManager<
      _$CatalogDatabase,
      $ComponentRelationsTable,
      ComponentRelationRow,
      $$ComponentRelationsTableFilterComposer,
      $$ComponentRelationsTableOrderingComposer,
      $$ComponentRelationsTableAnnotationComposer,
      $$ComponentRelationsTableCreateCompanionBuilder,
      $$ComponentRelationsTableUpdateCompanionBuilder,
      (
        ComponentRelationRow,
        BaseReferences<
          _$CatalogDatabase,
          $ComponentRelationsTable,
          ComponentRelationRow
        >,
      ),
      ComponentRelationRow,
      PrefetchHooks Function()
    >;
typedef $$ComponentCustomTableCreateCompanionBuilder =
    ComponentCustomCompanion Function({
      required String componentId,
      required String key,
      required String value,
      Value<int> rowid,
    });
typedef $$ComponentCustomTableUpdateCompanionBuilder =
    ComponentCustomCompanion Function({
      Value<String> componentId,
      Value<String> key,
      Value<String> value,
      Value<int> rowid,
    });

class $$ComponentCustomTableFilterComposer
    extends Composer<_$CatalogDatabase, $ComponentCustomTable> {
  $$ComponentCustomTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get componentId => $composableBuilder(
    column: $table.componentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ComponentCustomTableOrderingComposer
    extends Composer<_$CatalogDatabase, $ComponentCustomTable> {
  $$ComponentCustomTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get componentId => $composableBuilder(
    column: $table.componentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ComponentCustomTableAnnotationComposer
    extends Composer<_$CatalogDatabase, $ComponentCustomTable> {
  $$ComponentCustomTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get componentId => $composableBuilder(
    column: $table.componentId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$ComponentCustomTableTableManager
    extends
        RootTableManager<
          _$CatalogDatabase,
          $ComponentCustomTable,
          ComponentCustomRow,
          $$ComponentCustomTableFilterComposer,
          $$ComponentCustomTableOrderingComposer,
          $$ComponentCustomTableAnnotationComposer,
          $$ComponentCustomTableCreateCompanionBuilder,
          $$ComponentCustomTableUpdateCompanionBuilder,
          (
            ComponentCustomRow,
            BaseReferences<
              _$CatalogDatabase,
              $ComponentCustomTable,
              ComponentCustomRow
            >,
          ),
          ComponentCustomRow,
          PrefetchHooks Function()
        > {
  $$ComponentCustomTableTableManager(
    _$CatalogDatabase db,
    $ComponentCustomTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ComponentCustomTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ComponentCustomTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ComponentCustomTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> componentId = const Value.absent(),
                Value<String> key = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ComponentCustomCompanion(
                componentId: componentId,
                key: key,
                value: value,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String componentId,
                required String key,
                required String value,
                Value<int> rowid = const Value.absent(),
              }) => ComponentCustomCompanion.insert(
                componentId: componentId,
                key: key,
                value: value,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ComponentCustomTableProcessedTableManager =
    ProcessedTableManager<
      _$CatalogDatabase,
      $ComponentCustomTable,
      ComponentCustomRow,
      $$ComponentCustomTableFilterComposer,
      $$ComponentCustomTableOrderingComposer,
      $$ComponentCustomTableAnnotationComposer,
      $$ComponentCustomTableCreateCompanionBuilder,
      $$ComponentCustomTableUpdateCompanionBuilder,
      (
        ComponentCustomRow,
        BaseReferences<
          _$CatalogDatabase,
          $ComponentCustomTable,
          ComponentCustomRow
        >,
      ),
      ComponentCustomRow,
      PrefetchHooks Function()
    >;
typedef $$ComponentFieldTranslationsTableCreateCompanionBuilder =
    ComponentFieldTranslationsCompanion Function({
      required String componentId,
      required String field,
      required String language,
      required String value,
      Value<int> rowid,
    });
typedef $$ComponentFieldTranslationsTableUpdateCompanionBuilder =
    ComponentFieldTranslationsCompanion Function({
      Value<String> componentId,
      Value<String> field,
      Value<String> language,
      Value<String> value,
      Value<int> rowid,
    });

class $$ComponentFieldTranslationsTableFilterComposer
    extends Composer<_$CatalogDatabase, $ComponentFieldTranslationsTable> {
  $$ComponentFieldTranslationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get componentId => $composableBuilder(
    column: $table.componentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get field => $composableBuilder(
    column: $table.field,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ComponentFieldTranslationsTableOrderingComposer
    extends Composer<_$CatalogDatabase, $ComponentFieldTranslationsTable> {
  $$ComponentFieldTranslationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get componentId => $composableBuilder(
    column: $table.componentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get field => $composableBuilder(
    column: $table.field,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ComponentFieldTranslationsTableAnnotationComposer
    extends Composer<_$CatalogDatabase, $ComponentFieldTranslationsTable> {
  $$ComponentFieldTranslationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get componentId => $composableBuilder(
    column: $table.componentId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get field =>
      $composableBuilder(column: $table.field, builder: (column) => column);

  GeneratedColumn<String> get language =>
      $composableBuilder(column: $table.language, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$ComponentFieldTranslationsTableTableManager
    extends
        RootTableManager<
          _$CatalogDatabase,
          $ComponentFieldTranslationsTable,
          ComponentFieldTranslationRow,
          $$ComponentFieldTranslationsTableFilterComposer,
          $$ComponentFieldTranslationsTableOrderingComposer,
          $$ComponentFieldTranslationsTableAnnotationComposer,
          $$ComponentFieldTranslationsTableCreateCompanionBuilder,
          $$ComponentFieldTranslationsTableUpdateCompanionBuilder,
          (
            ComponentFieldTranslationRow,
            BaseReferences<
              _$CatalogDatabase,
              $ComponentFieldTranslationsTable,
              ComponentFieldTranslationRow
            >,
          ),
          ComponentFieldTranslationRow,
          PrefetchHooks Function()
        > {
  $$ComponentFieldTranslationsTableTableManager(
    _$CatalogDatabase db,
    $ComponentFieldTranslationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ComponentFieldTranslationsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$ComponentFieldTranslationsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ComponentFieldTranslationsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> componentId = const Value.absent(),
                Value<String> field = const Value.absent(),
                Value<String> language = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ComponentFieldTranslationsCompanion(
                componentId: componentId,
                field: field,
                language: language,
                value: value,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String componentId,
                required String field,
                required String language,
                required String value,
                Value<int> rowid = const Value.absent(),
              }) => ComponentFieldTranslationsCompanion.insert(
                componentId: componentId,
                field: field,
                language: language,
                value: value,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ComponentFieldTranslationsTableProcessedTableManager =
    ProcessedTableManager<
      _$CatalogDatabase,
      $ComponentFieldTranslationsTable,
      ComponentFieldTranslationRow,
      $$ComponentFieldTranslationsTableFilterComposer,
      $$ComponentFieldTranslationsTableOrderingComposer,
      $$ComponentFieldTranslationsTableAnnotationComposer,
      $$ComponentFieldTranslationsTableCreateCompanionBuilder,
      $$ComponentFieldTranslationsTableUpdateCompanionBuilder,
      (
        ComponentFieldTranslationRow,
        BaseReferences<
          _$CatalogDatabase,
          $ComponentFieldTranslationsTable,
          ComponentFieldTranslationRow
        >,
      ),
      ComponentFieldTranslationRow,
      PrefetchHooks Function()
    >;

class $CatalogDatabaseManager {
  final _$CatalogDatabase _db;
  $CatalogDatabaseManager(this._db);
  $$ComponentsTableTableManager get components =>
      $$ComponentsTableTableManager(_db, _db.components);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
  $$ComponentCategoriesTableTableManager get componentCategories =>
      $$ComponentCategoriesTableTableManager(_db, _db.componentCategories);
  $$KeywordsTableTableManager get keywords =>
      $$KeywordsTableTableManager(_db, _db.keywords);
  $$ComponentKeywordsTableTableManager get componentKeywords =>
      $$ComponentKeywordsTableTableManager(_db, _db.componentKeywords);
  $$ComponentUrlsTableTableManager get componentUrls =>
      $$ComponentUrlsTableTableManager(_db, _db.componentUrls);
  $$ComponentIconsTableTableManager get componentIcons =>
      $$ComponentIconsTableTableManager(_db, _db.componentIcons);
  $$ReleasesTableTableManager get releases =>
      $$ReleasesTableTableManager(_db, _db.releases);
  $$ReleaseIssuesTableTableManager get releaseIssues =>
      $$ReleaseIssuesTableTableManager(_db, _db.releaseIssues);
  $$ScreenshotsTableTableManager get screenshots =>
      $$ScreenshotsTableTableManager(_db, _db.screenshots);
  $$ScreenshotImagesTableTableManager get screenshotImages =>
      $$ScreenshotImagesTableTableManager(_db, _db.screenshotImages);
  $$ScreenshotVideosTableTableManager get screenshotVideos =>
      $$ScreenshotVideosTableTableManager(_db, _db.screenshotVideos);
  $$ContentRatingAttrsTableTableManager get contentRatingAttrs =>
      $$ContentRatingAttrsTableTableManager(_db, _db.contentRatingAttrs);
  $$ComponentLanguagesTableTableManager get componentLanguages =>
      $$ComponentLanguagesTableTableManager(_db, _db.componentLanguages);
  $$BrandingColorsTableTableManager get brandingColors =>
      $$BrandingColorsTableTableManager(_db, _db.brandingColors);
  $$ComponentExtendsTableTableManager get componentExtends =>
      $$ComponentExtendsTableTableManager(_db, _db.componentExtends);
  $$ComponentSuggestsTableTableManager get componentSuggests =>
      $$ComponentSuggestsTableTableManager(_db, _db.componentSuggests);
  $$ComponentRelationsTableTableManager get componentRelations =>
      $$ComponentRelationsTableTableManager(_db, _db.componentRelations);
  $$ComponentCustomTableTableManager get componentCustom =>
      $$ComponentCustomTableTableManager(_db, _db.componentCustom);
  $$ComponentFieldTranslationsTableTableManager
  get componentFieldTranslations =>
      $$ComponentFieldTranslationsTableTableManager(
        _db,
        _db.componentFieldTranslations,
      );
}
