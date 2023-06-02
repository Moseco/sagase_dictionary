// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kanji_radical.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetKanjiRadicalCollection on Isar {
  IsarCollection<KanjiRadical> get kanjiRadicals => this.collection();
}

const KanjiRadicalSchema = CollectionSchema(
  name: r'KanjiRadical',
  id: 3637630282364721818,
  properties: {
    r'importance': PropertySchema(
      id: 0,
      name: r'importance',
      type: IsarType.byte,
      enumMap: _KanjiRadicalimportanceEnumValueMap,
    ),
    r'kangxiId': PropertySchema(
      id: 1,
      name: r'kangxiId',
      type: IsarType.long,
    ),
    r'meaning': PropertySchema(
      id: 2,
      name: r'meaning',
      type: IsarType.string,
    ),
    r'position': PropertySchema(
      id: 3,
      name: r'position',
      type: IsarType.byte,
      enumMap: _KanjiRadicalpositionEnumValueMap,
    ),
    r'radical': PropertySchema(
      id: 4,
      name: r'radical',
      type: IsarType.string,
    ),
    r'reading': PropertySchema(
      id: 5,
      name: r'reading',
      type: IsarType.string,
    ),
    r'strokeCount': PropertySchema(
      id: 6,
      name: r'strokeCount',
      type: IsarType.long,
    ),
    r'strokes': PropertySchema(
      id: 7,
      name: r'strokes',
      type: IsarType.stringList,
    ),
    r'variantOf': PropertySchema(
      id: 8,
      name: r'variantOf',
      type: IsarType.string,
    ),
    r'variants': PropertySchema(
      id: 9,
      name: r'variants',
      type: IsarType.stringList,
    )
  },
  estimateSize: _kanjiRadicalEstimateSize,
  serialize: _kanjiRadicalSerialize,
  deserialize: _kanjiRadicalDeserialize,
  deserializeProp: _kanjiRadicalDeserializeProp,
  idName: r'id',
  indexes: {
    r'radical': IndexSchema(
      id: -5731891106966412493,
      name: r'radical',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'radical',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'kanjiWithRadical': LinkSchema(
      id: -3732638784367542430,
      name: r'kanjiWithRadical',
      target: r'Kanji',
      single: false,
      linkName: r'radical',
    )
  },
  embeddedSchemas: {},
  getId: _kanjiRadicalGetId,
  getLinks: _kanjiRadicalGetLinks,
  attach: _kanjiRadicalAttach,
  version: '3.1.0+1',
);

int _kanjiRadicalEstimateSize(
  KanjiRadical object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.meaning.length * 3;
  bytesCount += 3 + object.radical.length * 3;
  bytesCount += 3 + object.reading.length * 3;
  {
    final list = object.strokes;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.variantOf;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.variants;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  return bytesCount;
}

void _kanjiRadicalSerialize(
  KanjiRadical object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeByte(offsets[0], object.importance.index);
  writer.writeLong(offsets[1], object.kangxiId);
  writer.writeString(offsets[2], object.meaning);
  writer.writeByte(offsets[3], object.position.index);
  writer.writeString(offsets[4], object.radical);
  writer.writeString(offsets[5], object.reading);
  writer.writeLong(offsets[6], object.strokeCount);
  writer.writeStringList(offsets[7], object.strokes);
  writer.writeString(offsets[8], object.variantOf);
  writer.writeStringList(offsets[9], object.variants);
}

KanjiRadical _kanjiRadicalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = KanjiRadical();
  object.id = id;
  object.importance =
      _KanjiRadicalimportanceValueEnumMap[reader.readByteOrNull(offsets[0])] ??
          KanjiRadicalImportance.top25;
  object.kangxiId = reader.readLongOrNull(offsets[1]);
  object.meaning = reader.readString(offsets[2]);
  object.position =
      _KanjiRadicalpositionValueEnumMap[reader.readByteOrNull(offsets[3])] ??
          KanjiRadicalPosition.top;
  object.radical = reader.readString(offsets[4]);
  object.reading = reader.readString(offsets[5]);
  object.strokeCount = reader.readLong(offsets[6]);
  object.strokes = reader.readStringList(offsets[7]);
  object.variantOf = reader.readStringOrNull(offsets[8]);
  object.variants = reader.readStringList(offsets[9]);
  return object;
}

P _kanjiRadicalDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_KanjiRadicalimportanceValueEnumMap[
              reader.readByteOrNull(offset)] ??
          KanjiRadicalImportance.top25) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (_KanjiRadicalpositionValueEnumMap[
              reader.readByteOrNull(offset)] ??
          KanjiRadicalPosition.top) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readStringList(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringList(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _KanjiRadicalimportanceEnumValueMap = {
  'top25': 0,
  'top50': 1,
  'top75': 2,
  'none': 3,
};
const _KanjiRadicalimportanceValueEnumMap = {
  0: KanjiRadicalImportance.top25,
  1: KanjiRadicalImportance.top50,
  2: KanjiRadicalImportance.top75,
  3: KanjiRadicalImportance.none,
};
const _KanjiRadicalpositionEnumValueMap = {
  'top': 0,
  'left': 1,
  'right': 2,
  'bottom': 3,
  'enclose': 4,
  'topLeft': 5,
  'bottomLeft': 6,
  'none': 7,
};
const _KanjiRadicalpositionValueEnumMap = {
  0: KanjiRadicalPosition.top,
  1: KanjiRadicalPosition.left,
  2: KanjiRadicalPosition.right,
  3: KanjiRadicalPosition.bottom,
  4: KanjiRadicalPosition.enclose,
  5: KanjiRadicalPosition.topLeft,
  6: KanjiRadicalPosition.bottomLeft,
  7: KanjiRadicalPosition.none,
};

Id _kanjiRadicalGetId(KanjiRadical object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _kanjiRadicalGetLinks(KanjiRadical object) {
  return [object.kanjiWithRadical];
}

void _kanjiRadicalAttach(
    IsarCollection<dynamic> col, Id id, KanjiRadical object) {
  object.id = id;
  object.kanjiWithRadical
      .attach(col, col.isar.collection<Kanji>(), r'kanjiWithRadical', id);
}

extension KanjiRadicalByIndex on IsarCollection<KanjiRadical> {
  Future<KanjiRadical?> getByRadical(String radical) {
    return getByIndex(r'radical', [radical]);
  }

  KanjiRadical? getByRadicalSync(String radical) {
    return getByIndexSync(r'radical', [radical]);
  }

  Future<bool> deleteByRadical(String radical) {
    return deleteByIndex(r'radical', [radical]);
  }

  bool deleteByRadicalSync(String radical) {
    return deleteByIndexSync(r'radical', [radical]);
  }

  Future<List<KanjiRadical?>> getAllByRadical(List<String> radicalValues) {
    final values = radicalValues.map((e) => [e]).toList();
    return getAllByIndex(r'radical', values);
  }

  List<KanjiRadical?> getAllByRadicalSync(List<String> radicalValues) {
    final values = radicalValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'radical', values);
  }

  Future<int> deleteAllByRadical(List<String> radicalValues) {
    final values = radicalValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'radical', values);
  }

  int deleteAllByRadicalSync(List<String> radicalValues) {
    final values = radicalValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'radical', values);
  }

  Future<Id> putByRadical(KanjiRadical object) {
    return putByIndex(r'radical', object);
  }

  Id putByRadicalSync(KanjiRadical object, {bool saveLinks = true}) {
    return putByIndexSync(r'radical', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByRadical(List<KanjiRadical> objects) {
    return putAllByIndex(r'radical', objects);
  }

  List<Id> putAllByRadicalSync(List<KanjiRadical> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'radical', objects, saveLinks: saveLinks);
  }
}

extension KanjiRadicalQueryWhereSort
    on QueryBuilder<KanjiRadical, KanjiRadical, QWhere> {
  QueryBuilder<KanjiRadical, KanjiRadical, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension KanjiRadicalQueryWhere
    on QueryBuilder<KanjiRadical, KanjiRadical, QWhereClause> {
  QueryBuilder<KanjiRadical, KanjiRadical, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterWhereClause> radicalEqualTo(
      String radical) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'radical',
        value: [radical],
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterWhereClause> radicalNotEqualTo(
      String radical) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'radical',
              lower: [],
              upper: [radical],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'radical',
              lower: [radical],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'radical',
              lower: [radical],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'radical',
              lower: [],
              upper: [radical],
              includeUpper: false,
            ));
      }
    });
  }
}

extension KanjiRadicalQueryFilter
    on QueryBuilder<KanjiRadical, KanjiRadical, QFilterCondition> {
  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      importanceEqualTo(KanjiRadicalImportance value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'importance',
        value: value,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      importanceGreaterThan(
    KanjiRadicalImportance value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'importance',
        value: value,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      importanceLessThan(
    KanjiRadicalImportance value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'importance',
        value: value,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      importanceBetween(
    KanjiRadicalImportance lower,
    KanjiRadicalImportance upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'importance',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      kangxiIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'kangxiId',
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      kangxiIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'kangxiId',
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      kangxiIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'kangxiId',
        value: value,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      kangxiIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'kangxiId',
        value: value,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      kangxiIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'kangxiId',
        value: value,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      kangxiIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'kangxiId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      meaningEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'meaning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      meaningGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'meaning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      meaningLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'meaning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      meaningBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'meaning',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      meaningStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'meaning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      meaningEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'meaning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      meaningContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'meaning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      meaningMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'meaning',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      meaningIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'meaning',
        value: '',
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      meaningIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'meaning',
        value: '',
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      positionEqualTo(KanjiRadicalPosition value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'position',
        value: value,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      positionGreaterThan(
    KanjiRadicalPosition value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'position',
        value: value,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      positionLessThan(
    KanjiRadicalPosition value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'position',
        value: value,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      positionBetween(
    KanjiRadicalPosition lower,
    KanjiRadicalPosition upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'position',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      radicalEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'radical',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      radicalGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'radical',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      radicalLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'radical',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      radicalBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'radical',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      radicalStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'radical',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      radicalEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'radical',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      radicalContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'radical',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      radicalMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'radical',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      radicalIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'radical',
        value: '',
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      radicalIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'radical',
        value: '',
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      readingEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reading',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      readingGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reading',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      readingLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reading',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      readingBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reading',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      readingStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'reading',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      readingEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'reading',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      readingContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'reading',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      readingMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'reading',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      readingIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reading',
        value: '',
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      readingIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'reading',
        value: '',
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      strokeCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'strokeCount',
        value: value,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      strokeCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'strokeCount',
        value: value,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      strokeCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'strokeCount',
        value: value,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      strokeCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'strokeCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      strokesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'strokes',
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      strokesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'strokes',
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      strokesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'strokes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      strokesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'strokes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      strokesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'strokes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      strokesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'strokes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      strokesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'strokes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      strokesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'strokes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      strokesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'strokes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      strokesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'strokes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      strokesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'strokes',
        value: '',
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      strokesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'strokes',
        value: '',
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      strokesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'strokes',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      strokesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'strokes',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      strokesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'strokes',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      strokesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'strokes',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      strokesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'strokes',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      strokesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'strokes',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      variantOfIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'variantOf',
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      variantOfIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'variantOf',
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      variantOfEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'variantOf',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      variantOfGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'variantOf',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      variantOfLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'variantOf',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      variantOfBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'variantOf',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      variantOfStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'variantOf',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      variantOfEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'variantOf',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      variantOfContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'variantOf',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      variantOfMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'variantOf',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      variantOfIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'variantOf',
        value: '',
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      variantOfIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'variantOf',
        value: '',
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      variantsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'variants',
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      variantsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'variants',
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      variantsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'variants',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      variantsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'variants',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      variantsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'variants',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      variantsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'variants',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      variantsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'variants',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      variantsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'variants',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      variantsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'variants',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      variantsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'variants',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      variantsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'variants',
        value: '',
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      variantsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'variants',
        value: '',
      ));
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      variantsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'variants',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      variantsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'variants',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      variantsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'variants',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      variantsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'variants',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      variantsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'variants',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      variantsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'variants',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension KanjiRadicalQueryObject
    on QueryBuilder<KanjiRadical, KanjiRadical, QFilterCondition> {}

extension KanjiRadicalQueryLinks
    on QueryBuilder<KanjiRadical, KanjiRadical, QFilterCondition> {
  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      kanjiWithRadical(FilterQuery<Kanji> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'kanjiWithRadical');
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      kanjiWithRadicalLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'kanjiWithRadical', length, true, length, true);
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      kanjiWithRadicalIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'kanjiWithRadical', 0, true, 0, true);
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      kanjiWithRadicalIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'kanjiWithRadical', 0, false, 999999, true);
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      kanjiWithRadicalLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'kanjiWithRadical', 0, true, length, include);
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      kanjiWithRadicalLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'kanjiWithRadical', length, include, 999999, true);
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterFilterCondition>
      kanjiWithRadicalLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'kanjiWithRadical', lower, includeLower, upper, includeUpper);
    });
  }
}

extension KanjiRadicalQuerySortBy
    on QueryBuilder<KanjiRadical, KanjiRadical, QSortBy> {
  QueryBuilder<KanjiRadical, KanjiRadical, QAfterSortBy> sortByImportance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'importance', Sort.asc);
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterSortBy>
      sortByImportanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'importance', Sort.desc);
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterSortBy> sortByKangxiId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kangxiId', Sort.asc);
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterSortBy> sortByKangxiIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kangxiId', Sort.desc);
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterSortBy> sortByMeaning() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meaning', Sort.asc);
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterSortBy> sortByMeaningDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meaning', Sort.desc);
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterSortBy> sortByPosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'position', Sort.asc);
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterSortBy> sortByPositionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'position', Sort.desc);
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterSortBy> sortByRadical() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'radical', Sort.asc);
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterSortBy> sortByRadicalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'radical', Sort.desc);
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterSortBy> sortByReading() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reading', Sort.asc);
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterSortBy> sortByReadingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reading', Sort.desc);
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterSortBy> sortByStrokeCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'strokeCount', Sort.asc);
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterSortBy>
      sortByStrokeCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'strokeCount', Sort.desc);
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterSortBy> sortByVariantOf() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'variantOf', Sort.asc);
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterSortBy> sortByVariantOfDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'variantOf', Sort.desc);
    });
  }
}

extension KanjiRadicalQuerySortThenBy
    on QueryBuilder<KanjiRadical, KanjiRadical, QSortThenBy> {
  QueryBuilder<KanjiRadical, KanjiRadical, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterSortBy> thenByImportance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'importance', Sort.asc);
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterSortBy>
      thenByImportanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'importance', Sort.desc);
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterSortBy> thenByKangxiId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kangxiId', Sort.asc);
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterSortBy> thenByKangxiIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kangxiId', Sort.desc);
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterSortBy> thenByMeaning() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meaning', Sort.asc);
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterSortBy> thenByMeaningDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meaning', Sort.desc);
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterSortBy> thenByPosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'position', Sort.asc);
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterSortBy> thenByPositionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'position', Sort.desc);
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterSortBy> thenByRadical() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'radical', Sort.asc);
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterSortBy> thenByRadicalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'radical', Sort.desc);
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterSortBy> thenByReading() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reading', Sort.asc);
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterSortBy> thenByReadingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reading', Sort.desc);
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterSortBy> thenByStrokeCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'strokeCount', Sort.asc);
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterSortBy>
      thenByStrokeCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'strokeCount', Sort.desc);
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterSortBy> thenByVariantOf() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'variantOf', Sort.asc);
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QAfterSortBy> thenByVariantOfDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'variantOf', Sort.desc);
    });
  }
}

extension KanjiRadicalQueryWhereDistinct
    on QueryBuilder<KanjiRadical, KanjiRadical, QDistinct> {
  QueryBuilder<KanjiRadical, KanjiRadical, QDistinct> distinctByImportance() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'importance');
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QDistinct> distinctByKangxiId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'kangxiId');
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QDistinct> distinctByMeaning(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'meaning', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QDistinct> distinctByPosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'position');
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QDistinct> distinctByRadical(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'radical', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QDistinct> distinctByReading(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reading', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QDistinct> distinctByStrokeCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'strokeCount');
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QDistinct> distinctByStrokes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'strokes');
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QDistinct> distinctByVariantOf(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'variantOf', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadical, QDistinct> distinctByVariants() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'variants');
    });
  }
}

extension KanjiRadicalQueryProperty
    on QueryBuilder<KanjiRadical, KanjiRadical, QQueryProperty> {
  QueryBuilder<KanjiRadical, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadicalImportance, QQueryOperations>
      importanceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'importance');
    });
  }

  QueryBuilder<KanjiRadical, int?, QQueryOperations> kangxiIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'kangxiId');
    });
  }

  QueryBuilder<KanjiRadical, String, QQueryOperations> meaningProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'meaning');
    });
  }

  QueryBuilder<KanjiRadical, KanjiRadicalPosition, QQueryOperations>
      positionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'position');
    });
  }

  QueryBuilder<KanjiRadical, String, QQueryOperations> radicalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'radical');
    });
  }

  QueryBuilder<KanjiRadical, String, QQueryOperations> readingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reading');
    });
  }

  QueryBuilder<KanjiRadical, int, QQueryOperations> strokeCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'strokeCount');
    });
  }

  QueryBuilder<KanjiRadical, List<String>?, QQueryOperations>
      strokesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'strokes');
    });
  }

  QueryBuilder<KanjiRadical, String?, QQueryOperations> variantOfProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'variantOf');
    });
  }

  QueryBuilder<KanjiRadical, List<String>?, QQueryOperations>
      variantsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'variants');
    });
  }
}
