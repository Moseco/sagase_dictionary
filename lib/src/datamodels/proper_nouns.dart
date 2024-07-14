import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:sagase_dictionary/src/utils/enums.dart';

@TableIndex(name: 'IX_proper_nouns_reading', columns: {#reading})
@TableIndex(name: 'IX_proper_nouns_reading_romaji', columns: {#readingRomaji})
@TableIndex(name: 'IX_proper_nouns_romaji', columns: {#romaji})
class ProperNouns extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get writing => text().nullable()();
  TextColumn get writingSearchForm => text().nullable()();
  TextColumn get reading => text()();
  TextColumn get readingSearchForm => text().nullable()();
  TextColumn get readingRomaji => text()();
  TextColumn get readingRomajiSimplified => text().nullable()();
  TextColumn get romaji => text()();

  TextColumn get types =>
      text().map(const ProperNounTypeConverter()).nullable()();
}

class ProperNounTypeConverter
    extends TypeConverter<List<ProperNounType>, String> {
  const ProperNounTypeConverter();

  @override
  List<ProperNounType> fromSql(String fromDb) {
    return (jsonDecode(fromDb).cast<int>() as List<int>)
        .map((e) => ProperNounType.values[e])
        .toList();
  }

  @override
  String toSql(List<ProperNounType> value) {
    return jsonEncode(value.map((e) => e.index).toList());
  }
}
