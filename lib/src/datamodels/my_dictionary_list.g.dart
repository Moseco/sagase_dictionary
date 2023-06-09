// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_dictionary_list.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMyDictionaryListCollection on Isar {
  IsarCollection<MyDictionaryList> get myDictionaryLists => this.collection();
}

const MyDictionaryListSchema = CollectionSchema(
  name: r'MyDictionaryList',
  id: 6176417872671831127,
  properties: {
    r'name': PropertySchema(
      id: 0,
      name: r'name',
      type: IsarType.string,
    ),
    r'timestamp': PropertySchema(
      id: 1,
      name: r'timestamp',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _myDictionaryListEstimateSize,
  serialize: _myDictionaryListSerialize,
  deserialize: _myDictionaryListDeserialize,
  deserializeProp: _myDictionaryListDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'vocabLinks': LinkSchema(
      id: -7430551060252451920,
      name: r'vocabLinks',
      target: r'Vocab',
      single: false,
    ),
    r'kanjiLinks': LinkSchema(
      id: -4353092201869663227,
      name: r'kanjiLinks',
      target: r'Kanji',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _myDictionaryListGetId,
  getLinks: _myDictionaryListGetLinks,
  attach: _myDictionaryListAttach,
  version: '3.1.0+1',
);

int _myDictionaryListEstimateSize(
  MyDictionaryList object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _myDictionaryListSerialize(
  MyDictionaryList object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.name);
  writer.writeDateTime(offsets[1], object.timestamp);
}

MyDictionaryList _myDictionaryListDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MyDictionaryList();
  object.id = id;
  object.name = reader.readString(offsets[0]);
  object.timestamp = reader.readDateTime(offsets[1]);
  return object;
}

P _myDictionaryListDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _myDictionaryListGetId(MyDictionaryList object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _myDictionaryListGetLinks(MyDictionaryList object) {
  return [object.vocabLinks, object.kanjiLinks];
}

void _myDictionaryListAttach(
    IsarCollection<dynamic> col, Id id, MyDictionaryList object) {
  object.id = id;
  object.vocabLinks
      .attach(col, col.isar.collection<Vocab>(), r'vocabLinks', id);
  object.kanjiLinks
      .attach(col, col.isar.collection<Kanji>(), r'kanjiLinks', id);
}

extension MyDictionaryListQueryWhereSort
    on QueryBuilder<MyDictionaryList, MyDictionaryList, QWhere> {
  QueryBuilder<MyDictionaryList, MyDictionaryList, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MyDictionaryListQueryWhere
    on QueryBuilder<MyDictionaryList, MyDictionaryList, QWhereClause> {
  QueryBuilder<MyDictionaryList, MyDictionaryList, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MyDictionaryList, MyDictionaryList, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<MyDictionaryList, MyDictionaryList, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MyDictionaryList, MyDictionaryList, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MyDictionaryList, MyDictionaryList, QAfterWhereClause> idBetween(
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

extension MyDictionaryListQueryFilter
    on QueryBuilder<MyDictionaryList, MyDictionaryList, QFilterCondition> {
  QueryBuilder<MyDictionaryList, MyDictionaryList, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<MyDictionaryList, MyDictionaryList, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<MyDictionaryList, MyDictionaryList, QAfterFilterCondition>
      idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MyDictionaryList, MyDictionaryList, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<MyDictionaryList, MyDictionaryList, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<MyDictionaryList, MyDictionaryList, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<MyDictionaryList, MyDictionaryList, QAfterFilterCondition>
      nameEqualTo(
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

  QueryBuilder<MyDictionaryList, MyDictionaryList, QAfterFilterCondition>
      nameGreaterThan(
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

  QueryBuilder<MyDictionaryList, MyDictionaryList, QAfterFilterCondition>
      nameLessThan(
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

  QueryBuilder<MyDictionaryList, MyDictionaryList, QAfterFilterCondition>
      nameBetween(
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

  QueryBuilder<MyDictionaryList, MyDictionaryList, QAfterFilterCondition>
      nameStartsWith(
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

  QueryBuilder<MyDictionaryList, MyDictionaryList, QAfterFilterCondition>
      nameEndsWith(
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

  QueryBuilder<MyDictionaryList, MyDictionaryList, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyDictionaryList, MyDictionaryList, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyDictionaryList, MyDictionaryList, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<MyDictionaryList, MyDictionaryList, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<MyDictionaryList, MyDictionaryList, QAfterFilterCondition>
      timestampEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<MyDictionaryList, MyDictionaryList, QAfterFilterCondition>
      timestampGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<MyDictionaryList, MyDictionaryList, QAfterFilterCondition>
      timestampLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<MyDictionaryList, MyDictionaryList, QAfterFilterCondition>
      timestampBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timestamp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MyDictionaryListQueryObject
    on QueryBuilder<MyDictionaryList, MyDictionaryList, QFilterCondition> {}

extension MyDictionaryListQueryLinks
    on QueryBuilder<MyDictionaryList, MyDictionaryList, QFilterCondition> {
  QueryBuilder<MyDictionaryList, MyDictionaryList, QAfterFilterCondition>
      vocabLinks(FilterQuery<Vocab> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'vocabLinks');
    });
  }

  QueryBuilder<MyDictionaryList, MyDictionaryList, QAfterFilterCondition>
      vocabLinksLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'vocabLinks', length, true, length, true);
    });
  }

  QueryBuilder<MyDictionaryList, MyDictionaryList, QAfterFilterCondition>
      vocabLinksIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'vocabLinks', 0, true, 0, true);
    });
  }

  QueryBuilder<MyDictionaryList, MyDictionaryList, QAfterFilterCondition>
      vocabLinksIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'vocabLinks', 0, false, 999999, true);
    });
  }

  QueryBuilder<MyDictionaryList, MyDictionaryList, QAfterFilterCondition>
      vocabLinksLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'vocabLinks', 0, true, length, include);
    });
  }

  QueryBuilder<MyDictionaryList, MyDictionaryList, QAfterFilterCondition>
      vocabLinksLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'vocabLinks', length, include, 999999, true);
    });
  }

  QueryBuilder<MyDictionaryList, MyDictionaryList, QAfterFilterCondition>
      vocabLinksLengthBetween(
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

  QueryBuilder<MyDictionaryList, MyDictionaryList, QAfterFilterCondition>
      kanjiLinks(FilterQuery<Kanji> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'kanjiLinks');
    });
  }

  QueryBuilder<MyDictionaryList, MyDictionaryList, QAfterFilterCondition>
      kanjiLinksLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'kanjiLinks', length, true, length, true);
    });
  }

  QueryBuilder<MyDictionaryList, MyDictionaryList, QAfterFilterCondition>
      kanjiLinksIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'kanjiLinks', 0, true, 0, true);
    });
  }

  QueryBuilder<MyDictionaryList, MyDictionaryList, QAfterFilterCondition>
      kanjiLinksIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'kanjiLinks', 0, false, 999999, true);
    });
  }

  QueryBuilder<MyDictionaryList, MyDictionaryList, QAfterFilterCondition>
      kanjiLinksLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'kanjiLinks', 0, true, length, include);
    });
  }

  QueryBuilder<MyDictionaryList, MyDictionaryList, QAfterFilterCondition>
      kanjiLinksLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'kanjiLinks', length, include, 999999, true);
    });
  }

  QueryBuilder<MyDictionaryList, MyDictionaryList, QAfterFilterCondition>
      kanjiLinksLengthBetween(
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

extension MyDictionaryListQuerySortBy
    on QueryBuilder<MyDictionaryList, MyDictionaryList, QSortBy> {
  QueryBuilder<MyDictionaryList, MyDictionaryList, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MyDictionaryList, MyDictionaryList, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<MyDictionaryList, MyDictionaryList, QAfterSortBy>
      sortByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<MyDictionaryList, MyDictionaryList, QAfterSortBy>
      sortByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }
}

extension MyDictionaryListQuerySortThenBy
    on QueryBuilder<MyDictionaryList, MyDictionaryList, QSortThenBy> {
  QueryBuilder<MyDictionaryList, MyDictionaryList, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MyDictionaryList, MyDictionaryList, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MyDictionaryList, MyDictionaryList, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MyDictionaryList, MyDictionaryList, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<MyDictionaryList, MyDictionaryList, QAfterSortBy>
      thenByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<MyDictionaryList, MyDictionaryList, QAfterSortBy>
      thenByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }
}

extension MyDictionaryListQueryWhereDistinct
    on QueryBuilder<MyDictionaryList, MyDictionaryList, QDistinct> {
  QueryBuilder<MyDictionaryList, MyDictionaryList, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MyDictionaryList, MyDictionaryList, QDistinct>
      distinctByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timestamp');
    });
  }
}

extension MyDictionaryListQueryProperty
    on QueryBuilder<MyDictionaryList, MyDictionaryList, QQueryProperty> {
  QueryBuilder<MyDictionaryList, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MyDictionaryList, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<MyDictionaryList, DateTime, QQueryOperations>
      timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timestamp');
    });
  }
}
