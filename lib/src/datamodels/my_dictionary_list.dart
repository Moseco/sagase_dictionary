import 'package:isar/isar.dart';
import 'package:sagase_dictionary/src/datamodels/dictionary_list.dart';
import 'package:sagase_dictionary/src/datamodels/kanji.dart';
import 'package:sagase_dictionary/src/datamodels/vocab.dart';
import 'package:sagase_dictionary/src/utils/constants.dart';

part 'my_dictionary_list.g.dart';

@Collection()
class MyDictionaryList extends DictionaryList {
  late DateTime timestamp;

  @override
  final vocabLinks = IsarLinks<Vocab>();
  @override
  final kanjiLinks = IsarLinks<Kanji>();

  @Index()
  List<int> vocab = [];
  @Index()
  List<int> kanji = [];

  @override
  List<int> getVocab() => vocab;
  @override
  List<int> getKanji() => kanji;

  String toBackupJson() {
    return '''{
      "${SagaseDictionaryConstants.backupMyDictionaryListId}": $id,
      "${SagaseDictionaryConstants.backupMyDictionaryListName}": "$name",
      "${SagaseDictionaryConstants.backupMyDictionaryListTimestamp}": ${timestamp.millisecondsSinceEpoch},
      "${SagaseDictionaryConstants.backupMyDictionaryListVocab}": ${(vocabLinks.map((e) => e.id).toSet()..addAll(vocab)).toList()},
      "${SagaseDictionaryConstants.backupMyDictionaryListKanji}": ${(kanjiLinks.map((e) => e.kanji.codeUnitAt(0)).toSet()..addAll(kanji)).toList()}
}''';
  }

  static MyDictionaryList fromBackupJson(
    Map<String, dynamic> map,
    int version,
  ) {
    if (version <= 11) {
      return MyDictionaryList()
        ..id = map[SagaseDictionaryConstants.backupMyDictionaryListId]
        ..name = map[SagaseDictionaryConstants.backupMyDictionaryListName]
        ..timestamp = DateTime.fromMillisecondsSinceEpoch(
            map[SagaseDictionaryConstants.backupMyDictionaryListTimestamp])
        ..vocab = map[SagaseDictionaryConstants.backupMyDictionaryListVocab]
            .cast<int>()
        ..kanji = map[SagaseDictionaryConstants.backupMyDictionaryListKanji]
            .map((e) => e.codeUnitAt(0))
            .toList()
            .cast<int>();
    } else {
      return MyDictionaryList()
        ..id = map[SagaseDictionaryConstants.backupMyDictionaryListId]
        ..name = map[SagaseDictionaryConstants.backupMyDictionaryListName]
        ..timestamp = DateTime.fromMillisecondsSinceEpoch(
            map[SagaseDictionaryConstants.backupMyDictionaryListTimestamp])
        ..vocab = map[SagaseDictionaryConstants.backupMyDictionaryListVocab]
            .cast<int>()
        ..kanji = map[SagaseDictionaryConstants.backupMyDictionaryListKanji]
            .cast<int>();
    }
  }
}
