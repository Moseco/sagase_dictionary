import 'package:isar/isar.dart';
import 'package:sagase_dictionary/src/datamodels/kanji.dart';
import 'package:sagase_dictionary/src/datamodels/vocab.dart';

abstract class DictionaryList {
  Id? id;

  late String name;

  IsarLinks<Vocab> get vocabLinks;
  IsarLinks<Kanji> get kanjiLinks;
}
