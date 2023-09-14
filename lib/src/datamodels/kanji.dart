import 'package:isar/isar.dart';
import 'package:sagase_dictionary/src/datamodels/dictionary_item.dart';
import 'package:sagase_dictionary/src/datamodels/kanji_radical.dart';
import 'package:sagase_dictionary/src/datamodels/my_dictionary_list.dart';
import 'package:sagase_dictionary/src/datamodels/vocab.dart';
import 'package:sagase_dictionary/src/datamodels/spaced_repetition_data.dart';

part 'kanji.g.dart';

@Collection()
class Kanji extends DictionaryItem {
  @Index(unique: true)
  late String kanji;

  final radical = IsarLink<KanjiRadical>();
  final componentLinks = IsarLinks<Kanji>();
  byte grade = 255;
  late byte strokeCount;
  int? frequency;
  byte jlpt = 255;

  @Index(type: IndexType.value, caseSensitive: false)
  List<String>? meanings;

  List<String>? onReadings;
  List<String>? kunReadings;
  List<String>? nanori;

  @Index(type: IndexType.value)
  List<String>? readingIndex;

  List<String>? strokes;

  final compounds = IsarLinks<Vocab>();

  @Backlink(to: 'kanjiLinks')
  final myDictionaryListLinks = IsarLinks<MyDictionaryList>();
}
