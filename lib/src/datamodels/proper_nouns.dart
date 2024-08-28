import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:sagase_dictionary/src/datamodels/dictionary_item.dart';
import 'package:sagase_dictionary/src/utils/enums.dart';

@UseRowClass(ProperNoun)
@TableIndex(name: 'IX_proper_nouns_reading', columns: {#reading})
@TableIndex(name: 'IX_proper_nouns_reading_romaji', columns: {#readingRomaji})
class ProperNouns extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get writing => text().nullable()();
  TextColumn get writingSearchForm => text().nullable()();
  TextColumn get reading => text()();
  TextColumn get readingSearchForm => text().nullable()();
  TextColumn get readingRomaji => text()();
  TextColumn get readingRomajiSimplified => text().nullable()();
  TextColumn get romaji => text()();

  TextColumn get types => text().map(const ProperNounTypeConverter())();
}

class ProperNoun extends DictionaryItem {
  final String? writing;
  final String? writingSearchForm;
  final String reading;
  final String? readingSearchForm;
  final String readingRomaji;
  final String? readingRomajiSimplified;
  final String romaji;

  final List<ProperNounType> types;

  ProperNoun({
    required super.id,
    required this.writing,
    required this.writingSearchForm,
    required this.reading,
    required this.readingSearchForm,
    required this.readingRomaji,
    required this.readingRomajiSimplified,
    required this.romaji,
    required this.types,
  });
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

@TableIndex(name: 'IX_proper_noun_romaji_words_word', columns: {#word})
class ProperNounRomajiWords extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get word => text()();
  IntColumn get properNounId => integer()();
}
