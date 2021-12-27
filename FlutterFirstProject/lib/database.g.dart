// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class MarvelModel extends DataClass implements Insertable<MarvelModel> {
  final int id;
  final String name;
  final String image;
  final String marvelText;
  MarvelModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.marvelText});
  factory MarvelModel.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return MarvelModel(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      image: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image'])!,
      marvelText: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}marvel_text'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['image'] = Variable<String>(image);
    map['marvel_text'] = Variable<String>(marvelText);
    return map;
  }

  MarvelModelsCompanion toCompanion(bool nullToAbsent) {
    return MarvelModelsCompanion(
      id: Value(id),
      name: Value(name),
      image: Value(image),
      marvelText: Value(marvelText),
    );
  }

  factory MarvelModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MarvelModel(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      image: serializer.fromJson<String>(json['image']),
      marvelText: serializer.fromJson<String>(json['marvelText']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'image': serializer.toJson<String>(image),
      'marvelText': serializer.toJson<String>(marvelText),
    };
  }

  MarvelModel copyWith(
          {int? id, String? name, String? image, String? marvelText}) =>
      MarvelModel(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        marvelText: marvelText ?? this.marvelText,
      );
  @override
  String toString() {
    return (StringBuffer('MarvelModel(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('image: $image, ')
          ..write('marvelText: $marvelText')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, image, marvelText);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MarvelModel &&
          other.id == this.id &&
          other.name == this.name &&
          other.image == this.image &&
          other.marvelText == this.marvelText);
}

class MarvelModelsCompanion extends UpdateCompanion<MarvelModel> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> image;
  final Value<String> marvelText;
  const MarvelModelsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.image = const Value.absent(),
    this.marvelText = const Value.absent(),
  });
  MarvelModelsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String image,
    required String marvelText,
  })  : name = Value(name),
        image = Value(image),
        marvelText = Value(marvelText);
  static Insertable<MarvelModel> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? image,
    Expression<String>? marvelText,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (image != null) 'image': image,
      if (marvelText != null) 'marvel_text': marvelText,
    });
  }

  MarvelModelsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? image,
      Value<String>? marvelText}) {
    return MarvelModelsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      marvelText: marvelText ?? this.marvelText,
    );
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
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (marvelText.present) {
      map['marvel_text'] = Variable<String>(marvelText.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MarvelModelsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('image: $image, ')
          ..write('marvelText: $marvelText')
          ..write(')'))
        .toString();
  }
}

class $MarvelModelsTable extends MarvelModels
    with TableInfo<$MarvelModelsTable, MarvelModel> {
  final GeneratedDatabase _db;
  final String? _alias;
  $MarvelModelsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String?> image = GeneratedColumn<String?>(
      'image', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _marvelTextMeta = const VerificationMeta('marvelText');
  @override
  late final GeneratedColumn<String?> marvelText = GeneratedColumn<String?>(
      'marvel_text', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, image, marvelText];
  @override
  String get aliasedName => _alias ?? 'marvel_models';
  @override
  String get actualTableName => 'marvel_models';
  @override
  VerificationContext validateIntegrity(Insertable<MarvelModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('marvel_text')) {
      context.handle(
          _marvelTextMeta,
          marvelText.isAcceptableOrUnknown(
              data['marvel_text']!, _marvelTextMeta));
    } else if (isInserting) {
      context.missing(_marvelTextMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MarvelModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    return MarvelModel.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $MarvelModelsTable createAlias(String alias) {
    return $MarvelModelsTable(_db, alias);
  }
}

abstract class _$MarvelDatabase extends GeneratedDatabase {
  _$MarvelDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $MarvelModelsTable marvelModels = $MarvelModelsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [marvelModels];
}
