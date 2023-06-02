// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'predefined_dictionary_list.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPredefinedDictionaryListCollection on Isar {
  IsarCollection<PredefinedDictionaryList> get predefinedDictionaryLists =>
      this.collection();
}

const PredefinedDictionaryListSchema = CollectionSchema(
  name: r'PredefinedDictionaryList',
  id: -951282998250442629,
  properties: {
    r'name': PropertySchema(
      id: 0,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _predefinedDictionaryListEstimateSize,
  serialize: _predefinedDictionaryListSerialize,
  deserialize: _predefinedDictionaryListDeserialize,
  deserializeProp: _predefinedDictionaryListDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'vocabLinks': LinkSchema(
      id: -8755321992188407673,
      name: r'vocabLinks',
      target: r'Vocab',
      single: false,
    ),
    r'kanjiLinks': LinkSchema(
      id: 42614560257722466,
      name: r'kanjiLinks',
      target: r'Kanji',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _predefinedDictionaryListGetId,
  getLinks: _predefinedDictionaryListGetLinks,
  attach: _predefinedDictionaryListAttach,
  version: '3.1.0+1',
);

int _predefinedDictionaryListEstimateSize(
  PredefinedDictionaryList object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _predefinedDictionaryListSerialize(
  PredefinedDictionaryList object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.name);
}

PredefinedDictionaryList _predefinedDictionaryListDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PredefinedDictionaryList();
  object.id = id;
  object.name = reader.readString(offsets[0]);
  return object;
}

P _predefinedDictionaryListDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _predefinedDictionaryListGetId(PredefinedDictionaryList object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _predefinedDictionaryListGetLinks(
    PredefinedDictionaryList object) {
  return [object.vocabLinks, object.kanjiLinks];
}

void _predefinedDictionaryListAttach(
    IsarCollection<dynamic> col, Id id, PredefinedDictionaryList object) {
  object.id = id;
  object.vocabLinks
      .attach(col, col.isar.collection<Vocab>(), r'vocabLinks', id);
  object.kanjiLinks
      .attach(col, col.isar.collection<Kanji>(), r'kanjiLinks', id);
}

extension PredefinedDictionaryListQueryWhereSort on QueryBuilder<
    PredefinedDictionaryList, PredefinedDictionaryList, QWhere> {
  QueryBuilder<PredefinedDictionaryList, PredefinedDictionaryList, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PredefinedDictionaryListQueryWhere on QueryBuilder<
    PredefinedDictionaryList, PredefinedDictionaryList, QWhereClause> {
  QueryBuilder<PredefinedDictionaryList, PredefinedDictionaryList,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PredefinedDictionaryList, PredefinedDictionaryList,
      QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<PredefinedDictionaryList, PredefinedDictionaryList,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PredefinedDictionaryList, PredefinedDictionaryList,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PredefinedDictionaryList, PredefinedDictionaryList,
      QAfterWhereClause> idBetween(
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
}

extension PredefinedDictionaryListQueryFilter on QueryBuilder<
    PredefinedDictionaryList, PredefinedDictionaryList, QFilterCondition> {
  QueryBuilder<PredefinedDictionaryList, PredefinedDictionaryList,
      QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<PredefinedDictionaryList, PredefinedDictionaryList,
      QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<PredefinedDictionaryList, PredefinedDictionaryList,
      QAfterFilterCondition> idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PredefinedDictionaryList, PredefinedDictionaryList,
      QAfterFilterCondition> idGreaterThan(
    Id? value, {
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

  QueryBuilder<PredefinedDictionaryList, PredefinedDictionaryList,
      QAfterFilterCondition> idLessThan(
    Id? value, {
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

  QueryBuilder<PredefinedDictionaryList, PredefinedDictionaryList,
      QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
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

  QueryBuilder<PredefinedDictionaryList, PredefinedDictionaryList,
      QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PredefinedDictionaryList, PredefinedDictionaryList,
      QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PredefinedDictionaryList, PredefinedDictionaryList,
      QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PredefinedDictionaryList, PredefinedDictionaryList,
      QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PredefinedDictionaryList, PredefinedDictionaryList,
      QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PredefinedDictionaryList, PredefinedDictionaryList,
      QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PredefinedDictionaryList, PredefinedDictionaryList,
          QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PredefinedDictionaryList, PredefinedDictionaryList,
          QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PredefinedDictionaryList, PredefinedDictionaryList,
      QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<PredefinedDictionaryList, PredefinedDictionaryList,
      QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension PredefinedDictionaryListQueryObject on QueryBuilder<
    PredefinedDictionaryList, PredefinedDictionaryList, QFilterCondition> {}

extension PredefinedDictionaryListQueryLinks on QueryBuilder<
    PredefinedDictionaryList, PredefinedDictionaryList, QFilterCondition> {
  QueryBuilder<PredefinedDictionaryList, PredefinedDictionaryList,
      QAfterFilterCondition> vocabLinks(FilterQuery<Vocab> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'vocabLinks');
    });
  }

  QueryBuilder<PredefinedDictionaryList, PredefinedDictionaryList,
      QAfterFilterCondition> vocabLinksLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'vocabLinks', length, true, length, true);
    });
  }

  QueryBuilder<PredefinedDictionaryList, PredefinedDictionaryList,
      QAfterFilterCondition> vocabLinksIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'vocabLinks', 0, true, 0, true);
    });
  }

  QueryBuilder<PredefinedDictionaryList, PredefinedDictionaryList,
      QAfterFilterCondition> vocabLinksIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'vocabLinks', 0, false, 999999, true);
    });
  }

  QueryBuilder<PredefinedDictionaryList, PredefinedDictionaryList,
      QAfterFilterCondition> vocabLinksLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'vocabLinks', 0, true, length, include);
    });
  }

  QueryBuilder<PredefinedDictionaryList, PredefinedDictionaryList,
      QAfterFilterCondition> vocabLinksLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'vocabLinks', length, include, 999999, true);
    });
  }

  QueryBuilder<PredefinedDictionaryList, PredefinedDictionaryList,
      QAfterFilterCondition> vocabLinksLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'vocabLinks', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<PredefinedDictionaryList, PredefinedDictionaryList,
      QAfterFilterCondition> kanjiLinks(FilterQuery<Kanji> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'kanjiLinks');
    });
  }

  QueryBuilder<PredefinedDictionaryList, PredefinedDictionaryList,
      QAfterFilterCondition> kanjiLinksLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'kanjiLinks', length, true, length, true);
    });
  }

  QueryBuilder<PredefinedDictionaryList, PredefinedDictionaryList,
      QAfterFilterCondition> kanjiLinksIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'kanjiLinks', 0, true, 0, true);
    });
  }

  QueryBuilder<PredefinedDictionaryList, PredefinedDictionaryList,
      QAfterFilterCondition> kanjiLinksIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'kanjiLinks', 0, false, 999999, true);
    });
  }

  QueryBuilder<PredefinedDictionaryList, PredefinedDictionaryList,
      QAfterFilterCondition> kanjiLinksLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'kanjiLinks', 0, true, length, include);
    });
  }

  QueryBuilder<PredefinedDictionaryList, PredefinedDictionaryList,
      QAfterFilterCondition> kanjiLinksLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'kanjiLinks', length, include, 999999, true);
    });
  }

  QueryBuilder<PredefinedDictionaryList, PredefinedDictionaryList,
      QAfterFilterCondition> kanjiLinksLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'kanjiLinks', lower, includeLower, upper, includeUpper);
    });
  }
}

extension PredefinedDictionaryListQuerySortBy on QueryBuilder<
    PredefinedDictionaryList, PredefinedDictionaryList, QSortBy> {
  QueryBuilder<PredefinedDictionaryList, PredefinedDictionaryList, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<PredefinedDictionaryList, PredefinedDictionaryList, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension PredefinedDictionaryListQuerySortThenBy on QueryBuilder<
    PredefinedDictionaryList, PredefinedDictionaryList, QSortThenBy> {
  QueryBuilder<PredefinedDictionaryList, PredefinedDictionaryList, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PredefinedDictionaryList, PredefinedDictionaryList, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PredefinedDictionaryList, PredefinedDictionaryList, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<PredefinedDictionaryList, PredefinedDictionaryList, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension PredefinedDictionaryListQueryWhereDistinct on QueryBuilder<
    PredefinedDictionaryList, PredefinedDictionaryList, QDistinct> {
  QueryBuilder<PredefinedDictionaryList, PredefinedDictionaryList, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension PredefinedDictionaryListQueryProperty on QueryBuilder<
    PredefinedDictionaryList, PredefinedDictionaryList, QQueryProperty> {
  QueryBuilder<PredefinedDictionaryList, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PredefinedDictionaryList, String, QQueryOperations>
      nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }
}
