// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vocab.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVocabCollection on Isar {
  IsarCollection<Vocab> get vocabs => this.collection();
}

const VocabSchema = CollectionSchema(
  name: r'Vocab',
  id: -8363969117561088477,
  properties: {
    r'commonWord': PropertySchema(
      id: 0,
      name: r'commonWord',
      type: IsarType.bool,
    ),
    r'definitionIndex': PropertySchema(
      id: 1,
      name: r'definitionIndex',
      type: IsarType.stringList,
    ),
    r'definitions': PropertySchema(
      id: 2,
      name: r'definitions',
      type: IsarType.objectList,
      target: r'VocabDefinition',
    ),
    r'frequencyScore': PropertySchema(
      id: 3,
      name: r'frequencyScore',
      type: IsarType.long,
    ),
    r'japaneseTextIndex': PropertySchema(
      id: 4,
      name: r'japaneseTextIndex',
      type: IsarType.stringList,
    ),
    r'kanjiReadingPairs': PropertySchema(
      id: 5,
      name: r'kanjiReadingPairs',
      type: IsarType.objectList,
      target: r'KanjiReadingPair',
    ),
    r'romajiTextIndex': PropertySchema(
      id: 6,
      name: r'romajiTextIndex',
      type: IsarType.stringList,
    ),
    r'spacedRepetitionData': PropertySchema(
      id: 7,
      name: r'spacedRepetitionData',
      type: IsarType.object,
      target: r'SpacedRepetitionData',
    )
  },
  estimateSize: _vocabEstimateSize,
  serialize: _vocabSerialize,
  deserialize: _vocabDeserialize,
  deserializeProp: _vocabDeserializeProp,
  idName: r'id',
  indexes: {
    r'japaneseTextIndex': IndexSchema(
      id: -7800858644333330950,
      name: r'japaneseTextIndex',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'japaneseTextIndex',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    ),
    r'romajiTextIndex': IndexSchema(
      id: 4720219597701500010,
      name: r'romajiTextIndex',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'romajiTextIndex',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    ),
    r'definitionIndex': IndexSchema(
      id: -5022962026442024695,
      name: r'definitionIndex',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'definitionIndex',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'myDictionaryListLinks': LinkSchema(
      id: 6992640191833276501,
      name: r'myDictionaryListLinks',
      target: r'MyDictionaryList',
      single: false,
      linkName: r'vocabLinks',
    )
  },
  embeddedSchemas: {
    r'KanjiReadingPair': KanjiReadingPairSchema,
    r'VocabKanji': VocabKanjiSchema,
    r'VocabReading': VocabReadingSchema,
    r'VocabDefinition': VocabDefinitionSchema,
    r'VocabExample': VocabExampleSchema,
    r'LoanWordInfo': LoanWordInfoSchema,
    r'SpacedRepetitionData': SpacedRepetitionDataSchema
  },
  getId: _vocabGetId,
  getLinks: _vocabGetLinks,
  attach: _vocabAttach,
  version: '3.1.0+1',
);

int _vocabEstimateSize(
  Vocab object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.definitionIndex.length * 3;
  {
    for (var i = 0; i < object.definitionIndex.length; i++) {
      final value = object.definitionIndex[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.definitions.length * 3;
  {
    final offsets = allOffsets[VocabDefinition]!;
    for (var i = 0; i < object.definitions.length; i++) {
      final value = object.definitions[i];
      bytesCount +=
          VocabDefinitionSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.japaneseTextIndex.length * 3;
  {
    for (var i = 0; i < object.japaneseTextIndex.length; i++) {
      final value = object.japaneseTextIndex[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.kanjiReadingPairs.length * 3;
  {
    final offsets = allOffsets[KanjiReadingPair]!;
    for (var i = 0; i < object.kanjiReadingPairs.length; i++) {
      final value = object.kanjiReadingPairs[i];
      bytesCount +=
          KanjiReadingPairSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.romajiTextIndex.length * 3;
  {
    for (var i = 0; i < object.romajiTextIndex.length; i++) {
      final value = object.romajiTextIndex[i];
      bytesCount += value.length * 3;
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
  return bytesCount;
}

void _vocabSerialize(
  Vocab object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.commonWord);
  writer.writeStringList(offsets[1], object.definitionIndex);
  writer.writeObjectList<VocabDefinition>(
    offsets[2],
    allOffsets,
    VocabDefinitionSchema.serialize,
    object.definitions,
  );
  writer.writeLong(offsets[3], object.frequencyScore);
  writer.writeStringList(offsets[4], object.japaneseTextIndex);
  writer.writeObjectList<KanjiReadingPair>(
    offsets[5],
    allOffsets,
    KanjiReadingPairSchema.serialize,
    object.kanjiReadingPairs,
  );
  writer.writeStringList(offsets[6], object.romajiTextIndex);
  writer.writeObject<SpacedRepetitionData>(
    offsets[7],
    allOffsets,
    SpacedRepetitionDataSchema.serialize,
    object.spacedRepetitionData,
  );
}

Vocab _vocabDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Vocab();
  object.commonWord = reader.readBool(offsets[0]);
  object.definitionIndex = reader.readStringList(offsets[1]) ?? [];
  object.definitions = reader.readObjectList<VocabDefinition>(
        offsets[2],
        VocabDefinitionSchema.deserialize,
        allOffsets,
        VocabDefinition(),
      ) ??
      [];
  object.frequencyScore = reader.readLong(offsets[3]);
  object.id = id;
  object.japaneseTextIndex = reader.readStringList(offsets[4]) ?? [];
  object.kanjiReadingPairs = reader.readObjectList<KanjiReadingPair>(
        offsets[5],
        KanjiReadingPairSchema.deserialize,
        allOffsets,
        KanjiReadingPair(),
      ) ??
      [];
  object.romajiTextIndex = reader.readStringList(offsets[6]) ?? [];
  object.spacedRepetitionData = reader.readObjectOrNull<SpacedRepetitionData>(
    offsets[7],
    SpacedRepetitionDataSchema.deserialize,
    allOffsets,
  );
  return object;
}

P _vocabDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readStringList(offset) ?? []) as P;
    case 2:
      return (reader.readObjectList<VocabDefinition>(
            offset,
            VocabDefinitionSchema.deserialize,
            allOffsets,
            VocabDefinition(),
          ) ??
          []) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readStringList(offset) ?? []) as P;
    case 5:
      return (reader.readObjectList<KanjiReadingPair>(
            offset,
            KanjiReadingPairSchema.deserialize,
            allOffsets,
            KanjiReadingPair(),
          ) ??
          []) as P;
    case 6:
      return (reader.readStringList(offset) ?? []) as P;
    case 7:
      return (reader.readObjectOrNull<SpacedRepetitionData>(
        offset,
        SpacedRepetitionDataSchema.deserialize,
        allOffsets,
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _vocabGetId(Vocab object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _vocabGetLinks(Vocab object) {
  return [object.myDictionaryListLinks];
}

void _vocabAttach(IsarCollection<dynamic> col, Id id, Vocab object) {
  object.id = id;
  object.myDictionaryListLinks.attach(col,
      col.isar.collection<MyDictionaryList>(), r'myDictionaryListLinks', id);
}

extension VocabQueryWhereSort on QueryBuilder<Vocab, Vocab, QWhere> {
  QueryBuilder<Vocab, Vocab, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterWhere> anyJapaneseTextIndexElement() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'japaneseTextIndex'),
      );
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterWhere> anyRomajiTextIndexElement() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'romajiTextIndex'),
      );
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterWhere> anyDefinitionIndexElement() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'definitionIndex'),
      );
    });
  }
}

extension VocabQueryWhere on QueryBuilder<Vocab, Vocab, QWhereClause> {
  QueryBuilder<Vocab, Vocab, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Vocab, Vocab, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterWhereClause> idBetween(
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

  QueryBuilder<Vocab, Vocab, QAfterWhereClause> japaneseTextIndexElementEqualTo(
      String japaneseTextIndexElement) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'japaneseTextIndex',
        value: [japaneseTextIndexElement],
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterWhereClause>
      japaneseTextIndexElementNotEqualTo(String japaneseTextIndexElement) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'japaneseTextIndex',
              lower: [],
              upper: [japaneseTextIndexElement],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'japaneseTextIndex',
              lower: [japaneseTextIndexElement],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'japaneseTextIndex',
              lower: [japaneseTextIndexElement],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'japaneseTextIndex',
              lower: [],
              upper: [japaneseTextIndexElement],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterWhereClause>
      japaneseTextIndexElementGreaterThan(
    String japaneseTextIndexElement, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'japaneseTextIndex',
        lower: [japaneseTextIndexElement],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterWhereClause>
      japaneseTextIndexElementLessThan(
    String japaneseTextIndexElement, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'japaneseTextIndex',
        lower: [],
        upper: [japaneseTextIndexElement],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterWhereClause> japaneseTextIndexElementBetween(
    String lowerJapaneseTextIndexElement,
    String upperJapaneseTextIndexElement, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'japaneseTextIndex',
        lower: [lowerJapaneseTextIndexElement],
        includeLower: includeLower,
        upper: [upperJapaneseTextIndexElement],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterWhereClause>
      japaneseTextIndexElementStartsWith(
          String JapaneseTextIndexElementPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'japaneseTextIndex',
        lower: [JapaneseTextIndexElementPrefix],
        upper: ['$JapaneseTextIndexElementPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterWhereClause>
      japaneseTextIndexElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'japaneseTextIndex',
        value: [''],
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterWhereClause>
      japaneseTextIndexElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'japaneseTextIndex',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'japaneseTextIndex',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'japaneseTextIndex',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'japaneseTextIndex',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterWhereClause> romajiTextIndexElementEqualTo(
      String romajiTextIndexElement) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'romajiTextIndex',
        value: [romajiTextIndexElement],
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterWhereClause>
      romajiTextIndexElementNotEqualTo(String romajiTextIndexElement) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'romajiTextIndex',
              lower: [],
              upper: [romajiTextIndexElement],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'romajiTextIndex',
              lower: [romajiTextIndexElement],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'romajiTextIndex',
              lower: [romajiTextIndexElement],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'romajiTextIndex',
              lower: [],
              upper: [romajiTextIndexElement],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterWhereClause>
      romajiTextIndexElementGreaterThan(
    String romajiTextIndexElement, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'romajiTextIndex',
        lower: [romajiTextIndexElement],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterWhereClause> romajiTextIndexElementLessThan(
    String romajiTextIndexElement, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'romajiTextIndex',
        lower: [],
        upper: [romajiTextIndexElement],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterWhereClause> romajiTextIndexElementBetween(
    String lowerRomajiTextIndexElement,
    String upperRomajiTextIndexElement, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'romajiTextIndex',
        lower: [lowerRomajiTextIndexElement],
        includeLower: includeLower,
        upper: [upperRomajiTextIndexElement],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterWhereClause>
      romajiTextIndexElementStartsWith(String RomajiTextIndexElementPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'romajiTextIndex',
        lower: [RomajiTextIndexElementPrefix],
        upper: ['$RomajiTextIndexElementPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterWhereClause>
      romajiTextIndexElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'romajiTextIndex',
        value: [''],
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterWhereClause>
      romajiTextIndexElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'romajiTextIndex',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'romajiTextIndex',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'romajiTextIndex',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'romajiTextIndex',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterWhereClause> definitionIndexElementEqualTo(
      String definitionIndexElement) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'definitionIndex',
        value: [definitionIndexElement],
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterWhereClause>
      definitionIndexElementNotEqualTo(String definitionIndexElement) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'definitionIndex',
              lower: [],
              upper: [definitionIndexElement],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'definitionIndex',
              lower: [definitionIndexElement],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'definitionIndex',
              lower: [definitionIndexElement],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'definitionIndex',
              lower: [],
              upper: [definitionIndexElement],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterWhereClause>
      definitionIndexElementGreaterThan(
    String definitionIndexElement, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'definitionIndex',
        lower: [definitionIndexElement],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterWhereClause> definitionIndexElementLessThan(
    String definitionIndexElement, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'definitionIndex',
        lower: [],
        upper: [definitionIndexElement],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterWhereClause> definitionIndexElementBetween(
    String lowerDefinitionIndexElement,
    String upperDefinitionIndexElement, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'definitionIndex',
        lower: [lowerDefinitionIndexElement],
        includeLower: includeLower,
        upper: [upperDefinitionIndexElement],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterWhereClause>
      definitionIndexElementStartsWith(String DefinitionIndexElementPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'definitionIndex',
        lower: [DefinitionIndexElementPrefix],
        upper: ['$DefinitionIndexElementPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterWhereClause>
      definitionIndexElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'definitionIndex',
        value: [''],
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterWhereClause>
      definitionIndexElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'definitionIndex',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'definitionIndex',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'definitionIndex',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'definitionIndex',
              upper: [''],
            ));
      }
    });
  }
}

extension VocabQueryFilter on QueryBuilder<Vocab, Vocab, QFilterCondition> {
  QueryBuilder<Vocab, Vocab, QAfterFilterCondition> commonWordEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'commonWord',
        value: value,
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      definitionIndexElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'definitionIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      definitionIndexElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'definitionIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      definitionIndexElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'definitionIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      definitionIndexElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'definitionIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      definitionIndexElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'definitionIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      definitionIndexElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'definitionIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      definitionIndexElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'definitionIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      definitionIndexElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'definitionIndex',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      definitionIndexElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'definitionIndex',
        value: '',
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      definitionIndexElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'definitionIndex',
        value: '',
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      definitionIndexLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'definitionIndex',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition> definitionIndexIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'definitionIndex',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      definitionIndexIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'definitionIndex',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      definitionIndexLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'definitionIndex',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      definitionIndexLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'definitionIndex',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      definitionIndexLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'definitionIndex',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition> definitionsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'definitions',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition> definitionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'definitions',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition> definitionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'definitions',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition> definitionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'definitions',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      definitionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'definitions',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition> definitionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'definitions',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition> frequencyScoreEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frequencyScore',
        value: value,
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition> frequencyScoreGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frequencyScore',
        value: value,
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition> frequencyScoreLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frequencyScore',
        value: value,
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition> frequencyScoreBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frequencyScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      japaneseTextIndexElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'japaneseTextIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      japaneseTextIndexElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'japaneseTextIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      japaneseTextIndexElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'japaneseTextIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      japaneseTextIndexElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'japaneseTextIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      japaneseTextIndexElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'japaneseTextIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      japaneseTextIndexElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'japaneseTextIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      japaneseTextIndexElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'japaneseTextIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      japaneseTextIndexElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'japaneseTextIndex',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      japaneseTextIndexElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'japaneseTextIndex',
        value: '',
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      japaneseTextIndexElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'japaneseTextIndex',
        value: '',
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      japaneseTextIndexLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'japaneseTextIndex',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition> japaneseTextIndexIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'japaneseTextIndex',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      japaneseTextIndexIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'japaneseTextIndex',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      japaneseTextIndexLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'japaneseTextIndex',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      japaneseTextIndexLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'japaneseTextIndex',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      japaneseTextIndexLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'japaneseTextIndex',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      kanjiReadingPairsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'kanjiReadingPairs',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition> kanjiReadingPairsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'kanjiReadingPairs',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      kanjiReadingPairsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'kanjiReadingPairs',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      kanjiReadingPairsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'kanjiReadingPairs',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      kanjiReadingPairsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'kanjiReadingPairs',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      kanjiReadingPairsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'kanjiReadingPairs',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      romajiTextIndexElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'romajiTextIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      romajiTextIndexElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'romajiTextIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      romajiTextIndexElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'romajiTextIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      romajiTextIndexElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'romajiTextIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      romajiTextIndexElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'romajiTextIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      romajiTextIndexElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'romajiTextIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      romajiTextIndexElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'romajiTextIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      romajiTextIndexElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'romajiTextIndex',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      romajiTextIndexElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'romajiTextIndex',
        value: '',
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      romajiTextIndexElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'romajiTextIndex',
        value: '',
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      romajiTextIndexLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'romajiTextIndex',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition> romajiTextIndexIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'romajiTextIndex',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      romajiTextIndexIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'romajiTextIndex',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      romajiTextIndexLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'romajiTextIndex',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      romajiTextIndexLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'romajiTextIndex',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      romajiTextIndexLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'romajiTextIndex',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      spacedRepetitionDataIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'spacedRepetitionData',
      ));
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      spacedRepetitionDataIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'spacedRepetitionData',
      ));
    });
  }
}

extension VocabQueryObject on QueryBuilder<Vocab, Vocab, QFilterCondition> {
  QueryBuilder<Vocab, Vocab, QAfterFilterCondition> definitionsElement(
      FilterQuery<VocabDefinition> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'definitions');
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition> kanjiReadingPairsElement(
      FilterQuery<KanjiReadingPair> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'kanjiReadingPairs');
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition> spacedRepetitionData(
      FilterQuery<SpacedRepetitionData> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'spacedRepetitionData');
    });
  }
}

extension VocabQueryLinks on QueryBuilder<Vocab, Vocab, QFilterCondition> {
  QueryBuilder<Vocab, Vocab, QAfterFilterCondition> myDictionaryListLinks(
      FilterQuery<MyDictionaryList> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'myDictionaryListLinks');
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      myDictionaryListLinksLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'myDictionaryListLinks', length, true, length, true);
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      myDictionaryListLinksIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'myDictionaryListLinks', 0, true, 0, true);
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      myDictionaryListLinksIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'myDictionaryListLinks', 0, false, 999999, true);
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      myDictionaryListLinksLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'myDictionaryListLinks', 0, true, length, include);
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      myDictionaryListLinksLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'myDictionaryListLinks', length, include, 999999, true);
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterFilterCondition>
      myDictionaryListLinksLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'myDictionaryListLinks', lower, includeLower, upper, includeUpper);
    });
  }
}

extension VocabQuerySortBy on QueryBuilder<Vocab, Vocab, QSortBy> {
  QueryBuilder<Vocab, Vocab, QAfterSortBy> sortByCommonWord() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commonWord', Sort.asc);
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterSortBy> sortByCommonWordDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commonWord', Sort.desc);
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterSortBy> sortByFrequencyScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frequencyScore', Sort.asc);
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterSortBy> sortByFrequencyScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frequencyScore', Sort.desc);
    });
  }
}

extension VocabQuerySortThenBy on QueryBuilder<Vocab, Vocab, QSortThenBy> {
  QueryBuilder<Vocab, Vocab, QAfterSortBy> thenByCommonWord() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commonWord', Sort.asc);
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterSortBy> thenByCommonWordDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commonWord', Sort.desc);
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterSortBy> thenByFrequencyScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frequencyScore', Sort.asc);
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterSortBy> thenByFrequencyScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frequencyScore', Sort.desc);
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Vocab, Vocab, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension VocabQueryWhereDistinct on QueryBuilder<Vocab, Vocab, QDistinct> {
  QueryBuilder<Vocab, Vocab, QDistinct> distinctByCommonWord() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'commonWord');
    });
  }

  QueryBuilder<Vocab, Vocab, QDistinct> distinctByDefinitionIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'definitionIndex');
    });
  }

  QueryBuilder<Vocab, Vocab, QDistinct> distinctByFrequencyScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'frequencyScore');
    });
  }

  QueryBuilder<Vocab, Vocab, QDistinct> distinctByJapaneseTextIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'japaneseTextIndex');
    });
  }

  QueryBuilder<Vocab, Vocab, QDistinct> distinctByRomajiTextIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'romajiTextIndex');
    });
  }
}

extension VocabQueryProperty on QueryBuilder<Vocab, Vocab, QQueryProperty> {
  QueryBuilder<Vocab, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Vocab, bool, QQueryOperations> commonWordProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'commonWord');
    });
  }

  QueryBuilder<Vocab, List<String>, QQueryOperations>
      definitionIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'definitionIndex');
    });
  }

  QueryBuilder<Vocab, List<VocabDefinition>, QQueryOperations>
      definitionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'definitions');
    });
  }

  QueryBuilder<Vocab, int, QQueryOperations> frequencyScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'frequencyScore');
    });
  }

  QueryBuilder<Vocab, List<String>, QQueryOperations>
      japaneseTextIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'japaneseTextIndex');
    });
  }

  QueryBuilder<Vocab, List<KanjiReadingPair>, QQueryOperations>
      kanjiReadingPairsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'kanjiReadingPairs');
    });
  }

  QueryBuilder<Vocab, List<String>, QQueryOperations>
      romajiTextIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'romajiTextIndex');
    });
  }

  QueryBuilder<Vocab, SpacedRepetitionData?, QQueryOperations>
      spacedRepetitionDataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'spacedRepetitionData');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const KanjiReadingPairSchema = Schema(
  name: r'KanjiReadingPair',
  id: 6099850662229599186,
  properties: {
    r'kanjiWritings': PropertySchema(
      id: 0,
      name: r'kanjiWritings',
      type: IsarType.objectList,
      target: r'VocabKanji',
    ),
    r'readings': PropertySchema(
      id: 1,
      name: r'readings',
      type: IsarType.objectList,
      target: r'VocabReading',
    )
  },
  estimateSize: _kanjiReadingPairEstimateSize,
  serialize: _kanjiReadingPairSerialize,
  deserialize: _kanjiReadingPairDeserialize,
  deserializeProp: _kanjiReadingPairDeserializeProp,
);

int _kanjiReadingPairEstimateSize(
  KanjiReadingPair object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.kanjiWritings;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[VocabKanji]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              VocabKanjiSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  bytesCount += 3 + object.readings.length * 3;
  {
    final offsets = allOffsets[VocabReading]!;
    for (var i = 0; i < object.readings.length; i++) {
      final value = object.readings[i];
      bytesCount += VocabReadingSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _kanjiReadingPairSerialize(
  KanjiReadingPair object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<VocabKanji>(
    offsets[0],
    allOffsets,
    VocabKanjiSchema.serialize,
    object.kanjiWritings,
  );
  writer.writeObjectList<VocabReading>(
    offsets[1],
    allOffsets,
    VocabReadingSchema.serialize,
    object.readings,
  );
}

KanjiReadingPair _kanjiReadingPairDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = KanjiReadingPair();
  object.kanjiWritings = reader.readObjectList<VocabKanji>(
    offsets[0],
    VocabKanjiSchema.deserialize,
    allOffsets,
    VocabKanji(),
  );
  object.readings = reader.readObjectList<VocabReading>(
        offsets[1],
        VocabReadingSchema.deserialize,
        allOffsets,
        VocabReading(),
      ) ??
      [];
  return object;
}

P _kanjiReadingPairDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<VocabKanji>(
        offset,
        VocabKanjiSchema.deserialize,
        allOffsets,
        VocabKanji(),
      )) as P;
    case 1:
      return (reader.readObjectList<VocabReading>(
            offset,
            VocabReadingSchema.deserialize,
            allOffsets,
            VocabReading(),
          ) ??
          []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension KanjiReadingPairQueryFilter
    on QueryBuilder<KanjiReadingPair, KanjiReadingPair, QFilterCondition> {
  QueryBuilder<KanjiReadingPair, KanjiReadingPair, QAfterFilterCondition>
      kanjiWritingsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'kanjiWritings',
      ));
    });
  }

  QueryBuilder<KanjiReadingPair, KanjiReadingPair, QAfterFilterCondition>
      kanjiWritingsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'kanjiWritings',
      ));
    });
  }

  QueryBuilder<KanjiReadingPair, KanjiReadingPair, QAfterFilterCondition>
      kanjiWritingsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'kanjiWritings',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<KanjiReadingPair, KanjiReadingPair, QAfterFilterCondition>
      kanjiWritingsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'kanjiWritings',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<KanjiReadingPair, KanjiReadingPair, QAfterFilterCondition>
      kanjiWritingsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'kanjiWritings',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<KanjiReadingPair, KanjiReadingPair, QAfterFilterCondition>
      kanjiWritingsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'kanjiWritings',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<KanjiReadingPair, KanjiReadingPair, QAfterFilterCondition>
      kanjiWritingsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'kanjiWritings',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<KanjiReadingPair, KanjiReadingPair, QAfterFilterCondition>
      kanjiWritingsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'kanjiWritings',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<KanjiReadingPair, KanjiReadingPair, QAfterFilterCondition>
      readingsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'readings',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<KanjiReadingPair, KanjiReadingPair, QAfterFilterCondition>
      readingsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'readings',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<KanjiReadingPair, KanjiReadingPair, QAfterFilterCondition>
      readingsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'readings',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<KanjiReadingPair, KanjiReadingPair, QAfterFilterCondition>
      readingsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'readings',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<KanjiReadingPair, KanjiReadingPair, QAfterFilterCondition>
      readingsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'readings',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<KanjiReadingPair, KanjiReadingPair, QAfterFilterCondition>
      readingsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'readings',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension KanjiReadingPairQueryObject
    on QueryBuilder<KanjiReadingPair, KanjiReadingPair, QFilterCondition> {
  QueryBuilder<KanjiReadingPair, KanjiReadingPair, QAfterFilterCondition>
      kanjiWritingsElement(FilterQuery<VocabKanji> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'kanjiWritings');
    });
  }

  QueryBuilder<KanjiReadingPair, KanjiReadingPair, QAfterFilterCondition>
      readingsElement(FilterQuery<VocabReading> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'readings');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const VocabKanjiSchema = Schema(
  name: r'VocabKanji',
  id: -3399825013867579520,
  properties: {
    r'info': PropertySchema(
      id: 0,
      name: r'info',
      type: IsarType.byteList,
      enumMap: _VocabKanjiinfoEnumValueMap,
    ),
    r'kanji': PropertySchema(
      id: 1,
      name: r'kanji',
      type: IsarType.string,
    )
  },
  estimateSize: _vocabKanjiEstimateSize,
  serialize: _vocabKanjiSerialize,
  deserialize: _vocabKanjiDeserialize,
  deserializeProp: _vocabKanjiDeserializeProp,
);

int _vocabKanjiEstimateSize(
  VocabKanji object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.info;
    if (value != null) {
      bytesCount += 3 + value.length;
    }
  }
  bytesCount += 3 + object.kanji.length * 3;
  return bytesCount;
}

void _vocabKanjiSerialize(
  VocabKanji object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeByteList(offsets[0], object.info?.map((e) => e.index).toList());
  writer.writeString(offsets[1], object.kanji);
}

VocabKanji _vocabKanjiDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VocabKanji();
  object.info = reader
      .readByteList(offsets[0])
      ?.map((e) => _VocabKanjiinfoValueEnumMap[e] ?? KanjiInfo.ateji)
      .toList();
  object.kanji = reader.readString(offsets[1]);
  return object;
}

P _vocabKanjiDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader
          .readByteList(offset)
          ?.map((e) => _VocabKanjiinfoValueEnumMap[e] ?? KanjiInfo.ateji)
          .toList()) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _VocabKanjiinfoEnumValueMap = {
  'ateji': 0,
  'irregularKana': 1,
  'irregularKanji': 2,
  'irregularOkurigana': 3,
  'outdatedKanji': 4,
  'rareKanjiForm': 5,
  'searchOnlyForm': 6,
};
const _VocabKanjiinfoValueEnumMap = {
  0: KanjiInfo.ateji,
  1: KanjiInfo.irregularKana,
  2: KanjiInfo.irregularKanji,
  3: KanjiInfo.irregularOkurigana,
  4: KanjiInfo.outdatedKanji,
  5: KanjiInfo.rareKanjiForm,
  6: KanjiInfo.searchOnlyForm,
};

extension VocabKanjiQueryFilter
    on QueryBuilder<VocabKanji, VocabKanji, QFilterCondition> {
  QueryBuilder<VocabKanji, VocabKanji, QAfterFilterCondition> infoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'info',
      ));
    });
  }

  QueryBuilder<VocabKanji, VocabKanji, QAfterFilterCondition> infoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'info',
      ));
    });
  }

  QueryBuilder<VocabKanji, VocabKanji, QAfterFilterCondition>
      infoElementEqualTo(KanjiInfo value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'info',
        value: value,
      ));
    });
  }

  QueryBuilder<VocabKanji, VocabKanji, QAfterFilterCondition>
      infoElementGreaterThan(
    KanjiInfo value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'info',
        value: value,
      ));
    });
  }

  QueryBuilder<VocabKanji, VocabKanji, QAfterFilterCondition>
      infoElementLessThan(
    KanjiInfo value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'info',
        value: value,
      ));
    });
  }

  QueryBuilder<VocabKanji, VocabKanji, QAfterFilterCondition>
      infoElementBetween(
    KanjiInfo lower,
    KanjiInfo upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'info',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VocabKanji, VocabKanji, QAfterFilterCondition> infoLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'info',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<VocabKanji, VocabKanji, QAfterFilterCondition> infoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'info',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<VocabKanji, VocabKanji, QAfterFilterCondition> infoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'info',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VocabKanji, VocabKanji, QAfterFilterCondition>
      infoLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'info',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<VocabKanji, VocabKanji, QAfterFilterCondition>
      infoLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'info',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VocabKanji, VocabKanji, QAfterFilterCondition> infoLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'info',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<VocabKanji, VocabKanji, QAfterFilterCondition> kanjiEqualTo(
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

  QueryBuilder<VocabKanji, VocabKanji, QAfterFilterCondition> kanjiGreaterThan(
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

  QueryBuilder<VocabKanji, VocabKanji, QAfterFilterCondition> kanjiLessThan(
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

  QueryBuilder<VocabKanji, VocabKanji, QAfterFilterCondition> kanjiBetween(
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

  QueryBuilder<VocabKanji, VocabKanji, QAfterFilterCondition> kanjiStartsWith(
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

  QueryBuilder<VocabKanji, VocabKanji, QAfterFilterCondition> kanjiEndsWith(
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

  QueryBuilder<VocabKanji, VocabKanji, QAfterFilterCondition> kanjiContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'kanji',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VocabKanji, VocabKanji, QAfterFilterCondition> kanjiMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'kanji',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VocabKanji, VocabKanji, QAfterFilterCondition> kanjiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'kanji',
        value: '',
      ));
    });
  }

  QueryBuilder<VocabKanji, VocabKanji, QAfterFilterCondition>
      kanjiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'kanji',
        value: '',
      ));
    });
  }
}

extension VocabKanjiQueryObject
    on QueryBuilder<VocabKanji, VocabKanji, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const VocabReadingSchema = Schema(
  name: r'VocabReading',
  id: 1513026693826546813,
  properties: {
    r'info': PropertySchema(
      id: 0,
      name: r'info',
      type: IsarType.byteList,
      enumMap: _VocabReadinginfoEnumValueMap,
    ),
    r'pitchAccents': PropertySchema(
      id: 1,
      name: r'pitchAccents',
      type: IsarType.longList,
    ),
    r'reading': PropertySchema(
      id: 2,
      name: r'reading',
      type: IsarType.string,
    )
  },
  estimateSize: _vocabReadingEstimateSize,
  serialize: _vocabReadingSerialize,
  deserialize: _vocabReadingDeserialize,
  deserializeProp: _vocabReadingDeserializeProp,
);

int _vocabReadingEstimateSize(
  VocabReading object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.info;
    if (value != null) {
      bytesCount += 3 + value.length;
    }
  }
  {
    final value = object.pitchAccents;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  bytesCount += 3 + object.reading.length * 3;
  return bytesCount;
}

void _vocabReadingSerialize(
  VocabReading object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeByteList(offsets[0], object.info?.map((e) => e.index).toList());
  writer.writeLongList(offsets[1], object.pitchAccents);
  writer.writeString(offsets[2], object.reading);
}

VocabReading _vocabReadingDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VocabReading();
  object.info = reader
      .readByteList(offsets[0])
      ?.map((e) => _VocabReadinginfoValueEnumMap[e] ?? ReadingInfo.gikun)
      .toList();
  object.pitchAccents = reader.readLongList(offsets[1]);
  object.reading = reader.readString(offsets[2]);
  return object;
}

P _vocabReadingDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader
          .readByteList(offset)
          ?.map((e) => _VocabReadinginfoValueEnumMap[e] ?? ReadingInfo.gikun)
          .toList()) as P;
    case 1:
      return (reader.readLongList(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _VocabReadinginfoEnumValueMap = {
  'gikun': 0,
  'irregularKana': 1,
  'outdatedKana': 2,
  'searchOnlyForm': 3,
};
const _VocabReadinginfoValueEnumMap = {
  0: ReadingInfo.gikun,
  1: ReadingInfo.irregularKana,
  2: ReadingInfo.outdatedKana,
  3: ReadingInfo.searchOnlyForm,
};

extension VocabReadingQueryFilter
    on QueryBuilder<VocabReading, VocabReading, QFilterCondition> {
  QueryBuilder<VocabReading, VocabReading, QAfterFilterCondition> infoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'info',
      ));
    });
  }

  QueryBuilder<VocabReading, VocabReading, QAfterFilterCondition>
      infoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'info',
      ));
    });
  }

  QueryBuilder<VocabReading, VocabReading, QAfterFilterCondition>
      infoElementEqualTo(ReadingInfo value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'info',
        value: value,
      ));
    });
  }

  QueryBuilder<VocabReading, VocabReading, QAfterFilterCondition>
      infoElementGreaterThan(
    ReadingInfo value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'info',
        value: value,
      ));
    });
  }

  QueryBuilder<VocabReading, VocabReading, QAfterFilterCondition>
      infoElementLessThan(
    ReadingInfo value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'info',
        value: value,
      ));
    });
  }

  QueryBuilder<VocabReading, VocabReading, QAfterFilterCondition>
      infoElementBetween(
    ReadingInfo lower,
    ReadingInfo upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'info',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VocabReading, VocabReading, QAfterFilterCondition>
      infoLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'info',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<VocabReading, VocabReading, QAfterFilterCondition>
      infoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'info',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<VocabReading, VocabReading, QAfterFilterCondition>
      infoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'info',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VocabReading, VocabReading, QAfterFilterCondition>
      infoLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'info',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<VocabReading, VocabReading, QAfterFilterCondition>
      infoLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'info',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VocabReading, VocabReading, QAfterFilterCondition>
      infoLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'info',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<VocabReading, VocabReading, QAfterFilterCondition>
      pitchAccentsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pitchAccents',
      ));
    });
  }

  QueryBuilder<VocabReading, VocabReading, QAfterFilterCondition>
      pitchAccentsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pitchAccents',
      ));
    });
  }

  QueryBuilder<VocabReading, VocabReading, QAfterFilterCondition>
      pitchAccentsElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pitchAccents',
        value: value,
      ));
    });
  }

  QueryBuilder<VocabReading, VocabReading, QAfterFilterCondition>
      pitchAccentsElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pitchAccents',
        value: value,
      ));
    });
  }

  QueryBuilder<VocabReading, VocabReading, QAfterFilterCondition>
      pitchAccentsElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pitchAccents',
        value: value,
      ));
    });
  }

  QueryBuilder<VocabReading, VocabReading, QAfterFilterCondition>
      pitchAccentsElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pitchAccents',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VocabReading, VocabReading, QAfterFilterCondition>
      pitchAccentsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pitchAccents',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<VocabReading, VocabReading, QAfterFilterCondition>
      pitchAccentsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pitchAccents',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<VocabReading, VocabReading, QAfterFilterCondition>
      pitchAccentsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pitchAccents',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VocabReading, VocabReading, QAfterFilterCondition>
      pitchAccentsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pitchAccents',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<VocabReading, VocabReading, QAfterFilterCondition>
      pitchAccentsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pitchAccents',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VocabReading, VocabReading, QAfterFilterCondition>
      pitchAccentsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pitchAccents',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<VocabReading, VocabReading, QAfterFilterCondition>
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

  QueryBuilder<VocabReading, VocabReading, QAfterFilterCondition>
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

  QueryBuilder<VocabReading, VocabReading, QAfterFilterCondition>
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

  QueryBuilder<VocabReading, VocabReading, QAfterFilterCondition>
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

  QueryBuilder<VocabReading, VocabReading, QAfterFilterCondition>
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

  QueryBuilder<VocabReading, VocabReading, QAfterFilterCondition>
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

  QueryBuilder<VocabReading, VocabReading, QAfterFilterCondition>
      readingContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'reading',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VocabReading, VocabReading, QAfterFilterCondition>
      readingMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'reading',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VocabReading, VocabReading, QAfterFilterCondition>
      readingIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reading',
        value: '',
      ));
    });
  }

  QueryBuilder<VocabReading, VocabReading, QAfterFilterCondition>
      readingIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'reading',
        value: '',
      ));
    });
  }
}

extension VocabReadingQueryObject
    on QueryBuilder<VocabReading, VocabReading, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const VocabDefinitionSchema = Schema(
  name: r'VocabDefinition',
  id: 5348643281842710912,
  properties: {
    r'additionalInfo': PropertySchema(
      id: 0,
      name: r'additionalInfo',
      type: IsarType.string,
    ),
    r'appliesTo': PropertySchema(
      id: 1,
      name: r'appliesTo',
      type: IsarType.stringList,
    ),
    r'definition': PropertySchema(
      id: 2,
      name: r'definition',
      type: IsarType.string,
    ),
    r'dialects': PropertySchema(
      id: 3,
      name: r'dialects',
      type: IsarType.byteList,
      enumMap: _VocabDefinitiondialectsEnumValueMap,
    ),
    r'examples': PropertySchema(
      id: 4,
      name: r'examples',
      type: IsarType.objectList,
      target: r'VocabExample',
    ),
    r'fields': PropertySchema(
      id: 5,
      name: r'fields',
      type: IsarType.byteList,
      enumMap: _VocabDefinitionfieldsEnumValueMap,
    ),
    r'loanWordInfo': PropertySchema(
      id: 6,
      name: r'loanWordInfo',
      type: IsarType.object,
      target: r'LoanWordInfo',
    ),
    r'miscInfo': PropertySchema(
      id: 7,
      name: r'miscInfo',
      type: IsarType.byteList,
      enumMap: _VocabDefinitionmiscInfoEnumValueMap,
    ),
    r'pos': PropertySchema(
      id: 8,
      name: r'pos',
      type: IsarType.byteList,
      enumMap: _VocabDefinitionposEnumValueMap,
    )
  },
  estimateSize: _vocabDefinitionEstimateSize,
  serialize: _vocabDefinitionSerialize,
  deserialize: _vocabDefinitionDeserialize,
  deserializeProp: _vocabDefinitionDeserializeProp,
);

int _vocabDefinitionEstimateSize(
  VocabDefinition object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.additionalInfo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.appliesTo;
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
  bytesCount += 3 + object.definition.length * 3;
  {
    final value = object.dialects;
    if (value != null) {
      bytesCount += 3 + value.length;
    }
  }
  {
    final list = object.examples;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[VocabExample]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              VocabExampleSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.fields;
    if (value != null) {
      bytesCount += 3 + value.length;
    }
  }
  {
    final value = object.loanWordInfo;
    if (value != null) {
      bytesCount += 3 +
          LoanWordInfoSchema.estimateSize(
              value, allOffsets[LoanWordInfo]!, allOffsets);
    }
  }
  {
    final value = object.miscInfo;
    if (value != null) {
      bytesCount += 3 + value.length;
    }
  }
  {
    final value = object.pos;
    if (value != null) {
      bytesCount += 3 + value.length;
    }
  }
  return bytesCount;
}

void _vocabDefinitionSerialize(
  VocabDefinition object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.additionalInfo);
  writer.writeStringList(offsets[1], object.appliesTo);
  writer.writeString(offsets[2], object.definition);
  writer.writeByteList(
      offsets[3], object.dialects?.map((e) => e.index).toList());
  writer.writeObjectList<VocabExample>(
    offsets[4],
    allOffsets,
    VocabExampleSchema.serialize,
    object.examples,
  );
  writer.writeByteList(offsets[5], object.fields?.map((e) => e.index).toList());
  writer.writeObject<LoanWordInfo>(
    offsets[6],
    allOffsets,
    LoanWordInfoSchema.serialize,
    object.loanWordInfo,
  );
  writer.writeByteList(
      offsets[7], object.miscInfo?.map((e) => e.index).toList());
  writer.writeByteList(offsets[8], object.pos?.map((e) => e.index).toList());
}

VocabDefinition _vocabDefinitionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VocabDefinition();
  object.additionalInfo = reader.readStringOrNull(offsets[0]);
  object.appliesTo = reader.readStringList(offsets[1]);
  object.definition = reader.readString(offsets[2]);
  object.dialects = reader
      .readByteList(offsets[3])
      ?.map((e) => _VocabDefinitiondialectsValueEnumMap[e] ?? Dialect.brazilian)
      .toList();
  object.examples = reader.readObjectList<VocabExample>(
    offsets[4],
    VocabExampleSchema.deserialize,
    allOffsets,
    VocabExample(),
  );
  object.fields = reader
      .readByteList(offsets[5])
      ?.map((e) => _VocabDefinitionfieldsValueEnumMap[e] ?? Field.agriculture)
      .toList();
  object.loanWordInfo = reader.readObjectOrNull<LoanWordInfo>(
    offsets[6],
    LoanWordInfoSchema.deserialize,
    allOffsets,
  );
  object.miscInfo = reader
      .readByteList(offsets[7])
      ?.map((e) =>
          _VocabDefinitionmiscInfoValueEnumMap[e] ??
          MiscellaneousInfo.abbreviation)
      .toList();
  object.pos = reader
      .readByteList(offsets[8])
      ?.map(
          (e) => _VocabDefinitionposValueEnumMap[e] ?? PartOfSpeech.adjectiveF)
      .toList();
  return object;
}

P _vocabDefinitionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringList(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader
          .readByteList(offset)
          ?.map((e) =>
              _VocabDefinitiondialectsValueEnumMap[e] ?? Dialect.brazilian)
          .toList()) as P;
    case 4:
      return (reader.readObjectList<VocabExample>(
        offset,
        VocabExampleSchema.deserialize,
        allOffsets,
        VocabExample(),
      )) as P;
    case 5:
      return (reader
          .readByteList(offset)
          ?.map(
              (e) => _VocabDefinitionfieldsValueEnumMap[e] ?? Field.agriculture)
          .toList()) as P;
    case 6:
      return (reader.readObjectOrNull<LoanWordInfo>(
        offset,
        LoanWordInfoSchema.deserialize,
        allOffsets,
      )) as P;
    case 7:
      return (reader
          .readByteList(offset)
          ?.map((e) =>
              _VocabDefinitionmiscInfoValueEnumMap[e] ??
              MiscellaneousInfo.abbreviation)
          .toList()) as P;
    case 8:
      return (reader
          .readByteList(offset)
          ?.map((e) =>
              _VocabDefinitionposValueEnumMap[e] ?? PartOfSpeech.adjectiveF)
          .toList()) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _VocabDefinitiondialectsEnumValueMap = {
  'brazilian': 0,
  'hokkaidoBen': 1,
  'kansaiBen': 2,
  'kantouBen': 3,
  'kyotoBen': 4,
  'kyuushuuBen': 5,
  'naganoBen': 6,
  'osakaBen': 7,
  'ryuukyuuBen': 8,
  'touhokuBen': 9,
  'tosaBen': 10,
  'tsugaruBen': 11,
};
const _VocabDefinitiondialectsValueEnumMap = {
  0: Dialect.brazilian,
  1: Dialect.hokkaidoBen,
  2: Dialect.kansaiBen,
  3: Dialect.kantouBen,
  4: Dialect.kyotoBen,
  5: Dialect.kyuushuuBen,
  6: Dialect.naganoBen,
  7: Dialect.osakaBen,
  8: Dialect.ryuukyuuBen,
  9: Dialect.touhokuBen,
  10: Dialect.tosaBen,
  11: Dialect.tsugaruBen,
};
const _VocabDefinitionfieldsEnumValueMap = {
  'agriculture': 0,
  'anatomy': 1,
  'archeology': 2,
  'architecture': 3,
  'artAesthetics': 4,
  'astronomy': 5,
  'audiovisual': 6,
  'aviation': 7,
  'baseball': 8,
  'biochemistry': 9,
  'biology': 10,
  'botany': 11,
  'buddhism': 12,
  'business': 13,
  'cardGames': 14,
  'chemistry': 15,
  'christianity': 16,
  'clothing': 17,
  'computing': 18,
  'crystallography': 19,
  'dentistry': 20,
  'ecology': 21,
  'economics': 22,
  'electricityElecEng': 23,
  'electronics': 24,
  'embryology': 25,
  'engineering': 26,
  'entomology': 27,
  'film': 28,
  'finance': 29,
  'fishing': 30,
  'foodCooking': 31,
  'gardening': 32,
  'genetics': 33,
  'geography': 34,
  'geology': 35,
  'geometry': 36,
  'go': 37,
  'golf': 38,
  'grammar': 39,
  'greekMythology': 40,
  'hanafuda': 41,
  'horseRacing': 42,
  'kabuki': 43,
  'law': 44,
  'linguistics': 45,
  'logic': 46,
  'martialArts': 47,
  'mahjong': 48,
  'manga': 49,
  'mathematics': 50,
  'mechanicalEngineering': 51,
  'medicine': 52,
  'meteorology': 53,
  'military': 54,
  'mining': 55,
  'music': 56,
  'noh': 57,
  'ornithology': 58,
  'paleontology': 59,
  'pathology': 60,
  'pharmacology': 61,
  'philosophy': 62,
  'photography': 63,
  'physics': 64,
  'physiology': 65,
  'politics': 66,
  'printing': 67,
  'psychiatry': 68,
  'psychoanalysis': 69,
  'psychology': 70,
  'railway': 71,
  'romanMythology': 72,
  'shinto': 73,
  'shogi': 74,
  'skiing': 75,
  'sports': 76,
  'statistics': 77,
  'stockMarket': 78,
  'sumo': 79,
  'telecommunications': 80,
  'trademark': 81,
  'television': 82,
  'videoGames': 83,
  'zoology': 84,
};
const _VocabDefinitionfieldsValueEnumMap = {
  0: Field.agriculture,
  1: Field.anatomy,
  2: Field.archeology,
  3: Field.architecture,
  4: Field.artAesthetics,
  5: Field.astronomy,
  6: Field.audiovisual,
  7: Field.aviation,
  8: Field.baseball,
  9: Field.biochemistry,
  10: Field.biology,
  11: Field.botany,
  12: Field.buddhism,
  13: Field.business,
  14: Field.cardGames,
  15: Field.chemistry,
  16: Field.christianity,
  17: Field.clothing,
  18: Field.computing,
  19: Field.crystallography,
  20: Field.dentistry,
  21: Field.ecology,
  22: Field.economics,
  23: Field.electricityElecEng,
  24: Field.electronics,
  25: Field.embryology,
  26: Field.engineering,
  27: Field.entomology,
  28: Field.film,
  29: Field.finance,
  30: Field.fishing,
  31: Field.foodCooking,
  32: Field.gardening,
  33: Field.genetics,
  34: Field.geography,
  35: Field.geology,
  36: Field.geometry,
  37: Field.go,
  38: Field.golf,
  39: Field.grammar,
  40: Field.greekMythology,
  41: Field.hanafuda,
  42: Field.horseRacing,
  43: Field.kabuki,
  44: Field.law,
  45: Field.linguistics,
  46: Field.logic,
  47: Field.martialArts,
  48: Field.mahjong,
  49: Field.manga,
  50: Field.mathematics,
  51: Field.mechanicalEngineering,
  52: Field.medicine,
  53: Field.meteorology,
  54: Field.military,
  55: Field.mining,
  56: Field.music,
  57: Field.noh,
  58: Field.ornithology,
  59: Field.paleontology,
  60: Field.pathology,
  61: Field.pharmacology,
  62: Field.philosophy,
  63: Field.photography,
  64: Field.physics,
  65: Field.physiology,
  66: Field.politics,
  67: Field.printing,
  68: Field.psychiatry,
  69: Field.psychoanalysis,
  70: Field.psychology,
  71: Field.railway,
  72: Field.romanMythology,
  73: Field.shinto,
  74: Field.shogi,
  75: Field.skiing,
  76: Field.sports,
  77: Field.statistics,
  78: Field.stockMarket,
  79: Field.sumo,
  80: Field.telecommunications,
  81: Field.trademark,
  82: Field.television,
  83: Field.videoGames,
  84: Field.zoology,
};
const _VocabDefinitionmiscInfoEnumValueMap = {
  'abbreviation': 0,
  'archaism': 1,
  'character': 2,
  'childrensLanguage': 3,
  'colloquialism': 4,
  'companyName': 5,
  'creature': 6,
  'datedTerm': 7,
  'deity': 8,
  'derogatory': 9,
  'document': 10,
  'euphemistic': 11,
  'event': 12,
  'familiarLanguage': 13,
  'femaleLanguage': 14,
  'fiction': 15,
  'formalOrLiteraryTerm': 16,
  'givenName': 17,
  'group': 18,
  'historicalTerm': 19,
  'honorificOrRespectful': 20,
  'humbleLanguage': 21,
  'idiomaticExpression': 22,
  'humorousTerm': 23,
  'legend': 24,
  'mangaSlang': 25,
  'maleLanguage': 26,
  'mythology': 27,
  'internetSlang': 28,
  'object': 29,
  'obsoleteTerm': 30,
  'onomatopoeicOrMimeticWord': 31,
  'organizationName': 32,
  'other': 33,
  'particularPerson': 34,
  'placeName': 35,
  'poeticalTerm': 36,
  'politeLanguage': 37,
  'productName': 38,
  'proverb': 39,
  'quotation': 40,
  'rare': 41,
  'religion': 42,
  'sensitive': 43,
  'service': 44,
  'shipName': 45,
  'slang': 46,
  'railwayStation': 47,
  'surname': 48,
  'usuallyKanaAlone': 49,
  'unclassifiedName': 50,
  'vulgar': 51,
  'workOfArt': 52,
  'rudeOrXRatedTerm': 53,
  'yojijukugo': 54,
};
const _VocabDefinitionmiscInfoValueEnumMap = {
  0: MiscellaneousInfo.abbreviation,
  1: MiscellaneousInfo.archaism,
  2: MiscellaneousInfo.character,
  3: MiscellaneousInfo.childrensLanguage,
  4: MiscellaneousInfo.colloquialism,
  5: MiscellaneousInfo.companyName,
  6: MiscellaneousInfo.creature,
  7: MiscellaneousInfo.datedTerm,
  8: MiscellaneousInfo.deity,
  9: MiscellaneousInfo.derogatory,
  10: MiscellaneousInfo.document,
  11: MiscellaneousInfo.euphemistic,
  12: MiscellaneousInfo.event,
  13: MiscellaneousInfo.familiarLanguage,
  14: MiscellaneousInfo.femaleLanguage,
  15: MiscellaneousInfo.fiction,
  16: MiscellaneousInfo.formalOrLiteraryTerm,
  17: MiscellaneousInfo.givenName,
  18: MiscellaneousInfo.group,
  19: MiscellaneousInfo.historicalTerm,
  20: MiscellaneousInfo.honorificOrRespectful,
  21: MiscellaneousInfo.humbleLanguage,
  22: MiscellaneousInfo.idiomaticExpression,
  23: MiscellaneousInfo.humorousTerm,
  24: MiscellaneousInfo.legend,
  25: MiscellaneousInfo.mangaSlang,
  26: MiscellaneousInfo.maleLanguage,
  27: MiscellaneousInfo.mythology,
  28: MiscellaneousInfo.internetSlang,
  29: MiscellaneousInfo.object,
  30: MiscellaneousInfo.obsoleteTerm,
  31: MiscellaneousInfo.onomatopoeicOrMimeticWord,
  32: MiscellaneousInfo.organizationName,
  33: MiscellaneousInfo.other,
  34: MiscellaneousInfo.particularPerson,
  35: MiscellaneousInfo.placeName,
  36: MiscellaneousInfo.poeticalTerm,
  37: MiscellaneousInfo.politeLanguage,
  38: MiscellaneousInfo.productName,
  39: MiscellaneousInfo.proverb,
  40: MiscellaneousInfo.quotation,
  41: MiscellaneousInfo.rare,
  42: MiscellaneousInfo.religion,
  43: MiscellaneousInfo.sensitive,
  44: MiscellaneousInfo.service,
  45: MiscellaneousInfo.shipName,
  46: MiscellaneousInfo.slang,
  47: MiscellaneousInfo.railwayStation,
  48: MiscellaneousInfo.surname,
  49: MiscellaneousInfo.usuallyKanaAlone,
  50: MiscellaneousInfo.unclassifiedName,
  51: MiscellaneousInfo.vulgar,
  52: MiscellaneousInfo.workOfArt,
  53: MiscellaneousInfo.rudeOrXRatedTerm,
  54: MiscellaneousInfo.yojijukugo,
};
const _VocabDefinitionposEnumValueMap = {
  'adjectiveF': 0,
  'adjectiveI': 1,
  'adjectiveIx': 2,
  'adjectiveKari': 3,
  'adjectiveKu': 4,
  'adjectiveNa': 5,
  'adjectiveNari': 6,
  'adjectiveNo': 7,
  'adjectivePn': 8,
  'adjectiveShiku': 9,
  'adjectiveT': 10,
  'adverb': 11,
  'adverbTo': 12,
  'auxiliary': 13,
  'auxiliaryAdj': 14,
  'auxiliaryV': 15,
  'conjunction': 16,
  'copula': 17,
  'counter': 18,
  'expressions': 19,
  'interjection': 20,
  'noun': 21,
  'nounAdverbial': 22,
  'nounProper': 23,
  'nounPrefix': 24,
  'nounSuffix': 25,
  'nounTemporal': 26,
  'numeric': 27,
  'pronoun': 28,
  'prefix': 29,
  'particle': 30,
  'suffix': 31,
  'unclassified': 32,
  'verb': 33,
  'verbIchidan': 34,
  'verbIchidanS': 35,
  'verbNidanAS': 36,
  'verbNidanBK': 37,
  'verbNidanBS': 38,
  'verbNidanDK': 39,
  'verbNidanDS': 40,
  'verbNidanGK': 41,
  'verbNidanGS': 42,
  'verbNidanHK': 43,
  'verbNidanHS': 44,
  'verbNidanKK': 45,
  'verbNidanKS': 46,
  'verbNidanMK': 47,
  'verbNidanMS': 48,
  'verbNidanNS': 49,
  'verbNidanRK': 50,
  'verbNidanRS': 51,
  'verbNidanSS': 52,
  'verbNidanTK': 53,
  'verbNidanTS': 54,
  'verbNidanWS': 55,
  'verbNidanYK': 56,
  'verbNidanYS': 57,
  'verbNidanZS': 58,
  'verbYodanB': 59,
  'verbYodanG': 60,
  'verbYodanH': 61,
  'verbYodanK': 62,
  'verbYodanM': 63,
  'verbYodanN': 64,
  'verbYodanR': 65,
  'verbYodanS': 66,
  'verbYodanT': 67,
  'verbGodanAru': 68,
  'verbGodanB': 69,
  'verbGodanG': 70,
  'verbGodanK': 71,
  'verbGodanKS': 72,
  'verbGodanM': 73,
  'verbGodanN': 74,
  'verbGodanR': 75,
  'verbGodanRI': 76,
  'verbGodanS': 77,
  'verbGodanT': 78,
  'verbGodanU': 79,
  'verbGodanUS': 80,
  'verbGodanUru': 81,
  'verbIntransitive': 82,
  'verbKuru': 83,
  'verbIrregularN': 84,
  'verbIrregularR': 85,
  'verbSuru': 86,
  'verbSu': 87,
  'verbSuruIncluded': 88,
  'verbSuruSpecial': 89,
  'verbTransitive': 90,
  'verbIchidanZuru': 91,
  'unknown': 92,
};
const _VocabDefinitionposValueEnumMap = {
  0: PartOfSpeech.adjectiveF,
  1: PartOfSpeech.adjectiveI,
  2: PartOfSpeech.adjectiveIx,
  3: PartOfSpeech.adjectiveKari,
  4: PartOfSpeech.adjectiveKu,
  5: PartOfSpeech.adjectiveNa,
  6: PartOfSpeech.adjectiveNari,
  7: PartOfSpeech.adjectiveNo,
  8: PartOfSpeech.adjectivePn,
  9: PartOfSpeech.adjectiveShiku,
  10: PartOfSpeech.adjectiveT,
  11: PartOfSpeech.adverb,
  12: PartOfSpeech.adverbTo,
  13: PartOfSpeech.auxiliary,
  14: PartOfSpeech.auxiliaryAdj,
  15: PartOfSpeech.auxiliaryV,
  16: PartOfSpeech.conjunction,
  17: PartOfSpeech.copula,
  18: PartOfSpeech.counter,
  19: PartOfSpeech.expressions,
  20: PartOfSpeech.interjection,
  21: PartOfSpeech.noun,
  22: PartOfSpeech.nounAdverbial,
  23: PartOfSpeech.nounProper,
  24: PartOfSpeech.nounPrefix,
  25: PartOfSpeech.nounSuffix,
  26: PartOfSpeech.nounTemporal,
  27: PartOfSpeech.numeric,
  28: PartOfSpeech.pronoun,
  29: PartOfSpeech.prefix,
  30: PartOfSpeech.particle,
  31: PartOfSpeech.suffix,
  32: PartOfSpeech.unclassified,
  33: PartOfSpeech.verb,
  34: PartOfSpeech.verbIchidan,
  35: PartOfSpeech.verbIchidanS,
  36: PartOfSpeech.verbNidanAS,
  37: PartOfSpeech.verbNidanBK,
  38: PartOfSpeech.verbNidanBS,
  39: PartOfSpeech.verbNidanDK,
  40: PartOfSpeech.verbNidanDS,
  41: PartOfSpeech.verbNidanGK,
  42: PartOfSpeech.verbNidanGS,
  43: PartOfSpeech.verbNidanHK,
  44: PartOfSpeech.verbNidanHS,
  45: PartOfSpeech.verbNidanKK,
  46: PartOfSpeech.verbNidanKS,
  47: PartOfSpeech.verbNidanMK,
  48: PartOfSpeech.verbNidanMS,
  49: PartOfSpeech.verbNidanNS,
  50: PartOfSpeech.verbNidanRK,
  51: PartOfSpeech.verbNidanRS,
  52: PartOfSpeech.verbNidanSS,
  53: PartOfSpeech.verbNidanTK,
  54: PartOfSpeech.verbNidanTS,
  55: PartOfSpeech.verbNidanWS,
  56: PartOfSpeech.verbNidanYK,
  57: PartOfSpeech.verbNidanYS,
  58: PartOfSpeech.verbNidanZS,
  59: PartOfSpeech.verbYodanB,
  60: PartOfSpeech.verbYodanG,
  61: PartOfSpeech.verbYodanH,
  62: PartOfSpeech.verbYodanK,
  63: PartOfSpeech.verbYodanM,
  64: PartOfSpeech.verbYodanN,
  65: PartOfSpeech.verbYodanR,
  66: PartOfSpeech.verbYodanS,
  67: PartOfSpeech.verbYodanT,
  68: PartOfSpeech.verbGodanAru,
  69: PartOfSpeech.verbGodanB,
  70: PartOfSpeech.verbGodanG,
  71: PartOfSpeech.verbGodanK,
  72: PartOfSpeech.verbGodanKS,
  73: PartOfSpeech.verbGodanM,
  74: PartOfSpeech.verbGodanN,
  75: PartOfSpeech.verbGodanR,
  76: PartOfSpeech.verbGodanRI,
  77: PartOfSpeech.verbGodanS,
  78: PartOfSpeech.verbGodanT,
  79: PartOfSpeech.verbGodanU,
  80: PartOfSpeech.verbGodanUS,
  81: PartOfSpeech.verbGodanUru,
  82: PartOfSpeech.verbIntransitive,
  83: PartOfSpeech.verbKuru,
  84: PartOfSpeech.verbIrregularN,
  85: PartOfSpeech.verbIrregularR,
  86: PartOfSpeech.verbSuru,
  87: PartOfSpeech.verbSu,
  88: PartOfSpeech.verbSuruIncluded,
  89: PartOfSpeech.verbSuruSpecial,
  90: PartOfSpeech.verbTransitive,
  91: PartOfSpeech.verbIchidanZuru,
  92: PartOfSpeech.unknown,
};

extension VocabDefinitionQueryFilter
    on QueryBuilder<VocabDefinition, VocabDefinition, QFilterCondition> {
  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      additionalInfoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'additionalInfo',
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      additionalInfoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'additionalInfo',
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      additionalInfoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'additionalInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      additionalInfoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'additionalInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      additionalInfoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'additionalInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      additionalInfoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'additionalInfo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      additionalInfoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'additionalInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      additionalInfoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'additionalInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      additionalInfoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'additionalInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      additionalInfoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'additionalInfo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      additionalInfoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'additionalInfo',
        value: '',
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      additionalInfoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'additionalInfo',
        value: '',
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      appliesToIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'appliesTo',
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      appliesToIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'appliesTo',
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      appliesToElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'appliesTo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      appliesToElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'appliesTo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      appliesToElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'appliesTo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      appliesToElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'appliesTo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      appliesToElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'appliesTo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      appliesToElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'appliesTo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      appliesToElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'appliesTo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      appliesToElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'appliesTo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      appliesToElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'appliesTo',
        value: '',
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      appliesToElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'appliesTo',
        value: '',
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      appliesToLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'appliesTo',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      appliesToIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'appliesTo',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      appliesToIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'appliesTo',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      appliesToLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'appliesTo',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      appliesToLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'appliesTo',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      appliesToLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'appliesTo',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      definitionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'definition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      definitionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'definition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      definitionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'definition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      definitionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'definition',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      definitionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'definition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      definitionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'definition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      definitionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'definition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      definitionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'definition',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      definitionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'definition',
        value: '',
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      definitionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'definition',
        value: '',
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      dialectsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dialects',
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      dialectsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dialects',
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      dialectsElementEqualTo(Dialect value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dialects',
        value: value,
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      dialectsElementGreaterThan(
    Dialect value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dialects',
        value: value,
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      dialectsElementLessThan(
    Dialect value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dialects',
        value: value,
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      dialectsElementBetween(
    Dialect lower,
    Dialect upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dialects',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      dialectsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dialects',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      dialectsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dialects',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      dialectsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dialects',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      dialectsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dialects',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      dialectsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dialects',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      dialectsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dialects',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      examplesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'examples',
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      examplesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'examples',
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      examplesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'examples',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      examplesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'examples',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      examplesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'examples',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      examplesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'examples',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      examplesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'examples',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      examplesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'examples',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      fieldsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fields',
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      fieldsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fields',
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      fieldsElementEqualTo(Field value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fields',
        value: value,
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      fieldsElementGreaterThan(
    Field value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fields',
        value: value,
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      fieldsElementLessThan(
    Field value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fields',
        value: value,
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      fieldsElementBetween(
    Field lower,
    Field upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fields',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      fieldsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fields',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      fieldsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fields',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      fieldsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fields',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      fieldsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fields',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      fieldsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fields',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      fieldsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fields',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      loanWordInfoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'loanWordInfo',
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      loanWordInfoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'loanWordInfo',
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      miscInfoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'miscInfo',
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      miscInfoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'miscInfo',
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      miscInfoElementEqualTo(MiscellaneousInfo value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'miscInfo',
        value: value,
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      miscInfoElementGreaterThan(
    MiscellaneousInfo value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'miscInfo',
        value: value,
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      miscInfoElementLessThan(
    MiscellaneousInfo value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'miscInfo',
        value: value,
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      miscInfoElementBetween(
    MiscellaneousInfo lower,
    MiscellaneousInfo upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'miscInfo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      miscInfoLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'miscInfo',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      miscInfoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'miscInfo',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      miscInfoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'miscInfo',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      miscInfoLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'miscInfo',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      miscInfoLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'miscInfo',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      miscInfoLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'miscInfo',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      posIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pos',
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      posIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pos',
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      posElementEqualTo(PartOfSpeech value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pos',
        value: value,
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      posElementGreaterThan(
    PartOfSpeech value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pos',
        value: value,
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      posElementLessThan(
    PartOfSpeech value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pos',
        value: value,
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      posElementBetween(
    PartOfSpeech lower,
    PartOfSpeech upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pos',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      posLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pos',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      posIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pos',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      posIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pos',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      posLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pos',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      posLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pos',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      posLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pos',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension VocabDefinitionQueryObject
    on QueryBuilder<VocabDefinition, VocabDefinition, QFilterCondition> {
  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      examplesElement(FilterQuery<VocabExample> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'examples');
    });
  }

  QueryBuilder<VocabDefinition, VocabDefinition, QAfterFilterCondition>
      loanWordInfo(FilterQuery<LoanWordInfo> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'loanWordInfo');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const VocabExampleSchema = Schema(
  name: r'VocabExample',
  id: -2896980490390277729,
  properties: {
    r'english': PropertySchema(
      id: 0,
      name: r'english',
      type: IsarType.string,
    ),
    r'japanese': PropertySchema(
      id: 1,
      name: r'japanese',
      type: IsarType.string,
    )
  },
  estimateSize: _vocabExampleEstimateSize,
  serialize: _vocabExampleSerialize,
  deserialize: _vocabExampleDeserialize,
  deserializeProp: _vocabExampleDeserializeProp,
);

int _vocabExampleEstimateSize(
  VocabExample object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.english.length * 3;
  bytesCount += 3 + object.japanese.length * 3;
  return bytesCount;
}

void _vocabExampleSerialize(
  VocabExample object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.english);
  writer.writeString(offsets[1], object.japanese);
}

VocabExample _vocabExampleDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VocabExample();
  object.english = reader.readString(offsets[0]);
  object.japanese = reader.readString(offsets[1]);
  return object;
}

P _vocabExampleDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension VocabExampleQueryFilter
    on QueryBuilder<VocabExample, VocabExample, QFilterCondition> {
  QueryBuilder<VocabExample, VocabExample, QAfterFilterCondition>
      englishEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'english',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VocabExample, VocabExample, QAfterFilterCondition>
      englishGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'english',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VocabExample, VocabExample, QAfterFilterCondition>
      englishLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'english',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VocabExample, VocabExample, QAfterFilterCondition>
      englishBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'english',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VocabExample, VocabExample, QAfterFilterCondition>
      englishStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'english',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VocabExample, VocabExample, QAfterFilterCondition>
      englishEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'english',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VocabExample, VocabExample, QAfterFilterCondition>
      englishContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'english',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VocabExample, VocabExample, QAfterFilterCondition>
      englishMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'english',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VocabExample, VocabExample, QAfterFilterCondition>
      englishIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'english',
        value: '',
      ));
    });
  }

  QueryBuilder<VocabExample, VocabExample, QAfterFilterCondition>
      englishIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'english',
        value: '',
      ));
    });
  }

  QueryBuilder<VocabExample, VocabExample, QAfterFilterCondition>
      japaneseEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'japanese',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VocabExample, VocabExample, QAfterFilterCondition>
      japaneseGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'japanese',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VocabExample, VocabExample, QAfterFilterCondition>
      japaneseLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'japanese',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VocabExample, VocabExample, QAfterFilterCondition>
      japaneseBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'japanese',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VocabExample, VocabExample, QAfterFilterCondition>
      japaneseStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'japanese',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VocabExample, VocabExample, QAfterFilterCondition>
      japaneseEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'japanese',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VocabExample, VocabExample, QAfterFilterCondition>
      japaneseContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'japanese',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VocabExample, VocabExample, QAfterFilterCondition>
      japaneseMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'japanese',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VocabExample, VocabExample, QAfterFilterCondition>
      japaneseIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'japanese',
        value: '',
      ));
    });
  }

  QueryBuilder<VocabExample, VocabExample, QAfterFilterCondition>
      japaneseIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'japanese',
        value: '',
      ));
    });
  }
}

extension VocabExampleQueryObject
    on QueryBuilder<VocabExample, VocabExample, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const LoanWordInfoSchema = Schema(
  name: r'LoanWordInfo',
  id: 3920775525188283511,
  properties: {
    r'languageSource': PropertySchema(
      id: 0,
      name: r'languageSource',
      type: IsarType.byteList,
      enumMap: _LoanWordInfolanguageSourceEnumValueMap,
    ),
    r'waseieigo': PropertySchema(
      id: 1,
      name: r'waseieigo',
      type: IsarType.bool,
    )
  },
  estimateSize: _loanWordInfoEstimateSize,
  serialize: _loanWordInfoSerialize,
  deserialize: _loanWordInfoDeserialize,
  deserializeProp: _loanWordInfoDeserializeProp,
);

int _loanWordInfoEstimateSize(
  LoanWordInfo object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.languageSource.length;
  return bytesCount;
}

void _loanWordInfoSerialize(
  LoanWordInfo object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeByteList(
      offsets[0], object.languageSource.map((e) => e.index).toList());
  writer.writeBool(offsets[1], object.waseieigo);
}

LoanWordInfo _loanWordInfoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LoanWordInfo();
  object.languageSource = reader
          .readByteList(offsets[0])
          ?.map((e) =>
              _LoanWordInfolanguageSourceValueEnumMap[e] ?? LanguageSource.afr)
          .toList() ??
      [];
  object.waseieigo = reader.readBool(offsets[1]);
  return object;
}

P _loanWordInfoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader
              .readByteList(offset)
              ?.map((e) =>
                  _LoanWordInfolanguageSourceValueEnumMap[e] ??
                  LanguageSource.afr)
              .toList() ??
          []) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _LoanWordInfolanguageSourceEnumValueMap = {
  'afr': 0,
  'ain': 1,
  'alg': 2,
  'amh': 3,
  'ara': 4,
  'arn': 5,
  'bnt': 6,
  'bre': 7,
  'bul': 8,
  'bur': 9,
  'chi': 10,
  'chn': 11,
  'cze': 12,
  'dan': 13,
  'dut': 14,
  'eng': 15,
  'epo': 16,
  'est': 17,
  'fil': 18,
  'fin': 19,
  'fre': 20,
  'geo': 21,
  'ger': 22,
  'glg': 23,
  'grc': 24,
  'gre': 25,
  'haw': 26,
  'heb': 27,
  'hin': 28,
  'hun': 29,
  'ice': 30,
  'ind': 31,
  'ita': 32,
  'khm': 33,
  'kor': 34,
  'kur': 35,
  'lat': 36,
  'mal': 37,
  'mao': 38,
  'may': 39,
  'mnc': 40,
  'mol': 41,
  'mon': 42,
  'nor': 43,
  'per': 44,
  'pol': 45,
  'por': 46,
  'rum': 47,
  'rus': 48,
  'san': 49,
  'scr': 50,
  'slo': 51,
  'slv': 52,
  'som': 53,
  'spa': 54,
  'swa': 55,
  'swe': 56,
  'tah': 57,
  'tam': 58,
  'tgl': 59,
  'tha': 60,
  'tib': 61,
  'tur': 62,
  'ukr': 63,
  'urd': 64,
  'vie': 65,
  'yid': 66,
};
const _LoanWordInfolanguageSourceValueEnumMap = {
  0: LanguageSource.afr,
  1: LanguageSource.ain,
  2: LanguageSource.alg,
  3: LanguageSource.amh,
  4: LanguageSource.ara,
  5: LanguageSource.arn,
  6: LanguageSource.bnt,
  7: LanguageSource.bre,
  8: LanguageSource.bul,
  9: LanguageSource.bur,
  10: LanguageSource.chi,
  11: LanguageSource.chn,
  12: LanguageSource.cze,
  13: LanguageSource.dan,
  14: LanguageSource.dut,
  15: LanguageSource.eng,
  16: LanguageSource.epo,
  17: LanguageSource.est,
  18: LanguageSource.fil,
  19: LanguageSource.fin,
  20: LanguageSource.fre,
  21: LanguageSource.geo,
  22: LanguageSource.ger,
  23: LanguageSource.glg,
  24: LanguageSource.grc,
  25: LanguageSource.gre,
  26: LanguageSource.haw,
  27: LanguageSource.heb,
  28: LanguageSource.hin,
  29: LanguageSource.hun,
  30: LanguageSource.ice,
  31: LanguageSource.ind,
  32: LanguageSource.ita,
  33: LanguageSource.khm,
  34: LanguageSource.kor,
  35: LanguageSource.kur,
  36: LanguageSource.lat,
  37: LanguageSource.mal,
  38: LanguageSource.mao,
  39: LanguageSource.may,
  40: LanguageSource.mnc,
  41: LanguageSource.mol,
  42: LanguageSource.mon,
  43: LanguageSource.nor,
  44: LanguageSource.per,
  45: LanguageSource.pol,
  46: LanguageSource.por,
  47: LanguageSource.rum,
  48: LanguageSource.rus,
  49: LanguageSource.san,
  50: LanguageSource.scr,
  51: LanguageSource.slo,
  52: LanguageSource.slv,
  53: LanguageSource.som,
  54: LanguageSource.spa,
  55: LanguageSource.swa,
  56: LanguageSource.swe,
  57: LanguageSource.tah,
  58: LanguageSource.tam,
  59: LanguageSource.tgl,
  60: LanguageSource.tha,
  61: LanguageSource.tib,
  62: LanguageSource.tur,
  63: LanguageSource.ukr,
  64: LanguageSource.urd,
  65: LanguageSource.vie,
  66: LanguageSource.yid,
};

extension LoanWordInfoQueryFilter
    on QueryBuilder<LoanWordInfo, LoanWordInfo, QFilterCondition> {
  QueryBuilder<LoanWordInfo, LoanWordInfo, QAfterFilterCondition>
      languageSourceElementEqualTo(LanguageSource value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'languageSource',
        value: value,
      ));
    });
  }

  QueryBuilder<LoanWordInfo, LoanWordInfo, QAfterFilterCondition>
      languageSourceElementGreaterThan(
    LanguageSource value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'languageSource',
        value: value,
      ));
    });
  }

  QueryBuilder<LoanWordInfo, LoanWordInfo, QAfterFilterCondition>
      languageSourceElementLessThan(
    LanguageSource value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'languageSource',
        value: value,
      ));
    });
  }

  QueryBuilder<LoanWordInfo, LoanWordInfo, QAfterFilterCondition>
      languageSourceElementBetween(
    LanguageSource lower,
    LanguageSource upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'languageSource',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LoanWordInfo, LoanWordInfo, QAfterFilterCondition>
      languageSourceLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'languageSource',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<LoanWordInfo, LoanWordInfo, QAfterFilterCondition>
      languageSourceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'languageSource',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<LoanWordInfo, LoanWordInfo, QAfterFilterCondition>
      languageSourceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'languageSource',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LoanWordInfo, LoanWordInfo, QAfterFilterCondition>
      languageSourceLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'languageSource',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<LoanWordInfo, LoanWordInfo, QAfterFilterCondition>
      languageSourceLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'languageSource',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LoanWordInfo, LoanWordInfo, QAfterFilterCondition>
      languageSourceLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'languageSource',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<LoanWordInfo, LoanWordInfo, QAfterFilterCondition>
      waseieigoEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'waseieigo',
        value: value,
      ));
    });
  }
}

extension LoanWordInfoQueryObject
    on QueryBuilder<LoanWordInfo, LoanWordInfo, QFilterCondition> {}
