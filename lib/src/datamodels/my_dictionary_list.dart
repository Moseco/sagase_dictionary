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

  String toBackupJson() {
    return '''{
      "${SagaseDictionaryConstants.backupMyDictionaryListId}": $id,
      "${SagaseDictionaryConstants.backupMyDictionaryListName}": "$name",
      "${SagaseDictionaryConstants.backupMyDictionaryListTimestamp}": ${timestamp.millisecondsSinceEpoch},
      "${SagaseDictionaryConstants.backupMyDictionaryListVocab}": ${vocabLinks.map((e) => e.id).toList()},
      "${SagaseDictionaryConstants.backupMyDictionaryListKanji}": ${kanjiLinks.map((e) => '"${e.kanji}"').toList()}
}''';
  }

  // IsarLinks must be added manually afterwards
  static MyDictionaryList fromBackupJson(Map<String, dynamic> map) {
    return MyDictionaryList()
      ..id = map[SagaseDictionaryConstants.backupMyDictionaryListId]
      ..name = map[SagaseDictionaryConstants.backupMyDictionaryListName]
      ..timestamp = DateTime.fromMillisecondsSinceEpoch(
          map[SagaseDictionaryConstants.backupMyDictionaryListTimestamp]);
  }
}
