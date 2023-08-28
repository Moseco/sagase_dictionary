// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proper_noun.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetProperNounCollection on Isar {
  IsarCollection<ProperNoun> get properNouns => this.collection();
}

const ProperNounSchema = CollectionSchema(
  name: r'ProperNoun',
  id: -2983283169531870950,
  properties: {
    r'reading': PropertySchema(
      id: 0,
      name: r'reading',
      type: IsarType.string,
    ),
    r'romaji': PropertySchema(
      id: 1,
      name: r'romaji',
      type: IsarType.string,
    ),
    r'types': PropertySchema(
      id: 2,
      name: r'types',
      type: IsarType.byteList,
      enumMap: _ProperNountypesEnumValueMap,
    ),
    r'writing': PropertySchema(
      id: 3,
      name: r'writing',
      type: IsarType.string,
    )
  },
  estimateSize: _properNounEstimateSize,
  serialize: _properNounSerialize,
  deserialize: _properNounDeserialize,
  deserializeProp: _properNounDeserializeProp,
  idName: r'id',
  indexes: {
    r'writing': IndexSchema(
      id: 4145483005888724849,
      name: r'writing',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'writing',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    ),
    r'reading': IndexSchema(
      id: -8872607090340677149,
      name: r'reading',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'reading',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    ),
    r'romaji': IndexSchema(
      id: 8838462283043294347,
      name: r'romaji',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'romaji',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _properNounGetId,
  getLinks: _properNounGetLinks,
  attach: _properNounAttach,
  version: '3.1.0+1',
);

int _properNounEstimateSize(
  ProperNoun object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.reading;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.romaji.length * 3;
  bytesCount += 3 + object.types.length;
  bytesCount += 3 + object.writing.length * 3;
  return bytesCount;
}

void _properNounSerialize(
  ProperNoun object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.reading);
  writer.writeString(offsets[1], object.romaji);
  writer.writeByteList(offsets[2], object.types.map((e) => e.index).toList());
  writer.writeString(offsets[3], object.writing);
}

ProperNoun _properNounDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ProperNoun();
  object.id = id;
  object.reading = reader.readStringOrNull(offsets[0]);
  object.romaji = reader.readString(offsets[1]);
  object.types = reader
          .readByteList(offsets[2])
          ?.map(
              (e) => _ProperNountypesValueEnumMap[e] ?? ProperNounType.surname)
          .toList() ??
      [];
  object.writing = reader.readString(offsets[3]);
  return object;
}

P _properNounDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader
              .readByteList(offset)
              ?.map((e) =>
                  _ProperNountypesValueEnumMap[e] ?? ProperNounType.surname)
              .toList() ??
          []) as P;
    case 3:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ProperNountypesEnumValueMap = {
  'surname': 0,
  'placeName': 1,
  'personName': 2,
  'givenName': 3,
  'femaleName': 4,
  'maleName': 5,
  'fullName': 6,
  'product': 7,
  'company': 8,
  'organization': 9,
  'station': 10,
  'workOfArt': 11,
  'group': 12,
  'object': 13,
  'service': 14,
  'character': 15,
  'legend': 16,
  'creature': 17,
  'event': 18,
  'myth': 19,
  'fiction': 20,
  'deity': 21,
  'ship': 22,
  'document': 23,
  'religion': 24,
  'unknown': 25,
};
const _ProperNountypesValueEnumMap = {
  0: ProperNounType.surname,
  1: ProperNounType.placeName,
  2: ProperNounType.personName,
  3: ProperNounType.givenName,
  4: ProperNounType.femaleName,
  5: ProperNounType.maleName,
  6: ProperNounType.fullName,
  7: ProperNounType.product,
  8: ProperNounType.company,
  9: ProperNounType.organization,
  10: ProperNounType.station,
  11: ProperNounType.workOfArt,
  12: ProperNounType.group,
  13: ProperNounType.object,
  14: ProperNounType.service,
  15: ProperNounType.character,
  16: ProperNounType.legend,
  17: ProperNounType.creature,
  18: ProperNounType.event,
  19: ProperNounType.myth,
  20: ProperNounType.fiction,
  21: ProperNounType.deity,
  22: ProperNounType.ship,
  23: ProperNounType.document,
  24: ProperNounType.religion,
  25: ProperNounType.unknown,
};

Id _properNounGetId(ProperNoun object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _properNounGetLinks(ProperNoun object) {
  return [];
}

void _properNounAttach(IsarCollection<dynamic> col, Id id, ProperNoun object) {
  object.id = id;
}

extension ProperNounQueryWhereSort
    on QueryBuilder<ProperNoun, ProperNoun, QWhere> {
  QueryBuilder<ProperNoun, ProperNoun, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterWhere> anyWriting() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'writing'),
      );
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterWhere> anyReading() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'reading'),
      );
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterWhere> anyRomaji() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'romaji'),
      );
    });
  }
}

extension ProperNounQueryWhere
    on QueryBuilder<ProperNoun, ProperNoun, QWhereClause> {
  QueryBuilder<ProperNoun, ProperNoun, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<ProperNoun, ProperNoun, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterWhereClause> idBetween(
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

  QueryBuilder<ProperNoun, ProperNoun, QAfterWhereClause> writingEqualTo(
      String writing) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'writing',
        value: [writing],
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterWhereClause> writingNotEqualTo(
      String writing) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'writing',
              lower: [],
              upper: [writing],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'writing',
              lower: [writing],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'writing',
              lower: [writing],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'writing',
              lower: [],
              upper: [writing],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterWhereClause> writingGreaterThan(
    String writing, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'writing',
        lower: [writing],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterWhereClause> writingLessThan(
    String writing, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'writing',
        lower: [],
        upper: [writing],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterWhereClause> writingBetween(
    String lowerWriting,
    String upperWriting, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'writing',
        lower: [lowerWriting],
        includeLower: includeLower,
        upper: [upperWriting],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterWhereClause> writingStartsWith(
      String WritingPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'writing',
        lower: [WritingPrefix],
        upper: ['$WritingPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterWhereClause> writingIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'writing',
        value: [''],
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterWhereClause> writingIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'writing',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'writing',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'writing',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'writing',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterWhereClause> readingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'reading',
        value: [null],
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterWhereClause> readingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'reading',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterWhereClause> readingEqualTo(
      String? reading) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'reading',
        value: [reading],
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterWhereClause> readingNotEqualTo(
      String? reading) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reading',
              lower: [],
              upper: [reading],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reading',
              lower: [reading],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reading',
              lower: [reading],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reading',
              lower: [],
              upper: [reading],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterWhereClause> readingGreaterThan(
    String? reading, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'reading',
        lower: [reading],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterWhereClause> readingLessThan(
    String? reading, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'reading',
        lower: [],
        upper: [reading],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterWhereClause> readingBetween(
    String? lowerReading,
    String? upperReading, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'reading',
        lower: [lowerReading],
        includeLower: includeLower,
        upper: [upperReading],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterWhereClause> readingStartsWith(
      String ReadingPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'reading',
        lower: [ReadingPrefix],
        upper: ['$ReadingPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterWhereClause> readingIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'reading',
        value: [''],
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterWhereClause> readingIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'reading',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'reading',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'reading',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'reading',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterWhereClause> romajiEqualTo(
      String romaji) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'romaji',
        value: [romaji],
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterWhereClause> romajiNotEqualTo(
      String romaji) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'romaji',
              lower: [],
              upper: [romaji],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'romaji',
              lower: [romaji],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'romaji',
              lower: [romaji],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'romaji',
              lower: [],
              upper: [romaji],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterWhereClause> romajiGreaterThan(
    String romaji, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'romaji',
        lower: [romaji],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterWhereClause> romajiLessThan(
    String romaji, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'romaji',
        lower: [],
        upper: [romaji],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterWhereClause> romajiBetween(
    String lowerRomaji,
    String upperRomaji, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'romaji',
        lower: [lowerRomaji],
        includeLower: includeLower,
        upper: [upperRomaji],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterWhereClause> romajiStartsWith(
      String RomajiPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'romaji',
        lower: [RomajiPrefix],
        upper: ['$RomajiPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterWhereClause> romajiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'romaji',
        value: [''],
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterWhereClause> romajiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'romaji',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'romaji',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'romaji',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'romaji',
              upper: [''],
            ));
      }
    });
  }
}

extension ProperNounQueryFilter
    on QueryBuilder<ProperNoun, ProperNoun, QFilterCondition> {
  QueryBuilder<ProperNoun, ProperNoun, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ProperNoun, ProperNoun, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ProperNoun, ProperNoun, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ProperNoun, ProperNoun, QAfterFilterCondition> readingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'reading',
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterFilterCondition>
      readingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'reading',
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterFilterCondition> readingEqualTo(
    String? value, {
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

  QueryBuilder<ProperNoun, ProperNoun, QAfterFilterCondition>
      readingGreaterThan(
    String? value, {
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

  QueryBuilder<ProperNoun, ProperNoun, QAfterFilterCondition> readingLessThan(
    String? value, {
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

  QueryBuilder<ProperNoun, ProperNoun, QAfterFilterCondition> readingBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<ProperNoun, ProperNoun, QAfterFilterCondition> readingStartsWith(
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

  QueryBuilder<ProperNoun, ProperNoun, QAfterFilterCondition> readingEndsWith(
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

  QueryBuilder<ProperNoun, ProperNoun, QAfterFilterCondition> readingContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'reading',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterFilterCondition> readingMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'reading',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterFilterCondition> readingIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reading',
        value: '',
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterFilterCondition>
      readingIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'reading',
        value: '',
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterFilterCondition> romajiEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'romaji',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterFilterCondition> romajiGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'romaji',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterFilterCondition> romajiLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'romaji',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterFilterCondition> romajiBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'romaji',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterFilterCondition> romajiStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'romaji',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterFilterCondition> romajiEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'romaji',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterFilterCondition> romajiContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'romaji',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterFilterCondition> romajiMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'romaji',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterFilterCondition> romajiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'romaji',
        value: '',
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterFilterCondition>
      romajiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'romaji',
        value: '',
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterFilterCondition>
      typesElementEqualTo(ProperNounType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'types',
        value: value,
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterFilterCondition>
      typesElementGreaterThan(
    ProperNounType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'types',
        value: value,
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterFilterCondition>
      typesElementLessThan(
    ProperNounType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'types',
        value: value,
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterFilterCondition>
      typesElementBetween(
    ProperNounType lower,
    ProperNounType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'types',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterFilterCondition>
      typesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'types',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterFilterCondition> typesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'types',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterFilterCondition>
      typesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'types',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterFilterCondition>
      typesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'types',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterFilterCondition>
      typesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'types',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterFilterCondition>
      typesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'types',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterFilterCondition> writingEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'writing',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterFilterCondition>
      writingGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'writing',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterFilterCondition> writingLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'writing',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterFilterCondition> writingBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'writing',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterFilterCondition> writingStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'writing',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterFilterCondition> writingEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'writing',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterFilterCondition> writingContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'writing',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterFilterCondition> writingMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'writing',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterFilterCondition> writingIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'writing',
        value: '',
      ));
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterFilterCondition>
      writingIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'writing',
        value: '',
      ));
    });
  }
}

extension ProperNounQueryObject
    on QueryBuilder<ProperNoun, ProperNoun, QFilterCondition> {}

extension ProperNounQueryLinks
    on QueryBuilder<ProperNoun, ProperNoun, QFilterCondition> {}

extension ProperNounQuerySortBy
    on QueryBuilder<ProperNoun, ProperNoun, QSortBy> {
  QueryBuilder<ProperNoun, ProperNoun, QAfterSortBy> sortByReading() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reading', Sort.asc);
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterSortBy> sortByReadingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reading', Sort.desc);
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterSortBy> sortByRomaji() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'romaji', Sort.asc);
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterSortBy> sortByRomajiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'romaji', Sort.desc);
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterSortBy> sortByWriting() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'writing', Sort.asc);
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterSortBy> sortByWritingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'writing', Sort.desc);
    });
  }
}

extension ProperNounQuerySortThenBy
    on QueryBuilder<ProperNoun, ProperNoun, QSortThenBy> {
  QueryBuilder<ProperNoun, ProperNoun, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterSortBy> thenByReading() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reading', Sort.asc);
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterSortBy> thenByReadingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reading', Sort.desc);
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterSortBy> thenByRomaji() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'romaji', Sort.asc);
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterSortBy> thenByRomajiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'romaji', Sort.desc);
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterSortBy> thenByWriting() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'writing', Sort.asc);
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QAfterSortBy> thenByWritingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'writing', Sort.desc);
    });
  }
}

extension ProperNounQueryWhereDistinct
    on QueryBuilder<ProperNoun, ProperNoun, QDistinct> {
  QueryBuilder<ProperNoun, ProperNoun, QDistinct> distinctByReading(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reading', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QDistinct> distinctByRomaji(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'romaji', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QDistinct> distinctByTypes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'types');
    });
  }

  QueryBuilder<ProperNoun, ProperNoun, QDistinct> distinctByWriting(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'writing', caseSensitive: caseSensitive);
    });
  }
}

extension ProperNounQueryProperty
    on QueryBuilder<ProperNoun, ProperNoun, QQueryProperty> {
  QueryBuilder<ProperNoun, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ProperNoun, String?, QQueryOperations> readingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reading');
    });
  }

  QueryBuilder<ProperNoun, String, QQueryOperations> romajiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'romaji');
    });
  }

  QueryBuilder<ProperNoun, List<ProperNounType>, QQueryOperations>
      typesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'types');
    });
  }

  QueryBuilder<ProperNoun, String, QQueryOperations> writingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'writing');
    });
  }
}
