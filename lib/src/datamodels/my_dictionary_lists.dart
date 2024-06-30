import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:sagase_dictionary/src/datamodels/dictionary_list.dart';
import 'package:sagase_dictionary/src/utils/constants.dart';

@UseRowClass(MyDictionaryList)
class MyDictionaryLists extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().check(name.length.isBiggerThan(Constant(0)))();
  DateTimeColumn get timestamp => dateTime().withDefault(currentDateAndTime)();
}

class MyDictionaryList extends DictionaryList {
  final DateTime timestamp;

  MyDictionaryList({
    required super.id,
    required super.name,
    required this.timestamp,
    // Lists included for convenience while importing/exporting
    super.vocab = const [],
    super.kanji = const [],
  });

  MyDictionaryList copyWith({
    int? id,
    String? name,
    DateTime? timestamp,
    List<int>? vocab,
    List<int>? kanji,
  }) {
    return MyDictionaryList(
      id: id ?? this.id,
      name: name ?? this.name,
      timestamp: timestamp ?? this.timestamp,
      vocab: vocab ?? this.vocab,
      kanji: kanji ?? this.kanji,
    );
  }

  String toBackupJson() {
    return jsonEncode(
      {
        SagaseDictionaryConstants.backupMyDictionaryListId: id,
        SagaseDictionaryConstants.backupMyDictionaryListName: name,
        SagaseDictionaryConstants.backupMyDictionaryListTimestamp:
            timestamp.millisecondsSinceEpoch,
        SagaseDictionaryConstants.backupMyDictionaryListVocab: vocab,
        SagaseDictionaryConstants.backupMyDictionaryListKanji: kanji,
      },
    );
  }

  static MyDictionaryList fromBackupJson(String json) {
    final map = jsonDecode(json);

    return MyDictionaryList(
      id: map[SagaseDictionaryConstants.backupMyDictionaryListId],
      name: map[SagaseDictionaryConstants.backupMyDictionaryListName],
      timestamp: DateTime.fromMillisecondsSinceEpoch(
          map[SagaseDictionaryConstants.backupMyDictionaryListTimestamp]),
      vocab: map[SagaseDictionaryConstants.backupMyDictionaryListVocab]
          .cast<int>(),
      kanji: map[SagaseDictionaryConstants.backupMyDictionaryListKanji]
          .cast<int>(),
    );
  }

  String toShareJson() {
    return jsonEncode(
      {
        SagaseDictionaryConstants.exportType:
            SagaseDictionaryConstants.exportTypeMyList,
        SagaseDictionaryConstants.exportMyListName: name,
        SagaseDictionaryConstants.exportMyListVocab: vocab,
        SagaseDictionaryConstants.exportMyListKanji: kanji,
      },
    );
  }

  static MyDictionaryList? fromShareJson(String json) {
    final map = jsonDecode(json);

    // Verify contents
    if (map[SagaseDictionaryConstants.exportType] !=
            SagaseDictionaryConstants.exportTypeMyList ||
        map[SagaseDictionaryConstants.exportMyListName] == null ||
        map[SagaseDictionaryConstants.exportMyListVocab] == null ||
        map[SagaseDictionaryConstants.exportMyListKanji] == null) {
      return null;
    }

    // ID from imports does not matter, should generate a new one
    return MyDictionaryList(
      id: 0,
      name: map[SagaseDictionaryConstants.exportMyListName],
      timestamp: DateTime.now(),
      vocab: map[SagaseDictionaryConstants.exportMyListVocab].cast<int>(),
      kanji: map[SagaseDictionaryConstants.exportMyListKanji].cast<int>(),
    );
  }
}

@TableIndex(name: 'IX_my_dictionary_list_items_list_id', columns: {#listId})
class MyDictionaryListItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get listId => integer()();
  IntColumn get vocabId => integer().customConstraint(
      'NOT NULL DEFAULT 0 CHECK( IIF(vocab_id = 0, 1, 0) + IIF(kanji_id = 0, 1, 0) = 1 )')();
  IntColumn get kanjiId => integer().customConstraint(
      'NOT NULL DEFAULT 0 CHECK( IIF(vocab_id = 0, 1, 0) + IIF(kanji_id = 0, 1, 0) = 1 )')();

  @override
  List<Set<Column>> get uniqueKeys => [
        {listId, vocabId, kanjiId},
      ];
}
