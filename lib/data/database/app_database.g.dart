// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ContinentsLocalTable extends ContinentsLocal
    with TableInfo<$ContinentsLocalTable, ContinentsLocalData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ContinentsLocalTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localIdMeta = const VerificationMeta(
    'localId',
  );
  @override
  late final GeneratedColumn<int> localId = GeneratedColumn<int>(
    'local_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _serverIdMeta = const VerificationMeta(
    'serverId',
  );
  @override
  late final GeneratedColumn<String> serverId = GeneratedColumn<String>(
    'server_id',
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
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(SyncStatus.pendingAdd),
  );
  @override
  List<GeneratedColumn> get $columns => [
    localId,
    serverId,
    name,
    code,
    syncStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'continents_local';
  @override
  VerificationContext validateIntegrity(
    Insertable<ContinentsLocalData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(
        _localIdMeta,
        localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta),
      );
    }
    if (data.containsKey('server_id')) {
      context.handle(
        _serverIdMeta,
        serverId.isAcceptableOrUnknown(data['server_id']!, _serverIdMeta),
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
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  ContinentsLocalData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ContinentsLocalData(
      localId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}local_id'],
          )!,
      serverId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}server_id'],
      ),
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      ),
      syncStatus:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}sync_status'],
          )!,
    );
  }

  @override
  $ContinentsLocalTable createAlias(String alias) {
    return $ContinentsLocalTable(attachedDatabase, alias);
  }
}

class ContinentsLocalData extends DataClass
    implements Insertable<ContinentsLocalData> {
  final int localId;
  final String? serverId;
  final String name;
  final String? code;
  final String syncStatus;
  const ContinentsLocalData({
    required this.localId,
    this.serverId,
    required this.name,
    this.code,
    required this.syncStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<int>(localId);
    if (!nullToAbsent || serverId != null) {
      map['server_id'] = Variable<String>(serverId);
    }
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || code != null) {
      map['code'] = Variable<String>(code);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  ContinentsLocalCompanion toCompanion(bool nullToAbsent) {
    return ContinentsLocalCompanion(
      localId: Value(localId),
      serverId:
          serverId == null && nullToAbsent
              ? const Value.absent()
              : Value(serverId),
      name: Value(name),
      code: code == null && nullToAbsent ? const Value.absent() : Value(code),
      syncStatus: Value(syncStatus),
    );
  }

  factory ContinentsLocalData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ContinentsLocalData(
      localId: serializer.fromJson<int>(json['localId']),
      serverId: serializer.fromJson<String?>(json['serverId']),
      name: serializer.fromJson<String>(json['name']),
      code: serializer.fromJson<String?>(json['code']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<int>(localId),
      'serverId': serializer.toJson<String?>(serverId),
      'name': serializer.toJson<String>(name),
      'code': serializer.toJson<String?>(code),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  ContinentsLocalData copyWith({
    int? localId,
    Value<String?> serverId = const Value.absent(),
    String? name,
    Value<String?> code = const Value.absent(),
    String? syncStatus,
  }) => ContinentsLocalData(
    localId: localId ?? this.localId,
    serverId: serverId.present ? serverId.value : this.serverId,
    name: name ?? this.name,
    code: code.present ? code.value : this.code,
    syncStatus: syncStatus ?? this.syncStatus,
  );
  ContinentsLocalData copyWithCompanion(ContinentsLocalCompanion data) {
    return ContinentsLocalData(
      localId: data.localId.present ? data.localId.value : this.localId,
      serverId: data.serverId.present ? data.serverId.value : this.serverId,
      name: data.name.present ? data.name.value : this.name,
      code: data.code.present ? data.code.value : this.code,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ContinentsLocalData(')
          ..write('localId: $localId, ')
          ..write('serverId: $serverId, ')
          ..write('name: $name, ')
          ..write('code: $code, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(localId, serverId, name, code, syncStatus);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ContinentsLocalData &&
          other.localId == this.localId &&
          other.serverId == this.serverId &&
          other.name == this.name &&
          other.code == this.code &&
          other.syncStatus == this.syncStatus);
}

class ContinentsLocalCompanion extends UpdateCompanion<ContinentsLocalData> {
  final Value<int> localId;
  final Value<String?> serverId;
  final Value<String> name;
  final Value<String?> code;
  final Value<String> syncStatus;
  const ContinentsLocalCompanion({
    this.localId = const Value.absent(),
    this.serverId = const Value.absent(),
    this.name = const Value.absent(),
    this.code = const Value.absent(),
    this.syncStatus = const Value.absent(),
  });
  ContinentsLocalCompanion.insert({
    this.localId = const Value.absent(),
    this.serverId = const Value.absent(),
    required String name,
    this.code = const Value.absent(),
    this.syncStatus = const Value.absent(),
  }) : name = Value(name);
  static Insertable<ContinentsLocalData> custom({
    Expression<int>? localId,
    Expression<String>? serverId,
    Expression<String>? name,
    Expression<String>? code,
    Expression<String>? syncStatus,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (serverId != null) 'server_id': serverId,
      if (name != null) 'name': name,
      if (code != null) 'code': code,
      if (syncStatus != null) 'sync_status': syncStatus,
    });
  }

  ContinentsLocalCompanion copyWith({
    Value<int>? localId,
    Value<String?>? serverId,
    Value<String>? name,
    Value<String?>? code,
    Value<String>? syncStatus,
  }) {
    return ContinentsLocalCompanion(
      localId: localId ?? this.localId,
      serverId: serverId ?? this.serverId,
      name: name ?? this.name,
      code: code ?? this.code,
      syncStatus: syncStatus ?? this.syncStatus,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (serverId.present) {
      map['server_id'] = Variable<String>(serverId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ContinentsLocalCompanion(')
          ..write('localId: $localId, ')
          ..write('serverId: $serverId, ')
          ..write('name: $name, ')
          ..write('code: $code, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }
}

class $CountriesLocalTable extends CountriesLocal
    with TableInfo<$CountriesLocalTable, CountriesLocalData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CountriesLocalTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localIdMeta = const VerificationMeta(
    'localId',
  );
  @override
  late final GeneratedColumn<int> localId = GeneratedColumn<int>(
    'local_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _serverIdMeta = const VerificationMeta(
    'serverId',
  );
  @override
  late final GeneratedColumn<String> serverId = GeneratedColumn<String>(
    'server_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _continentLocalIdMeta = const VerificationMeta(
    'continentLocalId',
  );
  @override
  late final GeneratedColumn<int> continentLocalId = GeneratedColumn<int>(
    'continent_local_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES continents_local (local_id)',
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
  );
  static const VerificationMeta _isoCodeMeta = const VerificationMeta(
    'isoCode',
  );
  @override
  late final GeneratedColumn<String> isoCode = GeneratedColumn<String>(
    'iso_code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(SyncStatus.pendingAdd),
  );
  @override
  List<GeneratedColumn> get $columns => [
    localId,
    serverId,
    continentLocalId,
    name,
    isoCode,
    syncStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'countries_local';
  @override
  VerificationContext validateIntegrity(
    Insertable<CountriesLocalData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(
        _localIdMeta,
        localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta),
      );
    }
    if (data.containsKey('server_id')) {
      context.handle(
        _serverIdMeta,
        serverId.isAcceptableOrUnknown(data['server_id']!, _serverIdMeta),
      );
    }
    if (data.containsKey('continent_local_id')) {
      context.handle(
        _continentLocalIdMeta,
        continentLocalId.isAcceptableOrUnknown(
          data['continent_local_id']!,
          _continentLocalIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_continentLocalIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('iso_code')) {
      context.handle(
        _isoCodeMeta,
        isoCode.isAcceptableOrUnknown(data['iso_code']!, _isoCodeMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  CountriesLocalData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CountriesLocalData(
      localId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}local_id'],
          )!,
      serverId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}server_id'],
      ),
      continentLocalId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}continent_local_id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      isoCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}iso_code'],
      ),
      syncStatus:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}sync_status'],
          )!,
    );
  }

  @override
  $CountriesLocalTable createAlias(String alias) {
    return $CountriesLocalTable(attachedDatabase, alias);
  }
}

class CountriesLocalData extends DataClass
    implements Insertable<CountriesLocalData> {
  final int localId;
  final String? serverId;
  final int continentLocalId;
  final String name;
  final String? isoCode;
  final String syncStatus;
  const CountriesLocalData({
    required this.localId,
    this.serverId,
    required this.continentLocalId,
    required this.name,
    this.isoCode,
    required this.syncStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<int>(localId);
    if (!nullToAbsent || serverId != null) {
      map['server_id'] = Variable<String>(serverId);
    }
    map['continent_local_id'] = Variable<int>(continentLocalId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || isoCode != null) {
      map['iso_code'] = Variable<String>(isoCode);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  CountriesLocalCompanion toCompanion(bool nullToAbsent) {
    return CountriesLocalCompanion(
      localId: Value(localId),
      serverId:
          serverId == null && nullToAbsent
              ? const Value.absent()
              : Value(serverId),
      continentLocalId: Value(continentLocalId),
      name: Value(name),
      isoCode:
          isoCode == null && nullToAbsent
              ? const Value.absent()
              : Value(isoCode),
      syncStatus: Value(syncStatus),
    );
  }

  factory CountriesLocalData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CountriesLocalData(
      localId: serializer.fromJson<int>(json['localId']),
      serverId: serializer.fromJson<String?>(json['serverId']),
      continentLocalId: serializer.fromJson<int>(json['continentLocalId']),
      name: serializer.fromJson<String>(json['name']),
      isoCode: serializer.fromJson<String?>(json['isoCode']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<int>(localId),
      'serverId': serializer.toJson<String?>(serverId),
      'continentLocalId': serializer.toJson<int>(continentLocalId),
      'name': serializer.toJson<String>(name),
      'isoCode': serializer.toJson<String?>(isoCode),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  CountriesLocalData copyWith({
    int? localId,
    Value<String?> serverId = const Value.absent(),
    int? continentLocalId,
    String? name,
    Value<String?> isoCode = const Value.absent(),
    String? syncStatus,
  }) => CountriesLocalData(
    localId: localId ?? this.localId,
    serverId: serverId.present ? serverId.value : this.serverId,
    continentLocalId: continentLocalId ?? this.continentLocalId,
    name: name ?? this.name,
    isoCode: isoCode.present ? isoCode.value : this.isoCode,
    syncStatus: syncStatus ?? this.syncStatus,
  );
  CountriesLocalData copyWithCompanion(CountriesLocalCompanion data) {
    return CountriesLocalData(
      localId: data.localId.present ? data.localId.value : this.localId,
      serverId: data.serverId.present ? data.serverId.value : this.serverId,
      continentLocalId:
          data.continentLocalId.present
              ? data.continentLocalId.value
              : this.continentLocalId,
      name: data.name.present ? data.name.value : this.name,
      isoCode: data.isoCode.present ? data.isoCode.value : this.isoCode,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CountriesLocalData(')
          ..write('localId: $localId, ')
          ..write('serverId: $serverId, ')
          ..write('continentLocalId: $continentLocalId, ')
          ..write('name: $name, ')
          ..write('isoCode: $isoCode, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    localId,
    serverId,
    continentLocalId,
    name,
    isoCode,
    syncStatus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CountriesLocalData &&
          other.localId == this.localId &&
          other.serverId == this.serverId &&
          other.continentLocalId == this.continentLocalId &&
          other.name == this.name &&
          other.isoCode == this.isoCode &&
          other.syncStatus == this.syncStatus);
}

class CountriesLocalCompanion extends UpdateCompanion<CountriesLocalData> {
  final Value<int> localId;
  final Value<String?> serverId;
  final Value<int> continentLocalId;
  final Value<String> name;
  final Value<String?> isoCode;
  final Value<String> syncStatus;
  const CountriesLocalCompanion({
    this.localId = const Value.absent(),
    this.serverId = const Value.absent(),
    this.continentLocalId = const Value.absent(),
    this.name = const Value.absent(),
    this.isoCode = const Value.absent(),
    this.syncStatus = const Value.absent(),
  });
  CountriesLocalCompanion.insert({
    this.localId = const Value.absent(),
    this.serverId = const Value.absent(),
    required int continentLocalId,
    required String name,
    this.isoCode = const Value.absent(),
    this.syncStatus = const Value.absent(),
  }) : continentLocalId = Value(continentLocalId),
       name = Value(name);
  static Insertable<CountriesLocalData> custom({
    Expression<int>? localId,
    Expression<String>? serverId,
    Expression<int>? continentLocalId,
    Expression<String>? name,
    Expression<String>? isoCode,
    Expression<String>? syncStatus,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (serverId != null) 'server_id': serverId,
      if (continentLocalId != null) 'continent_local_id': continentLocalId,
      if (name != null) 'name': name,
      if (isoCode != null) 'iso_code': isoCode,
      if (syncStatus != null) 'sync_status': syncStatus,
    });
  }

  CountriesLocalCompanion copyWith({
    Value<int>? localId,
    Value<String?>? serverId,
    Value<int>? continentLocalId,
    Value<String>? name,
    Value<String?>? isoCode,
    Value<String>? syncStatus,
  }) {
    return CountriesLocalCompanion(
      localId: localId ?? this.localId,
      serverId: serverId ?? this.serverId,
      continentLocalId: continentLocalId ?? this.continentLocalId,
      name: name ?? this.name,
      isoCode: isoCode ?? this.isoCode,
      syncStatus: syncStatus ?? this.syncStatus,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (serverId.present) {
      map['server_id'] = Variable<String>(serverId.value);
    }
    if (continentLocalId.present) {
      map['continent_local_id'] = Variable<int>(continentLocalId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (isoCode.present) {
      map['iso_code'] = Variable<String>(isoCode.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CountriesLocalCompanion(')
          ..write('localId: $localId, ')
          ..write('serverId: $serverId, ')
          ..write('continentLocalId: $continentLocalId, ')
          ..write('name: $name, ')
          ..write('isoCode: $isoCode, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }
}

class $LocationsLocalTable extends LocationsLocal
    with TableInfo<$LocationsLocalTable, LocationsLocalData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocationsLocalTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localIdMeta = const VerificationMeta(
    'localId',
  );
  @override
  late final GeneratedColumn<int> localId = GeneratedColumn<int>(
    'local_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _serverIdMeta = const VerificationMeta(
    'serverId',
  );
  @override
  late final GeneratedColumn<String> serverId = GeneratedColumn<String>(
    'server_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _latitudeMeta = const VerificationMeta(
    'latitude',
  );
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
    'latitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _longitudeMeta = const VerificationMeta(
    'longitude',
  );
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
    'longitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _formattedAddressMeta = const VerificationMeta(
    'formattedAddress',
  );
  @override
  late final GeneratedColumn<String> formattedAddress = GeneratedColumn<String>(
    'formatted_address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
    'city',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumn<String> state = GeneratedColumn<String>(
    'state',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _googlePlaceIdMeta = const VerificationMeta(
    'googlePlaceId',
  );
  @override
  late final GeneratedColumn<String> googlePlaceId = GeneratedColumn<String>(
    'google_place_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _countryLocalIdMeta = const VerificationMeta(
    'countryLocalId',
  );
  @override
  late final GeneratedColumn<int> countryLocalId = GeneratedColumn<int>(
    'country_local_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES countries_local (local_id)',
    ),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumnWithTypeConverter<DateTime, String> updatedAt =
      GeneratedColumn<String>(
        'updated_at',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<DateTime>($LocationsLocalTable.$converterupdatedAt);
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(SyncStatus.pendingAdd),
  );
  @override
  List<GeneratedColumn> get $columns => [
    localId,
    serverId,
    latitude,
    longitude,
    formattedAddress,
    city,
    state,
    googlePlaceId,
    countryLocalId,
    updatedAt,
    syncStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'locations_local';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocationsLocalData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(
        _localIdMeta,
        localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta),
      );
    }
    if (data.containsKey('server_id')) {
      context.handle(
        _serverIdMeta,
        serverId.isAcceptableOrUnknown(data['server_id']!, _serverIdMeta),
      );
    }
    if (data.containsKey('latitude')) {
      context.handle(
        _latitudeMeta,
        latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(
        _longitudeMeta,
        longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('formatted_address')) {
      context.handle(
        _formattedAddressMeta,
        formattedAddress.isAcceptableOrUnknown(
          data['formatted_address']!,
          _formattedAddressMeta,
        ),
      );
    }
    if (data.containsKey('city')) {
      context.handle(
        _cityMeta,
        city.isAcceptableOrUnknown(data['city']!, _cityMeta),
      );
    }
    if (data.containsKey('state')) {
      context.handle(
        _stateMeta,
        state.isAcceptableOrUnknown(data['state']!, _stateMeta),
      );
    }
    if (data.containsKey('google_place_id')) {
      context.handle(
        _googlePlaceIdMeta,
        googlePlaceId.isAcceptableOrUnknown(
          data['google_place_id']!,
          _googlePlaceIdMeta,
        ),
      );
    }
    if (data.containsKey('country_local_id')) {
      context.handle(
        _countryLocalIdMeta,
        countryLocalId.isAcceptableOrUnknown(
          data['country_local_id']!,
          _countryLocalIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_countryLocalIdMeta);
    }
    context.handle(_updatedAtMeta, const VerificationResult.success());
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  LocationsLocalData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocationsLocalData(
      localId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}local_id'],
          )!,
      serverId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}server_id'],
      ),
      latitude:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}latitude'],
          )!,
      longitude:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}longitude'],
          )!,
      formattedAddress: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}formatted_address'],
      ),
      city: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}city'],
      ),
      state: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}state'],
      ),
      googlePlaceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}google_place_id'],
      ),
      countryLocalId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}country_local_id'],
          )!,
      updatedAt: $LocationsLocalTable.$converterupdatedAt.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}updated_at'],
        )!,
      ),
      syncStatus:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}sync_status'],
          )!,
    );
  }

  @override
  $LocationsLocalTable createAlias(String alias) {
    return $LocationsLocalTable(attachedDatabase, alias);
  }

  static TypeConverter<DateTime, String> $converterupdatedAt =
      const DateTimeConverter();
}

class LocationsLocalData extends DataClass
    implements Insertable<LocationsLocalData> {
  final int localId;
  final String? serverId;
  final double latitude;
  final double longitude;
  final String? formattedAddress;
  final String? city;
  final String? state;
  final String? googlePlaceId;
  final int countryLocalId;
  final DateTime updatedAt;
  final String syncStatus;
  const LocationsLocalData({
    required this.localId,
    this.serverId,
    required this.latitude,
    required this.longitude,
    this.formattedAddress,
    this.city,
    this.state,
    this.googlePlaceId,
    required this.countryLocalId,
    required this.updatedAt,
    required this.syncStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<int>(localId);
    if (!nullToAbsent || serverId != null) {
      map['server_id'] = Variable<String>(serverId);
    }
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    if (!nullToAbsent || formattedAddress != null) {
      map['formatted_address'] = Variable<String>(formattedAddress);
    }
    if (!nullToAbsent || city != null) {
      map['city'] = Variable<String>(city);
    }
    if (!nullToAbsent || state != null) {
      map['state'] = Variable<String>(state);
    }
    if (!nullToAbsent || googlePlaceId != null) {
      map['google_place_id'] = Variable<String>(googlePlaceId);
    }
    map['country_local_id'] = Variable<int>(countryLocalId);
    {
      map['updated_at'] = Variable<String>(
        $LocationsLocalTable.$converterupdatedAt.toSql(updatedAt),
      );
    }
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  LocationsLocalCompanion toCompanion(bool nullToAbsent) {
    return LocationsLocalCompanion(
      localId: Value(localId),
      serverId:
          serverId == null && nullToAbsent
              ? const Value.absent()
              : Value(serverId),
      latitude: Value(latitude),
      longitude: Value(longitude),
      formattedAddress:
          formattedAddress == null && nullToAbsent
              ? const Value.absent()
              : Value(formattedAddress),
      city: city == null && nullToAbsent ? const Value.absent() : Value(city),
      state:
          state == null && nullToAbsent ? const Value.absent() : Value(state),
      googlePlaceId:
          googlePlaceId == null && nullToAbsent
              ? const Value.absent()
              : Value(googlePlaceId),
      countryLocalId: Value(countryLocalId),
      updatedAt: Value(updatedAt),
      syncStatus: Value(syncStatus),
    );
  }

  factory LocationsLocalData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocationsLocalData(
      localId: serializer.fromJson<int>(json['localId']),
      serverId: serializer.fromJson<String?>(json['serverId']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      formattedAddress: serializer.fromJson<String?>(json['formattedAddress']),
      city: serializer.fromJson<String?>(json['city']),
      state: serializer.fromJson<String?>(json['state']),
      googlePlaceId: serializer.fromJson<String?>(json['googlePlaceId']),
      countryLocalId: serializer.fromJson<int>(json['countryLocalId']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<int>(localId),
      'serverId': serializer.toJson<String?>(serverId),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'formattedAddress': serializer.toJson<String?>(formattedAddress),
      'city': serializer.toJson<String?>(city),
      'state': serializer.toJson<String?>(state),
      'googlePlaceId': serializer.toJson<String?>(googlePlaceId),
      'countryLocalId': serializer.toJson<int>(countryLocalId),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  LocationsLocalData copyWith({
    int? localId,
    Value<String?> serverId = const Value.absent(),
    double? latitude,
    double? longitude,
    Value<String?> formattedAddress = const Value.absent(),
    Value<String?> city = const Value.absent(),
    Value<String?> state = const Value.absent(),
    Value<String?> googlePlaceId = const Value.absent(),
    int? countryLocalId,
    DateTime? updatedAt,
    String? syncStatus,
  }) => LocationsLocalData(
    localId: localId ?? this.localId,
    serverId: serverId.present ? serverId.value : this.serverId,
    latitude: latitude ?? this.latitude,
    longitude: longitude ?? this.longitude,
    formattedAddress:
        formattedAddress.present
            ? formattedAddress.value
            : this.formattedAddress,
    city: city.present ? city.value : this.city,
    state: state.present ? state.value : this.state,
    googlePlaceId:
        googlePlaceId.present ? googlePlaceId.value : this.googlePlaceId,
    countryLocalId: countryLocalId ?? this.countryLocalId,
    updatedAt: updatedAt ?? this.updatedAt,
    syncStatus: syncStatus ?? this.syncStatus,
  );
  LocationsLocalData copyWithCompanion(LocationsLocalCompanion data) {
    return LocationsLocalData(
      localId: data.localId.present ? data.localId.value : this.localId,
      serverId: data.serverId.present ? data.serverId.value : this.serverId,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      formattedAddress:
          data.formattedAddress.present
              ? data.formattedAddress.value
              : this.formattedAddress,
      city: data.city.present ? data.city.value : this.city,
      state: data.state.present ? data.state.value : this.state,
      googlePlaceId:
          data.googlePlaceId.present
              ? data.googlePlaceId.value
              : this.googlePlaceId,
      countryLocalId:
          data.countryLocalId.present
              ? data.countryLocalId.value
              : this.countryLocalId,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocationsLocalData(')
          ..write('localId: $localId, ')
          ..write('serverId: $serverId, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('formattedAddress: $formattedAddress, ')
          ..write('city: $city, ')
          ..write('state: $state, ')
          ..write('googlePlaceId: $googlePlaceId, ')
          ..write('countryLocalId: $countryLocalId, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    localId,
    serverId,
    latitude,
    longitude,
    formattedAddress,
    city,
    state,
    googlePlaceId,
    countryLocalId,
    updatedAt,
    syncStatus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocationsLocalData &&
          other.localId == this.localId &&
          other.serverId == this.serverId &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.formattedAddress == this.formattedAddress &&
          other.city == this.city &&
          other.state == this.state &&
          other.googlePlaceId == this.googlePlaceId &&
          other.countryLocalId == this.countryLocalId &&
          other.updatedAt == this.updatedAt &&
          other.syncStatus == this.syncStatus);
}

class LocationsLocalCompanion extends UpdateCompanion<LocationsLocalData> {
  final Value<int> localId;
  final Value<String?> serverId;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<String?> formattedAddress;
  final Value<String?> city;
  final Value<String?> state;
  final Value<String?> googlePlaceId;
  final Value<int> countryLocalId;
  final Value<DateTime> updatedAt;
  final Value<String> syncStatus;
  const LocationsLocalCompanion({
    this.localId = const Value.absent(),
    this.serverId = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.formattedAddress = const Value.absent(),
    this.city = const Value.absent(),
    this.state = const Value.absent(),
    this.googlePlaceId = const Value.absent(),
    this.countryLocalId = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
  });
  LocationsLocalCompanion.insert({
    this.localId = const Value.absent(),
    this.serverId = const Value.absent(),
    required double latitude,
    required double longitude,
    this.formattedAddress = const Value.absent(),
    this.city = const Value.absent(),
    this.state = const Value.absent(),
    this.googlePlaceId = const Value.absent(),
    required int countryLocalId,
    required DateTime updatedAt,
    this.syncStatus = const Value.absent(),
  }) : latitude = Value(latitude),
       longitude = Value(longitude),
       countryLocalId = Value(countryLocalId),
       updatedAt = Value(updatedAt);
  static Insertable<LocationsLocalData> custom({
    Expression<int>? localId,
    Expression<String>? serverId,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<String>? formattedAddress,
    Expression<String>? city,
    Expression<String>? state,
    Expression<String>? googlePlaceId,
    Expression<int>? countryLocalId,
    Expression<String>? updatedAt,
    Expression<String>? syncStatus,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (serverId != null) 'server_id': serverId,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (formattedAddress != null) 'formatted_address': formattedAddress,
      if (city != null) 'city': city,
      if (state != null) 'state': state,
      if (googlePlaceId != null) 'google_place_id': googlePlaceId,
      if (countryLocalId != null) 'country_local_id': countryLocalId,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
    });
  }

  LocationsLocalCompanion copyWith({
    Value<int>? localId,
    Value<String?>? serverId,
    Value<double>? latitude,
    Value<double>? longitude,
    Value<String?>? formattedAddress,
    Value<String?>? city,
    Value<String?>? state,
    Value<String?>? googlePlaceId,
    Value<int>? countryLocalId,
    Value<DateTime>? updatedAt,
    Value<String>? syncStatus,
  }) {
    return LocationsLocalCompanion(
      localId: localId ?? this.localId,
      serverId: serverId ?? this.serverId,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      formattedAddress: formattedAddress ?? this.formattedAddress,
      city: city ?? this.city,
      state: state ?? this.state,
      googlePlaceId: googlePlaceId ?? this.googlePlaceId,
      countryLocalId: countryLocalId ?? this.countryLocalId,
      updatedAt: updatedAt ?? this.updatedAt,
      syncStatus: syncStatus ?? this.syncStatus,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (serverId.present) {
      map['server_id'] = Variable<String>(serverId.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (formattedAddress.present) {
      map['formatted_address'] = Variable<String>(formattedAddress.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
    }
    if (googlePlaceId.present) {
      map['google_place_id'] = Variable<String>(googlePlaceId.value);
    }
    if (countryLocalId.present) {
      map['country_local_id'] = Variable<int>(countryLocalId.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(
        $LocationsLocalTable.$converterupdatedAt.toSql(updatedAt.value),
      );
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocationsLocalCompanion(')
          ..write('localId: $localId, ')
          ..write('serverId: $serverId, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('formattedAddress: $formattedAddress, ')
          ..write('city: $city, ')
          ..write('state: $state, ')
          ..write('googlePlaceId: $googlePlaceId, ')
          ..write('countryLocalId: $countryLocalId, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }
}

class $UsersLocalTable extends UsersLocal
    with TableInfo<$UsersLocalTable, UsersLocalData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersLocalTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localIdMeta = const VerificationMeta(
    'localId',
  );
  @override
  late final GeneratedColumn<int> localId = GeneratedColumn<int>(
    'local_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _serverIdMeta = const VerificationMeta(
    'serverId',
  );
  @override
  late final GeneratedColumn<String> serverId = GeneratedColumn<String>(
    'server_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isVerifiedMeta = const VerificationMeta(
    'isVerified',
  );
  @override
  late final GeneratedColumn<bool> isVerified = GeneratedColumn<bool>(
    'is_verified',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_verified" IN (0, 1))',
    ),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumnWithTypeConverter<DateTime, String> updatedAt =
      GeneratedColumn<String>(
        'updated_at',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<DateTime>($UsersLocalTable.$converterupdatedAt);
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(SyncStatus.pendingAdd),
  );
  @override
  List<GeneratedColumn> get $columns => [
    localId,
    serverId,
    email,
    isVerified,
    updatedAt,
    syncStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users_local';
  @override
  VerificationContext validateIntegrity(
    Insertable<UsersLocalData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(
        _localIdMeta,
        localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta),
      );
    }
    if (data.containsKey('server_id')) {
      context.handle(
        _serverIdMeta,
        serverId.isAcceptableOrUnknown(data['server_id']!, _serverIdMeta),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('is_verified')) {
      context.handle(
        _isVerifiedMeta,
        isVerified.isAcceptableOrUnknown(data['is_verified']!, _isVerifiedMeta),
      );
    } else if (isInserting) {
      context.missing(_isVerifiedMeta);
    }
    context.handle(_updatedAtMeta, const VerificationResult.success());
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  UsersLocalData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UsersLocalData(
      localId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}local_id'],
          )!,
      serverId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}server_id'],
      ),
      email:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}email'],
          )!,
      isVerified:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}is_verified'],
          )!,
      updatedAt: $UsersLocalTable.$converterupdatedAt.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}updated_at'],
        )!,
      ),
      syncStatus:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}sync_status'],
          )!,
    );
  }

  @override
  $UsersLocalTable createAlias(String alias) {
    return $UsersLocalTable(attachedDatabase, alias);
  }

  static TypeConverter<DateTime, String> $converterupdatedAt =
      const DateTimeConverter();
}

class UsersLocalData extends DataClass implements Insertable<UsersLocalData> {
  final int localId;
  final String? serverId;
  final String email;
  final bool isVerified;
  final DateTime updatedAt;
  final String syncStatus;
  const UsersLocalData({
    required this.localId,
    this.serverId,
    required this.email,
    required this.isVerified,
    required this.updatedAt,
    required this.syncStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<int>(localId);
    if (!nullToAbsent || serverId != null) {
      map['server_id'] = Variable<String>(serverId);
    }
    map['email'] = Variable<String>(email);
    map['is_verified'] = Variable<bool>(isVerified);
    {
      map['updated_at'] = Variable<String>(
        $UsersLocalTable.$converterupdatedAt.toSql(updatedAt),
      );
    }
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  UsersLocalCompanion toCompanion(bool nullToAbsent) {
    return UsersLocalCompanion(
      localId: Value(localId),
      serverId:
          serverId == null && nullToAbsent
              ? const Value.absent()
              : Value(serverId),
      email: Value(email),
      isVerified: Value(isVerified),
      updatedAt: Value(updatedAt),
      syncStatus: Value(syncStatus),
    );
  }

  factory UsersLocalData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UsersLocalData(
      localId: serializer.fromJson<int>(json['localId']),
      serverId: serializer.fromJson<String?>(json['serverId']),
      email: serializer.fromJson<String>(json['email']),
      isVerified: serializer.fromJson<bool>(json['isVerified']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<int>(localId),
      'serverId': serializer.toJson<String?>(serverId),
      'email': serializer.toJson<String>(email),
      'isVerified': serializer.toJson<bool>(isVerified),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  UsersLocalData copyWith({
    int? localId,
    Value<String?> serverId = const Value.absent(),
    String? email,
    bool? isVerified,
    DateTime? updatedAt,
    String? syncStatus,
  }) => UsersLocalData(
    localId: localId ?? this.localId,
    serverId: serverId.present ? serverId.value : this.serverId,
    email: email ?? this.email,
    isVerified: isVerified ?? this.isVerified,
    updatedAt: updatedAt ?? this.updatedAt,
    syncStatus: syncStatus ?? this.syncStatus,
  );
  UsersLocalData copyWithCompanion(UsersLocalCompanion data) {
    return UsersLocalData(
      localId: data.localId.present ? data.localId.value : this.localId,
      serverId: data.serverId.present ? data.serverId.value : this.serverId,
      email: data.email.present ? data.email.value : this.email,
      isVerified:
          data.isVerified.present ? data.isVerified.value : this.isVerified,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UsersLocalData(')
          ..write('localId: $localId, ')
          ..write('serverId: $serverId, ')
          ..write('email: $email, ')
          ..write('isVerified: $isVerified, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(localId, serverId, email, isVerified, updatedAt, syncStatus);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UsersLocalData &&
          other.localId == this.localId &&
          other.serverId == this.serverId &&
          other.email == this.email &&
          other.isVerified == this.isVerified &&
          other.updatedAt == this.updatedAt &&
          other.syncStatus == this.syncStatus);
}

class UsersLocalCompanion extends UpdateCompanion<UsersLocalData> {
  final Value<int> localId;
  final Value<String?> serverId;
  final Value<String> email;
  final Value<bool> isVerified;
  final Value<DateTime> updatedAt;
  final Value<String> syncStatus;
  const UsersLocalCompanion({
    this.localId = const Value.absent(),
    this.serverId = const Value.absent(),
    this.email = const Value.absent(),
    this.isVerified = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
  });
  UsersLocalCompanion.insert({
    this.localId = const Value.absent(),
    this.serverId = const Value.absent(),
    required String email,
    required bool isVerified,
    required DateTime updatedAt,
    this.syncStatus = const Value.absent(),
  }) : email = Value(email),
       isVerified = Value(isVerified),
       updatedAt = Value(updatedAt);
  static Insertable<UsersLocalData> custom({
    Expression<int>? localId,
    Expression<String>? serverId,
    Expression<String>? email,
    Expression<bool>? isVerified,
    Expression<String>? updatedAt,
    Expression<String>? syncStatus,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (serverId != null) 'server_id': serverId,
      if (email != null) 'email': email,
      if (isVerified != null) 'is_verified': isVerified,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
    });
  }

  UsersLocalCompanion copyWith({
    Value<int>? localId,
    Value<String?>? serverId,
    Value<String>? email,
    Value<bool>? isVerified,
    Value<DateTime>? updatedAt,
    Value<String>? syncStatus,
  }) {
    return UsersLocalCompanion(
      localId: localId ?? this.localId,
      serverId: serverId ?? this.serverId,
      email: email ?? this.email,
      isVerified: isVerified ?? this.isVerified,
      updatedAt: updatedAt ?? this.updatedAt,
      syncStatus: syncStatus ?? this.syncStatus,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (serverId.present) {
      map['server_id'] = Variable<String>(serverId.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (isVerified.present) {
      map['is_verified'] = Variable<bool>(isVerified.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(
        $UsersLocalTable.$converterupdatedAt.toSql(updatedAt.value),
      );
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersLocalCompanion(')
          ..write('localId: $localId, ')
          ..write('serverId: $serverId, ')
          ..write('email: $email, ')
          ..write('isVerified: $isVerified, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }
}

class $UserProfilesLocalTable extends UserProfilesLocal
    with TableInfo<$UserProfilesLocalTable, UserProfilesLocalData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserProfilesLocalTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localIdMeta = const VerificationMeta(
    'localId',
  );
  @override
  late final GeneratedColumn<int> localId = GeneratedColumn<int>(
    'local_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _serverIdMeta = const VerificationMeta(
    'serverId',
  );
  @override
  late final GeneratedColumn<String> serverId = GeneratedColumn<String>(
    'server_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _userLocalIdMeta = const VerificationMeta(
    'userLocalId',
  );
  @override
  late final GeneratedColumn<int> userLocalId = GeneratedColumn<int>(
    'user_local_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users_local (local_id)',
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
  );
  static const VerificationMeta _profilePhotoUrlMeta = const VerificationMeta(
    'profilePhotoUrl',
  );
  @override
  late final GeneratedColumn<String> profilePhotoUrl = GeneratedColumn<String>(
    'profile_photo_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _coverPhotoUrlMeta = const VerificationMeta(
    'coverPhotoUrl',
  );
  @override
  late final GeneratedColumn<String> coverPhotoUrl = GeneratedColumn<String>(
    'cover_photo_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _profileLocalFilePathMeta =
      const VerificationMeta('profileLocalFilePath');
  @override
  late final GeneratedColumn<String> profileLocalFilePath =
      GeneratedColumn<String>(
        'profile_local_file_path',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _coverLocalFilePathMeta =
      const VerificationMeta('coverLocalFilePath');
  @override
  late final GeneratedColumn<String> coverLocalFilePath =
      GeneratedColumn<String>(
        'cover_local_file_path',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _bioMeta = const VerificationMeta('bio');
  @override
  late final GeneratedColumn<String> bio = GeneratedColumn<String>(
    'bio',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _locationLocalIdMeta = const VerificationMeta(
    'locationLocalId',
  );
  @override
  late final GeneratedColumn<int> locationLocalId = GeneratedColumn<int>(
    'location_local_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES locations_local (local_id)',
    ),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumnWithTypeConverter<DateTime, String> updatedAt =
      GeneratedColumn<String>(
        'updated_at',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<DateTime>($UserProfilesLocalTable.$converterupdatedAt);
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(SyncStatus.pendingAdd),
  );
  @override
  List<GeneratedColumn> get $columns => [
    localId,
    serverId,
    userLocalId,
    name,
    profilePhotoUrl,
    coverPhotoUrl,
    profileLocalFilePath,
    coverLocalFilePath,
    bio,
    locationLocalId,
    updatedAt,
    syncStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_profiles_local';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserProfilesLocalData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(
        _localIdMeta,
        localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta),
      );
    }
    if (data.containsKey('server_id')) {
      context.handle(
        _serverIdMeta,
        serverId.isAcceptableOrUnknown(data['server_id']!, _serverIdMeta),
      );
    }
    if (data.containsKey('user_local_id')) {
      context.handle(
        _userLocalIdMeta,
        userLocalId.isAcceptableOrUnknown(
          data['user_local_id']!,
          _userLocalIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_userLocalIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('profile_photo_url')) {
      context.handle(
        _profilePhotoUrlMeta,
        profilePhotoUrl.isAcceptableOrUnknown(
          data['profile_photo_url']!,
          _profilePhotoUrlMeta,
        ),
      );
    }
    if (data.containsKey('cover_photo_url')) {
      context.handle(
        _coverPhotoUrlMeta,
        coverPhotoUrl.isAcceptableOrUnknown(
          data['cover_photo_url']!,
          _coverPhotoUrlMeta,
        ),
      );
    }
    if (data.containsKey('profile_local_file_path')) {
      context.handle(
        _profileLocalFilePathMeta,
        profileLocalFilePath.isAcceptableOrUnknown(
          data['profile_local_file_path']!,
          _profileLocalFilePathMeta,
        ),
      );
    }
    if (data.containsKey('cover_local_file_path')) {
      context.handle(
        _coverLocalFilePathMeta,
        coverLocalFilePath.isAcceptableOrUnknown(
          data['cover_local_file_path']!,
          _coverLocalFilePathMeta,
        ),
      );
    }
    if (data.containsKey('bio')) {
      context.handle(
        _bioMeta,
        bio.isAcceptableOrUnknown(data['bio']!, _bioMeta),
      );
    }
    if (data.containsKey('location_local_id')) {
      context.handle(
        _locationLocalIdMeta,
        locationLocalId.isAcceptableOrUnknown(
          data['location_local_id']!,
          _locationLocalIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_locationLocalIdMeta);
    }
    context.handle(_updatedAtMeta, const VerificationResult.success());
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  UserProfilesLocalData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserProfilesLocalData(
      localId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}local_id'],
          )!,
      serverId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}server_id'],
      ),
      userLocalId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}user_local_id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      profilePhotoUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}profile_photo_url'],
      ),
      coverPhotoUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cover_photo_url'],
      ),
      profileLocalFilePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}profile_local_file_path'],
      ),
      coverLocalFilePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cover_local_file_path'],
      ),
      bio: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bio'],
      ),
      locationLocalId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}location_local_id'],
          )!,
      updatedAt: $UserProfilesLocalTable.$converterupdatedAt.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}updated_at'],
        )!,
      ),
      syncStatus:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}sync_status'],
          )!,
    );
  }

  @override
  $UserProfilesLocalTable createAlias(String alias) {
    return $UserProfilesLocalTable(attachedDatabase, alias);
  }

  static TypeConverter<DateTime, String> $converterupdatedAt =
      const DateTimeConverter();
}

class UserProfilesLocalData extends DataClass
    implements Insertable<UserProfilesLocalData> {
  final int localId;
  final String? serverId;
  final int userLocalId;
  final String name;
  final String? profilePhotoUrl;
  final String? coverPhotoUrl;
  final String? profileLocalFilePath;
  final String? coverLocalFilePath;
  final String? bio;
  final int locationLocalId;
  final DateTime updatedAt;
  final String syncStatus;
  const UserProfilesLocalData({
    required this.localId,
    this.serverId,
    required this.userLocalId,
    required this.name,
    this.profilePhotoUrl,
    this.coverPhotoUrl,
    this.profileLocalFilePath,
    this.coverLocalFilePath,
    this.bio,
    required this.locationLocalId,
    required this.updatedAt,
    required this.syncStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<int>(localId);
    if (!nullToAbsent || serverId != null) {
      map['server_id'] = Variable<String>(serverId);
    }
    map['user_local_id'] = Variable<int>(userLocalId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || profilePhotoUrl != null) {
      map['profile_photo_url'] = Variable<String>(profilePhotoUrl);
    }
    if (!nullToAbsent || coverPhotoUrl != null) {
      map['cover_photo_url'] = Variable<String>(coverPhotoUrl);
    }
    if (!nullToAbsent || profileLocalFilePath != null) {
      map['profile_local_file_path'] = Variable<String>(profileLocalFilePath);
    }
    if (!nullToAbsent || coverLocalFilePath != null) {
      map['cover_local_file_path'] = Variable<String>(coverLocalFilePath);
    }
    if (!nullToAbsent || bio != null) {
      map['bio'] = Variable<String>(bio);
    }
    map['location_local_id'] = Variable<int>(locationLocalId);
    {
      map['updated_at'] = Variable<String>(
        $UserProfilesLocalTable.$converterupdatedAt.toSql(updatedAt),
      );
    }
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  UserProfilesLocalCompanion toCompanion(bool nullToAbsent) {
    return UserProfilesLocalCompanion(
      localId: Value(localId),
      serverId:
          serverId == null && nullToAbsent
              ? const Value.absent()
              : Value(serverId),
      userLocalId: Value(userLocalId),
      name: Value(name),
      profilePhotoUrl:
          profilePhotoUrl == null && nullToAbsent
              ? const Value.absent()
              : Value(profilePhotoUrl),
      coverPhotoUrl:
          coverPhotoUrl == null && nullToAbsent
              ? const Value.absent()
              : Value(coverPhotoUrl),
      profileLocalFilePath:
          profileLocalFilePath == null && nullToAbsent
              ? const Value.absent()
              : Value(profileLocalFilePath),
      coverLocalFilePath:
          coverLocalFilePath == null && nullToAbsent
              ? const Value.absent()
              : Value(coverLocalFilePath),
      bio: bio == null && nullToAbsent ? const Value.absent() : Value(bio),
      locationLocalId: Value(locationLocalId),
      updatedAt: Value(updatedAt),
      syncStatus: Value(syncStatus),
    );
  }

  factory UserProfilesLocalData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserProfilesLocalData(
      localId: serializer.fromJson<int>(json['localId']),
      serverId: serializer.fromJson<String?>(json['serverId']),
      userLocalId: serializer.fromJson<int>(json['userLocalId']),
      name: serializer.fromJson<String>(json['name']),
      profilePhotoUrl: serializer.fromJson<String?>(json['profilePhotoUrl']),
      coverPhotoUrl: serializer.fromJson<String?>(json['coverPhotoUrl']),
      profileLocalFilePath: serializer.fromJson<String?>(
        json['profileLocalFilePath'],
      ),
      coverLocalFilePath: serializer.fromJson<String?>(
        json['coverLocalFilePath'],
      ),
      bio: serializer.fromJson<String?>(json['bio']),
      locationLocalId: serializer.fromJson<int>(json['locationLocalId']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<int>(localId),
      'serverId': serializer.toJson<String?>(serverId),
      'userLocalId': serializer.toJson<int>(userLocalId),
      'name': serializer.toJson<String>(name),
      'profilePhotoUrl': serializer.toJson<String?>(profilePhotoUrl),
      'coverPhotoUrl': serializer.toJson<String?>(coverPhotoUrl),
      'profileLocalFilePath': serializer.toJson<String?>(profileLocalFilePath),
      'coverLocalFilePath': serializer.toJson<String?>(coverLocalFilePath),
      'bio': serializer.toJson<String?>(bio),
      'locationLocalId': serializer.toJson<int>(locationLocalId),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  UserProfilesLocalData copyWith({
    int? localId,
    Value<String?> serverId = const Value.absent(),
    int? userLocalId,
    String? name,
    Value<String?> profilePhotoUrl = const Value.absent(),
    Value<String?> coverPhotoUrl = const Value.absent(),
    Value<String?> profileLocalFilePath = const Value.absent(),
    Value<String?> coverLocalFilePath = const Value.absent(),
    Value<String?> bio = const Value.absent(),
    int? locationLocalId,
    DateTime? updatedAt,
    String? syncStatus,
  }) => UserProfilesLocalData(
    localId: localId ?? this.localId,
    serverId: serverId.present ? serverId.value : this.serverId,
    userLocalId: userLocalId ?? this.userLocalId,
    name: name ?? this.name,
    profilePhotoUrl:
        profilePhotoUrl.present ? profilePhotoUrl.value : this.profilePhotoUrl,
    coverPhotoUrl:
        coverPhotoUrl.present ? coverPhotoUrl.value : this.coverPhotoUrl,
    profileLocalFilePath:
        profileLocalFilePath.present
            ? profileLocalFilePath.value
            : this.profileLocalFilePath,
    coverLocalFilePath:
        coverLocalFilePath.present
            ? coverLocalFilePath.value
            : this.coverLocalFilePath,
    bio: bio.present ? bio.value : this.bio,
    locationLocalId: locationLocalId ?? this.locationLocalId,
    updatedAt: updatedAt ?? this.updatedAt,
    syncStatus: syncStatus ?? this.syncStatus,
  );
  UserProfilesLocalData copyWithCompanion(UserProfilesLocalCompanion data) {
    return UserProfilesLocalData(
      localId: data.localId.present ? data.localId.value : this.localId,
      serverId: data.serverId.present ? data.serverId.value : this.serverId,
      userLocalId:
          data.userLocalId.present ? data.userLocalId.value : this.userLocalId,
      name: data.name.present ? data.name.value : this.name,
      profilePhotoUrl:
          data.profilePhotoUrl.present
              ? data.profilePhotoUrl.value
              : this.profilePhotoUrl,
      coverPhotoUrl:
          data.coverPhotoUrl.present
              ? data.coverPhotoUrl.value
              : this.coverPhotoUrl,
      profileLocalFilePath:
          data.profileLocalFilePath.present
              ? data.profileLocalFilePath.value
              : this.profileLocalFilePath,
      coverLocalFilePath:
          data.coverLocalFilePath.present
              ? data.coverLocalFilePath.value
              : this.coverLocalFilePath,
      bio: data.bio.present ? data.bio.value : this.bio,
      locationLocalId:
          data.locationLocalId.present
              ? data.locationLocalId.value
              : this.locationLocalId,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserProfilesLocalData(')
          ..write('localId: $localId, ')
          ..write('serverId: $serverId, ')
          ..write('userLocalId: $userLocalId, ')
          ..write('name: $name, ')
          ..write('profilePhotoUrl: $profilePhotoUrl, ')
          ..write('coverPhotoUrl: $coverPhotoUrl, ')
          ..write('profileLocalFilePath: $profileLocalFilePath, ')
          ..write('coverLocalFilePath: $coverLocalFilePath, ')
          ..write('bio: $bio, ')
          ..write('locationLocalId: $locationLocalId, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    localId,
    serverId,
    userLocalId,
    name,
    profilePhotoUrl,
    coverPhotoUrl,
    profileLocalFilePath,
    coverLocalFilePath,
    bio,
    locationLocalId,
    updatedAt,
    syncStatus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserProfilesLocalData &&
          other.localId == this.localId &&
          other.serverId == this.serverId &&
          other.userLocalId == this.userLocalId &&
          other.name == this.name &&
          other.profilePhotoUrl == this.profilePhotoUrl &&
          other.coverPhotoUrl == this.coverPhotoUrl &&
          other.profileLocalFilePath == this.profileLocalFilePath &&
          other.coverLocalFilePath == this.coverLocalFilePath &&
          other.bio == this.bio &&
          other.locationLocalId == this.locationLocalId &&
          other.updatedAt == this.updatedAt &&
          other.syncStatus == this.syncStatus);
}

class UserProfilesLocalCompanion
    extends UpdateCompanion<UserProfilesLocalData> {
  final Value<int> localId;
  final Value<String?> serverId;
  final Value<int> userLocalId;
  final Value<String> name;
  final Value<String?> profilePhotoUrl;
  final Value<String?> coverPhotoUrl;
  final Value<String?> profileLocalFilePath;
  final Value<String?> coverLocalFilePath;
  final Value<String?> bio;
  final Value<int> locationLocalId;
  final Value<DateTime> updatedAt;
  final Value<String> syncStatus;
  const UserProfilesLocalCompanion({
    this.localId = const Value.absent(),
    this.serverId = const Value.absent(),
    this.userLocalId = const Value.absent(),
    this.name = const Value.absent(),
    this.profilePhotoUrl = const Value.absent(),
    this.coverPhotoUrl = const Value.absent(),
    this.profileLocalFilePath = const Value.absent(),
    this.coverLocalFilePath = const Value.absent(),
    this.bio = const Value.absent(),
    this.locationLocalId = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
  });
  UserProfilesLocalCompanion.insert({
    this.localId = const Value.absent(),
    this.serverId = const Value.absent(),
    required int userLocalId,
    required String name,
    this.profilePhotoUrl = const Value.absent(),
    this.coverPhotoUrl = const Value.absent(),
    this.profileLocalFilePath = const Value.absent(),
    this.coverLocalFilePath = const Value.absent(),
    this.bio = const Value.absent(),
    required int locationLocalId,
    required DateTime updatedAt,
    this.syncStatus = const Value.absent(),
  }) : userLocalId = Value(userLocalId),
       name = Value(name),
       locationLocalId = Value(locationLocalId),
       updatedAt = Value(updatedAt);
  static Insertable<UserProfilesLocalData> custom({
    Expression<int>? localId,
    Expression<String>? serverId,
    Expression<int>? userLocalId,
    Expression<String>? name,
    Expression<String>? profilePhotoUrl,
    Expression<String>? coverPhotoUrl,
    Expression<String>? profileLocalFilePath,
    Expression<String>? coverLocalFilePath,
    Expression<String>? bio,
    Expression<int>? locationLocalId,
    Expression<String>? updatedAt,
    Expression<String>? syncStatus,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (serverId != null) 'server_id': serverId,
      if (userLocalId != null) 'user_local_id': userLocalId,
      if (name != null) 'name': name,
      if (profilePhotoUrl != null) 'profile_photo_url': profilePhotoUrl,
      if (coverPhotoUrl != null) 'cover_photo_url': coverPhotoUrl,
      if (profileLocalFilePath != null)
        'profile_local_file_path': profileLocalFilePath,
      if (coverLocalFilePath != null)
        'cover_local_file_path': coverLocalFilePath,
      if (bio != null) 'bio': bio,
      if (locationLocalId != null) 'location_local_id': locationLocalId,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
    });
  }

  UserProfilesLocalCompanion copyWith({
    Value<int>? localId,
    Value<String?>? serverId,
    Value<int>? userLocalId,
    Value<String>? name,
    Value<String?>? profilePhotoUrl,
    Value<String?>? coverPhotoUrl,
    Value<String?>? profileLocalFilePath,
    Value<String?>? coverLocalFilePath,
    Value<String?>? bio,
    Value<int>? locationLocalId,
    Value<DateTime>? updatedAt,
    Value<String>? syncStatus,
  }) {
    return UserProfilesLocalCompanion(
      localId: localId ?? this.localId,
      serverId: serverId ?? this.serverId,
      userLocalId: userLocalId ?? this.userLocalId,
      name: name ?? this.name,
      profilePhotoUrl: profilePhotoUrl ?? this.profilePhotoUrl,
      coverPhotoUrl: coverPhotoUrl ?? this.coverPhotoUrl,
      profileLocalFilePath: profileLocalFilePath ?? this.profileLocalFilePath,
      coverLocalFilePath: coverLocalFilePath ?? this.coverLocalFilePath,
      bio: bio ?? this.bio,
      locationLocalId: locationLocalId ?? this.locationLocalId,
      updatedAt: updatedAt ?? this.updatedAt,
      syncStatus: syncStatus ?? this.syncStatus,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (serverId.present) {
      map['server_id'] = Variable<String>(serverId.value);
    }
    if (userLocalId.present) {
      map['user_local_id'] = Variable<int>(userLocalId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (profilePhotoUrl.present) {
      map['profile_photo_url'] = Variable<String>(profilePhotoUrl.value);
    }
    if (coverPhotoUrl.present) {
      map['cover_photo_url'] = Variable<String>(coverPhotoUrl.value);
    }
    if (profileLocalFilePath.present) {
      map['profile_local_file_path'] = Variable<String>(
        profileLocalFilePath.value,
      );
    }
    if (coverLocalFilePath.present) {
      map['cover_local_file_path'] = Variable<String>(coverLocalFilePath.value);
    }
    if (bio.present) {
      map['bio'] = Variable<String>(bio.value);
    }
    if (locationLocalId.present) {
      map['location_local_id'] = Variable<int>(locationLocalId.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(
        $UserProfilesLocalTable.$converterupdatedAt.toSql(updatedAt.value),
      );
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserProfilesLocalCompanion(')
          ..write('localId: $localId, ')
          ..write('serverId: $serverId, ')
          ..write('userLocalId: $userLocalId, ')
          ..write('name: $name, ')
          ..write('profilePhotoUrl: $profilePhotoUrl, ')
          ..write('coverPhotoUrl: $coverPhotoUrl, ')
          ..write('profileLocalFilePath: $profileLocalFilePath, ')
          ..write('coverLocalFilePath: $coverLocalFilePath, ')
          ..write('bio: $bio, ')
          ..write('locationLocalId: $locationLocalId, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }
}

class $UserVisitedCountriesLocalTable extends UserVisitedCountriesLocal
    with
        TableInfo<
          $UserVisitedCountriesLocalTable,
          UserVisitedCountriesLocalData
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserVisitedCountriesLocalTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localIdMeta = const VerificationMeta(
    'localId',
  );
  @override
  late final GeneratedColumn<int> localId = GeneratedColumn<int>(
    'local_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _serverIdMeta = const VerificationMeta(
    'serverId',
  );
  @override
  late final GeneratedColumn<String> serverId = GeneratedColumn<String>(
    'server_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _userLocalIdMeta = const VerificationMeta(
    'userLocalId',
  );
  @override
  late final GeneratedColumn<int> userLocalId = GeneratedColumn<int>(
    'user_local_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users_local (local_id)',
    ),
  );
  static const VerificationMeta _countryLocalIdMeta = const VerificationMeta(
    'countryLocalId',
  );
  @override
  late final GeneratedColumn<int> countryLocalId = GeneratedColumn<int>(
    'country_local_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES countries_local (local_id)',
    ),
  );
  static const VerificationMeta _visitedAtMeta = const VerificationMeta(
    'visitedAt',
  );
  @override
  late final GeneratedColumnWithTypeConverter<DateTime, String> visitedAt =
      GeneratedColumn<String>(
        'visited_at',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<DateTime>(
        $UserVisitedCountriesLocalTable.$convertervisitedAt,
      );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(SyncStatus.pendingAdd),
  );
  @override
  List<GeneratedColumn> get $columns => [
    localId,
    serverId,
    userLocalId,
    countryLocalId,
    visitedAt,
    syncStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_visited_countries_local';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserVisitedCountriesLocalData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(
        _localIdMeta,
        localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta),
      );
    }
    if (data.containsKey('server_id')) {
      context.handle(
        _serverIdMeta,
        serverId.isAcceptableOrUnknown(data['server_id']!, _serverIdMeta),
      );
    }
    if (data.containsKey('user_local_id')) {
      context.handle(
        _userLocalIdMeta,
        userLocalId.isAcceptableOrUnknown(
          data['user_local_id']!,
          _userLocalIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_userLocalIdMeta);
    }
    if (data.containsKey('country_local_id')) {
      context.handle(
        _countryLocalIdMeta,
        countryLocalId.isAcceptableOrUnknown(
          data['country_local_id']!,
          _countryLocalIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_countryLocalIdMeta);
    }
    context.handle(_visitedAtMeta, const VerificationResult.success());
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  UserVisitedCountriesLocalData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserVisitedCountriesLocalData(
      localId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}local_id'],
          )!,
      serverId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}server_id'],
      ),
      userLocalId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}user_local_id'],
          )!,
      countryLocalId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}country_local_id'],
          )!,
      visitedAt: $UserVisitedCountriesLocalTable.$convertervisitedAt.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}visited_at'],
        )!,
      ),
      syncStatus:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}sync_status'],
          )!,
    );
  }

  @override
  $UserVisitedCountriesLocalTable createAlias(String alias) {
    return $UserVisitedCountriesLocalTable(attachedDatabase, alias);
  }

  static TypeConverter<DateTime, String> $convertervisitedAt =
      const DateTimeConverter();
}

class UserVisitedCountriesLocalData extends DataClass
    implements Insertable<UserVisitedCountriesLocalData> {
  final int localId;
  final String? serverId;
  final int userLocalId;
  final int countryLocalId;
  final DateTime visitedAt;
  final String syncStatus;
  const UserVisitedCountriesLocalData({
    required this.localId,
    this.serverId,
    required this.userLocalId,
    required this.countryLocalId,
    required this.visitedAt,
    required this.syncStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<int>(localId);
    if (!nullToAbsent || serverId != null) {
      map['server_id'] = Variable<String>(serverId);
    }
    map['user_local_id'] = Variable<int>(userLocalId);
    map['country_local_id'] = Variable<int>(countryLocalId);
    {
      map['visited_at'] = Variable<String>(
        $UserVisitedCountriesLocalTable.$convertervisitedAt.toSql(visitedAt),
      );
    }
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  UserVisitedCountriesLocalCompanion toCompanion(bool nullToAbsent) {
    return UserVisitedCountriesLocalCompanion(
      localId: Value(localId),
      serverId:
          serverId == null && nullToAbsent
              ? const Value.absent()
              : Value(serverId),
      userLocalId: Value(userLocalId),
      countryLocalId: Value(countryLocalId),
      visitedAt: Value(visitedAt),
      syncStatus: Value(syncStatus),
    );
  }

  factory UserVisitedCountriesLocalData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserVisitedCountriesLocalData(
      localId: serializer.fromJson<int>(json['localId']),
      serverId: serializer.fromJson<String?>(json['serverId']),
      userLocalId: serializer.fromJson<int>(json['userLocalId']),
      countryLocalId: serializer.fromJson<int>(json['countryLocalId']),
      visitedAt: serializer.fromJson<DateTime>(json['visitedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<int>(localId),
      'serverId': serializer.toJson<String?>(serverId),
      'userLocalId': serializer.toJson<int>(userLocalId),
      'countryLocalId': serializer.toJson<int>(countryLocalId),
      'visitedAt': serializer.toJson<DateTime>(visitedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  UserVisitedCountriesLocalData copyWith({
    int? localId,
    Value<String?> serverId = const Value.absent(),
    int? userLocalId,
    int? countryLocalId,
    DateTime? visitedAt,
    String? syncStatus,
  }) => UserVisitedCountriesLocalData(
    localId: localId ?? this.localId,
    serverId: serverId.present ? serverId.value : this.serverId,
    userLocalId: userLocalId ?? this.userLocalId,
    countryLocalId: countryLocalId ?? this.countryLocalId,
    visitedAt: visitedAt ?? this.visitedAt,
    syncStatus: syncStatus ?? this.syncStatus,
  );
  UserVisitedCountriesLocalData copyWithCompanion(
    UserVisitedCountriesLocalCompanion data,
  ) {
    return UserVisitedCountriesLocalData(
      localId: data.localId.present ? data.localId.value : this.localId,
      serverId: data.serverId.present ? data.serverId.value : this.serverId,
      userLocalId:
          data.userLocalId.present ? data.userLocalId.value : this.userLocalId,
      countryLocalId:
          data.countryLocalId.present
              ? data.countryLocalId.value
              : this.countryLocalId,
      visitedAt: data.visitedAt.present ? data.visitedAt.value : this.visitedAt,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserVisitedCountriesLocalData(')
          ..write('localId: $localId, ')
          ..write('serverId: $serverId, ')
          ..write('userLocalId: $userLocalId, ')
          ..write('countryLocalId: $countryLocalId, ')
          ..write('visitedAt: $visitedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    localId,
    serverId,
    userLocalId,
    countryLocalId,
    visitedAt,
    syncStatus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserVisitedCountriesLocalData &&
          other.localId == this.localId &&
          other.serverId == this.serverId &&
          other.userLocalId == this.userLocalId &&
          other.countryLocalId == this.countryLocalId &&
          other.visitedAt == this.visitedAt &&
          other.syncStatus == this.syncStatus);
}

class UserVisitedCountriesLocalCompanion
    extends UpdateCompanion<UserVisitedCountriesLocalData> {
  final Value<int> localId;
  final Value<String?> serverId;
  final Value<int> userLocalId;
  final Value<int> countryLocalId;
  final Value<DateTime> visitedAt;
  final Value<String> syncStatus;
  const UserVisitedCountriesLocalCompanion({
    this.localId = const Value.absent(),
    this.serverId = const Value.absent(),
    this.userLocalId = const Value.absent(),
    this.countryLocalId = const Value.absent(),
    this.visitedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
  });
  UserVisitedCountriesLocalCompanion.insert({
    this.localId = const Value.absent(),
    this.serverId = const Value.absent(),
    required int userLocalId,
    required int countryLocalId,
    required DateTime visitedAt,
    this.syncStatus = const Value.absent(),
  }) : userLocalId = Value(userLocalId),
       countryLocalId = Value(countryLocalId),
       visitedAt = Value(visitedAt);
  static Insertable<UserVisitedCountriesLocalData> custom({
    Expression<int>? localId,
    Expression<String>? serverId,
    Expression<int>? userLocalId,
    Expression<int>? countryLocalId,
    Expression<String>? visitedAt,
    Expression<String>? syncStatus,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (serverId != null) 'server_id': serverId,
      if (userLocalId != null) 'user_local_id': userLocalId,
      if (countryLocalId != null) 'country_local_id': countryLocalId,
      if (visitedAt != null) 'visited_at': visitedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
    });
  }

  UserVisitedCountriesLocalCompanion copyWith({
    Value<int>? localId,
    Value<String?>? serverId,
    Value<int>? userLocalId,
    Value<int>? countryLocalId,
    Value<DateTime>? visitedAt,
    Value<String>? syncStatus,
  }) {
    return UserVisitedCountriesLocalCompanion(
      localId: localId ?? this.localId,
      serverId: serverId ?? this.serverId,
      userLocalId: userLocalId ?? this.userLocalId,
      countryLocalId: countryLocalId ?? this.countryLocalId,
      visitedAt: visitedAt ?? this.visitedAt,
      syncStatus: syncStatus ?? this.syncStatus,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (serverId.present) {
      map['server_id'] = Variable<String>(serverId.value);
    }
    if (userLocalId.present) {
      map['user_local_id'] = Variable<int>(userLocalId.value);
    }
    if (countryLocalId.present) {
      map['country_local_id'] = Variable<int>(countryLocalId.value);
    }
    if (visitedAt.present) {
      map['visited_at'] = Variable<String>(
        $UserVisitedCountriesLocalTable.$convertervisitedAt.toSql(
          visitedAt.value,
        ),
      );
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserVisitedCountriesLocalCompanion(')
          ..write('localId: $localId, ')
          ..write('serverId: $serverId, ')
          ..write('userLocalId: $userLocalId, ')
          ..write('countryLocalId: $countryLocalId, ')
          ..write('visitedAt: $visitedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }
}

class $JournalsLocalTable extends JournalsLocal
    with TableInfo<$JournalsLocalTable, JournalsLocalData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JournalsLocalTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localIdMeta = const VerificationMeta(
    'localId',
  );
  @override
  late final GeneratedColumn<int> localId = GeneratedColumn<int>(
    'local_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _serverIdMeta = const VerificationMeta(
    'serverId',
  );
  @override
  late final GeneratedColumn<String> serverId = GeneratedColumn<String>(
    'server_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _userLocalIdMeta = const VerificationMeta(
    'userLocalId',
  );
  @override
  late final GeneratedColumn<int> userLocalId = GeneratedColumn<int>(
    'user_local_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users_local (local_id)',
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
  );
  static const VerificationMeta _shortSummaryMeta = const VerificationMeta(
    'shortSummary',
  );
  @override
  late final GeneratedColumn<String> shortSummary = GeneratedColumn<String>(
    'short_summary',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _locationLocalIdMeta = const VerificationMeta(
    'locationLocalId',
  );
  @override
  late final GeneratedColumn<int> locationLocalId = GeneratedColumn<int>(
    'location_local_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES locations_local (local_id)',
    ),
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumnWithTypeConverter<DateTime, String> startDate =
      GeneratedColumn<String>(
        'start_date',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<DateTime>($JournalsLocalTable.$converterstartDate);
  static const VerificationMeta _endDateMeta = const VerificationMeta(
    'endDate',
  );
  @override
  late final GeneratedColumnWithTypeConverter<DateTime?, String> endDate =
      GeneratedColumn<String>(
        'end_date',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<DateTime?>($JournalsLocalTable.$converterendDaten);
  static const VerificationMeta _coverPhotoUrlMeta = const VerificationMeta(
    'coverPhotoUrl',
  );
  @override
  late final GeneratedColumn<String> coverPhotoUrl = GeneratedColumn<String>(
    'cover_photo_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _coverLocalFilePathMeta =
      const VerificationMeta('coverLocalFilePath');
  @override
  late final GeneratedColumn<String> coverLocalFilePath =
      GeneratedColumn<String>(
        'cover_local_file_path',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _remindersEnabledMeta = const VerificationMeta(
    'remindersEnabled',
  );
  @override
  late final GeneratedColumn<bool> remindersEnabled = GeneratedColumn<bool>(
    'reminders_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("reminders_enabled" IN (0, 1))',
    ),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumnWithTypeConverter<DateTime, String> updatedAt =
      GeneratedColumn<String>(
        'updated_at',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<DateTime>($JournalsLocalTable.$converterupdatedAt);
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(SyncStatus.pendingAdd),
  );
  @override
  List<GeneratedColumn> get $columns => [
    localId,
    serverId,
    userLocalId,
    name,
    shortSummary,
    locationLocalId,
    startDate,
    endDate,
    coverPhotoUrl,
    coverLocalFilePath,
    remindersEnabled,
    updatedAt,
    syncStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'journals_local';
  @override
  VerificationContext validateIntegrity(
    Insertable<JournalsLocalData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(
        _localIdMeta,
        localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta),
      );
    }
    if (data.containsKey('server_id')) {
      context.handle(
        _serverIdMeta,
        serverId.isAcceptableOrUnknown(data['server_id']!, _serverIdMeta),
      );
    }
    if (data.containsKey('user_local_id')) {
      context.handle(
        _userLocalIdMeta,
        userLocalId.isAcceptableOrUnknown(
          data['user_local_id']!,
          _userLocalIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_userLocalIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('short_summary')) {
      context.handle(
        _shortSummaryMeta,
        shortSummary.isAcceptableOrUnknown(
          data['short_summary']!,
          _shortSummaryMeta,
        ),
      );
    }
    if (data.containsKey('location_local_id')) {
      context.handle(
        _locationLocalIdMeta,
        locationLocalId.isAcceptableOrUnknown(
          data['location_local_id']!,
          _locationLocalIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_locationLocalIdMeta);
    }
    context.handle(_startDateMeta, const VerificationResult.success());
    context.handle(_endDateMeta, const VerificationResult.success());
    if (data.containsKey('cover_photo_url')) {
      context.handle(
        _coverPhotoUrlMeta,
        coverPhotoUrl.isAcceptableOrUnknown(
          data['cover_photo_url']!,
          _coverPhotoUrlMeta,
        ),
      );
    }
    if (data.containsKey('cover_local_file_path')) {
      context.handle(
        _coverLocalFilePathMeta,
        coverLocalFilePath.isAcceptableOrUnknown(
          data['cover_local_file_path']!,
          _coverLocalFilePathMeta,
        ),
      );
    }
    if (data.containsKey('reminders_enabled')) {
      context.handle(
        _remindersEnabledMeta,
        remindersEnabled.isAcceptableOrUnknown(
          data['reminders_enabled']!,
          _remindersEnabledMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_remindersEnabledMeta);
    }
    context.handle(_updatedAtMeta, const VerificationResult.success());
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  JournalsLocalData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return JournalsLocalData(
      localId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}local_id'],
          )!,
      serverId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}server_id'],
      ),
      userLocalId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}user_local_id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      shortSummary: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}short_summary'],
      ),
      locationLocalId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}location_local_id'],
          )!,
      startDate: $JournalsLocalTable.$converterstartDate.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}start_date'],
        )!,
      ),
      endDate: $JournalsLocalTable.$converterendDaten.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}end_date'],
        ),
      ),
      coverPhotoUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cover_photo_url'],
      ),
      coverLocalFilePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cover_local_file_path'],
      ),
      remindersEnabled:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}reminders_enabled'],
          )!,
      updatedAt: $JournalsLocalTable.$converterupdatedAt.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}updated_at'],
        )!,
      ),
      syncStatus:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}sync_status'],
          )!,
    );
  }

  @override
  $JournalsLocalTable createAlias(String alias) {
    return $JournalsLocalTable(attachedDatabase, alias);
  }

  static TypeConverter<DateTime, String> $converterstartDate =
      const DateTimeConverter();
  static TypeConverter<DateTime, String> $converterendDate =
      const DateTimeConverter();
  static TypeConverter<DateTime?, String?> $converterendDaten =
      NullAwareTypeConverter.wrap($converterendDate);
  static TypeConverter<DateTime, String> $converterupdatedAt =
      const DateTimeConverter();
}

class JournalsLocalData extends DataClass
    implements Insertable<JournalsLocalData> {
  final int localId;
  final String? serverId;
  final int userLocalId;
  final String name;
  final String? shortSummary;
  final int locationLocalId;
  final DateTime startDate;
  final DateTime? endDate;
  final String? coverPhotoUrl;
  final String? coverLocalFilePath;
  final bool remindersEnabled;
  final DateTime updatedAt;
  final String syncStatus;
  const JournalsLocalData({
    required this.localId,
    this.serverId,
    required this.userLocalId,
    required this.name,
    this.shortSummary,
    required this.locationLocalId,
    required this.startDate,
    this.endDate,
    this.coverPhotoUrl,
    this.coverLocalFilePath,
    required this.remindersEnabled,
    required this.updatedAt,
    required this.syncStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<int>(localId);
    if (!nullToAbsent || serverId != null) {
      map['server_id'] = Variable<String>(serverId);
    }
    map['user_local_id'] = Variable<int>(userLocalId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || shortSummary != null) {
      map['short_summary'] = Variable<String>(shortSummary);
    }
    map['location_local_id'] = Variable<int>(locationLocalId);
    {
      map['start_date'] = Variable<String>(
        $JournalsLocalTable.$converterstartDate.toSql(startDate),
      );
    }
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<String>(
        $JournalsLocalTable.$converterendDaten.toSql(endDate),
      );
    }
    if (!nullToAbsent || coverPhotoUrl != null) {
      map['cover_photo_url'] = Variable<String>(coverPhotoUrl);
    }
    if (!nullToAbsent || coverLocalFilePath != null) {
      map['cover_local_file_path'] = Variable<String>(coverLocalFilePath);
    }
    map['reminders_enabled'] = Variable<bool>(remindersEnabled);
    {
      map['updated_at'] = Variable<String>(
        $JournalsLocalTable.$converterupdatedAt.toSql(updatedAt),
      );
    }
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  JournalsLocalCompanion toCompanion(bool nullToAbsent) {
    return JournalsLocalCompanion(
      localId: Value(localId),
      serverId:
          serverId == null && nullToAbsent
              ? const Value.absent()
              : Value(serverId),
      userLocalId: Value(userLocalId),
      name: Value(name),
      shortSummary:
          shortSummary == null && nullToAbsent
              ? const Value.absent()
              : Value(shortSummary),
      locationLocalId: Value(locationLocalId),
      startDate: Value(startDate),
      endDate:
          endDate == null && nullToAbsent
              ? const Value.absent()
              : Value(endDate),
      coverPhotoUrl:
          coverPhotoUrl == null && nullToAbsent
              ? const Value.absent()
              : Value(coverPhotoUrl),
      coverLocalFilePath:
          coverLocalFilePath == null && nullToAbsent
              ? const Value.absent()
              : Value(coverLocalFilePath),
      remindersEnabled: Value(remindersEnabled),
      updatedAt: Value(updatedAt),
      syncStatus: Value(syncStatus),
    );
  }

  factory JournalsLocalData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JournalsLocalData(
      localId: serializer.fromJson<int>(json['localId']),
      serverId: serializer.fromJson<String?>(json['serverId']),
      userLocalId: serializer.fromJson<int>(json['userLocalId']),
      name: serializer.fromJson<String>(json['name']),
      shortSummary: serializer.fromJson<String?>(json['shortSummary']),
      locationLocalId: serializer.fromJson<int>(json['locationLocalId']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime?>(json['endDate']),
      coverPhotoUrl: serializer.fromJson<String?>(json['coverPhotoUrl']),
      coverLocalFilePath: serializer.fromJson<String?>(
        json['coverLocalFilePath'],
      ),
      remindersEnabled: serializer.fromJson<bool>(json['remindersEnabled']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<int>(localId),
      'serverId': serializer.toJson<String?>(serverId),
      'userLocalId': serializer.toJson<int>(userLocalId),
      'name': serializer.toJson<String>(name),
      'shortSummary': serializer.toJson<String?>(shortSummary),
      'locationLocalId': serializer.toJson<int>(locationLocalId),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime?>(endDate),
      'coverPhotoUrl': serializer.toJson<String?>(coverPhotoUrl),
      'coverLocalFilePath': serializer.toJson<String?>(coverLocalFilePath),
      'remindersEnabled': serializer.toJson<bool>(remindersEnabled),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  JournalsLocalData copyWith({
    int? localId,
    Value<String?> serverId = const Value.absent(),
    int? userLocalId,
    String? name,
    Value<String?> shortSummary = const Value.absent(),
    int? locationLocalId,
    DateTime? startDate,
    Value<DateTime?> endDate = const Value.absent(),
    Value<String?> coverPhotoUrl = const Value.absent(),
    Value<String?> coverLocalFilePath = const Value.absent(),
    bool? remindersEnabled,
    DateTime? updatedAt,
    String? syncStatus,
  }) => JournalsLocalData(
    localId: localId ?? this.localId,
    serverId: serverId.present ? serverId.value : this.serverId,
    userLocalId: userLocalId ?? this.userLocalId,
    name: name ?? this.name,
    shortSummary: shortSummary.present ? shortSummary.value : this.shortSummary,
    locationLocalId: locationLocalId ?? this.locationLocalId,
    startDate: startDate ?? this.startDate,
    endDate: endDate.present ? endDate.value : this.endDate,
    coverPhotoUrl:
        coverPhotoUrl.present ? coverPhotoUrl.value : this.coverPhotoUrl,
    coverLocalFilePath:
        coverLocalFilePath.present
            ? coverLocalFilePath.value
            : this.coverLocalFilePath,
    remindersEnabled: remindersEnabled ?? this.remindersEnabled,
    updatedAt: updatedAt ?? this.updatedAt,
    syncStatus: syncStatus ?? this.syncStatus,
  );
  JournalsLocalData copyWithCompanion(JournalsLocalCompanion data) {
    return JournalsLocalData(
      localId: data.localId.present ? data.localId.value : this.localId,
      serverId: data.serverId.present ? data.serverId.value : this.serverId,
      userLocalId:
          data.userLocalId.present ? data.userLocalId.value : this.userLocalId,
      name: data.name.present ? data.name.value : this.name,
      shortSummary:
          data.shortSummary.present
              ? data.shortSummary.value
              : this.shortSummary,
      locationLocalId:
          data.locationLocalId.present
              ? data.locationLocalId.value
              : this.locationLocalId,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      coverPhotoUrl:
          data.coverPhotoUrl.present
              ? data.coverPhotoUrl.value
              : this.coverPhotoUrl,
      coverLocalFilePath:
          data.coverLocalFilePath.present
              ? data.coverLocalFilePath.value
              : this.coverLocalFilePath,
      remindersEnabled:
          data.remindersEnabled.present
              ? data.remindersEnabled.value
              : this.remindersEnabled,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('JournalsLocalData(')
          ..write('localId: $localId, ')
          ..write('serverId: $serverId, ')
          ..write('userLocalId: $userLocalId, ')
          ..write('name: $name, ')
          ..write('shortSummary: $shortSummary, ')
          ..write('locationLocalId: $locationLocalId, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('coverPhotoUrl: $coverPhotoUrl, ')
          ..write('coverLocalFilePath: $coverLocalFilePath, ')
          ..write('remindersEnabled: $remindersEnabled, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    localId,
    serverId,
    userLocalId,
    name,
    shortSummary,
    locationLocalId,
    startDate,
    endDate,
    coverPhotoUrl,
    coverLocalFilePath,
    remindersEnabled,
    updatedAt,
    syncStatus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JournalsLocalData &&
          other.localId == this.localId &&
          other.serverId == this.serverId &&
          other.userLocalId == this.userLocalId &&
          other.name == this.name &&
          other.shortSummary == this.shortSummary &&
          other.locationLocalId == this.locationLocalId &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.coverPhotoUrl == this.coverPhotoUrl &&
          other.coverLocalFilePath == this.coverLocalFilePath &&
          other.remindersEnabled == this.remindersEnabled &&
          other.updatedAt == this.updatedAt &&
          other.syncStatus == this.syncStatus);
}

class JournalsLocalCompanion extends UpdateCompanion<JournalsLocalData> {
  final Value<int> localId;
  final Value<String?> serverId;
  final Value<int> userLocalId;
  final Value<String> name;
  final Value<String?> shortSummary;
  final Value<int> locationLocalId;
  final Value<DateTime> startDate;
  final Value<DateTime?> endDate;
  final Value<String?> coverPhotoUrl;
  final Value<String?> coverLocalFilePath;
  final Value<bool> remindersEnabled;
  final Value<DateTime> updatedAt;
  final Value<String> syncStatus;
  const JournalsLocalCompanion({
    this.localId = const Value.absent(),
    this.serverId = const Value.absent(),
    this.userLocalId = const Value.absent(),
    this.name = const Value.absent(),
    this.shortSummary = const Value.absent(),
    this.locationLocalId = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.coverPhotoUrl = const Value.absent(),
    this.coverLocalFilePath = const Value.absent(),
    this.remindersEnabled = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
  });
  JournalsLocalCompanion.insert({
    this.localId = const Value.absent(),
    this.serverId = const Value.absent(),
    required int userLocalId,
    required String name,
    this.shortSummary = const Value.absent(),
    required int locationLocalId,
    required DateTime startDate,
    this.endDate = const Value.absent(),
    this.coverPhotoUrl = const Value.absent(),
    this.coverLocalFilePath = const Value.absent(),
    required bool remindersEnabled,
    required DateTime updatedAt,
    this.syncStatus = const Value.absent(),
  }) : userLocalId = Value(userLocalId),
       name = Value(name),
       locationLocalId = Value(locationLocalId),
       startDate = Value(startDate),
       remindersEnabled = Value(remindersEnabled),
       updatedAt = Value(updatedAt);
  static Insertable<JournalsLocalData> custom({
    Expression<int>? localId,
    Expression<String>? serverId,
    Expression<int>? userLocalId,
    Expression<String>? name,
    Expression<String>? shortSummary,
    Expression<int>? locationLocalId,
    Expression<String>? startDate,
    Expression<String>? endDate,
    Expression<String>? coverPhotoUrl,
    Expression<String>? coverLocalFilePath,
    Expression<bool>? remindersEnabled,
    Expression<String>? updatedAt,
    Expression<String>? syncStatus,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (serverId != null) 'server_id': serverId,
      if (userLocalId != null) 'user_local_id': userLocalId,
      if (name != null) 'name': name,
      if (shortSummary != null) 'short_summary': shortSummary,
      if (locationLocalId != null) 'location_local_id': locationLocalId,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (coverPhotoUrl != null) 'cover_photo_url': coverPhotoUrl,
      if (coverLocalFilePath != null)
        'cover_local_file_path': coverLocalFilePath,
      if (remindersEnabled != null) 'reminders_enabled': remindersEnabled,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
    });
  }

  JournalsLocalCompanion copyWith({
    Value<int>? localId,
    Value<String?>? serverId,
    Value<int>? userLocalId,
    Value<String>? name,
    Value<String?>? shortSummary,
    Value<int>? locationLocalId,
    Value<DateTime>? startDate,
    Value<DateTime?>? endDate,
    Value<String?>? coverPhotoUrl,
    Value<String?>? coverLocalFilePath,
    Value<bool>? remindersEnabled,
    Value<DateTime>? updatedAt,
    Value<String>? syncStatus,
  }) {
    return JournalsLocalCompanion(
      localId: localId ?? this.localId,
      serverId: serverId ?? this.serverId,
      userLocalId: userLocalId ?? this.userLocalId,
      name: name ?? this.name,
      shortSummary: shortSummary ?? this.shortSummary,
      locationLocalId: locationLocalId ?? this.locationLocalId,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      coverPhotoUrl: coverPhotoUrl ?? this.coverPhotoUrl,
      coverLocalFilePath: coverLocalFilePath ?? this.coverLocalFilePath,
      remindersEnabled: remindersEnabled ?? this.remindersEnabled,
      updatedAt: updatedAt ?? this.updatedAt,
      syncStatus: syncStatus ?? this.syncStatus,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (serverId.present) {
      map['server_id'] = Variable<String>(serverId.value);
    }
    if (userLocalId.present) {
      map['user_local_id'] = Variable<int>(userLocalId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (shortSummary.present) {
      map['short_summary'] = Variable<String>(shortSummary.value);
    }
    if (locationLocalId.present) {
      map['location_local_id'] = Variable<int>(locationLocalId.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<String>(
        $JournalsLocalTable.$converterstartDate.toSql(startDate.value),
      );
    }
    if (endDate.present) {
      map['end_date'] = Variable<String>(
        $JournalsLocalTable.$converterendDaten.toSql(endDate.value),
      );
    }
    if (coverPhotoUrl.present) {
      map['cover_photo_url'] = Variable<String>(coverPhotoUrl.value);
    }
    if (coverLocalFilePath.present) {
      map['cover_local_file_path'] = Variable<String>(coverLocalFilePath.value);
    }
    if (remindersEnabled.present) {
      map['reminders_enabled'] = Variable<bool>(remindersEnabled.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(
        $JournalsLocalTable.$converterupdatedAt.toSql(updatedAt.value),
      );
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JournalsLocalCompanion(')
          ..write('localId: $localId, ')
          ..write('serverId: $serverId, ')
          ..write('userLocalId: $userLocalId, ')
          ..write('name: $name, ')
          ..write('shortSummary: $shortSummary, ')
          ..write('locationLocalId: $locationLocalId, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('coverPhotoUrl: $coverPhotoUrl, ')
          ..write('coverLocalFilePath: $coverLocalFilePath, ')
          ..write('remindersEnabled: $remindersEnabled, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }
}

class $CategoriesLocalTable extends CategoriesLocal
    with TableInfo<$CategoriesLocalTable, CategoriesLocalData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesLocalTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localIdMeta = const VerificationMeta(
    'localId',
  );
  @override
  late final GeneratedColumn<int> localId = GeneratedColumn<int>(
    'local_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _serverIdMeta = const VerificationMeta(
    'serverId',
  );
  @override
  late final GeneratedColumn<String> serverId = GeneratedColumn<String>(
    'server_id',
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
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(SyncStatus.pendingAdd),
  );
  @override
  List<GeneratedColumn> get $columns => [localId, serverId, name, syncStatus];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories_local';
  @override
  VerificationContext validateIntegrity(
    Insertable<CategoriesLocalData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(
        _localIdMeta,
        localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta),
      );
    }
    if (data.containsKey('server_id')) {
      context.handle(
        _serverIdMeta,
        serverId.isAcceptableOrUnknown(data['server_id']!, _serverIdMeta),
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
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  CategoriesLocalData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoriesLocalData(
      localId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}local_id'],
          )!,
      serverId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}server_id'],
      ),
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      syncStatus:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}sync_status'],
          )!,
    );
  }

  @override
  $CategoriesLocalTable createAlias(String alias) {
    return $CategoriesLocalTable(attachedDatabase, alias);
  }
}

class CategoriesLocalData extends DataClass
    implements Insertable<CategoriesLocalData> {
  final int localId;
  final String? serverId;
  final String name;
  final String syncStatus;
  const CategoriesLocalData({
    required this.localId,
    this.serverId,
    required this.name,
    required this.syncStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<int>(localId);
    if (!nullToAbsent || serverId != null) {
      map['server_id'] = Variable<String>(serverId);
    }
    map['name'] = Variable<String>(name);
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  CategoriesLocalCompanion toCompanion(bool nullToAbsent) {
    return CategoriesLocalCompanion(
      localId: Value(localId),
      serverId:
          serverId == null && nullToAbsent
              ? const Value.absent()
              : Value(serverId),
      name: Value(name),
      syncStatus: Value(syncStatus),
    );
  }

  factory CategoriesLocalData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoriesLocalData(
      localId: serializer.fromJson<int>(json['localId']),
      serverId: serializer.fromJson<String?>(json['serverId']),
      name: serializer.fromJson<String>(json['name']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<int>(localId),
      'serverId': serializer.toJson<String?>(serverId),
      'name': serializer.toJson<String>(name),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  CategoriesLocalData copyWith({
    int? localId,
    Value<String?> serverId = const Value.absent(),
    String? name,
    String? syncStatus,
  }) => CategoriesLocalData(
    localId: localId ?? this.localId,
    serverId: serverId.present ? serverId.value : this.serverId,
    name: name ?? this.name,
    syncStatus: syncStatus ?? this.syncStatus,
  );
  CategoriesLocalData copyWithCompanion(CategoriesLocalCompanion data) {
    return CategoriesLocalData(
      localId: data.localId.present ? data.localId.value : this.localId,
      serverId: data.serverId.present ? data.serverId.value : this.serverId,
      name: data.name.present ? data.name.value : this.name,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesLocalData(')
          ..write('localId: $localId, ')
          ..write('serverId: $serverId, ')
          ..write('name: $name, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(localId, serverId, name, syncStatus);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoriesLocalData &&
          other.localId == this.localId &&
          other.serverId == this.serverId &&
          other.name == this.name &&
          other.syncStatus == this.syncStatus);
}

class CategoriesLocalCompanion extends UpdateCompanion<CategoriesLocalData> {
  final Value<int> localId;
  final Value<String?> serverId;
  final Value<String> name;
  final Value<String> syncStatus;
  const CategoriesLocalCompanion({
    this.localId = const Value.absent(),
    this.serverId = const Value.absent(),
    this.name = const Value.absent(),
    this.syncStatus = const Value.absent(),
  });
  CategoriesLocalCompanion.insert({
    this.localId = const Value.absent(),
    this.serverId = const Value.absent(),
    required String name,
    this.syncStatus = const Value.absent(),
  }) : name = Value(name);
  static Insertable<CategoriesLocalData> custom({
    Expression<int>? localId,
    Expression<String>? serverId,
    Expression<String>? name,
    Expression<String>? syncStatus,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (serverId != null) 'server_id': serverId,
      if (name != null) 'name': name,
      if (syncStatus != null) 'sync_status': syncStatus,
    });
  }

  CategoriesLocalCompanion copyWith({
    Value<int>? localId,
    Value<String?>? serverId,
    Value<String>? name,
    Value<String>? syncStatus,
  }) {
    return CategoriesLocalCompanion(
      localId: localId ?? this.localId,
      serverId: serverId ?? this.serverId,
      name: name ?? this.name,
      syncStatus: syncStatus ?? this.syncStatus,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (serverId.present) {
      map['server_id'] = Variable<String>(serverId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesLocalCompanion(')
          ..write('localId: $localId, ')
          ..write('serverId: $serverId, ')
          ..write('name: $name, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }
}

class $MomentsLocalTable extends MomentsLocal
    with TableInfo<$MomentsLocalTable, MomentsLocalData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MomentsLocalTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localIdMeta = const VerificationMeta(
    'localId',
  );
  @override
  late final GeneratedColumn<int> localId = GeneratedColumn<int>(
    'local_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _serverIdMeta = const VerificationMeta(
    'serverId',
  );
  @override
  late final GeneratedColumn<String> serverId = GeneratedColumn<String>(
    'server_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _journalLocalIdMeta = const VerificationMeta(
    'journalLocalId',
  );
  @override
  late final GeneratedColumn<int> journalLocalId = GeneratedColumn<int>(
    'journal_local_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES journals_local (local_id)',
    ),
  );
  static const VerificationMeta _locationLocalIdMeta = const VerificationMeta(
    'locationLocalId',
  );
  @override
  late final GeneratedColumn<int> locationLocalId = GeneratedColumn<int>(
    'location_local_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES locations_local (local_id)',
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
  static const VerificationMeta _categoryLocalIdMeta = const VerificationMeta(
    'categoryLocalId',
  );
  @override
  late final GeneratedColumn<int> categoryLocalId = GeneratedColumn<int>(
    'category_local_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES categories_local (local_id)',
    ),
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumnWithTypeConverter<DateTime, String> timestamp =
      GeneratedColumn<String>(
        'timestamp',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<DateTime>($MomentsLocalTable.$convertertimestamp);
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumnWithTypeConverter<DateTime, String> updatedAt =
      GeneratedColumn<String>(
        'updated_at',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<DateTime>($MomentsLocalTable.$converterupdatedAt);
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(SyncStatus.pendingAdd),
  );
  @override
  List<GeneratedColumn> get $columns => [
    localId,
    serverId,
    journalLocalId,
    locationLocalId,
    name,
    description,
    categoryLocalId,
    timestamp,
    updatedAt,
    syncStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'moments_local';
  @override
  VerificationContext validateIntegrity(
    Insertable<MomentsLocalData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(
        _localIdMeta,
        localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta),
      );
    }
    if (data.containsKey('server_id')) {
      context.handle(
        _serverIdMeta,
        serverId.isAcceptableOrUnknown(data['server_id']!, _serverIdMeta),
      );
    }
    if (data.containsKey('journal_local_id')) {
      context.handle(
        _journalLocalIdMeta,
        journalLocalId.isAcceptableOrUnknown(
          data['journal_local_id']!,
          _journalLocalIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_journalLocalIdMeta);
    }
    if (data.containsKey('location_local_id')) {
      context.handle(
        _locationLocalIdMeta,
        locationLocalId.isAcceptableOrUnknown(
          data['location_local_id']!,
          _locationLocalIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_locationLocalIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
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
    if (data.containsKey('category_local_id')) {
      context.handle(
        _categoryLocalIdMeta,
        categoryLocalId.isAcceptableOrUnknown(
          data['category_local_id']!,
          _categoryLocalIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_categoryLocalIdMeta);
    }
    context.handle(_timestampMeta, const VerificationResult.success());
    context.handle(_updatedAtMeta, const VerificationResult.success());
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  MomentsLocalData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MomentsLocalData(
      localId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}local_id'],
          )!,
      serverId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}server_id'],
      ),
      journalLocalId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}journal_local_id'],
          )!,
      locationLocalId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}location_local_id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      categoryLocalId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}category_local_id'],
          )!,
      timestamp: $MomentsLocalTable.$convertertimestamp.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}timestamp'],
        )!,
      ),
      updatedAt: $MomentsLocalTable.$converterupdatedAt.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}updated_at'],
        )!,
      ),
      syncStatus:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}sync_status'],
          )!,
    );
  }

  @override
  $MomentsLocalTable createAlias(String alias) {
    return $MomentsLocalTable(attachedDatabase, alias);
  }

  static TypeConverter<DateTime, String> $convertertimestamp =
      const DateTimeConverter();
  static TypeConverter<DateTime, String> $converterupdatedAt =
      const DateTimeConverter();
}

class MomentsLocalData extends DataClass
    implements Insertable<MomentsLocalData> {
  final int localId;
  final String? serverId;
  final int journalLocalId;
  final int locationLocalId;
  final String name;
  final String? description;
  final int categoryLocalId;
  final DateTime timestamp;
  final DateTime updatedAt;
  final String syncStatus;
  const MomentsLocalData({
    required this.localId,
    this.serverId,
    required this.journalLocalId,
    required this.locationLocalId,
    required this.name,
    this.description,
    required this.categoryLocalId,
    required this.timestamp,
    required this.updatedAt,
    required this.syncStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<int>(localId);
    if (!nullToAbsent || serverId != null) {
      map['server_id'] = Variable<String>(serverId);
    }
    map['journal_local_id'] = Variable<int>(journalLocalId);
    map['location_local_id'] = Variable<int>(locationLocalId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['category_local_id'] = Variable<int>(categoryLocalId);
    {
      map['timestamp'] = Variable<String>(
        $MomentsLocalTable.$convertertimestamp.toSql(timestamp),
      );
    }
    {
      map['updated_at'] = Variable<String>(
        $MomentsLocalTable.$converterupdatedAt.toSql(updatedAt),
      );
    }
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  MomentsLocalCompanion toCompanion(bool nullToAbsent) {
    return MomentsLocalCompanion(
      localId: Value(localId),
      serverId:
          serverId == null && nullToAbsent
              ? const Value.absent()
              : Value(serverId),
      journalLocalId: Value(journalLocalId),
      locationLocalId: Value(locationLocalId),
      name: Value(name),
      description:
          description == null && nullToAbsent
              ? const Value.absent()
              : Value(description),
      categoryLocalId: Value(categoryLocalId),
      timestamp: Value(timestamp),
      updatedAt: Value(updatedAt),
      syncStatus: Value(syncStatus),
    );
  }

  factory MomentsLocalData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MomentsLocalData(
      localId: serializer.fromJson<int>(json['localId']),
      serverId: serializer.fromJson<String?>(json['serverId']),
      journalLocalId: serializer.fromJson<int>(json['journalLocalId']),
      locationLocalId: serializer.fromJson<int>(json['locationLocalId']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      categoryLocalId: serializer.fromJson<int>(json['categoryLocalId']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<int>(localId),
      'serverId': serializer.toJson<String?>(serverId),
      'journalLocalId': serializer.toJson<int>(journalLocalId),
      'locationLocalId': serializer.toJson<int>(locationLocalId),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'categoryLocalId': serializer.toJson<int>(categoryLocalId),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  MomentsLocalData copyWith({
    int? localId,
    Value<String?> serverId = const Value.absent(),
    int? journalLocalId,
    int? locationLocalId,
    String? name,
    Value<String?> description = const Value.absent(),
    int? categoryLocalId,
    DateTime? timestamp,
    DateTime? updatedAt,
    String? syncStatus,
  }) => MomentsLocalData(
    localId: localId ?? this.localId,
    serverId: serverId.present ? serverId.value : this.serverId,
    journalLocalId: journalLocalId ?? this.journalLocalId,
    locationLocalId: locationLocalId ?? this.locationLocalId,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    categoryLocalId: categoryLocalId ?? this.categoryLocalId,
    timestamp: timestamp ?? this.timestamp,
    updatedAt: updatedAt ?? this.updatedAt,
    syncStatus: syncStatus ?? this.syncStatus,
  );
  MomentsLocalData copyWithCompanion(MomentsLocalCompanion data) {
    return MomentsLocalData(
      localId: data.localId.present ? data.localId.value : this.localId,
      serverId: data.serverId.present ? data.serverId.value : this.serverId,
      journalLocalId:
          data.journalLocalId.present
              ? data.journalLocalId.value
              : this.journalLocalId,
      locationLocalId:
          data.locationLocalId.present
              ? data.locationLocalId.value
              : this.locationLocalId,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      categoryLocalId:
          data.categoryLocalId.present
              ? data.categoryLocalId.value
              : this.categoryLocalId,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MomentsLocalData(')
          ..write('localId: $localId, ')
          ..write('serverId: $serverId, ')
          ..write('journalLocalId: $journalLocalId, ')
          ..write('locationLocalId: $locationLocalId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('categoryLocalId: $categoryLocalId, ')
          ..write('timestamp: $timestamp, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    localId,
    serverId,
    journalLocalId,
    locationLocalId,
    name,
    description,
    categoryLocalId,
    timestamp,
    updatedAt,
    syncStatus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MomentsLocalData &&
          other.localId == this.localId &&
          other.serverId == this.serverId &&
          other.journalLocalId == this.journalLocalId &&
          other.locationLocalId == this.locationLocalId &&
          other.name == this.name &&
          other.description == this.description &&
          other.categoryLocalId == this.categoryLocalId &&
          other.timestamp == this.timestamp &&
          other.updatedAt == this.updatedAt &&
          other.syncStatus == this.syncStatus);
}

class MomentsLocalCompanion extends UpdateCompanion<MomentsLocalData> {
  final Value<int> localId;
  final Value<String?> serverId;
  final Value<int> journalLocalId;
  final Value<int> locationLocalId;
  final Value<String> name;
  final Value<String?> description;
  final Value<int> categoryLocalId;
  final Value<DateTime> timestamp;
  final Value<DateTime> updatedAt;
  final Value<String> syncStatus;
  const MomentsLocalCompanion({
    this.localId = const Value.absent(),
    this.serverId = const Value.absent(),
    this.journalLocalId = const Value.absent(),
    this.locationLocalId = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.categoryLocalId = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
  });
  MomentsLocalCompanion.insert({
    this.localId = const Value.absent(),
    this.serverId = const Value.absent(),
    required int journalLocalId,
    required int locationLocalId,
    required String name,
    this.description = const Value.absent(),
    required int categoryLocalId,
    required DateTime timestamp,
    required DateTime updatedAt,
    this.syncStatus = const Value.absent(),
  }) : journalLocalId = Value(journalLocalId),
       locationLocalId = Value(locationLocalId),
       name = Value(name),
       categoryLocalId = Value(categoryLocalId),
       timestamp = Value(timestamp),
       updatedAt = Value(updatedAt);
  static Insertable<MomentsLocalData> custom({
    Expression<int>? localId,
    Expression<String>? serverId,
    Expression<int>? journalLocalId,
    Expression<int>? locationLocalId,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? categoryLocalId,
    Expression<String>? timestamp,
    Expression<String>? updatedAt,
    Expression<String>? syncStatus,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (serverId != null) 'server_id': serverId,
      if (journalLocalId != null) 'journal_local_id': journalLocalId,
      if (locationLocalId != null) 'location_local_id': locationLocalId,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (categoryLocalId != null) 'category_local_id': categoryLocalId,
      if (timestamp != null) 'timestamp': timestamp,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
    });
  }

  MomentsLocalCompanion copyWith({
    Value<int>? localId,
    Value<String?>? serverId,
    Value<int>? journalLocalId,
    Value<int>? locationLocalId,
    Value<String>? name,
    Value<String?>? description,
    Value<int>? categoryLocalId,
    Value<DateTime>? timestamp,
    Value<DateTime>? updatedAt,
    Value<String>? syncStatus,
  }) {
    return MomentsLocalCompanion(
      localId: localId ?? this.localId,
      serverId: serverId ?? this.serverId,
      journalLocalId: journalLocalId ?? this.journalLocalId,
      locationLocalId: locationLocalId ?? this.locationLocalId,
      name: name ?? this.name,
      description: description ?? this.description,
      categoryLocalId: categoryLocalId ?? this.categoryLocalId,
      timestamp: timestamp ?? this.timestamp,
      updatedAt: updatedAt ?? this.updatedAt,
      syncStatus: syncStatus ?? this.syncStatus,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (serverId.present) {
      map['server_id'] = Variable<String>(serverId.value);
    }
    if (journalLocalId.present) {
      map['journal_local_id'] = Variable<int>(journalLocalId.value);
    }
    if (locationLocalId.present) {
      map['location_local_id'] = Variable<int>(locationLocalId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (categoryLocalId.present) {
      map['category_local_id'] = Variable<int>(categoryLocalId.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<String>(
        $MomentsLocalTable.$convertertimestamp.toSql(timestamp.value),
      );
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(
        $MomentsLocalTable.$converterupdatedAt.toSql(updatedAt.value),
      );
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MomentsLocalCompanion(')
          ..write('localId: $localId, ')
          ..write('serverId: $serverId, ')
          ..write('journalLocalId: $journalLocalId, ')
          ..write('locationLocalId: $locationLocalId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('categoryLocalId: $categoryLocalId, ')
          ..write('timestamp: $timestamp, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }
}

class $MomentMediaLocalTable extends MomentMediaLocal
    with TableInfo<$MomentMediaLocalTable, MomentMediaLocalData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MomentMediaLocalTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localIdMeta = const VerificationMeta(
    'localId',
  );
  @override
  late final GeneratedColumn<int> localId = GeneratedColumn<int>(
    'local_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _serverIdMeta = const VerificationMeta(
    'serverId',
  );
  @override
  late final GeneratedColumn<String> serverId = GeneratedColumn<String>(
    'server_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _momentLocalIdMeta = const VerificationMeta(
    'momentLocalId',
  );
  @override
  late final GeneratedColumn<int> momentLocalId = GeneratedColumn<int>(
    'moment_local_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES moments_local (local_id)',
    ),
  );
  static const VerificationMeta _mediaUrlMeta = const VerificationMeta(
    'mediaUrl',
  );
  @override
  late final GeneratedColumn<String> mediaUrl = GeneratedColumn<String>(
    'media_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mediaTypeMeta = const VerificationMeta(
    'mediaType',
  );
  @override
  late final GeneratedColumn<String> mediaType = GeneratedColumn<String>(
    'media_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _localFilePathMeta = const VerificationMeta(
    'localFilePath',
  );
  @override
  late final GeneratedColumn<String> localFilePath = GeneratedColumn<String>(
    'local_file_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumnWithTypeConverter<DateTime, String> updatedAt =
      GeneratedColumn<String>(
        'updated_at',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<DateTime>($MomentMediaLocalTable.$converterupdatedAt);
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(SyncStatus.pendingAdd),
  );
  @override
  List<GeneratedColumn> get $columns => [
    localId,
    serverId,
    momentLocalId,
    mediaUrl,
    mediaType,
    localFilePath,
    updatedAt,
    syncStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'moment_media_local';
  @override
  VerificationContext validateIntegrity(
    Insertable<MomentMediaLocalData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(
        _localIdMeta,
        localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta),
      );
    }
    if (data.containsKey('server_id')) {
      context.handle(
        _serverIdMeta,
        serverId.isAcceptableOrUnknown(data['server_id']!, _serverIdMeta),
      );
    }
    if (data.containsKey('moment_local_id')) {
      context.handle(
        _momentLocalIdMeta,
        momentLocalId.isAcceptableOrUnknown(
          data['moment_local_id']!,
          _momentLocalIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_momentLocalIdMeta);
    }
    if (data.containsKey('media_url')) {
      context.handle(
        _mediaUrlMeta,
        mediaUrl.isAcceptableOrUnknown(data['media_url']!, _mediaUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_mediaUrlMeta);
    }
    if (data.containsKey('media_type')) {
      context.handle(
        _mediaTypeMeta,
        mediaType.isAcceptableOrUnknown(data['media_type']!, _mediaTypeMeta),
      );
    }
    if (data.containsKey('local_file_path')) {
      context.handle(
        _localFilePathMeta,
        localFilePath.isAcceptableOrUnknown(
          data['local_file_path']!,
          _localFilePathMeta,
        ),
      );
    }
    context.handle(_updatedAtMeta, const VerificationResult.success());
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  MomentMediaLocalData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MomentMediaLocalData(
      localId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}local_id'],
          )!,
      serverId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}server_id'],
      ),
      momentLocalId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}moment_local_id'],
          )!,
      mediaUrl:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}media_url'],
          )!,
      mediaType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}media_type'],
      ),
      localFilePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local_file_path'],
      ),
      updatedAt: $MomentMediaLocalTable.$converterupdatedAt.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}updated_at'],
        )!,
      ),
      syncStatus:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}sync_status'],
          )!,
    );
  }

  @override
  $MomentMediaLocalTable createAlias(String alias) {
    return $MomentMediaLocalTable(attachedDatabase, alias);
  }

  static TypeConverter<DateTime, String> $converterupdatedAt =
      const DateTimeConverter();
}

class MomentMediaLocalData extends DataClass
    implements Insertable<MomentMediaLocalData> {
  final int localId;
  final String? serverId;
  final int momentLocalId;
  final String mediaUrl;
  final String? mediaType;
  final String? localFilePath;
  final DateTime updatedAt;
  final String syncStatus;
  const MomentMediaLocalData({
    required this.localId,
    this.serverId,
    required this.momentLocalId,
    required this.mediaUrl,
    this.mediaType,
    this.localFilePath,
    required this.updatedAt,
    required this.syncStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<int>(localId);
    if (!nullToAbsent || serverId != null) {
      map['server_id'] = Variable<String>(serverId);
    }
    map['moment_local_id'] = Variable<int>(momentLocalId);
    map['media_url'] = Variable<String>(mediaUrl);
    if (!nullToAbsent || mediaType != null) {
      map['media_type'] = Variable<String>(mediaType);
    }
    if (!nullToAbsent || localFilePath != null) {
      map['local_file_path'] = Variable<String>(localFilePath);
    }
    {
      map['updated_at'] = Variable<String>(
        $MomentMediaLocalTable.$converterupdatedAt.toSql(updatedAt),
      );
    }
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  MomentMediaLocalCompanion toCompanion(bool nullToAbsent) {
    return MomentMediaLocalCompanion(
      localId: Value(localId),
      serverId:
          serverId == null && nullToAbsent
              ? const Value.absent()
              : Value(serverId),
      momentLocalId: Value(momentLocalId),
      mediaUrl: Value(mediaUrl),
      mediaType:
          mediaType == null && nullToAbsent
              ? const Value.absent()
              : Value(mediaType),
      localFilePath:
          localFilePath == null && nullToAbsent
              ? const Value.absent()
              : Value(localFilePath),
      updatedAt: Value(updatedAt),
      syncStatus: Value(syncStatus),
    );
  }

  factory MomentMediaLocalData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MomentMediaLocalData(
      localId: serializer.fromJson<int>(json['localId']),
      serverId: serializer.fromJson<String?>(json['serverId']),
      momentLocalId: serializer.fromJson<int>(json['momentLocalId']),
      mediaUrl: serializer.fromJson<String>(json['mediaUrl']),
      mediaType: serializer.fromJson<String?>(json['mediaType']),
      localFilePath: serializer.fromJson<String?>(json['localFilePath']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<int>(localId),
      'serverId': serializer.toJson<String?>(serverId),
      'momentLocalId': serializer.toJson<int>(momentLocalId),
      'mediaUrl': serializer.toJson<String>(mediaUrl),
      'mediaType': serializer.toJson<String?>(mediaType),
      'localFilePath': serializer.toJson<String?>(localFilePath),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  MomentMediaLocalData copyWith({
    int? localId,
    Value<String?> serverId = const Value.absent(),
    int? momentLocalId,
    String? mediaUrl,
    Value<String?> mediaType = const Value.absent(),
    Value<String?> localFilePath = const Value.absent(),
    DateTime? updatedAt,
    String? syncStatus,
  }) => MomentMediaLocalData(
    localId: localId ?? this.localId,
    serverId: serverId.present ? serverId.value : this.serverId,
    momentLocalId: momentLocalId ?? this.momentLocalId,
    mediaUrl: mediaUrl ?? this.mediaUrl,
    mediaType: mediaType.present ? mediaType.value : this.mediaType,
    localFilePath:
        localFilePath.present ? localFilePath.value : this.localFilePath,
    updatedAt: updatedAt ?? this.updatedAt,
    syncStatus: syncStatus ?? this.syncStatus,
  );
  MomentMediaLocalData copyWithCompanion(MomentMediaLocalCompanion data) {
    return MomentMediaLocalData(
      localId: data.localId.present ? data.localId.value : this.localId,
      serverId: data.serverId.present ? data.serverId.value : this.serverId,
      momentLocalId:
          data.momentLocalId.present
              ? data.momentLocalId.value
              : this.momentLocalId,
      mediaUrl: data.mediaUrl.present ? data.mediaUrl.value : this.mediaUrl,
      mediaType: data.mediaType.present ? data.mediaType.value : this.mediaType,
      localFilePath:
          data.localFilePath.present
              ? data.localFilePath.value
              : this.localFilePath,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MomentMediaLocalData(')
          ..write('localId: $localId, ')
          ..write('serverId: $serverId, ')
          ..write('momentLocalId: $momentLocalId, ')
          ..write('mediaUrl: $mediaUrl, ')
          ..write('mediaType: $mediaType, ')
          ..write('localFilePath: $localFilePath, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    localId,
    serverId,
    momentLocalId,
    mediaUrl,
    mediaType,
    localFilePath,
    updatedAt,
    syncStatus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MomentMediaLocalData &&
          other.localId == this.localId &&
          other.serverId == this.serverId &&
          other.momentLocalId == this.momentLocalId &&
          other.mediaUrl == this.mediaUrl &&
          other.mediaType == this.mediaType &&
          other.localFilePath == this.localFilePath &&
          other.updatedAt == this.updatedAt &&
          other.syncStatus == this.syncStatus);
}

class MomentMediaLocalCompanion extends UpdateCompanion<MomentMediaLocalData> {
  final Value<int> localId;
  final Value<String?> serverId;
  final Value<int> momentLocalId;
  final Value<String> mediaUrl;
  final Value<String?> mediaType;
  final Value<String?> localFilePath;
  final Value<DateTime> updatedAt;
  final Value<String> syncStatus;
  const MomentMediaLocalCompanion({
    this.localId = const Value.absent(),
    this.serverId = const Value.absent(),
    this.momentLocalId = const Value.absent(),
    this.mediaUrl = const Value.absent(),
    this.mediaType = const Value.absent(),
    this.localFilePath = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
  });
  MomentMediaLocalCompanion.insert({
    this.localId = const Value.absent(),
    this.serverId = const Value.absent(),
    required int momentLocalId,
    required String mediaUrl,
    this.mediaType = const Value.absent(),
    this.localFilePath = const Value.absent(),
    required DateTime updatedAt,
    this.syncStatus = const Value.absent(),
  }) : momentLocalId = Value(momentLocalId),
       mediaUrl = Value(mediaUrl),
       updatedAt = Value(updatedAt);
  static Insertable<MomentMediaLocalData> custom({
    Expression<int>? localId,
    Expression<String>? serverId,
    Expression<int>? momentLocalId,
    Expression<String>? mediaUrl,
    Expression<String>? mediaType,
    Expression<String>? localFilePath,
    Expression<String>? updatedAt,
    Expression<String>? syncStatus,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (serverId != null) 'server_id': serverId,
      if (momentLocalId != null) 'moment_local_id': momentLocalId,
      if (mediaUrl != null) 'media_url': mediaUrl,
      if (mediaType != null) 'media_type': mediaType,
      if (localFilePath != null) 'local_file_path': localFilePath,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
    });
  }

  MomentMediaLocalCompanion copyWith({
    Value<int>? localId,
    Value<String?>? serverId,
    Value<int>? momentLocalId,
    Value<String>? mediaUrl,
    Value<String?>? mediaType,
    Value<String?>? localFilePath,
    Value<DateTime>? updatedAt,
    Value<String>? syncStatus,
  }) {
    return MomentMediaLocalCompanion(
      localId: localId ?? this.localId,
      serverId: serverId ?? this.serverId,
      momentLocalId: momentLocalId ?? this.momentLocalId,
      mediaUrl: mediaUrl ?? this.mediaUrl,
      mediaType: mediaType ?? this.mediaType,
      localFilePath: localFilePath ?? this.localFilePath,
      updatedAt: updatedAt ?? this.updatedAt,
      syncStatus: syncStatus ?? this.syncStatus,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (serverId.present) {
      map['server_id'] = Variable<String>(serverId.value);
    }
    if (momentLocalId.present) {
      map['moment_local_id'] = Variable<int>(momentLocalId.value);
    }
    if (mediaUrl.present) {
      map['media_url'] = Variable<String>(mediaUrl.value);
    }
    if (mediaType.present) {
      map['media_type'] = Variable<String>(mediaType.value);
    }
    if (localFilePath.present) {
      map['local_file_path'] = Variable<String>(localFilePath.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(
        $MomentMediaLocalTable.$converterupdatedAt.toSql(updatedAt.value),
      );
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MomentMediaLocalCompanion(')
          ..write('localId: $localId, ')
          ..write('serverId: $serverId, ')
          ..write('momentLocalId: $momentLocalId, ')
          ..write('mediaUrl: $mediaUrl, ')
          ..write('mediaType: $mediaType, ')
          ..write('localFilePath: $localFilePath, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }
}

class $SyncHistoryTable extends SyncHistory
    with TableInfo<$SyncHistoryTable, SyncHistoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncHistoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localIdMeta = const VerificationMeta(
    'localId',
  );
  @override
  late final GeneratedColumn<int> localId = GeneratedColumn<int>(
    'local_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _syncTypeMeta = const VerificationMeta(
    'syncType',
  );
  @override
  late final GeneratedColumn<String> syncType = GeneratedColumn<String>(
    'sync_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncTimeMeta = const VerificationMeta(
    'syncTime',
  );
  @override
  late final GeneratedColumnWithTypeConverter<DateTime, String> syncTime =
      GeneratedColumn<String>(
        'sync_time',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<DateTime>($SyncHistoryTable.$convertersyncTime);
  static const VerificationMeta _syncMessageMeta = const VerificationMeta(
    'syncMessage',
  );
  @override
  late final GeneratedColumn<String> syncMessage = GeneratedColumn<String>(
    'sync_message',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    localId,
    syncStatus,
    syncType,
    syncTime,
    syncMessage,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_history';
  @override
  VerificationContext validateIntegrity(
    Insertable<SyncHistoryData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(
        _localIdMeta,
        localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    } else if (isInserting) {
      context.missing(_syncStatusMeta);
    }
    if (data.containsKey('sync_type')) {
      context.handle(
        _syncTypeMeta,
        syncType.isAcceptableOrUnknown(data['sync_type']!, _syncTypeMeta),
      );
    }
    context.handle(_syncTimeMeta, const VerificationResult.success());
    if (data.containsKey('sync_message')) {
      context.handle(
        _syncMessageMeta,
        syncMessage.isAcceptableOrUnknown(
          data['sync_message']!,
          _syncMessageMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  SyncHistoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncHistoryData(
      localId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}local_id'],
          )!,
      syncStatus:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}sync_status'],
          )!,
      syncType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_type'],
      ),
      syncTime: $SyncHistoryTable.$convertersyncTime.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}sync_time'],
        )!,
      ),
      syncMessage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_message'],
      ),
    );
  }

  @override
  $SyncHistoryTable createAlias(String alias) {
    return $SyncHistoryTable(attachedDatabase, alias);
  }

  static TypeConverter<DateTime, String> $convertersyncTime =
      const DateTimeConverter();
}

class SyncHistoryData extends DataClass implements Insertable<SyncHistoryData> {
  final int localId;
  final String syncStatus;
  final String? syncType;
  final DateTime syncTime;
  final String? syncMessage;
  const SyncHistoryData({
    required this.localId,
    required this.syncStatus,
    this.syncType,
    required this.syncTime,
    this.syncMessage,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<int>(localId);
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || syncType != null) {
      map['sync_type'] = Variable<String>(syncType);
    }
    {
      map['sync_time'] = Variable<String>(
        $SyncHistoryTable.$convertersyncTime.toSql(syncTime),
      );
    }
    if (!nullToAbsent || syncMessage != null) {
      map['sync_message'] = Variable<String>(syncMessage);
    }
    return map;
  }

  SyncHistoryCompanion toCompanion(bool nullToAbsent) {
    return SyncHistoryCompanion(
      localId: Value(localId),
      syncStatus: Value(syncStatus),
      syncType:
          syncType == null && nullToAbsent
              ? const Value.absent()
              : Value(syncType),
      syncTime: Value(syncTime),
      syncMessage:
          syncMessage == null && nullToAbsent
              ? const Value.absent()
              : Value(syncMessage),
    );
  }

  factory SyncHistoryData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncHistoryData(
      localId: serializer.fromJson<int>(json['localId']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      syncType: serializer.fromJson<String?>(json['syncType']),
      syncTime: serializer.fromJson<DateTime>(json['syncTime']),
      syncMessage: serializer.fromJson<String?>(json['syncMessage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<int>(localId),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'syncType': serializer.toJson<String?>(syncType),
      'syncTime': serializer.toJson<DateTime>(syncTime),
      'syncMessage': serializer.toJson<String?>(syncMessage),
    };
  }

  SyncHistoryData copyWith({
    int? localId,
    String? syncStatus,
    Value<String?> syncType = const Value.absent(),
    DateTime? syncTime,
    Value<String?> syncMessage = const Value.absent(),
  }) => SyncHistoryData(
    localId: localId ?? this.localId,
    syncStatus: syncStatus ?? this.syncStatus,
    syncType: syncType.present ? syncType.value : this.syncType,
    syncTime: syncTime ?? this.syncTime,
    syncMessage: syncMessage.present ? syncMessage.value : this.syncMessage,
  );
  SyncHistoryData copyWithCompanion(SyncHistoryCompanion data) {
    return SyncHistoryData(
      localId: data.localId.present ? data.localId.value : this.localId,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
      syncType: data.syncType.present ? data.syncType.value : this.syncType,
      syncTime: data.syncTime.present ? data.syncTime.value : this.syncTime,
      syncMessage:
          data.syncMessage.present ? data.syncMessage.value : this.syncMessage,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncHistoryData(')
          ..write('localId: $localId, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('syncType: $syncType, ')
          ..write('syncTime: $syncTime, ')
          ..write('syncMessage: $syncMessage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(localId, syncStatus, syncType, syncTime, syncMessage);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncHistoryData &&
          other.localId == this.localId &&
          other.syncStatus == this.syncStatus &&
          other.syncType == this.syncType &&
          other.syncTime == this.syncTime &&
          other.syncMessage == this.syncMessage);
}

class SyncHistoryCompanion extends UpdateCompanion<SyncHistoryData> {
  final Value<int> localId;
  final Value<String> syncStatus;
  final Value<String?> syncType;
  final Value<DateTime> syncTime;
  final Value<String?> syncMessage;
  const SyncHistoryCompanion({
    this.localId = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.syncType = const Value.absent(),
    this.syncTime = const Value.absent(),
    this.syncMessage = const Value.absent(),
  });
  SyncHistoryCompanion.insert({
    this.localId = const Value.absent(),
    required String syncStatus,
    this.syncType = const Value.absent(),
    required DateTime syncTime,
    this.syncMessage = const Value.absent(),
  }) : syncStatus = Value(syncStatus),
       syncTime = Value(syncTime);
  static Insertable<SyncHistoryData> custom({
    Expression<int>? localId,
    Expression<String>? syncStatus,
    Expression<String>? syncType,
    Expression<String>? syncTime,
    Expression<String>? syncMessage,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (syncType != null) 'sync_type': syncType,
      if (syncTime != null) 'sync_time': syncTime,
      if (syncMessage != null) 'sync_message': syncMessage,
    });
  }

  SyncHistoryCompanion copyWith({
    Value<int>? localId,
    Value<String>? syncStatus,
    Value<String?>? syncType,
    Value<DateTime>? syncTime,
    Value<String?>? syncMessage,
  }) {
    return SyncHistoryCompanion(
      localId: localId ?? this.localId,
      syncStatus: syncStatus ?? this.syncStatus,
      syncType: syncType ?? this.syncType,
      syncTime: syncTime ?? this.syncTime,
      syncMessage: syncMessage ?? this.syncMessage,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (syncType.present) {
      map['sync_type'] = Variable<String>(syncType.value);
    }
    if (syncTime.present) {
      map['sync_time'] = Variable<String>(
        $SyncHistoryTable.$convertersyncTime.toSql(syncTime.value),
      );
    }
    if (syncMessage.present) {
      map['sync_message'] = Variable<String>(syncMessage.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncHistoryCompanion(')
          ..write('localId: $localId, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('syncType: $syncType, ')
          ..write('syncTime: $syncTime, ')
          ..write('syncMessage: $syncMessage')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ContinentsLocalTable continentsLocal = $ContinentsLocalTable(
    this,
  );
  late final $CountriesLocalTable countriesLocal = $CountriesLocalTable(this);
  late final $LocationsLocalTable locationsLocal = $LocationsLocalTable(this);
  late final $UsersLocalTable usersLocal = $UsersLocalTable(this);
  late final $UserProfilesLocalTable userProfilesLocal =
      $UserProfilesLocalTable(this);
  late final $UserVisitedCountriesLocalTable userVisitedCountriesLocal =
      $UserVisitedCountriesLocalTable(this);
  late final $JournalsLocalTable journalsLocal = $JournalsLocalTable(this);
  late final $CategoriesLocalTable categoriesLocal = $CategoriesLocalTable(
    this,
  );
  late final $MomentsLocalTable momentsLocal = $MomentsLocalTable(this);
  late final $MomentMediaLocalTable momentMediaLocal = $MomentMediaLocalTable(
    this,
  );
  late final $SyncHistoryTable syncHistory = $SyncHistoryTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    continentsLocal,
    countriesLocal,
    locationsLocal,
    usersLocal,
    userProfilesLocal,
    userVisitedCountriesLocal,
    journalsLocal,
    categoriesLocal,
    momentsLocal,
    momentMediaLocal,
    syncHistory,
  ];
}

typedef $$ContinentsLocalTableCreateCompanionBuilder =
    ContinentsLocalCompanion Function({
      Value<int> localId,
      Value<String?> serverId,
      required String name,
      Value<String?> code,
      Value<String> syncStatus,
    });
typedef $$ContinentsLocalTableUpdateCompanionBuilder =
    ContinentsLocalCompanion Function({
      Value<int> localId,
      Value<String?> serverId,
      Value<String> name,
      Value<String?> code,
      Value<String> syncStatus,
    });

final class $$ContinentsLocalTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ContinentsLocalTable,
          ContinentsLocalData
        > {
  $$ContinentsLocalTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$CountriesLocalTable, List<CountriesLocalData>>
  _countriesLocalRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.countriesLocal,
    aliasName: $_aliasNameGenerator(
      db.continentsLocal.localId,
      db.countriesLocal.continentLocalId,
    ),
  );

  $$CountriesLocalTableProcessedTableManager get countriesLocalRefs {
    final manager = $$CountriesLocalTableTableManager(
      $_db,
      $_db.countriesLocal,
    ).filter(
      (f) =>
          f.continentLocalId.localId.sqlEquals($_itemColumn<int>('local_id')!),
    );

    final cache = $_typedResult.readTableOrNull(_countriesLocalRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ContinentsLocalTableFilterComposer
    extends Composer<_$AppDatabase, $ContinentsLocalTable> {
  $$ContinentsLocalTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serverId => $composableBuilder(
    column: $table.serverId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> countriesLocalRefs(
    Expression<bool> Function($$CountriesLocalTableFilterComposer f) f,
  ) {
    final $$CountriesLocalTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.localId,
      referencedTable: $db.countriesLocal,
      getReferencedColumn: (t) => t.continentLocalId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CountriesLocalTableFilterComposer(
            $db: $db,
            $table: $db.countriesLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ContinentsLocalTableOrderingComposer
    extends Composer<_$AppDatabase, $ContinentsLocalTable> {
  $$ContinentsLocalTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serverId => $composableBuilder(
    column: $table.serverId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ContinentsLocalTableAnnotationComposer
    extends Composer<_$AppDatabase, $ContinentsLocalTable> {
  $$ContinentsLocalTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<String> get serverId =>
      $composableBuilder(column: $table.serverId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  Expression<T> countriesLocalRefs<T extends Object>(
    Expression<T> Function($$CountriesLocalTableAnnotationComposer a) f,
  ) {
    final $$CountriesLocalTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.localId,
      referencedTable: $db.countriesLocal,
      getReferencedColumn: (t) => t.continentLocalId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CountriesLocalTableAnnotationComposer(
            $db: $db,
            $table: $db.countriesLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ContinentsLocalTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ContinentsLocalTable,
          ContinentsLocalData,
          $$ContinentsLocalTableFilterComposer,
          $$ContinentsLocalTableOrderingComposer,
          $$ContinentsLocalTableAnnotationComposer,
          $$ContinentsLocalTableCreateCompanionBuilder,
          $$ContinentsLocalTableUpdateCompanionBuilder,
          (ContinentsLocalData, $$ContinentsLocalTableReferences),
          ContinentsLocalData,
          PrefetchHooks Function({bool countriesLocalRefs})
        > {
  $$ContinentsLocalTableTableManager(
    _$AppDatabase db,
    $ContinentsLocalTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () =>
                  $$ContinentsLocalTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$ContinentsLocalTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$ContinentsLocalTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<String?> serverId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> code = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
              }) => ContinentsLocalCompanion(
                localId: localId,
                serverId: serverId,
                name: name,
                code: code,
                syncStatus: syncStatus,
              ),
          createCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<String?> serverId = const Value.absent(),
                required String name,
                Value<String?> code = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
              }) => ContinentsLocalCompanion.insert(
                localId: localId,
                serverId: serverId,
                name: name,
                code: code,
                syncStatus: syncStatus,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$ContinentsLocalTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({countriesLocalRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (countriesLocalRefs) db.countriesLocal,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (countriesLocalRefs)
                    await $_getPrefetchedData<
                      ContinentsLocalData,
                      $ContinentsLocalTable,
                      CountriesLocalData
                    >(
                      currentTable: table,
                      referencedTable: $$ContinentsLocalTableReferences
                          ._countriesLocalRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$ContinentsLocalTableReferences(
                                db,
                                table,
                                p0,
                              ).countriesLocalRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.continentLocalId == item.localId,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ContinentsLocalTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ContinentsLocalTable,
      ContinentsLocalData,
      $$ContinentsLocalTableFilterComposer,
      $$ContinentsLocalTableOrderingComposer,
      $$ContinentsLocalTableAnnotationComposer,
      $$ContinentsLocalTableCreateCompanionBuilder,
      $$ContinentsLocalTableUpdateCompanionBuilder,
      (ContinentsLocalData, $$ContinentsLocalTableReferences),
      ContinentsLocalData,
      PrefetchHooks Function({bool countriesLocalRefs})
    >;
typedef $$CountriesLocalTableCreateCompanionBuilder =
    CountriesLocalCompanion Function({
      Value<int> localId,
      Value<String?> serverId,
      required int continentLocalId,
      required String name,
      Value<String?> isoCode,
      Value<String> syncStatus,
    });
typedef $$CountriesLocalTableUpdateCompanionBuilder =
    CountriesLocalCompanion Function({
      Value<int> localId,
      Value<String?> serverId,
      Value<int> continentLocalId,
      Value<String> name,
      Value<String?> isoCode,
      Value<String> syncStatus,
    });

final class $$CountriesLocalTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $CountriesLocalTable,
          CountriesLocalData
        > {
  $$CountriesLocalTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ContinentsLocalTable _continentLocalIdTable(_$AppDatabase db) =>
      db.continentsLocal.createAlias(
        $_aliasNameGenerator(
          db.countriesLocal.continentLocalId,
          db.continentsLocal.localId,
        ),
      );

  $$ContinentsLocalTableProcessedTableManager get continentLocalId {
    final $_column = $_itemColumn<int>('continent_local_id')!;

    final manager = $$ContinentsLocalTableTableManager(
      $_db,
      $_db.continentsLocal,
    ).filter((f) => f.localId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_continentLocalIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$LocationsLocalTable, List<LocationsLocalData>>
  _locationsLocalRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.locationsLocal,
    aliasName: $_aliasNameGenerator(
      db.countriesLocal.localId,
      db.locationsLocal.countryLocalId,
    ),
  );

  $$LocationsLocalTableProcessedTableManager get locationsLocalRefs {
    final manager = $$LocationsLocalTableTableManager(
      $_db,
      $_db.locationsLocal,
    ).filter(
      (f) => f.countryLocalId.localId.sqlEquals($_itemColumn<int>('local_id')!),
    );

    final cache = $_typedResult.readTableOrNull(_locationsLocalRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $UserVisitedCountriesLocalTable,
    List<UserVisitedCountriesLocalData>
  >
  _userVisitedCountriesLocalRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.userVisitedCountriesLocal,
        aliasName: $_aliasNameGenerator(
          db.countriesLocal.localId,
          db.userVisitedCountriesLocal.countryLocalId,
        ),
      );

  $$UserVisitedCountriesLocalTableProcessedTableManager
  get userVisitedCountriesLocalRefs {
    final manager = $$UserVisitedCountriesLocalTableTableManager(
      $_db,
      $_db.userVisitedCountriesLocal,
    ).filter(
      (f) => f.countryLocalId.localId.sqlEquals($_itemColumn<int>('local_id')!),
    );

    final cache = $_typedResult.readTableOrNull(
      _userVisitedCountriesLocalRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CountriesLocalTableFilterComposer
    extends Composer<_$AppDatabase, $CountriesLocalTable> {
  $$CountriesLocalTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serverId => $composableBuilder(
    column: $table.serverId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get isoCode => $composableBuilder(
    column: $table.isoCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  $$ContinentsLocalTableFilterComposer get continentLocalId {
    final $$ContinentsLocalTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.continentLocalId,
      referencedTable: $db.continentsLocal,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ContinentsLocalTableFilterComposer(
            $db: $db,
            $table: $db.continentsLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> locationsLocalRefs(
    Expression<bool> Function($$LocationsLocalTableFilterComposer f) f,
  ) {
    final $$LocationsLocalTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.localId,
      referencedTable: $db.locationsLocal,
      getReferencedColumn: (t) => t.countryLocalId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocationsLocalTableFilterComposer(
            $db: $db,
            $table: $db.locationsLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> userVisitedCountriesLocalRefs(
    Expression<bool> Function($$UserVisitedCountriesLocalTableFilterComposer f)
    f,
  ) {
    final $$UserVisitedCountriesLocalTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.localId,
          referencedTable: $db.userVisitedCountriesLocal,
          getReferencedColumn: (t) => t.countryLocalId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$UserVisitedCountriesLocalTableFilterComposer(
                $db: $db,
                $table: $db.userVisitedCountriesLocal,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$CountriesLocalTableOrderingComposer
    extends Composer<_$AppDatabase, $CountriesLocalTable> {
  $$CountriesLocalTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serverId => $composableBuilder(
    column: $table.serverId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get isoCode => $composableBuilder(
    column: $table.isoCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  $$ContinentsLocalTableOrderingComposer get continentLocalId {
    final $$ContinentsLocalTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.continentLocalId,
      referencedTable: $db.continentsLocal,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ContinentsLocalTableOrderingComposer(
            $db: $db,
            $table: $db.continentsLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CountriesLocalTableAnnotationComposer
    extends Composer<_$AppDatabase, $CountriesLocalTable> {
  $$CountriesLocalTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<String> get serverId =>
      $composableBuilder(column: $table.serverId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get isoCode =>
      $composableBuilder(column: $table.isoCode, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  $$ContinentsLocalTableAnnotationComposer get continentLocalId {
    final $$ContinentsLocalTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.continentLocalId,
      referencedTable: $db.continentsLocal,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ContinentsLocalTableAnnotationComposer(
            $db: $db,
            $table: $db.continentsLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> locationsLocalRefs<T extends Object>(
    Expression<T> Function($$LocationsLocalTableAnnotationComposer a) f,
  ) {
    final $$LocationsLocalTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.localId,
      referencedTable: $db.locationsLocal,
      getReferencedColumn: (t) => t.countryLocalId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocationsLocalTableAnnotationComposer(
            $db: $db,
            $table: $db.locationsLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> userVisitedCountriesLocalRefs<T extends Object>(
    Expression<T> Function($$UserVisitedCountriesLocalTableAnnotationComposer a)
    f,
  ) {
    final $$UserVisitedCountriesLocalTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.localId,
          referencedTable: $db.userVisitedCountriesLocal,
          getReferencedColumn: (t) => t.countryLocalId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$UserVisitedCountriesLocalTableAnnotationComposer(
                $db: $db,
                $table: $db.userVisitedCountriesLocal,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$CountriesLocalTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CountriesLocalTable,
          CountriesLocalData,
          $$CountriesLocalTableFilterComposer,
          $$CountriesLocalTableOrderingComposer,
          $$CountriesLocalTableAnnotationComposer,
          $$CountriesLocalTableCreateCompanionBuilder,
          $$CountriesLocalTableUpdateCompanionBuilder,
          (CountriesLocalData, $$CountriesLocalTableReferences),
          CountriesLocalData,
          PrefetchHooks Function({
            bool continentLocalId,
            bool locationsLocalRefs,
            bool userVisitedCountriesLocalRefs,
          })
        > {
  $$CountriesLocalTableTableManager(
    _$AppDatabase db,
    $CountriesLocalTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$CountriesLocalTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$CountriesLocalTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$CountriesLocalTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<String?> serverId = const Value.absent(),
                Value<int> continentLocalId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> isoCode = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
              }) => CountriesLocalCompanion(
                localId: localId,
                serverId: serverId,
                continentLocalId: continentLocalId,
                name: name,
                isoCode: isoCode,
                syncStatus: syncStatus,
              ),
          createCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<String?> serverId = const Value.absent(),
                required int continentLocalId,
                required String name,
                Value<String?> isoCode = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
              }) => CountriesLocalCompanion.insert(
                localId: localId,
                serverId: serverId,
                continentLocalId: continentLocalId,
                name: name,
                isoCode: isoCode,
                syncStatus: syncStatus,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$CountriesLocalTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({
            continentLocalId = false,
            locationsLocalRefs = false,
            userVisitedCountriesLocalRefs = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (locationsLocalRefs) db.locationsLocal,
                if (userVisitedCountriesLocalRefs) db.userVisitedCountriesLocal,
              ],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (continentLocalId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.continentLocalId,
                            referencedTable: $$CountriesLocalTableReferences
                                ._continentLocalIdTable(db),
                            referencedColumn:
                                $$CountriesLocalTableReferences
                                    ._continentLocalIdTable(db)
                                    .localId,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (locationsLocalRefs)
                    await $_getPrefetchedData<
                      CountriesLocalData,
                      $CountriesLocalTable,
                      LocationsLocalData
                    >(
                      currentTable: table,
                      referencedTable: $$CountriesLocalTableReferences
                          ._locationsLocalRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$CountriesLocalTableReferences(
                                db,
                                table,
                                p0,
                              ).locationsLocalRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.countryLocalId == item.localId,
                          ),
                      typedResults: items,
                    ),
                  if (userVisitedCountriesLocalRefs)
                    await $_getPrefetchedData<
                      CountriesLocalData,
                      $CountriesLocalTable,
                      UserVisitedCountriesLocalData
                    >(
                      currentTable: table,
                      referencedTable: $$CountriesLocalTableReferences
                          ._userVisitedCountriesLocalRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$CountriesLocalTableReferences(
                                db,
                                table,
                                p0,
                              ).userVisitedCountriesLocalRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.countryLocalId == item.localId,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CountriesLocalTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CountriesLocalTable,
      CountriesLocalData,
      $$CountriesLocalTableFilterComposer,
      $$CountriesLocalTableOrderingComposer,
      $$CountriesLocalTableAnnotationComposer,
      $$CountriesLocalTableCreateCompanionBuilder,
      $$CountriesLocalTableUpdateCompanionBuilder,
      (CountriesLocalData, $$CountriesLocalTableReferences),
      CountriesLocalData,
      PrefetchHooks Function({
        bool continentLocalId,
        bool locationsLocalRefs,
        bool userVisitedCountriesLocalRefs,
      })
    >;
typedef $$LocationsLocalTableCreateCompanionBuilder =
    LocationsLocalCompanion Function({
      Value<int> localId,
      Value<String?> serverId,
      required double latitude,
      required double longitude,
      Value<String?> formattedAddress,
      Value<String?> city,
      Value<String?> state,
      Value<String?> googlePlaceId,
      required int countryLocalId,
      required DateTime updatedAt,
      Value<String> syncStatus,
    });
typedef $$LocationsLocalTableUpdateCompanionBuilder =
    LocationsLocalCompanion Function({
      Value<int> localId,
      Value<String?> serverId,
      Value<double> latitude,
      Value<double> longitude,
      Value<String?> formattedAddress,
      Value<String?> city,
      Value<String?> state,
      Value<String?> googlePlaceId,
      Value<int> countryLocalId,
      Value<DateTime> updatedAt,
      Value<String> syncStatus,
    });

final class $$LocationsLocalTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $LocationsLocalTable,
          LocationsLocalData
        > {
  $$LocationsLocalTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CountriesLocalTable _countryLocalIdTable(_$AppDatabase db) =>
      db.countriesLocal.createAlias(
        $_aliasNameGenerator(
          db.locationsLocal.countryLocalId,
          db.countriesLocal.localId,
        ),
      );

  $$CountriesLocalTableProcessedTableManager get countryLocalId {
    final $_column = $_itemColumn<int>('country_local_id')!;

    final manager = $$CountriesLocalTableTableManager(
      $_db,
      $_db.countriesLocal,
    ).filter((f) => f.localId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_countryLocalIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $UserProfilesLocalTable,
    List<UserProfilesLocalData>
  >
  _userProfilesLocalRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.userProfilesLocal,
        aliasName: $_aliasNameGenerator(
          db.locationsLocal.localId,
          db.userProfilesLocal.locationLocalId,
        ),
      );

  $$UserProfilesLocalTableProcessedTableManager get userProfilesLocalRefs {
    final manager = $$UserProfilesLocalTableTableManager(
      $_db,
      $_db.userProfilesLocal,
    ).filter(
      (f) =>
          f.locationLocalId.localId.sqlEquals($_itemColumn<int>('local_id')!),
    );

    final cache = $_typedResult.readTableOrNull(
      _userProfilesLocalRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$JournalsLocalTable, List<JournalsLocalData>>
  _journalsLocalRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.journalsLocal,
    aliasName: $_aliasNameGenerator(
      db.locationsLocal.localId,
      db.journalsLocal.locationLocalId,
    ),
  );

  $$JournalsLocalTableProcessedTableManager get journalsLocalRefs {
    final manager = $$JournalsLocalTableTableManager(
      $_db,
      $_db.journalsLocal,
    ).filter(
      (f) =>
          f.locationLocalId.localId.sqlEquals($_itemColumn<int>('local_id')!),
    );

    final cache = $_typedResult.readTableOrNull(_journalsLocalRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MomentsLocalTable, List<MomentsLocalData>>
  _momentsLocalRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.momentsLocal,
    aliasName: $_aliasNameGenerator(
      db.locationsLocal.localId,
      db.momentsLocal.locationLocalId,
    ),
  );

  $$MomentsLocalTableProcessedTableManager get momentsLocalRefs {
    final manager = $$MomentsLocalTableTableManager(
      $_db,
      $_db.momentsLocal,
    ).filter(
      (f) =>
          f.locationLocalId.localId.sqlEquals($_itemColumn<int>('local_id')!),
    );

    final cache = $_typedResult.readTableOrNull(_momentsLocalRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$LocationsLocalTableFilterComposer
    extends Composer<_$AppDatabase, $LocationsLocalTable> {
  $$LocationsLocalTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serverId => $composableBuilder(
    column: $table.serverId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get formattedAddress => $composableBuilder(
    column: $table.formattedAddress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get state => $composableBuilder(
    column: $table.state,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get googlePlaceId => $composableBuilder(
    column: $table.googlePlaceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<DateTime, DateTime, String> get updatedAt =>
      $composableBuilder(
        column: $table.updatedAt,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  $$CountriesLocalTableFilterComposer get countryLocalId {
    final $$CountriesLocalTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.countryLocalId,
      referencedTable: $db.countriesLocal,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CountriesLocalTableFilterComposer(
            $db: $db,
            $table: $db.countriesLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> userProfilesLocalRefs(
    Expression<bool> Function($$UserProfilesLocalTableFilterComposer f) f,
  ) {
    final $$UserProfilesLocalTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.localId,
      referencedTable: $db.userProfilesLocal,
      getReferencedColumn: (t) => t.locationLocalId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserProfilesLocalTableFilterComposer(
            $db: $db,
            $table: $db.userProfilesLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> journalsLocalRefs(
    Expression<bool> Function($$JournalsLocalTableFilterComposer f) f,
  ) {
    final $$JournalsLocalTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.localId,
      referencedTable: $db.journalsLocal,
      getReferencedColumn: (t) => t.locationLocalId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$JournalsLocalTableFilterComposer(
            $db: $db,
            $table: $db.journalsLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> momentsLocalRefs(
    Expression<bool> Function($$MomentsLocalTableFilterComposer f) f,
  ) {
    final $$MomentsLocalTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.localId,
      referencedTable: $db.momentsLocal,
      getReferencedColumn: (t) => t.locationLocalId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentsLocalTableFilterComposer(
            $db: $db,
            $table: $db.momentsLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LocationsLocalTableOrderingComposer
    extends Composer<_$AppDatabase, $LocationsLocalTable> {
  $$LocationsLocalTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serverId => $composableBuilder(
    column: $table.serverId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get formattedAddress => $composableBuilder(
    column: $table.formattedAddress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get state => $composableBuilder(
    column: $table.state,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get googlePlaceId => $composableBuilder(
    column: $table.googlePlaceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  $$CountriesLocalTableOrderingComposer get countryLocalId {
    final $$CountriesLocalTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.countryLocalId,
      referencedTable: $db.countriesLocal,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CountriesLocalTableOrderingComposer(
            $db: $db,
            $table: $db.countriesLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LocationsLocalTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocationsLocalTable> {
  $$LocationsLocalTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<String> get serverId =>
      $composableBuilder(column: $table.serverId, builder: (column) => column);

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<String> get formattedAddress => $composableBuilder(
    column: $table.formattedAddress,
    builder: (column) => column,
  );

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumn<String> get state =>
      $composableBuilder(column: $table.state, builder: (column) => column);

  GeneratedColumn<String> get googlePlaceId => $composableBuilder(
    column: $table.googlePlaceId,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<DateTime, String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  $$CountriesLocalTableAnnotationComposer get countryLocalId {
    final $$CountriesLocalTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.countryLocalId,
      referencedTable: $db.countriesLocal,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CountriesLocalTableAnnotationComposer(
            $db: $db,
            $table: $db.countriesLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> userProfilesLocalRefs<T extends Object>(
    Expression<T> Function($$UserProfilesLocalTableAnnotationComposer a) f,
  ) {
    final $$UserProfilesLocalTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.localId,
          referencedTable: $db.userProfilesLocal,
          getReferencedColumn: (t) => t.locationLocalId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$UserProfilesLocalTableAnnotationComposer(
                $db: $db,
                $table: $db.userProfilesLocal,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> journalsLocalRefs<T extends Object>(
    Expression<T> Function($$JournalsLocalTableAnnotationComposer a) f,
  ) {
    final $$JournalsLocalTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.localId,
      referencedTable: $db.journalsLocal,
      getReferencedColumn: (t) => t.locationLocalId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$JournalsLocalTableAnnotationComposer(
            $db: $db,
            $table: $db.journalsLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> momentsLocalRefs<T extends Object>(
    Expression<T> Function($$MomentsLocalTableAnnotationComposer a) f,
  ) {
    final $$MomentsLocalTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.localId,
      referencedTable: $db.momentsLocal,
      getReferencedColumn: (t) => t.locationLocalId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentsLocalTableAnnotationComposer(
            $db: $db,
            $table: $db.momentsLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LocationsLocalTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LocationsLocalTable,
          LocationsLocalData,
          $$LocationsLocalTableFilterComposer,
          $$LocationsLocalTableOrderingComposer,
          $$LocationsLocalTableAnnotationComposer,
          $$LocationsLocalTableCreateCompanionBuilder,
          $$LocationsLocalTableUpdateCompanionBuilder,
          (LocationsLocalData, $$LocationsLocalTableReferences),
          LocationsLocalData,
          PrefetchHooks Function({
            bool countryLocalId,
            bool userProfilesLocalRefs,
            bool journalsLocalRefs,
            bool momentsLocalRefs,
          })
        > {
  $$LocationsLocalTableTableManager(
    _$AppDatabase db,
    $LocationsLocalTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$LocationsLocalTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$LocationsLocalTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$LocationsLocalTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<String?> serverId = const Value.absent(),
                Value<double> latitude = const Value.absent(),
                Value<double> longitude = const Value.absent(),
                Value<String?> formattedAddress = const Value.absent(),
                Value<String?> city = const Value.absent(),
                Value<String?> state = const Value.absent(),
                Value<String?> googlePlaceId = const Value.absent(),
                Value<int> countryLocalId = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
              }) => LocationsLocalCompanion(
                localId: localId,
                serverId: serverId,
                latitude: latitude,
                longitude: longitude,
                formattedAddress: formattedAddress,
                city: city,
                state: state,
                googlePlaceId: googlePlaceId,
                countryLocalId: countryLocalId,
                updatedAt: updatedAt,
                syncStatus: syncStatus,
              ),
          createCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<String?> serverId = const Value.absent(),
                required double latitude,
                required double longitude,
                Value<String?> formattedAddress = const Value.absent(),
                Value<String?> city = const Value.absent(),
                Value<String?> state = const Value.absent(),
                Value<String?> googlePlaceId = const Value.absent(),
                required int countryLocalId,
                required DateTime updatedAt,
                Value<String> syncStatus = const Value.absent(),
              }) => LocationsLocalCompanion.insert(
                localId: localId,
                serverId: serverId,
                latitude: latitude,
                longitude: longitude,
                formattedAddress: formattedAddress,
                city: city,
                state: state,
                googlePlaceId: googlePlaceId,
                countryLocalId: countryLocalId,
                updatedAt: updatedAt,
                syncStatus: syncStatus,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$LocationsLocalTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({
            countryLocalId = false,
            userProfilesLocalRefs = false,
            journalsLocalRefs = false,
            momentsLocalRefs = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (userProfilesLocalRefs) db.userProfilesLocal,
                if (journalsLocalRefs) db.journalsLocal,
                if (momentsLocalRefs) db.momentsLocal,
              ],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (countryLocalId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.countryLocalId,
                            referencedTable: $$LocationsLocalTableReferences
                                ._countryLocalIdTable(db),
                            referencedColumn:
                                $$LocationsLocalTableReferences
                                    ._countryLocalIdTable(db)
                                    .localId,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (userProfilesLocalRefs)
                    await $_getPrefetchedData<
                      LocationsLocalData,
                      $LocationsLocalTable,
                      UserProfilesLocalData
                    >(
                      currentTable: table,
                      referencedTable: $$LocationsLocalTableReferences
                          ._userProfilesLocalRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$LocationsLocalTableReferences(
                                db,
                                table,
                                p0,
                              ).userProfilesLocalRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.locationLocalId == item.localId,
                          ),
                      typedResults: items,
                    ),
                  if (journalsLocalRefs)
                    await $_getPrefetchedData<
                      LocationsLocalData,
                      $LocationsLocalTable,
                      JournalsLocalData
                    >(
                      currentTable: table,
                      referencedTable: $$LocationsLocalTableReferences
                          ._journalsLocalRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$LocationsLocalTableReferences(
                                db,
                                table,
                                p0,
                              ).journalsLocalRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.locationLocalId == item.localId,
                          ),
                      typedResults: items,
                    ),
                  if (momentsLocalRefs)
                    await $_getPrefetchedData<
                      LocationsLocalData,
                      $LocationsLocalTable,
                      MomentsLocalData
                    >(
                      currentTable: table,
                      referencedTable: $$LocationsLocalTableReferences
                          ._momentsLocalRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$LocationsLocalTableReferences(
                                db,
                                table,
                                p0,
                              ).momentsLocalRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.locationLocalId == item.localId,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$LocationsLocalTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LocationsLocalTable,
      LocationsLocalData,
      $$LocationsLocalTableFilterComposer,
      $$LocationsLocalTableOrderingComposer,
      $$LocationsLocalTableAnnotationComposer,
      $$LocationsLocalTableCreateCompanionBuilder,
      $$LocationsLocalTableUpdateCompanionBuilder,
      (LocationsLocalData, $$LocationsLocalTableReferences),
      LocationsLocalData,
      PrefetchHooks Function({
        bool countryLocalId,
        bool userProfilesLocalRefs,
        bool journalsLocalRefs,
        bool momentsLocalRefs,
      })
    >;
typedef $$UsersLocalTableCreateCompanionBuilder =
    UsersLocalCompanion Function({
      Value<int> localId,
      Value<String?> serverId,
      required String email,
      required bool isVerified,
      required DateTime updatedAt,
      Value<String> syncStatus,
    });
typedef $$UsersLocalTableUpdateCompanionBuilder =
    UsersLocalCompanion Function({
      Value<int> localId,
      Value<String?> serverId,
      Value<String> email,
      Value<bool> isVerified,
      Value<DateTime> updatedAt,
      Value<String> syncStatus,
    });

final class $$UsersLocalTableReferences
    extends BaseReferences<_$AppDatabase, $UsersLocalTable, UsersLocalData> {
  $$UsersLocalTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<
    $UserProfilesLocalTable,
    List<UserProfilesLocalData>
  >
  _userProfilesLocalRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.userProfilesLocal,
        aliasName: $_aliasNameGenerator(
          db.usersLocal.localId,
          db.userProfilesLocal.userLocalId,
        ),
      );

  $$UserProfilesLocalTableProcessedTableManager get userProfilesLocalRefs {
    final manager = $$UserProfilesLocalTableTableManager(
      $_db,
      $_db.userProfilesLocal,
    ).filter(
      (f) => f.userLocalId.localId.sqlEquals($_itemColumn<int>('local_id')!),
    );

    final cache = $_typedResult.readTableOrNull(
      _userProfilesLocalRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $UserVisitedCountriesLocalTable,
    List<UserVisitedCountriesLocalData>
  >
  _userVisitedCountriesLocalRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.userVisitedCountriesLocal,
        aliasName: $_aliasNameGenerator(
          db.usersLocal.localId,
          db.userVisitedCountriesLocal.userLocalId,
        ),
      );

  $$UserVisitedCountriesLocalTableProcessedTableManager
  get userVisitedCountriesLocalRefs {
    final manager = $$UserVisitedCountriesLocalTableTableManager(
      $_db,
      $_db.userVisitedCountriesLocal,
    ).filter(
      (f) => f.userLocalId.localId.sqlEquals($_itemColumn<int>('local_id')!),
    );

    final cache = $_typedResult.readTableOrNull(
      _userVisitedCountriesLocalRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$JournalsLocalTable, List<JournalsLocalData>>
  _journalsLocalRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.journalsLocal,
    aliasName: $_aliasNameGenerator(
      db.usersLocal.localId,
      db.journalsLocal.userLocalId,
    ),
  );

  $$JournalsLocalTableProcessedTableManager get journalsLocalRefs {
    final manager = $$JournalsLocalTableTableManager(
      $_db,
      $_db.journalsLocal,
    ).filter(
      (f) => f.userLocalId.localId.sqlEquals($_itemColumn<int>('local_id')!),
    );

    final cache = $_typedResult.readTableOrNull(_journalsLocalRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UsersLocalTableFilterComposer
    extends Composer<_$AppDatabase, $UsersLocalTable> {
  $$UsersLocalTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serverId => $composableBuilder(
    column: $table.serverId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isVerified => $composableBuilder(
    column: $table.isVerified,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<DateTime, DateTime, String> get updatedAt =>
      $composableBuilder(
        column: $table.updatedAt,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> userProfilesLocalRefs(
    Expression<bool> Function($$UserProfilesLocalTableFilterComposer f) f,
  ) {
    final $$UserProfilesLocalTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.localId,
      referencedTable: $db.userProfilesLocal,
      getReferencedColumn: (t) => t.userLocalId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserProfilesLocalTableFilterComposer(
            $db: $db,
            $table: $db.userProfilesLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> userVisitedCountriesLocalRefs(
    Expression<bool> Function($$UserVisitedCountriesLocalTableFilterComposer f)
    f,
  ) {
    final $$UserVisitedCountriesLocalTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.localId,
          referencedTable: $db.userVisitedCountriesLocal,
          getReferencedColumn: (t) => t.userLocalId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$UserVisitedCountriesLocalTableFilterComposer(
                $db: $db,
                $table: $db.userVisitedCountriesLocal,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> journalsLocalRefs(
    Expression<bool> Function($$JournalsLocalTableFilterComposer f) f,
  ) {
    final $$JournalsLocalTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.localId,
      referencedTable: $db.journalsLocal,
      getReferencedColumn: (t) => t.userLocalId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$JournalsLocalTableFilterComposer(
            $db: $db,
            $table: $db.journalsLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsersLocalTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersLocalTable> {
  $$UsersLocalTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serverId => $composableBuilder(
    column: $table.serverId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isVerified => $composableBuilder(
    column: $table.isVerified,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UsersLocalTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersLocalTable> {
  $$UsersLocalTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<String> get serverId =>
      $composableBuilder(column: $table.serverId, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<bool> get isVerified => $composableBuilder(
    column: $table.isVerified,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<DateTime, String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  Expression<T> userProfilesLocalRefs<T extends Object>(
    Expression<T> Function($$UserProfilesLocalTableAnnotationComposer a) f,
  ) {
    final $$UserProfilesLocalTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.localId,
          referencedTable: $db.userProfilesLocal,
          getReferencedColumn: (t) => t.userLocalId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$UserProfilesLocalTableAnnotationComposer(
                $db: $db,
                $table: $db.userProfilesLocal,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> userVisitedCountriesLocalRefs<T extends Object>(
    Expression<T> Function($$UserVisitedCountriesLocalTableAnnotationComposer a)
    f,
  ) {
    final $$UserVisitedCountriesLocalTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.localId,
          referencedTable: $db.userVisitedCountriesLocal,
          getReferencedColumn: (t) => t.userLocalId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$UserVisitedCountriesLocalTableAnnotationComposer(
                $db: $db,
                $table: $db.userVisitedCountriesLocal,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> journalsLocalRefs<T extends Object>(
    Expression<T> Function($$JournalsLocalTableAnnotationComposer a) f,
  ) {
    final $$JournalsLocalTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.localId,
      referencedTable: $db.journalsLocal,
      getReferencedColumn: (t) => t.userLocalId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$JournalsLocalTableAnnotationComposer(
            $db: $db,
            $table: $db.journalsLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsersLocalTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsersLocalTable,
          UsersLocalData,
          $$UsersLocalTableFilterComposer,
          $$UsersLocalTableOrderingComposer,
          $$UsersLocalTableAnnotationComposer,
          $$UsersLocalTableCreateCompanionBuilder,
          $$UsersLocalTableUpdateCompanionBuilder,
          (UsersLocalData, $$UsersLocalTableReferences),
          UsersLocalData,
          PrefetchHooks Function({
            bool userProfilesLocalRefs,
            bool userVisitedCountriesLocalRefs,
            bool journalsLocalRefs,
          })
        > {
  $$UsersLocalTableTableManager(_$AppDatabase db, $UsersLocalTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$UsersLocalTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$UsersLocalTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$UsersLocalTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<String?> serverId = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<bool> isVerified = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
              }) => UsersLocalCompanion(
                localId: localId,
                serverId: serverId,
                email: email,
                isVerified: isVerified,
                updatedAt: updatedAt,
                syncStatus: syncStatus,
              ),
          createCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<String?> serverId = const Value.absent(),
                required String email,
                required bool isVerified,
                required DateTime updatedAt,
                Value<String> syncStatus = const Value.absent(),
              }) => UsersLocalCompanion.insert(
                localId: localId,
                serverId: serverId,
                email: email,
                isVerified: isVerified,
                updatedAt: updatedAt,
                syncStatus: syncStatus,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$UsersLocalTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({
            userProfilesLocalRefs = false,
            userVisitedCountriesLocalRefs = false,
            journalsLocalRefs = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (userProfilesLocalRefs) db.userProfilesLocal,
                if (userVisitedCountriesLocalRefs) db.userVisitedCountriesLocal,
                if (journalsLocalRefs) db.journalsLocal,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (userProfilesLocalRefs)
                    await $_getPrefetchedData<
                      UsersLocalData,
                      $UsersLocalTable,
                      UserProfilesLocalData
                    >(
                      currentTable: table,
                      referencedTable: $$UsersLocalTableReferences
                          ._userProfilesLocalRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$UsersLocalTableReferences(
                                db,
                                table,
                                p0,
                              ).userProfilesLocalRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.userLocalId == item.localId,
                          ),
                      typedResults: items,
                    ),
                  if (userVisitedCountriesLocalRefs)
                    await $_getPrefetchedData<
                      UsersLocalData,
                      $UsersLocalTable,
                      UserVisitedCountriesLocalData
                    >(
                      currentTable: table,
                      referencedTable: $$UsersLocalTableReferences
                          ._userVisitedCountriesLocalRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$UsersLocalTableReferences(
                                db,
                                table,
                                p0,
                              ).userVisitedCountriesLocalRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.userLocalId == item.localId,
                          ),
                      typedResults: items,
                    ),
                  if (journalsLocalRefs)
                    await $_getPrefetchedData<
                      UsersLocalData,
                      $UsersLocalTable,
                      JournalsLocalData
                    >(
                      currentTable: table,
                      referencedTable: $$UsersLocalTableReferences
                          ._journalsLocalRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$UsersLocalTableReferences(
                                db,
                                table,
                                p0,
                              ).journalsLocalRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.userLocalId == item.localId,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$UsersLocalTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsersLocalTable,
      UsersLocalData,
      $$UsersLocalTableFilterComposer,
      $$UsersLocalTableOrderingComposer,
      $$UsersLocalTableAnnotationComposer,
      $$UsersLocalTableCreateCompanionBuilder,
      $$UsersLocalTableUpdateCompanionBuilder,
      (UsersLocalData, $$UsersLocalTableReferences),
      UsersLocalData,
      PrefetchHooks Function({
        bool userProfilesLocalRefs,
        bool userVisitedCountriesLocalRefs,
        bool journalsLocalRefs,
      })
    >;
typedef $$UserProfilesLocalTableCreateCompanionBuilder =
    UserProfilesLocalCompanion Function({
      Value<int> localId,
      Value<String?> serverId,
      required int userLocalId,
      required String name,
      Value<String?> profilePhotoUrl,
      Value<String?> coverPhotoUrl,
      Value<String?> profileLocalFilePath,
      Value<String?> coverLocalFilePath,
      Value<String?> bio,
      required int locationLocalId,
      required DateTime updatedAt,
      Value<String> syncStatus,
    });
typedef $$UserProfilesLocalTableUpdateCompanionBuilder =
    UserProfilesLocalCompanion Function({
      Value<int> localId,
      Value<String?> serverId,
      Value<int> userLocalId,
      Value<String> name,
      Value<String?> profilePhotoUrl,
      Value<String?> coverPhotoUrl,
      Value<String?> profileLocalFilePath,
      Value<String?> coverLocalFilePath,
      Value<String?> bio,
      Value<int> locationLocalId,
      Value<DateTime> updatedAt,
      Value<String> syncStatus,
    });

final class $$UserProfilesLocalTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $UserProfilesLocalTable,
          UserProfilesLocalData
        > {
  $$UserProfilesLocalTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UsersLocalTable _userLocalIdTable(_$AppDatabase db) =>
      db.usersLocal.createAlias(
        $_aliasNameGenerator(
          db.userProfilesLocal.userLocalId,
          db.usersLocal.localId,
        ),
      );

  $$UsersLocalTableProcessedTableManager get userLocalId {
    final $_column = $_itemColumn<int>('user_local_id')!;

    final manager = $$UsersLocalTableTableManager(
      $_db,
      $_db.usersLocal,
    ).filter((f) => f.localId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userLocalIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $LocationsLocalTable _locationLocalIdTable(_$AppDatabase db) =>
      db.locationsLocal.createAlias(
        $_aliasNameGenerator(
          db.userProfilesLocal.locationLocalId,
          db.locationsLocal.localId,
        ),
      );

  $$LocationsLocalTableProcessedTableManager get locationLocalId {
    final $_column = $_itemColumn<int>('location_local_id')!;

    final manager = $$LocationsLocalTableTableManager(
      $_db,
      $_db.locationsLocal,
    ).filter((f) => f.localId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_locationLocalIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$UserProfilesLocalTableFilterComposer
    extends Composer<_$AppDatabase, $UserProfilesLocalTable> {
  $$UserProfilesLocalTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serverId => $composableBuilder(
    column: $table.serverId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get profilePhotoUrl => $composableBuilder(
    column: $table.profilePhotoUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get coverPhotoUrl => $composableBuilder(
    column: $table.coverPhotoUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get profileLocalFilePath => $composableBuilder(
    column: $table.profileLocalFilePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get coverLocalFilePath => $composableBuilder(
    column: $table.coverLocalFilePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bio => $composableBuilder(
    column: $table.bio,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<DateTime, DateTime, String> get updatedAt =>
      $composableBuilder(
        column: $table.updatedAt,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersLocalTableFilterComposer get userLocalId {
    final $$UsersLocalTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userLocalId,
      referencedTable: $db.usersLocal,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersLocalTableFilterComposer(
            $db: $db,
            $table: $db.usersLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LocationsLocalTableFilterComposer get locationLocalId {
    final $$LocationsLocalTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.locationLocalId,
      referencedTable: $db.locationsLocal,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocationsLocalTableFilterComposer(
            $db: $db,
            $table: $db.locationsLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserProfilesLocalTableOrderingComposer
    extends Composer<_$AppDatabase, $UserProfilesLocalTable> {
  $$UserProfilesLocalTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serverId => $composableBuilder(
    column: $table.serverId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get profilePhotoUrl => $composableBuilder(
    column: $table.profilePhotoUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get coverPhotoUrl => $composableBuilder(
    column: $table.coverPhotoUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get profileLocalFilePath => $composableBuilder(
    column: $table.profileLocalFilePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get coverLocalFilePath => $composableBuilder(
    column: $table.coverLocalFilePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bio => $composableBuilder(
    column: $table.bio,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersLocalTableOrderingComposer get userLocalId {
    final $$UsersLocalTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userLocalId,
      referencedTable: $db.usersLocal,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersLocalTableOrderingComposer(
            $db: $db,
            $table: $db.usersLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LocationsLocalTableOrderingComposer get locationLocalId {
    final $$LocationsLocalTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.locationLocalId,
      referencedTable: $db.locationsLocal,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocationsLocalTableOrderingComposer(
            $db: $db,
            $table: $db.locationsLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserProfilesLocalTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserProfilesLocalTable> {
  $$UserProfilesLocalTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<String> get serverId =>
      $composableBuilder(column: $table.serverId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get profilePhotoUrl => $composableBuilder(
    column: $table.profilePhotoUrl,
    builder: (column) => column,
  );

  GeneratedColumn<String> get coverPhotoUrl => $composableBuilder(
    column: $table.coverPhotoUrl,
    builder: (column) => column,
  );

  GeneratedColumn<String> get profileLocalFilePath => $composableBuilder(
    column: $table.profileLocalFilePath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get coverLocalFilePath => $composableBuilder(
    column: $table.coverLocalFilePath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get bio =>
      $composableBuilder(column: $table.bio, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DateTime, String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  $$UsersLocalTableAnnotationComposer get userLocalId {
    final $$UsersLocalTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userLocalId,
      referencedTable: $db.usersLocal,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersLocalTableAnnotationComposer(
            $db: $db,
            $table: $db.usersLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LocationsLocalTableAnnotationComposer get locationLocalId {
    final $$LocationsLocalTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.locationLocalId,
      referencedTable: $db.locationsLocal,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocationsLocalTableAnnotationComposer(
            $db: $db,
            $table: $db.locationsLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserProfilesLocalTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserProfilesLocalTable,
          UserProfilesLocalData,
          $$UserProfilesLocalTableFilterComposer,
          $$UserProfilesLocalTableOrderingComposer,
          $$UserProfilesLocalTableAnnotationComposer,
          $$UserProfilesLocalTableCreateCompanionBuilder,
          $$UserProfilesLocalTableUpdateCompanionBuilder,
          (UserProfilesLocalData, $$UserProfilesLocalTableReferences),
          UserProfilesLocalData,
          PrefetchHooks Function({bool userLocalId, bool locationLocalId})
        > {
  $$UserProfilesLocalTableTableManager(
    _$AppDatabase db,
    $UserProfilesLocalTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$UserProfilesLocalTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => $$UserProfilesLocalTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$UserProfilesLocalTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<String?> serverId = const Value.absent(),
                Value<int> userLocalId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> profilePhotoUrl = const Value.absent(),
                Value<String?> coverPhotoUrl = const Value.absent(),
                Value<String?> profileLocalFilePath = const Value.absent(),
                Value<String?> coverLocalFilePath = const Value.absent(),
                Value<String?> bio = const Value.absent(),
                Value<int> locationLocalId = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
              }) => UserProfilesLocalCompanion(
                localId: localId,
                serverId: serverId,
                userLocalId: userLocalId,
                name: name,
                profilePhotoUrl: profilePhotoUrl,
                coverPhotoUrl: coverPhotoUrl,
                profileLocalFilePath: profileLocalFilePath,
                coverLocalFilePath: coverLocalFilePath,
                bio: bio,
                locationLocalId: locationLocalId,
                updatedAt: updatedAt,
                syncStatus: syncStatus,
              ),
          createCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<String?> serverId = const Value.absent(),
                required int userLocalId,
                required String name,
                Value<String?> profilePhotoUrl = const Value.absent(),
                Value<String?> coverPhotoUrl = const Value.absent(),
                Value<String?> profileLocalFilePath = const Value.absent(),
                Value<String?> coverLocalFilePath = const Value.absent(),
                Value<String?> bio = const Value.absent(),
                required int locationLocalId,
                required DateTime updatedAt,
                Value<String> syncStatus = const Value.absent(),
              }) => UserProfilesLocalCompanion.insert(
                localId: localId,
                serverId: serverId,
                userLocalId: userLocalId,
                name: name,
                profilePhotoUrl: profilePhotoUrl,
                coverPhotoUrl: coverPhotoUrl,
                profileLocalFilePath: profileLocalFilePath,
                coverLocalFilePath: coverLocalFilePath,
                bio: bio,
                locationLocalId: locationLocalId,
                updatedAt: updatedAt,
                syncStatus: syncStatus,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$UserProfilesLocalTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({
            userLocalId = false,
            locationLocalId = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (userLocalId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.userLocalId,
                            referencedTable: $$UserProfilesLocalTableReferences
                                ._userLocalIdTable(db),
                            referencedColumn:
                                $$UserProfilesLocalTableReferences
                                    ._userLocalIdTable(db)
                                    .localId,
                          )
                          as T;
                }
                if (locationLocalId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.locationLocalId,
                            referencedTable: $$UserProfilesLocalTableReferences
                                ._locationLocalIdTable(db),
                            referencedColumn:
                                $$UserProfilesLocalTableReferences
                                    ._locationLocalIdTable(db)
                                    .localId,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$UserProfilesLocalTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserProfilesLocalTable,
      UserProfilesLocalData,
      $$UserProfilesLocalTableFilterComposer,
      $$UserProfilesLocalTableOrderingComposer,
      $$UserProfilesLocalTableAnnotationComposer,
      $$UserProfilesLocalTableCreateCompanionBuilder,
      $$UserProfilesLocalTableUpdateCompanionBuilder,
      (UserProfilesLocalData, $$UserProfilesLocalTableReferences),
      UserProfilesLocalData,
      PrefetchHooks Function({bool userLocalId, bool locationLocalId})
    >;
typedef $$UserVisitedCountriesLocalTableCreateCompanionBuilder =
    UserVisitedCountriesLocalCompanion Function({
      Value<int> localId,
      Value<String?> serverId,
      required int userLocalId,
      required int countryLocalId,
      required DateTime visitedAt,
      Value<String> syncStatus,
    });
typedef $$UserVisitedCountriesLocalTableUpdateCompanionBuilder =
    UserVisitedCountriesLocalCompanion Function({
      Value<int> localId,
      Value<String?> serverId,
      Value<int> userLocalId,
      Value<int> countryLocalId,
      Value<DateTime> visitedAt,
      Value<String> syncStatus,
    });

final class $$UserVisitedCountriesLocalTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $UserVisitedCountriesLocalTable,
          UserVisitedCountriesLocalData
        > {
  $$UserVisitedCountriesLocalTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UsersLocalTable _userLocalIdTable(_$AppDatabase db) =>
      db.usersLocal.createAlias(
        $_aliasNameGenerator(
          db.userVisitedCountriesLocal.userLocalId,
          db.usersLocal.localId,
        ),
      );

  $$UsersLocalTableProcessedTableManager get userLocalId {
    final $_column = $_itemColumn<int>('user_local_id')!;

    final manager = $$UsersLocalTableTableManager(
      $_db,
      $_db.usersLocal,
    ).filter((f) => f.localId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userLocalIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CountriesLocalTable _countryLocalIdTable(_$AppDatabase db) =>
      db.countriesLocal.createAlias(
        $_aliasNameGenerator(
          db.userVisitedCountriesLocal.countryLocalId,
          db.countriesLocal.localId,
        ),
      );

  $$CountriesLocalTableProcessedTableManager get countryLocalId {
    final $_column = $_itemColumn<int>('country_local_id')!;

    final manager = $$CountriesLocalTableTableManager(
      $_db,
      $_db.countriesLocal,
    ).filter((f) => f.localId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_countryLocalIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$UserVisitedCountriesLocalTableFilterComposer
    extends Composer<_$AppDatabase, $UserVisitedCountriesLocalTable> {
  $$UserVisitedCountriesLocalTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serverId => $composableBuilder(
    column: $table.serverId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<DateTime, DateTime, String> get visitedAt =>
      $composableBuilder(
        column: $table.visitedAt,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersLocalTableFilterComposer get userLocalId {
    final $$UsersLocalTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userLocalId,
      referencedTable: $db.usersLocal,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersLocalTableFilterComposer(
            $db: $db,
            $table: $db.usersLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CountriesLocalTableFilterComposer get countryLocalId {
    final $$CountriesLocalTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.countryLocalId,
      referencedTable: $db.countriesLocal,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CountriesLocalTableFilterComposer(
            $db: $db,
            $table: $db.countriesLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserVisitedCountriesLocalTableOrderingComposer
    extends Composer<_$AppDatabase, $UserVisitedCountriesLocalTable> {
  $$UserVisitedCountriesLocalTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serverId => $composableBuilder(
    column: $table.serverId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get visitedAt => $composableBuilder(
    column: $table.visitedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersLocalTableOrderingComposer get userLocalId {
    final $$UsersLocalTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userLocalId,
      referencedTable: $db.usersLocal,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersLocalTableOrderingComposer(
            $db: $db,
            $table: $db.usersLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CountriesLocalTableOrderingComposer get countryLocalId {
    final $$CountriesLocalTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.countryLocalId,
      referencedTable: $db.countriesLocal,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CountriesLocalTableOrderingComposer(
            $db: $db,
            $table: $db.countriesLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserVisitedCountriesLocalTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserVisitedCountriesLocalTable> {
  $$UserVisitedCountriesLocalTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<String> get serverId =>
      $composableBuilder(column: $table.serverId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DateTime, String> get visitedAt =>
      $composableBuilder(column: $table.visitedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  $$UsersLocalTableAnnotationComposer get userLocalId {
    final $$UsersLocalTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userLocalId,
      referencedTable: $db.usersLocal,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersLocalTableAnnotationComposer(
            $db: $db,
            $table: $db.usersLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CountriesLocalTableAnnotationComposer get countryLocalId {
    final $$CountriesLocalTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.countryLocalId,
      referencedTable: $db.countriesLocal,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CountriesLocalTableAnnotationComposer(
            $db: $db,
            $table: $db.countriesLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserVisitedCountriesLocalTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserVisitedCountriesLocalTable,
          UserVisitedCountriesLocalData,
          $$UserVisitedCountriesLocalTableFilterComposer,
          $$UserVisitedCountriesLocalTableOrderingComposer,
          $$UserVisitedCountriesLocalTableAnnotationComposer,
          $$UserVisitedCountriesLocalTableCreateCompanionBuilder,
          $$UserVisitedCountriesLocalTableUpdateCompanionBuilder,
          (
            UserVisitedCountriesLocalData,
            $$UserVisitedCountriesLocalTableReferences,
          ),
          UserVisitedCountriesLocalData,
          PrefetchHooks Function({bool userLocalId, bool countryLocalId})
        > {
  $$UserVisitedCountriesLocalTableTableManager(
    _$AppDatabase db,
    $UserVisitedCountriesLocalTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$UserVisitedCountriesLocalTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => $$UserVisitedCountriesLocalTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$UserVisitedCountriesLocalTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<String?> serverId = const Value.absent(),
                Value<int> userLocalId = const Value.absent(),
                Value<int> countryLocalId = const Value.absent(),
                Value<DateTime> visitedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
              }) => UserVisitedCountriesLocalCompanion(
                localId: localId,
                serverId: serverId,
                userLocalId: userLocalId,
                countryLocalId: countryLocalId,
                visitedAt: visitedAt,
                syncStatus: syncStatus,
              ),
          createCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<String?> serverId = const Value.absent(),
                required int userLocalId,
                required int countryLocalId,
                required DateTime visitedAt,
                Value<String> syncStatus = const Value.absent(),
              }) => UserVisitedCountriesLocalCompanion.insert(
                localId: localId,
                serverId: serverId,
                userLocalId: userLocalId,
                countryLocalId: countryLocalId,
                visitedAt: visitedAt,
                syncStatus: syncStatus,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$UserVisitedCountriesLocalTableReferences(
                            db,
                            table,
                            e,
                          ),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({
            userLocalId = false,
            countryLocalId = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (userLocalId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.userLocalId,
                            referencedTable:
                                $$UserVisitedCountriesLocalTableReferences
                                    ._userLocalIdTable(db),
                            referencedColumn:
                                $$UserVisitedCountriesLocalTableReferences
                                    ._userLocalIdTable(db)
                                    .localId,
                          )
                          as T;
                }
                if (countryLocalId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.countryLocalId,
                            referencedTable:
                                $$UserVisitedCountriesLocalTableReferences
                                    ._countryLocalIdTable(db),
                            referencedColumn:
                                $$UserVisitedCountriesLocalTableReferences
                                    ._countryLocalIdTable(db)
                                    .localId,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$UserVisitedCountriesLocalTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserVisitedCountriesLocalTable,
      UserVisitedCountriesLocalData,
      $$UserVisitedCountriesLocalTableFilterComposer,
      $$UserVisitedCountriesLocalTableOrderingComposer,
      $$UserVisitedCountriesLocalTableAnnotationComposer,
      $$UserVisitedCountriesLocalTableCreateCompanionBuilder,
      $$UserVisitedCountriesLocalTableUpdateCompanionBuilder,
      (
        UserVisitedCountriesLocalData,
        $$UserVisitedCountriesLocalTableReferences,
      ),
      UserVisitedCountriesLocalData,
      PrefetchHooks Function({bool userLocalId, bool countryLocalId})
    >;
typedef $$JournalsLocalTableCreateCompanionBuilder =
    JournalsLocalCompanion Function({
      Value<int> localId,
      Value<String?> serverId,
      required int userLocalId,
      required String name,
      Value<String?> shortSummary,
      required int locationLocalId,
      required DateTime startDate,
      Value<DateTime?> endDate,
      Value<String?> coverPhotoUrl,
      Value<String?> coverLocalFilePath,
      required bool remindersEnabled,
      required DateTime updatedAt,
      Value<String> syncStatus,
    });
typedef $$JournalsLocalTableUpdateCompanionBuilder =
    JournalsLocalCompanion Function({
      Value<int> localId,
      Value<String?> serverId,
      Value<int> userLocalId,
      Value<String> name,
      Value<String?> shortSummary,
      Value<int> locationLocalId,
      Value<DateTime> startDate,
      Value<DateTime?> endDate,
      Value<String?> coverPhotoUrl,
      Value<String?> coverLocalFilePath,
      Value<bool> remindersEnabled,
      Value<DateTime> updatedAt,
      Value<String> syncStatus,
    });

final class $$JournalsLocalTableReferences
    extends
        BaseReferences<_$AppDatabase, $JournalsLocalTable, JournalsLocalData> {
  $$JournalsLocalTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UsersLocalTable _userLocalIdTable(_$AppDatabase db) =>
      db.usersLocal.createAlias(
        $_aliasNameGenerator(
          db.journalsLocal.userLocalId,
          db.usersLocal.localId,
        ),
      );

  $$UsersLocalTableProcessedTableManager get userLocalId {
    final $_column = $_itemColumn<int>('user_local_id')!;

    final manager = $$UsersLocalTableTableManager(
      $_db,
      $_db.usersLocal,
    ).filter((f) => f.localId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userLocalIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $LocationsLocalTable _locationLocalIdTable(_$AppDatabase db) =>
      db.locationsLocal.createAlias(
        $_aliasNameGenerator(
          db.journalsLocal.locationLocalId,
          db.locationsLocal.localId,
        ),
      );

  $$LocationsLocalTableProcessedTableManager get locationLocalId {
    final $_column = $_itemColumn<int>('location_local_id')!;

    final manager = $$LocationsLocalTableTableManager(
      $_db,
      $_db.locationsLocal,
    ).filter((f) => f.localId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_locationLocalIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$MomentsLocalTable, List<MomentsLocalData>>
  _momentsLocalRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.momentsLocal,
    aliasName: $_aliasNameGenerator(
      db.journalsLocal.localId,
      db.momentsLocal.journalLocalId,
    ),
  );

  $$MomentsLocalTableProcessedTableManager get momentsLocalRefs {
    final manager = $$MomentsLocalTableTableManager(
      $_db,
      $_db.momentsLocal,
    ).filter(
      (f) => f.journalLocalId.localId.sqlEquals($_itemColumn<int>('local_id')!),
    );

    final cache = $_typedResult.readTableOrNull(_momentsLocalRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$JournalsLocalTableFilterComposer
    extends Composer<_$AppDatabase, $JournalsLocalTable> {
  $$JournalsLocalTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serverId => $composableBuilder(
    column: $table.serverId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shortSummary => $composableBuilder(
    column: $table.shortSummary,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<DateTime, DateTime, String> get startDate =>
      $composableBuilder(
        column: $table.startDate,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<DateTime?, DateTime, String> get endDate =>
      $composableBuilder(
        column: $table.endDate,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get coverPhotoUrl => $composableBuilder(
    column: $table.coverPhotoUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get coverLocalFilePath => $composableBuilder(
    column: $table.coverLocalFilePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get remindersEnabled => $composableBuilder(
    column: $table.remindersEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<DateTime, DateTime, String> get updatedAt =>
      $composableBuilder(
        column: $table.updatedAt,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersLocalTableFilterComposer get userLocalId {
    final $$UsersLocalTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userLocalId,
      referencedTable: $db.usersLocal,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersLocalTableFilterComposer(
            $db: $db,
            $table: $db.usersLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LocationsLocalTableFilterComposer get locationLocalId {
    final $$LocationsLocalTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.locationLocalId,
      referencedTable: $db.locationsLocal,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocationsLocalTableFilterComposer(
            $db: $db,
            $table: $db.locationsLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> momentsLocalRefs(
    Expression<bool> Function($$MomentsLocalTableFilterComposer f) f,
  ) {
    final $$MomentsLocalTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.localId,
      referencedTable: $db.momentsLocal,
      getReferencedColumn: (t) => t.journalLocalId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentsLocalTableFilterComposer(
            $db: $db,
            $table: $db.momentsLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$JournalsLocalTableOrderingComposer
    extends Composer<_$AppDatabase, $JournalsLocalTable> {
  $$JournalsLocalTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serverId => $composableBuilder(
    column: $table.serverId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shortSummary => $composableBuilder(
    column: $table.shortSummary,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get coverPhotoUrl => $composableBuilder(
    column: $table.coverPhotoUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get coverLocalFilePath => $composableBuilder(
    column: $table.coverLocalFilePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get remindersEnabled => $composableBuilder(
    column: $table.remindersEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersLocalTableOrderingComposer get userLocalId {
    final $$UsersLocalTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userLocalId,
      referencedTable: $db.usersLocal,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersLocalTableOrderingComposer(
            $db: $db,
            $table: $db.usersLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LocationsLocalTableOrderingComposer get locationLocalId {
    final $$LocationsLocalTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.locationLocalId,
      referencedTable: $db.locationsLocal,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocationsLocalTableOrderingComposer(
            $db: $db,
            $table: $db.locationsLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$JournalsLocalTableAnnotationComposer
    extends Composer<_$AppDatabase, $JournalsLocalTable> {
  $$JournalsLocalTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<String> get serverId =>
      $composableBuilder(column: $table.serverId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get shortSummary => $composableBuilder(
    column: $table.shortSummary,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<DateTime, String> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DateTime?, String> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<String> get coverPhotoUrl => $composableBuilder(
    column: $table.coverPhotoUrl,
    builder: (column) => column,
  );

  GeneratedColumn<String> get coverLocalFilePath => $composableBuilder(
    column: $table.coverLocalFilePath,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get remindersEnabled => $composableBuilder(
    column: $table.remindersEnabled,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<DateTime, String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  $$UsersLocalTableAnnotationComposer get userLocalId {
    final $$UsersLocalTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userLocalId,
      referencedTable: $db.usersLocal,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersLocalTableAnnotationComposer(
            $db: $db,
            $table: $db.usersLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LocationsLocalTableAnnotationComposer get locationLocalId {
    final $$LocationsLocalTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.locationLocalId,
      referencedTable: $db.locationsLocal,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocationsLocalTableAnnotationComposer(
            $db: $db,
            $table: $db.locationsLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> momentsLocalRefs<T extends Object>(
    Expression<T> Function($$MomentsLocalTableAnnotationComposer a) f,
  ) {
    final $$MomentsLocalTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.localId,
      referencedTable: $db.momentsLocal,
      getReferencedColumn: (t) => t.journalLocalId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentsLocalTableAnnotationComposer(
            $db: $db,
            $table: $db.momentsLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$JournalsLocalTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $JournalsLocalTable,
          JournalsLocalData,
          $$JournalsLocalTableFilterComposer,
          $$JournalsLocalTableOrderingComposer,
          $$JournalsLocalTableAnnotationComposer,
          $$JournalsLocalTableCreateCompanionBuilder,
          $$JournalsLocalTableUpdateCompanionBuilder,
          (JournalsLocalData, $$JournalsLocalTableReferences),
          JournalsLocalData,
          PrefetchHooks Function({
            bool userLocalId,
            bool locationLocalId,
            bool momentsLocalRefs,
          })
        > {
  $$JournalsLocalTableTableManager(_$AppDatabase db, $JournalsLocalTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$JournalsLocalTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$JournalsLocalTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$JournalsLocalTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<String?> serverId = const Value.absent(),
                Value<int> userLocalId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> shortSummary = const Value.absent(),
                Value<int> locationLocalId = const Value.absent(),
                Value<DateTime> startDate = const Value.absent(),
                Value<DateTime?> endDate = const Value.absent(),
                Value<String?> coverPhotoUrl = const Value.absent(),
                Value<String?> coverLocalFilePath = const Value.absent(),
                Value<bool> remindersEnabled = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
              }) => JournalsLocalCompanion(
                localId: localId,
                serverId: serverId,
                userLocalId: userLocalId,
                name: name,
                shortSummary: shortSummary,
                locationLocalId: locationLocalId,
                startDate: startDate,
                endDate: endDate,
                coverPhotoUrl: coverPhotoUrl,
                coverLocalFilePath: coverLocalFilePath,
                remindersEnabled: remindersEnabled,
                updatedAt: updatedAt,
                syncStatus: syncStatus,
              ),
          createCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<String?> serverId = const Value.absent(),
                required int userLocalId,
                required String name,
                Value<String?> shortSummary = const Value.absent(),
                required int locationLocalId,
                required DateTime startDate,
                Value<DateTime?> endDate = const Value.absent(),
                Value<String?> coverPhotoUrl = const Value.absent(),
                Value<String?> coverLocalFilePath = const Value.absent(),
                required bool remindersEnabled,
                required DateTime updatedAt,
                Value<String> syncStatus = const Value.absent(),
              }) => JournalsLocalCompanion.insert(
                localId: localId,
                serverId: serverId,
                userLocalId: userLocalId,
                name: name,
                shortSummary: shortSummary,
                locationLocalId: locationLocalId,
                startDate: startDate,
                endDate: endDate,
                coverPhotoUrl: coverPhotoUrl,
                coverLocalFilePath: coverLocalFilePath,
                remindersEnabled: remindersEnabled,
                updatedAt: updatedAt,
                syncStatus: syncStatus,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$JournalsLocalTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({
            userLocalId = false,
            locationLocalId = false,
            momentsLocalRefs = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (momentsLocalRefs) db.momentsLocal],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (userLocalId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.userLocalId,
                            referencedTable: $$JournalsLocalTableReferences
                                ._userLocalIdTable(db),
                            referencedColumn:
                                $$JournalsLocalTableReferences
                                    ._userLocalIdTable(db)
                                    .localId,
                          )
                          as T;
                }
                if (locationLocalId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.locationLocalId,
                            referencedTable: $$JournalsLocalTableReferences
                                ._locationLocalIdTable(db),
                            referencedColumn:
                                $$JournalsLocalTableReferences
                                    ._locationLocalIdTable(db)
                                    .localId,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (momentsLocalRefs)
                    await $_getPrefetchedData<
                      JournalsLocalData,
                      $JournalsLocalTable,
                      MomentsLocalData
                    >(
                      currentTable: table,
                      referencedTable: $$JournalsLocalTableReferences
                          ._momentsLocalRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$JournalsLocalTableReferences(
                                db,
                                table,
                                p0,
                              ).momentsLocalRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.journalLocalId == item.localId,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$JournalsLocalTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $JournalsLocalTable,
      JournalsLocalData,
      $$JournalsLocalTableFilterComposer,
      $$JournalsLocalTableOrderingComposer,
      $$JournalsLocalTableAnnotationComposer,
      $$JournalsLocalTableCreateCompanionBuilder,
      $$JournalsLocalTableUpdateCompanionBuilder,
      (JournalsLocalData, $$JournalsLocalTableReferences),
      JournalsLocalData,
      PrefetchHooks Function({
        bool userLocalId,
        bool locationLocalId,
        bool momentsLocalRefs,
      })
    >;
typedef $$CategoriesLocalTableCreateCompanionBuilder =
    CategoriesLocalCompanion Function({
      Value<int> localId,
      Value<String?> serverId,
      required String name,
      Value<String> syncStatus,
    });
typedef $$CategoriesLocalTableUpdateCompanionBuilder =
    CategoriesLocalCompanion Function({
      Value<int> localId,
      Value<String?> serverId,
      Value<String> name,
      Value<String> syncStatus,
    });

final class $$CategoriesLocalTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $CategoriesLocalTable,
          CategoriesLocalData
        > {
  $$CategoriesLocalTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$MomentsLocalTable, List<MomentsLocalData>>
  _momentsLocalRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.momentsLocal,
    aliasName: $_aliasNameGenerator(
      db.categoriesLocal.localId,
      db.momentsLocal.categoryLocalId,
    ),
  );

  $$MomentsLocalTableProcessedTableManager get momentsLocalRefs {
    final manager = $$MomentsLocalTableTableManager(
      $_db,
      $_db.momentsLocal,
    ).filter(
      (f) =>
          f.categoryLocalId.localId.sqlEquals($_itemColumn<int>('local_id')!),
    );

    final cache = $_typedResult.readTableOrNull(_momentsLocalRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CategoriesLocalTableFilterComposer
    extends Composer<_$AppDatabase, $CategoriesLocalTable> {
  $$CategoriesLocalTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serverId => $composableBuilder(
    column: $table.serverId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> momentsLocalRefs(
    Expression<bool> Function($$MomentsLocalTableFilterComposer f) f,
  ) {
    final $$MomentsLocalTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.localId,
      referencedTable: $db.momentsLocal,
      getReferencedColumn: (t) => t.categoryLocalId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentsLocalTableFilterComposer(
            $db: $db,
            $table: $db.momentsLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CategoriesLocalTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoriesLocalTable> {
  $$CategoriesLocalTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serverId => $composableBuilder(
    column: $table.serverId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CategoriesLocalTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoriesLocalTable> {
  $$CategoriesLocalTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<String> get serverId =>
      $composableBuilder(column: $table.serverId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  Expression<T> momentsLocalRefs<T extends Object>(
    Expression<T> Function($$MomentsLocalTableAnnotationComposer a) f,
  ) {
    final $$MomentsLocalTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.localId,
      referencedTable: $db.momentsLocal,
      getReferencedColumn: (t) => t.categoryLocalId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentsLocalTableAnnotationComposer(
            $db: $db,
            $table: $db.momentsLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CategoriesLocalTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CategoriesLocalTable,
          CategoriesLocalData,
          $$CategoriesLocalTableFilterComposer,
          $$CategoriesLocalTableOrderingComposer,
          $$CategoriesLocalTableAnnotationComposer,
          $$CategoriesLocalTableCreateCompanionBuilder,
          $$CategoriesLocalTableUpdateCompanionBuilder,
          (CategoriesLocalData, $$CategoriesLocalTableReferences),
          CategoriesLocalData,
          PrefetchHooks Function({bool momentsLocalRefs})
        > {
  $$CategoriesLocalTableTableManager(
    _$AppDatabase db,
    $CategoriesLocalTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () =>
                  $$CategoriesLocalTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$CategoriesLocalTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$CategoriesLocalTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<String?> serverId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
              }) => CategoriesLocalCompanion(
                localId: localId,
                serverId: serverId,
                name: name,
                syncStatus: syncStatus,
              ),
          createCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<String?> serverId = const Value.absent(),
                required String name,
                Value<String> syncStatus = const Value.absent(),
              }) => CategoriesLocalCompanion.insert(
                localId: localId,
                serverId: serverId,
                name: name,
                syncStatus: syncStatus,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$CategoriesLocalTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({momentsLocalRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (momentsLocalRefs) db.momentsLocal],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (momentsLocalRefs)
                    await $_getPrefetchedData<
                      CategoriesLocalData,
                      $CategoriesLocalTable,
                      MomentsLocalData
                    >(
                      currentTable: table,
                      referencedTable: $$CategoriesLocalTableReferences
                          ._momentsLocalRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$CategoriesLocalTableReferences(
                                db,
                                table,
                                p0,
                              ).momentsLocalRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.categoryLocalId == item.localId,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CategoriesLocalTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CategoriesLocalTable,
      CategoriesLocalData,
      $$CategoriesLocalTableFilterComposer,
      $$CategoriesLocalTableOrderingComposer,
      $$CategoriesLocalTableAnnotationComposer,
      $$CategoriesLocalTableCreateCompanionBuilder,
      $$CategoriesLocalTableUpdateCompanionBuilder,
      (CategoriesLocalData, $$CategoriesLocalTableReferences),
      CategoriesLocalData,
      PrefetchHooks Function({bool momentsLocalRefs})
    >;
typedef $$MomentsLocalTableCreateCompanionBuilder =
    MomentsLocalCompanion Function({
      Value<int> localId,
      Value<String?> serverId,
      required int journalLocalId,
      required int locationLocalId,
      required String name,
      Value<String?> description,
      required int categoryLocalId,
      required DateTime timestamp,
      required DateTime updatedAt,
      Value<String> syncStatus,
    });
typedef $$MomentsLocalTableUpdateCompanionBuilder =
    MomentsLocalCompanion Function({
      Value<int> localId,
      Value<String?> serverId,
      Value<int> journalLocalId,
      Value<int> locationLocalId,
      Value<String> name,
      Value<String?> description,
      Value<int> categoryLocalId,
      Value<DateTime> timestamp,
      Value<DateTime> updatedAt,
      Value<String> syncStatus,
    });

final class $$MomentsLocalTableReferences
    extends
        BaseReferences<_$AppDatabase, $MomentsLocalTable, MomentsLocalData> {
  $$MomentsLocalTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $JournalsLocalTable _journalLocalIdTable(_$AppDatabase db) =>
      db.journalsLocal.createAlias(
        $_aliasNameGenerator(
          db.momentsLocal.journalLocalId,
          db.journalsLocal.localId,
        ),
      );

  $$JournalsLocalTableProcessedTableManager get journalLocalId {
    final $_column = $_itemColumn<int>('journal_local_id')!;

    final manager = $$JournalsLocalTableTableManager(
      $_db,
      $_db.journalsLocal,
    ).filter((f) => f.localId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_journalLocalIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $LocationsLocalTable _locationLocalIdTable(_$AppDatabase db) =>
      db.locationsLocal.createAlias(
        $_aliasNameGenerator(
          db.momentsLocal.locationLocalId,
          db.locationsLocal.localId,
        ),
      );

  $$LocationsLocalTableProcessedTableManager get locationLocalId {
    final $_column = $_itemColumn<int>('location_local_id')!;

    final manager = $$LocationsLocalTableTableManager(
      $_db,
      $_db.locationsLocal,
    ).filter((f) => f.localId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_locationLocalIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CategoriesLocalTable _categoryLocalIdTable(_$AppDatabase db) =>
      db.categoriesLocal.createAlias(
        $_aliasNameGenerator(
          db.momentsLocal.categoryLocalId,
          db.categoriesLocal.localId,
        ),
      );

  $$CategoriesLocalTableProcessedTableManager get categoryLocalId {
    final $_column = $_itemColumn<int>('category_local_id')!;

    final manager = $$CategoriesLocalTableTableManager(
      $_db,
      $_db.categoriesLocal,
    ).filter((f) => f.localId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryLocalIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$MomentMediaLocalTable, List<MomentMediaLocalData>>
  _momentMediaLocalRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.momentMediaLocal,
    aliasName: $_aliasNameGenerator(
      db.momentsLocal.localId,
      db.momentMediaLocal.momentLocalId,
    ),
  );

  $$MomentMediaLocalTableProcessedTableManager get momentMediaLocalRefs {
    final manager = $$MomentMediaLocalTableTableManager(
      $_db,
      $_db.momentMediaLocal,
    ).filter(
      (f) => f.momentLocalId.localId.sqlEquals($_itemColumn<int>('local_id')!),
    );

    final cache = $_typedResult.readTableOrNull(
      _momentMediaLocalRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$MomentsLocalTableFilterComposer
    extends Composer<_$AppDatabase, $MomentsLocalTable> {
  $$MomentsLocalTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serverId => $composableBuilder(
    column: $table.serverId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<DateTime, DateTime, String> get timestamp =>
      $composableBuilder(
        column: $table.timestamp,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<DateTime, DateTime, String> get updatedAt =>
      $composableBuilder(
        column: $table.updatedAt,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  $$JournalsLocalTableFilterComposer get journalLocalId {
    final $$JournalsLocalTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.journalLocalId,
      referencedTable: $db.journalsLocal,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$JournalsLocalTableFilterComposer(
            $db: $db,
            $table: $db.journalsLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LocationsLocalTableFilterComposer get locationLocalId {
    final $$LocationsLocalTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.locationLocalId,
      referencedTable: $db.locationsLocal,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocationsLocalTableFilterComposer(
            $db: $db,
            $table: $db.locationsLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoriesLocalTableFilterComposer get categoryLocalId {
    final $$CategoriesLocalTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryLocalId,
      referencedTable: $db.categoriesLocal,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesLocalTableFilterComposer(
            $db: $db,
            $table: $db.categoriesLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> momentMediaLocalRefs(
    Expression<bool> Function($$MomentMediaLocalTableFilterComposer f) f,
  ) {
    final $$MomentMediaLocalTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.localId,
      referencedTable: $db.momentMediaLocal,
      getReferencedColumn: (t) => t.momentLocalId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentMediaLocalTableFilterComposer(
            $db: $db,
            $table: $db.momentMediaLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MomentsLocalTableOrderingComposer
    extends Composer<_$AppDatabase, $MomentsLocalTable> {
  $$MomentsLocalTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serverId => $composableBuilder(
    column: $table.serverId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  $$JournalsLocalTableOrderingComposer get journalLocalId {
    final $$JournalsLocalTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.journalLocalId,
      referencedTable: $db.journalsLocal,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$JournalsLocalTableOrderingComposer(
            $db: $db,
            $table: $db.journalsLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LocationsLocalTableOrderingComposer get locationLocalId {
    final $$LocationsLocalTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.locationLocalId,
      referencedTable: $db.locationsLocal,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocationsLocalTableOrderingComposer(
            $db: $db,
            $table: $db.locationsLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoriesLocalTableOrderingComposer get categoryLocalId {
    final $$CategoriesLocalTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryLocalId,
      referencedTable: $db.categoriesLocal,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesLocalTableOrderingComposer(
            $db: $db,
            $table: $db.categoriesLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MomentsLocalTableAnnotationComposer
    extends Composer<_$AppDatabase, $MomentsLocalTable> {
  $$MomentsLocalTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<String> get serverId =>
      $composableBuilder(column: $table.serverId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<DateTime, String> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DateTime, String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  $$JournalsLocalTableAnnotationComposer get journalLocalId {
    final $$JournalsLocalTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.journalLocalId,
      referencedTable: $db.journalsLocal,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$JournalsLocalTableAnnotationComposer(
            $db: $db,
            $table: $db.journalsLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LocationsLocalTableAnnotationComposer get locationLocalId {
    final $$LocationsLocalTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.locationLocalId,
      referencedTable: $db.locationsLocal,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocationsLocalTableAnnotationComposer(
            $db: $db,
            $table: $db.locationsLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoriesLocalTableAnnotationComposer get categoryLocalId {
    final $$CategoriesLocalTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryLocalId,
      referencedTable: $db.categoriesLocal,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesLocalTableAnnotationComposer(
            $db: $db,
            $table: $db.categoriesLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> momentMediaLocalRefs<T extends Object>(
    Expression<T> Function($$MomentMediaLocalTableAnnotationComposer a) f,
  ) {
    final $$MomentMediaLocalTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.localId,
      referencedTable: $db.momentMediaLocal,
      getReferencedColumn: (t) => t.momentLocalId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentMediaLocalTableAnnotationComposer(
            $db: $db,
            $table: $db.momentMediaLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MomentsLocalTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MomentsLocalTable,
          MomentsLocalData,
          $$MomentsLocalTableFilterComposer,
          $$MomentsLocalTableOrderingComposer,
          $$MomentsLocalTableAnnotationComposer,
          $$MomentsLocalTableCreateCompanionBuilder,
          $$MomentsLocalTableUpdateCompanionBuilder,
          (MomentsLocalData, $$MomentsLocalTableReferences),
          MomentsLocalData,
          PrefetchHooks Function({
            bool journalLocalId,
            bool locationLocalId,
            bool categoryLocalId,
            bool momentMediaLocalRefs,
          })
        > {
  $$MomentsLocalTableTableManager(_$AppDatabase db, $MomentsLocalTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$MomentsLocalTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$MomentsLocalTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () =>
                  $$MomentsLocalTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<String?> serverId = const Value.absent(),
                Value<int> journalLocalId = const Value.absent(),
                Value<int> locationLocalId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int> categoryLocalId = const Value.absent(),
                Value<DateTime> timestamp = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
              }) => MomentsLocalCompanion(
                localId: localId,
                serverId: serverId,
                journalLocalId: journalLocalId,
                locationLocalId: locationLocalId,
                name: name,
                description: description,
                categoryLocalId: categoryLocalId,
                timestamp: timestamp,
                updatedAt: updatedAt,
                syncStatus: syncStatus,
              ),
          createCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<String?> serverId = const Value.absent(),
                required int journalLocalId,
                required int locationLocalId,
                required String name,
                Value<String?> description = const Value.absent(),
                required int categoryLocalId,
                required DateTime timestamp,
                required DateTime updatedAt,
                Value<String> syncStatus = const Value.absent(),
              }) => MomentsLocalCompanion.insert(
                localId: localId,
                serverId: serverId,
                journalLocalId: journalLocalId,
                locationLocalId: locationLocalId,
                name: name,
                description: description,
                categoryLocalId: categoryLocalId,
                timestamp: timestamp,
                updatedAt: updatedAt,
                syncStatus: syncStatus,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$MomentsLocalTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({
            journalLocalId = false,
            locationLocalId = false,
            categoryLocalId = false,
            momentMediaLocalRefs = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (momentMediaLocalRefs) db.momentMediaLocal,
              ],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (journalLocalId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.journalLocalId,
                            referencedTable: $$MomentsLocalTableReferences
                                ._journalLocalIdTable(db),
                            referencedColumn:
                                $$MomentsLocalTableReferences
                                    ._journalLocalIdTable(db)
                                    .localId,
                          )
                          as T;
                }
                if (locationLocalId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.locationLocalId,
                            referencedTable: $$MomentsLocalTableReferences
                                ._locationLocalIdTable(db),
                            referencedColumn:
                                $$MomentsLocalTableReferences
                                    ._locationLocalIdTable(db)
                                    .localId,
                          )
                          as T;
                }
                if (categoryLocalId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.categoryLocalId,
                            referencedTable: $$MomentsLocalTableReferences
                                ._categoryLocalIdTable(db),
                            referencedColumn:
                                $$MomentsLocalTableReferences
                                    ._categoryLocalIdTable(db)
                                    .localId,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (momentMediaLocalRefs)
                    await $_getPrefetchedData<
                      MomentsLocalData,
                      $MomentsLocalTable,
                      MomentMediaLocalData
                    >(
                      currentTable: table,
                      referencedTable: $$MomentsLocalTableReferences
                          ._momentMediaLocalRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$MomentsLocalTableReferences(
                                db,
                                table,
                                p0,
                              ).momentMediaLocalRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.momentLocalId == item.localId,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$MomentsLocalTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MomentsLocalTable,
      MomentsLocalData,
      $$MomentsLocalTableFilterComposer,
      $$MomentsLocalTableOrderingComposer,
      $$MomentsLocalTableAnnotationComposer,
      $$MomentsLocalTableCreateCompanionBuilder,
      $$MomentsLocalTableUpdateCompanionBuilder,
      (MomentsLocalData, $$MomentsLocalTableReferences),
      MomentsLocalData,
      PrefetchHooks Function({
        bool journalLocalId,
        bool locationLocalId,
        bool categoryLocalId,
        bool momentMediaLocalRefs,
      })
    >;
typedef $$MomentMediaLocalTableCreateCompanionBuilder =
    MomentMediaLocalCompanion Function({
      Value<int> localId,
      Value<String?> serverId,
      required int momentLocalId,
      required String mediaUrl,
      Value<String?> mediaType,
      Value<String?> localFilePath,
      required DateTime updatedAt,
      Value<String> syncStatus,
    });
typedef $$MomentMediaLocalTableUpdateCompanionBuilder =
    MomentMediaLocalCompanion Function({
      Value<int> localId,
      Value<String?> serverId,
      Value<int> momentLocalId,
      Value<String> mediaUrl,
      Value<String?> mediaType,
      Value<String?> localFilePath,
      Value<DateTime> updatedAt,
      Value<String> syncStatus,
    });

final class $$MomentMediaLocalTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $MomentMediaLocalTable,
          MomentMediaLocalData
        > {
  $$MomentMediaLocalTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $MomentsLocalTable _momentLocalIdTable(_$AppDatabase db) =>
      db.momentsLocal.createAlias(
        $_aliasNameGenerator(
          db.momentMediaLocal.momentLocalId,
          db.momentsLocal.localId,
        ),
      );

  $$MomentsLocalTableProcessedTableManager get momentLocalId {
    final $_column = $_itemColumn<int>('moment_local_id')!;

    final manager = $$MomentsLocalTableTableManager(
      $_db,
      $_db.momentsLocal,
    ).filter((f) => f.localId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_momentLocalIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MomentMediaLocalTableFilterComposer
    extends Composer<_$AppDatabase, $MomentMediaLocalTable> {
  $$MomentMediaLocalTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serverId => $composableBuilder(
    column: $table.serverId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mediaUrl => $composableBuilder(
    column: $table.mediaUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mediaType => $composableBuilder(
    column: $table.mediaType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get localFilePath => $composableBuilder(
    column: $table.localFilePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<DateTime, DateTime, String> get updatedAt =>
      $composableBuilder(
        column: $table.updatedAt,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  $$MomentsLocalTableFilterComposer get momentLocalId {
    final $$MomentsLocalTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.momentLocalId,
      referencedTable: $db.momentsLocal,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentsLocalTableFilterComposer(
            $db: $db,
            $table: $db.momentsLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MomentMediaLocalTableOrderingComposer
    extends Composer<_$AppDatabase, $MomentMediaLocalTable> {
  $$MomentMediaLocalTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serverId => $composableBuilder(
    column: $table.serverId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mediaUrl => $composableBuilder(
    column: $table.mediaUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mediaType => $composableBuilder(
    column: $table.mediaType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get localFilePath => $composableBuilder(
    column: $table.localFilePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  $$MomentsLocalTableOrderingComposer get momentLocalId {
    final $$MomentsLocalTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.momentLocalId,
      referencedTable: $db.momentsLocal,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentsLocalTableOrderingComposer(
            $db: $db,
            $table: $db.momentsLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MomentMediaLocalTableAnnotationComposer
    extends Composer<_$AppDatabase, $MomentMediaLocalTable> {
  $$MomentMediaLocalTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<String> get serverId =>
      $composableBuilder(column: $table.serverId, builder: (column) => column);

  GeneratedColumn<String> get mediaUrl =>
      $composableBuilder(column: $table.mediaUrl, builder: (column) => column);

  GeneratedColumn<String> get mediaType =>
      $composableBuilder(column: $table.mediaType, builder: (column) => column);

  GeneratedColumn<String> get localFilePath => $composableBuilder(
    column: $table.localFilePath,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<DateTime, String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  $$MomentsLocalTableAnnotationComposer get momentLocalId {
    final $$MomentsLocalTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.momentLocalId,
      referencedTable: $db.momentsLocal,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentsLocalTableAnnotationComposer(
            $db: $db,
            $table: $db.momentsLocal,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MomentMediaLocalTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MomentMediaLocalTable,
          MomentMediaLocalData,
          $$MomentMediaLocalTableFilterComposer,
          $$MomentMediaLocalTableOrderingComposer,
          $$MomentMediaLocalTableAnnotationComposer,
          $$MomentMediaLocalTableCreateCompanionBuilder,
          $$MomentMediaLocalTableUpdateCompanionBuilder,
          (MomentMediaLocalData, $$MomentMediaLocalTableReferences),
          MomentMediaLocalData,
          PrefetchHooks Function({bool momentLocalId})
        > {
  $$MomentMediaLocalTableTableManager(
    _$AppDatabase db,
    $MomentMediaLocalTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () =>
                  $$MomentMediaLocalTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$MomentMediaLocalTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$MomentMediaLocalTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<String?> serverId = const Value.absent(),
                Value<int> momentLocalId = const Value.absent(),
                Value<String> mediaUrl = const Value.absent(),
                Value<String?> mediaType = const Value.absent(),
                Value<String?> localFilePath = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
              }) => MomentMediaLocalCompanion(
                localId: localId,
                serverId: serverId,
                momentLocalId: momentLocalId,
                mediaUrl: mediaUrl,
                mediaType: mediaType,
                localFilePath: localFilePath,
                updatedAt: updatedAt,
                syncStatus: syncStatus,
              ),
          createCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<String?> serverId = const Value.absent(),
                required int momentLocalId,
                required String mediaUrl,
                Value<String?> mediaType = const Value.absent(),
                Value<String?> localFilePath = const Value.absent(),
                required DateTime updatedAt,
                Value<String> syncStatus = const Value.absent(),
              }) => MomentMediaLocalCompanion.insert(
                localId: localId,
                serverId: serverId,
                momentLocalId: momentLocalId,
                mediaUrl: mediaUrl,
                mediaType: mediaType,
                localFilePath: localFilePath,
                updatedAt: updatedAt,
                syncStatus: syncStatus,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$MomentMediaLocalTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({momentLocalId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (momentLocalId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.momentLocalId,
                            referencedTable: $$MomentMediaLocalTableReferences
                                ._momentLocalIdTable(db),
                            referencedColumn:
                                $$MomentMediaLocalTableReferences
                                    ._momentLocalIdTable(db)
                                    .localId,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$MomentMediaLocalTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MomentMediaLocalTable,
      MomentMediaLocalData,
      $$MomentMediaLocalTableFilterComposer,
      $$MomentMediaLocalTableOrderingComposer,
      $$MomentMediaLocalTableAnnotationComposer,
      $$MomentMediaLocalTableCreateCompanionBuilder,
      $$MomentMediaLocalTableUpdateCompanionBuilder,
      (MomentMediaLocalData, $$MomentMediaLocalTableReferences),
      MomentMediaLocalData,
      PrefetchHooks Function({bool momentLocalId})
    >;
typedef $$SyncHistoryTableCreateCompanionBuilder =
    SyncHistoryCompanion Function({
      Value<int> localId,
      required String syncStatus,
      Value<String?> syncType,
      required DateTime syncTime,
      Value<String?> syncMessage,
    });
typedef $$SyncHistoryTableUpdateCompanionBuilder =
    SyncHistoryCompanion Function({
      Value<int> localId,
      Value<String> syncStatus,
      Value<String?> syncType,
      Value<DateTime> syncTime,
      Value<String?> syncMessage,
    });

class $$SyncHistoryTableFilterComposer
    extends Composer<_$AppDatabase, $SyncHistoryTable> {
  $$SyncHistoryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncType => $composableBuilder(
    column: $table.syncType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<DateTime, DateTime, String> get syncTime =>
      $composableBuilder(
        column: $table.syncTime,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get syncMessage => $composableBuilder(
    column: $table.syncMessage,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SyncHistoryTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncHistoryTable> {
  $$SyncHistoryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncType => $composableBuilder(
    column: $table.syncType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncTime => $composableBuilder(
    column: $table.syncTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncMessage => $composableBuilder(
    column: $table.syncMessage,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SyncHistoryTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncHistoryTable> {
  $$SyncHistoryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get syncType =>
      $composableBuilder(column: $table.syncType, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DateTime, String> get syncTime =>
      $composableBuilder(column: $table.syncTime, builder: (column) => column);

  GeneratedColumn<String> get syncMessage => $composableBuilder(
    column: $table.syncMessage,
    builder: (column) => column,
  );
}

class $$SyncHistoryTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SyncHistoryTable,
          SyncHistoryData,
          $$SyncHistoryTableFilterComposer,
          $$SyncHistoryTableOrderingComposer,
          $$SyncHistoryTableAnnotationComposer,
          $$SyncHistoryTableCreateCompanionBuilder,
          $$SyncHistoryTableUpdateCompanionBuilder,
          (
            SyncHistoryData,
            BaseReferences<_$AppDatabase, $SyncHistoryTable, SyncHistoryData>,
          ),
          SyncHistoryData,
          PrefetchHooks Function()
        > {
  $$SyncHistoryTableTableManager(_$AppDatabase db, $SyncHistoryTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$SyncHistoryTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$SyncHistoryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () =>
                  $$SyncHistoryTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> syncType = const Value.absent(),
                Value<DateTime> syncTime = const Value.absent(),
                Value<String?> syncMessage = const Value.absent(),
              }) => SyncHistoryCompanion(
                localId: localId,
                syncStatus: syncStatus,
                syncType: syncType,
                syncTime: syncTime,
                syncMessage: syncMessage,
              ),
          createCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                required String syncStatus,
                Value<String?> syncType = const Value.absent(),
                required DateTime syncTime,
                Value<String?> syncMessage = const Value.absent(),
              }) => SyncHistoryCompanion.insert(
                localId: localId,
                syncStatus: syncStatus,
                syncType: syncType,
                syncTime: syncTime,
                syncMessage: syncMessage,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncHistoryTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SyncHistoryTable,
      SyncHistoryData,
      $$SyncHistoryTableFilterComposer,
      $$SyncHistoryTableOrderingComposer,
      $$SyncHistoryTableAnnotationComposer,
      $$SyncHistoryTableCreateCompanionBuilder,
      $$SyncHistoryTableUpdateCompanionBuilder,
      (
        SyncHistoryData,
        BaseReferences<_$AppDatabase, $SyncHistoryTable, SyncHistoryData>,
      ),
      SyncHistoryData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ContinentsLocalTableTableManager get continentsLocal =>
      $$ContinentsLocalTableTableManager(_db, _db.continentsLocal);
  $$CountriesLocalTableTableManager get countriesLocal =>
      $$CountriesLocalTableTableManager(_db, _db.countriesLocal);
  $$LocationsLocalTableTableManager get locationsLocal =>
      $$LocationsLocalTableTableManager(_db, _db.locationsLocal);
  $$UsersLocalTableTableManager get usersLocal =>
      $$UsersLocalTableTableManager(_db, _db.usersLocal);
  $$UserProfilesLocalTableTableManager get userProfilesLocal =>
      $$UserProfilesLocalTableTableManager(_db, _db.userProfilesLocal);
  $$UserVisitedCountriesLocalTableTableManager get userVisitedCountriesLocal =>
      $$UserVisitedCountriesLocalTableTableManager(
        _db,
        _db.userVisitedCountriesLocal,
      );
  $$JournalsLocalTableTableManager get journalsLocal =>
      $$JournalsLocalTableTableManager(_db, _db.journalsLocal);
  $$CategoriesLocalTableTableManager get categoriesLocal =>
      $$CategoriesLocalTableTableManager(_db, _db.categoriesLocal);
  $$MomentsLocalTableTableManager get momentsLocal =>
      $$MomentsLocalTableTableManager(_db, _db.momentsLocal);
  $$MomentMediaLocalTableTableManager get momentMediaLocal =>
      $$MomentMediaLocalTableTableManager(_db, _db.momentMediaLocal);
  $$SyncHistoryTableTableManager get syncHistory =>
      $$SyncHistoryTableTableManager(_db, _db.syncHistory);
}
