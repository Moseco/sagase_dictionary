import 'package:isar/isar.dart';
import 'package:sagase_dictionary/src/datamodels/dictionary_list.dart';
import 'package:sagase_dictionary/src/datamodels/kanji.dart';
import 'package:sagase_dictionary/src/datamodels/vocab.dart';

part 'predefined_dictionary_list.g.dart';

@Collection()
class PredefinedDictionaryList extends DictionaryList {
  @override
  final vocabLinks = IsarLinks<Vocab>();
  @override
  final kanjiLinks = IsarLinks<Kanji>();

  List<int> vocab = [];
  List<int> kanji = [];

  @override
  List<int> getVocab() => vocab;
  @override
  List<int> getKanji() => kanji;
}
