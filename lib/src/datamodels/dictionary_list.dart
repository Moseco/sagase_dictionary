import 'package:isar/isar.dart';
import 'package:sagase_dictionary/src/datamodels/kanji.dart';
import 'package:sagase_dictionary/src/datamodels/vocab.dart';

abstract class DictionaryList {
  Id id = Isar.autoIncrement;

  late String name;

  // Temporarily include both links and new lists for transition
  IsarLinks<Vocab> get vocabLinks;
  IsarLinks<Kanji> get kanjiLinks;

  List<int> getVocab();
  List<int> getKanji();
}
