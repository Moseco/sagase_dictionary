import 'package:drift/drift.dart';
import 'package:sagase_dictionary/src/datamodels/dictionary_item.dart';
import 'package:sagase_dictionary/src/utils/converters.dart';
import 'package:sagase_dictionary/src/utils/enums.dart';

@UseRowClass(Kanji)
@TableIndex(name: 'IX_kanjis_radical', columns: {#radical})
class Kanjis extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get kanji => text()();
  TextColumn get radical => text()();
  TextColumn get components =>
      text().map(const StringListConverter()).nullable()();

  IntColumn get grade => intEnum<KanjiGrade>().nullable()();
  IntColumn get strokeCount => integer()();
  IntColumn get frequency => integer().nullable()();
  IntColumn get jlpt => intEnum<JlptLevel>().nullable()();

  TextColumn get meaning => text().nullable()();

  TextColumn get strokes =>
      text().map(const StringListConverter()).nullable()();

  TextColumn get compounds => text().map(const IntListConverter()).nullable()();
}

class Kanji extends DictionaryItem {
  final String kanji;
  final String? meaning;
  final String radical;
  final List<String>? components;
  final KanjiGrade? grade;
  final int strokeCount;
  final int? frequency;
  final JlptLevel? jlpt;
  final List<String>? strokes;
  final List<int>? compounds;

  List<KanjiReading>? onReadings;
  List<KanjiReading>? kunReadings;
  List<KanjiReading>? nanori;

  Kanji({
    required super.id,
    required this.kanji,
    required this.meaning,
    required this.radical,
    required this.components,
    required this.grade,
    required this.strokeCount,
    required this.frequency,
    required this.jlpt,
    required this.strokes,
    required this.compounds,
  });
}

@UseRowClass(KanjiReading)
@TableIndex(name: 'IX_kanji_readings_kanji_id', columns: {#kanjiId})
@TableIndex(name: 'IX_kanji_readings_reading', columns: {#reading})
@TableIndex(name: 'IX_kanji_readings_reading_romaji', columns: {#readingRomaji})
class KanjiReadings extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get kanjiId => integer()();

  TextColumn get reading => text()();
  TextColumn get readingSearchForm => text().nullable()();
  TextColumn get readingRomaji => text()();
  TextColumn get readingRomajiSimplified => text().nullable()();

  IntColumn get type => intEnum<KanjiReadingType>()();
}

class KanjiReading {
  final int id;
  final int kanjiId;
  final String reading;
  final String? readingSearchForm;
  final String readingRomaji;
  final String? readingRomajiSimplified;
  final KanjiReadingType type;

  KanjiReading({
    required this.id,
    required this.kanjiId,
    required this.reading,
    required this.readingSearchForm,
    required this.readingRomaji,
    required this.readingRomajiSimplified,
    required this.type,
  });

  @override
  String toString() => reading;
}

@TableIndex(name: 'IX_kanji_meaning_words_word', columns: {#word})
class KanjiMeaningWords extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get word => text()();
  IntColumn get kanjiId => integer()();
}
