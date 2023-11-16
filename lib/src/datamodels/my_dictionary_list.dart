import 'package:isar/isar.dart';
import 'package:sagase_dictionary/src/datamodels/dictionary_list.dart';
import 'package:sagase_dictionary/src/utils/constants.dart';
import 'package:sagase_dictionary/src/utils/string_utils.dart';

part 'my_dictionary_list.g.dart';

@Collection()
class MyDictionaryList extends DictionaryList {
  late DateTime timestamp;

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
      "${SagaseDictionaryConstants.backupMyDictionaryListVocab}": $vocab,
      "${SagaseDictionaryConstants.backupMyDictionaryListKanji}": $kanji
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
            .map((e) => (e as String).kanjiCodePoint())
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
