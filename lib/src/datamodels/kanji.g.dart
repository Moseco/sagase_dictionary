// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kanji.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetKanjiCollection on Isar {
  IsarCollection<Kanji> get kanjis => this.collection();
}

const KanjiSchema = CollectionSchema(
  name: r'Kanji',
  id: 1338500017057314139,
  properties: {
    r'components': PropertySchema(
      id: 0,
      name: r'components',
      type: IsarType.stringList,
    ),
    r'compounds': PropertySchema(
      id: 1,
      name: r'compounds',
      type: IsarType.longList,
    ),
    r'frequency': PropertySchema(
      id: 2,
      name: r'frequency',
      type: IsarType.long,
    ),
    r'grade': PropertySchema(
      id: 3,
      name: r'grade',
      type: IsarType.byte,
    ),
    r'jlpt': PropertySchema(
      id: 4,
      name: r'jlpt',
      type: IsarType.byte,
    ),
    r'kanji': PropertySchema(
      id: 5,
      name: r'kanji',
      type: IsarType.string,
    ),
    r'kunReadings': PropertySchema(
      id: 6,
      name: r'kunReadings',
      type: IsarType.stringList,
    ),
    r'meanings': PropertySchema(
      id: 7,
      name: r'meanings',
      type: IsarType.stringList,
    ),
    r'nanori': PropertySchema(
      id: 8,
      name: r'nanori',
      type: IsarType.stringList,
    ),
    r'onReadings': PropertySchema(
      id: 9,
      name: r'onReadings',
      type: IsarType.stringList,
    ),
    r'radical': PropertySchema(
      id: 10,
      name: r'radical',
      type: IsarType.string,
    ),
    r'readingIndex': PropertySchema(
      id: 11,
      name: r'readingIndex',
      type: IsarType.stringList,
    ),
    r'spacedRepetitionData': PropertySchema(
      id: 12,
      name: r'spacedRepetitionData',
      type: IsarType.object,
      target: r'SpacedRepetitionData',
    ),
    r'spacedRepetitionDataEnglish': PropertySchema(
      id: 13,
      name: r'spacedRepetitionDataEnglish',
      type: IsarType.object,
      target: r'SpacedRepetitionData',
    ),
    r'strokeCount': PropertySchema(
      id: 14,
      name: r'strokeCount',
      type: IsarType.byte,
    ),
    r'strokes': PropertySchema(
      id: 15,
      name: r'strokes',
      type: IsarType.stringList,
    )
  },
  estimateSize: _kanjiEstimateSize,
  serialize: _kanjiSerialize,
  deserialize: _kanjiDeserialize,
  deserializeProp: _kanjiDeserializeProp,
  idName: r'id',
  indexes: {
    r'radical': IndexSchema(
      id: -5731891106966412493,
      name: r'radical',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'radical',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'meanings': IndexSchema(
      id: 8219783416830359807,
      name: r'meanings',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'meanings',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'readingIndex': IndexSchema(
      id: -5711563875198595583,
      name: r'readingIndex',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'readingIndex',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {r'SpacedRepetitionData': SpacedRepetitionDataSchema},
  getId: _kanjiGetId,
  getLinks: _kanjiGetLinks,
  attach: _kanjiAttach,
  version: '3.1.0+1',
);

int _kanjiEstimateSize(
  Kanji object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.components;
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
    final value = object.compounds;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  bytesCount += 3 + object.kanji.length * 3;
  {
    final list = object.kunReadings;
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
    final list = object.meanings;
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
    final list = object.nanori;
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
    final list = object.onReadings;
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
  bytesCount += 3 + object.radical.length * 3;
  {
    final list = object.readingIndex;
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
    final value = object.spacedRepetitionData;
    if (value != null) {
      bytesCount += 3 +
          SpacedRepetitionDataSchema.estimateSize(
              value, allOffsets[SpacedRepetitionData]!, allOffsets);
    }
  }
  {
    final value = object.spacedRepetitionDataEnglish;
    if (value != null) {
      bytesCount += 3 +
          SpacedRepetitionDataSchema.estimateSize(
              value, allOffsets[SpacedRepetitionData]!, allOffsets);
    }
  }
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
  return bytesCount;
}

void _kanjiSerialize(
  Kanji object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.components);
  writer.writeLongList(offsets[1], object.compounds);
  writer.writeLong(offsets[2], object.frequency);
  writer.writeByte(offsets[3], object.grade);
  writer.writeByte(offsets[4], object.jlpt);
  writer.writeString(offsets[5], object.kanji);
  writer.writeStringList(offsets[6], object.kunReadings);
  writer.writeStringList(offsets[7], object.meanings);
  writer.writeStringList(offsets[8], object.nanori);
  writer.writeStringList(offsets[9], object.onReadings);
  writer.writeString(offsets[10], object.radical);
  writer.writeStringList(offsets[11], object.readingIndex);
  writer.writeObject<SpacedRepetitionData>(
    offsets[12],
    allOffsets,
    SpacedRepetitionDataSchema.serialize,
    object.spacedRepetitionData,
  );
  writer.writeObject<SpacedRepetitionData>(
    offsets[13],
    allOffsets,
    SpacedRepetitionDataSchema.serialize,
    object.spacedRepetitionDataEnglish,
  );
  writer.writeByte(offsets[14], object.strokeCount);
  writer.writeStringList(offsets[15], object.strokes);
}

Kanji _kanjiDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Kanji();
  object.components = reader.readStringList(offsets[0]);
  object.compounds = reader.readLongList(offsets[1]);
  object.frequency = reader.readLongOrNull(offsets[2]);
  object.grade = reader.readByte(offsets[3]);
  object.id = id;
  object.jlpt = reader.readByte(offsets[4]);
  object.kanji = reader.readString(offsets[5]);
  object.kunReadings = reader.readStringList(offsets[6]);
  object.meanings = reader.readStringList(offsets[7]);
  object.nanori = reader.readStringList(offsets[8]);
  object.onReadings = reader.readStringList(offsets[9]);
  object.radical = reader.readString(offsets[10]);
  object.readingIndex = reader.readStringList(offsets[11]);
  object.spacedRepetitionData = reader.readObjectOrNull<SpacedRepetitionData>(
    offsets[12],
    SpacedRepetitionDataSchema.deserialize,
    allOffsets,
  );
  object.spacedRepetitionDataEnglish =
      reader.readObjectOrNull<SpacedRepetitionData>(
    offsets[13],
    SpacedRepetitionDataSchema.deserialize,
    allOffsets,
  );
  object.strokeCount = reader.readByte(offsets[14]);
  object.strokes = reader.readStringList(offsets[15]);
  return object;
}

P _kanjiDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset)) as P;
    case 1:
      return (reader.readLongList(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readByte(offset)) as P;
    case 4:
      return (reader.readByte(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readStringList(offset)) as P;
    case 7:
      return (reader.readStringList(offset)) as P;
    case 8:
      return (reader.readStringList(offset)) as P;
    case 9:
      return (reader.readStringList(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readStringList(offset)) as P;
    case 12:
      return (reader.readObjectOrNull<SpacedRepetitionData>(
        offset,
        SpacedRepetitionDataSchema.deserialize,
        allOffsets,
      )) as P;
    case 13:
      return (reader.readObjectOrNull<SpacedRepetitionData>(
        offset,
        SpacedRepetitionDataSchema.deserialize,
        allOffsets,
      )) as P;
    case 14:
      return (reader.readByte(offset)) as P;
    case 15:
      return (reader.readStringList(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _kanjiGetId(Kanji object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _kanjiGetLinks(Kanji object) {
  return [];
}

void _kanjiAttach(IsarCollection<dynamic> col, Id id, Kanji object) {
  object.id = id;
}

extension KanjiQueryWhereSort on QueryBuilder<Kanji, Kanji, QWhere> {
  QueryBuilder<Kanji, Kanji, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterWhere> anyMeaningsElement() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'meanings'),
      );
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterWhere> anyReadingIndexElement() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'readingIndex'),
      );
    });
  }
}

extension KanjiQueryWhere on QueryBuilder<Kanji, Kanji, QWhereClause> {
  QueryBuilder<Kanji, Kanji, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Kanji, Kanji, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterWhereClause> idBetween(
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

  QueryBuilder<Kanji, Kanji, QAfterWhereClause> radicalEqualTo(String radical) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'radical',
        value: [radical],
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterWhereClause> radicalNotEqualTo(
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

  QueryBuilder<Kanji, Kanji, QAfterWhereClause> meaningsElementEqualTo(
      String meaningsElement) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'meanings',
        value: [meaningsElement],
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterWhereClause> meaningsElementNotEqualTo(
      String meaningsElement) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'meanings',
              lower: [],
              upper: [meaningsElement],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'meanings',
              lower: [meaningsElement],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'meanings',
              lower: [meaningsElement],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'meanings',
              lower: [],
              upper: [meaningsElement],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterWhereClause> meaningsElementGreaterThan(
    String meaningsElement, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'meanings',
        lower: [meaningsElement],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterWhereClause> meaningsElementLessThan(
    String meaningsElement, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'meanings',
        lower: [],
        upper: [meaningsElement],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterWhereClause> meaningsElementBetween(
    String lowerMeaningsElement,
    String upperMeaningsElement, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'meanings',
        lower: [lowerMeaningsElement],
        includeLower: includeLower,
        upper: [upperMeaningsElement],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterWhereClause> meaningsElementStartsWith(
      String MeaningsElementPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'meanings',
        lower: [MeaningsElementPrefix],
        upper: ['$MeaningsElementPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterWhereClause> meaningsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'meanings',
        value: [''],
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterWhereClause> meaningsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'meanings',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'meanings',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'meanings',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'meanings',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterWhereClause> readingIndexElementEqualTo(
      String readingIndexElement) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'readingIndex',
        value: [readingIndexElement],
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterWhereClause> readingIndexElementNotEqualTo(
      String readingIndexElement) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'readingIndex',
              lower: [],
              upper: [readingIndexElement],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'readingIndex',
              lower: [readingIndexElement],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'readingIndex',
              lower: [readingIndexElement],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'readingIndex',
              lower: [],
              upper: [readingIndexElement],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterWhereClause> readingIndexElementGreaterThan(
    String readingIndexElement, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'readingIndex',
        lower: [readingIndexElement],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterWhereClause> readingIndexElementLessThan(
    String readingIndexElement, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'readingIndex',
        lower: [],
        upper: [readingIndexElement],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterWhereClause> readingIndexElementBetween(
    String lowerReadingIndexElement,
    String upperReadingIndexElement, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'readingIndex',
        lower: [lowerReadingIndexElement],
        includeLower: includeLower,
        upper: [upperReadingIndexElement],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterWhereClause> readingIndexElementStartsWith(
      String ReadingIndexElementPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'readingIndex',
        lower: [ReadingIndexElementPrefix],
        upper: ['$ReadingIndexElementPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterWhereClause> readingIndexElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'readingIndex',
        value: [''],
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterWhereClause>
      readingIndexElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'readingIndex',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'readingIndex',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'readingIndex',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'readingIndex',
              upper: [''],
            ));
      }
    });
  }
}

extension KanjiQueryFilter on QueryBuilder<Kanji, Kanji, QFilterCondition> {
  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> componentsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'components',
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> componentsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'components',
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> componentsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'components',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition>
      componentsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'components',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> componentsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'components',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> componentsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'components',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> componentsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'components',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> componentsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'components',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> componentsElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'components',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> componentsElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'components',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> componentsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'components',
        value: '',
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition>
      componentsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'components',
        value: '',
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> componentsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'components',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> componentsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'components',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> componentsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'components',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> componentsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'components',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> componentsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'components',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> componentsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'components',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> compoundsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'compounds',
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> compoundsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'compounds',
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> compoundsElementEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'compounds',
        value: value,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> compoundsElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'compounds',
        value: value,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> compoundsElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'compounds',
        value: value,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> compoundsElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'compounds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> compoundsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'compounds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> compoundsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'compounds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> compoundsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'compounds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> compoundsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'compounds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> compoundsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'compounds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> compoundsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'compounds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> frequencyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frequency',
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> frequencyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frequency',
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> frequencyEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frequency',
        value: value,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> frequencyGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frequency',
        value: value,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> frequencyLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frequency',
        value: value,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> frequencyBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frequency',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> gradeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grade',
        value: value,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> gradeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'grade',
        value: value,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> gradeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'grade',
        value: value,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> gradeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'grade',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> jlptEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jlpt',
        value: value,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> jlptGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'jlpt',
        value: value,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> jlptLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'jlpt',
        value: value,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> jlptBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'jlpt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> kanjiEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'kanji',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> kanjiGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'kanji',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> kanjiLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'kanji',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> kanjiBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'kanji',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> kanjiStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'kanji',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> kanjiEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'kanji',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> kanjiContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'kanji',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> kanjiMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'kanji',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> kanjiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'kanji',
        value: '',
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> kanjiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'kanji',
        value: '',
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> kunReadingsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'kunReadings',
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> kunReadingsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'kunReadings',
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> kunReadingsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'kunReadings',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition>
      kunReadingsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'kunReadings',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> kunReadingsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'kunReadings',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> kunReadingsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'kunReadings',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition>
      kunReadingsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'kunReadings',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> kunReadingsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'kunReadings',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> kunReadingsElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'kunReadings',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> kunReadingsElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'kunReadings',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition>
      kunReadingsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'kunReadings',
        value: '',
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition>
      kunReadingsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'kunReadings',
        value: '',
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> kunReadingsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'kunReadings',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> kunReadingsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'kunReadings',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> kunReadingsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'kunReadings',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> kunReadingsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'kunReadings',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition>
      kunReadingsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'kunReadings',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> kunReadingsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'kunReadings',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> meaningsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'meanings',
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> meaningsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'meanings',
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> meaningsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'meanings',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> meaningsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'meanings',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> meaningsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'meanings',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> meaningsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'meanings',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> meaningsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'meanings',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> meaningsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'meanings',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> meaningsElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'meanings',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> meaningsElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'meanings',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> meaningsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'meanings',
        value: '',
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition>
      meaningsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'meanings',
        value: '',
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> meaningsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'meanings',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> meaningsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'meanings',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> meaningsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'meanings',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> meaningsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'meanings',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> meaningsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'meanings',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> meaningsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'meanings',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> nanoriIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nanori',
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> nanoriIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nanori',
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> nanoriElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nanori',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> nanoriElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nanori',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> nanoriElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nanori',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> nanoriElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nanori',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> nanoriElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nanori',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> nanoriElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nanori',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> nanoriElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nanori',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> nanoriElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nanori',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> nanoriElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nanori',
        value: '',
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> nanoriElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nanori',
        value: '',
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> nanoriLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'nanori',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> nanoriIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'nanori',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> nanoriIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'nanori',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> nanoriLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'nanori',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> nanoriLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'nanori',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> nanoriLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'nanori',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> onReadingsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'onReadings',
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> onReadingsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'onReadings',
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> onReadingsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'onReadings',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition>
      onReadingsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'onReadings',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> onReadingsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'onReadings',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> onReadingsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'onReadings',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> onReadingsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'onReadings',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> onReadingsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'onReadings',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> onReadingsElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'onReadings',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> onReadingsElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'onReadings',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> onReadingsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'onReadings',
        value: '',
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition>
      onReadingsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'onReadings',
        value: '',
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> onReadingsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'onReadings',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> onReadingsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'onReadings',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> onReadingsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'onReadings',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> onReadingsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'onReadings',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> onReadingsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'onReadings',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> onReadingsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'onReadings',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> radicalEqualTo(
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

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> radicalGreaterThan(
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

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> radicalLessThan(
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

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> radicalBetween(
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

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> radicalStartsWith(
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

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> radicalEndsWith(
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

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> radicalContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'radical',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> radicalMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'radical',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> radicalIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'radical',
        value: '',
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> radicalIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'radical',
        value: '',
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> readingIndexIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'readingIndex',
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> readingIndexIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'readingIndex',
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> readingIndexElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'readingIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition>
      readingIndexElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'readingIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> readingIndexElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'readingIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> readingIndexElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'readingIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition>
      readingIndexElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'readingIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> readingIndexElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'readingIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> readingIndexElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'readingIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> readingIndexElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'readingIndex',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition>
      readingIndexElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'readingIndex',
        value: '',
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition>
      readingIndexElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'readingIndex',
        value: '',
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> readingIndexLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'readingIndex',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> readingIndexIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'readingIndex',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> readingIndexIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'readingIndex',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> readingIndexLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'readingIndex',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition>
      readingIndexLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'readingIndex',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> readingIndexLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'readingIndex',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition>
      spacedRepetitionDataIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'spacedRepetitionData',
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition>
      spacedRepetitionDataIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'spacedRepetitionData',
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition>
      spacedRepetitionDataEnglishIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'spacedRepetitionDataEnglish',
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition>
      spacedRepetitionDataEnglishIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'spacedRepetitionDataEnglish',
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> strokeCountEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'strokeCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> strokeCountGreaterThan(
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

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> strokeCountLessThan(
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

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> strokeCountBetween(
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

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> strokesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'strokes',
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> strokesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'strokes',
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> strokesElementEqualTo(
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

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> strokesElementGreaterThan(
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

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> strokesElementLessThan(
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

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> strokesElementBetween(
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

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> strokesElementStartsWith(
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

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> strokesElementEndsWith(
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

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> strokesElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'strokes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> strokesElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'strokes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> strokesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'strokes',
        value: '',
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> strokesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'strokes',
        value: '',
      ));
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> strokesLengthEqualTo(
      int length) {
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

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> strokesIsEmpty() {
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

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> strokesIsNotEmpty() {
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

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> strokesLengthLessThan(
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

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> strokesLengthGreaterThan(
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

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> strokesLengthBetween(
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
}

extension KanjiQueryObject on QueryBuilder<Kanji, Kanji, QFilterCondition> {
  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> spacedRepetitionData(
      FilterQuery<SpacedRepetitionData> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'spacedRepetitionData');
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterFilterCondition> spacedRepetitionDataEnglish(
      FilterQuery<SpacedRepetitionData> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'spacedRepetitionDataEnglish');
    });
  }
}

extension KanjiQueryLinks on QueryBuilder<Kanji, Kanji, QFilterCondition> {}

extension KanjiQuerySortBy on QueryBuilder<Kanji, Kanji, QSortBy> {
  QueryBuilder<Kanji, Kanji, QAfterSortBy> sortByFrequency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frequency', Sort.asc);
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterSortBy> sortByFrequencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frequency', Sort.desc);
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterSortBy> sortByGrade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.asc);
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterSortBy> sortByGradeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.desc);
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterSortBy> sortByJlpt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jlpt', Sort.asc);
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterSortBy> sortByJlptDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jlpt', Sort.desc);
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterSortBy> sortByKanji() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kanji', Sort.asc);
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterSortBy> sortByKanjiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kanji', Sort.desc);
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterSortBy> sortByRadical() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'radical', Sort.asc);
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterSortBy> sortByRadicalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'radical', Sort.desc);
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterSortBy> sortByStrokeCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'strokeCount', Sort.asc);
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterSortBy> sortByStrokeCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'strokeCount', Sort.desc);
    });
  }
}

extension KanjiQuerySortThenBy on QueryBuilder<Kanji, Kanji, QSortThenBy> {
  QueryBuilder<Kanji, Kanji, QAfterSortBy> thenByFrequency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frequency', Sort.asc);
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterSortBy> thenByFrequencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frequency', Sort.desc);
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterSortBy> thenByGrade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.asc);
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterSortBy> thenByGradeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.desc);
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterSortBy> thenByJlpt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jlpt', Sort.asc);
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterSortBy> thenByJlptDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jlpt', Sort.desc);
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterSortBy> thenByKanji() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kanji', Sort.asc);
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterSortBy> thenByKanjiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kanji', Sort.desc);
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterSortBy> thenByRadical() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'radical', Sort.asc);
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterSortBy> thenByRadicalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'radical', Sort.desc);
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterSortBy> thenByStrokeCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'strokeCount', Sort.asc);
    });
  }

  QueryBuilder<Kanji, Kanji, QAfterSortBy> thenByStrokeCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'strokeCount', Sort.desc);
    });
  }
}

extension KanjiQueryWhereDistinct on QueryBuilder<Kanji, Kanji, QDistinct> {
  QueryBuilder<Kanji, Kanji, QDistinct> distinctByComponents() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'components');
    });
  }

  QueryBuilder<Kanji, Kanji, QDistinct> distinctByCompounds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'compounds');
    });
  }

  QueryBuilder<Kanji, Kanji, QDistinct> distinctByFrequency() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'frequency');
    });
  }

  QueryBuilder<Kanji, Kanji, QDistinct> distinctByGrade() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'grade');
    });
  }

  QueryBuilder<Kanji, Kanji, QDistinct> distinctByJlpt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'jlpt');
    });
  }

  QueryBuilder<Kanji, Kanji, QDistinct> distinctByKanji(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'kanji', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Kanji, Kanji, QDistinct> distinctByKunReadings() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'kunReadings');
    });
  }

  QueryBuilder<Kanji, Kanji, QDistinct> distinctByMeanings() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'meanings');
    });
  }

  QueryBuilder<Kanji, Kanji, QDistinct> distinctByNanori() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nanori');
    });
  }

  QueryBuilder<Kanji, Kanji, QDistinct> distinctByOnReadings() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'onReadings');
    });
  }

  QueryBuilder<Kanji, Kanji, QDistinct> distinctByRadical(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'radical', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Kanji, Kanji, QDistinct> distinctByReadingIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'readingIndex');
    });
  }

  QueryBuilder<Kanji, Kanji, QDistinct> distinctByStrokeCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'strokeCount');
    });
  }

  QueryBuilder<Kanji, Kanji, QDistinct> distinctByStrokes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'strokes');
    });
  }
}

extension KanjiQueryProperty on QueryBuilder<Kanji, Kanji, QQueryProperty> {
  QueryBuilder<Kanji, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Kanji, List<String>?, QQueryOperations> componentsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'components');
    });
  }

  QueryBuilder<Kanji, List<int>?, QQueryOperations> compoundsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'compounds');
    });
  }

  QueryBuilder<Kanji, int?, QQueryOperations> frequencyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'frequency');
    });
  }

  QueryBuilder<Kanji, int, QQueryOperations> gradeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'grade');
    });
  }

  QueryBuilder<Kanji, int, QQueryOperations> jlptProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jlpt');
    });
  }

  QueryBuilder<Kanji, String, QQueryOperations> kanjiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'kanji');
    });
  }

  QueryBuilder<Kanji, List<String>?, QQueryOperations> kunReadingsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'kunReadings');
    });
  }

  QueryBuilder<Kanji, List<String>?, QQueryOperations> meaningsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'meanings');
    });
  }

  QueryBuilder<Kanji, List<String>?, QQueryOperations> nanoriProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nanori');
    });
  }

  QueryBuilder<Kanji, List<String>?, QQueryOperations> onReadingsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'onReadings');
    });
  }

  QueryBuilder<Kanji, String, QQueryOperations> radicalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'radical');
    });
  }

  QueryBuilder<Kanji, List<String>?, QQueryOperations> readingIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'readingIndex');
    });
  }

  QueryBuilder<Kanji, SpacedRepetitionData?, QQueryOperations>
      spacedRepetitionDataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'spacedRepetitionData');
    });
  }

  QueryBuilder<Kanji, SpacedRepetitionData?, QQueryOperations>
      spacedRepetitionDataEnglishProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'spacedRepetitionDataEnglish');
    });
  }

  QueryBuilder<Kanji, int, QQueryOperations> strokeCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'strokeCount');
    });
  }

  QueryBuilder<Kanji, List<String>?, QQueryOperations> strokesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'strokes');
    });
  }
}
