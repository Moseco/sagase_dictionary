import 'package:drift/drift.dart';
import 'package:sagase_dictionary/src/dao/dictionary_infos_dao.dart';
import 'package:sagase_dictionary/src/dao/flashcard_sets_dao.dart';
import 'package:sagase_dictionary/src/dao/kanjis_dao.dart';
import 'package:sagase_dictionary/src/dao/my_dictionary_lists_dao.dart';
import 'package:sagase_dictionary/src/dao/predefined_dictionary_lists_dao.dart';
import 'package:sagase_dictionary/src/dao/radicals_dao.dart';
import 'package:sagase_dictionary/src/dao/search_history_items_dao.dart';
import 'package:sagase_dictionary/src/dao/spaced_repetition_datas_dao.dart';
import 'package:sagase_dictionary/src/dao/vocabs_dao.dart';
import 'package:sagase_dictionary/src/datamodels/dictionary_infos.dart';
import 'package:sagase_dictionary/src/datamodels/flashcard_sets.dart';
import 'package:sagase_dictionary/src/datamodels/kanjis.dart';
import 'package:sagase_dictionary/src/datamodels/my_dictionary_lists.dart';
import 'package:sagase_dictionary/src/datamodels/predefined_dictionary_lists.dart';
import 'package:sagase_dictionary/src/datamodels/radicals.dart';
import 'package:sagase_dictionary/src/datamodels/search_history_items.dart';
import 'package:sagase_dictionary/src/datamodels/spaced_repetition_datas.dart';
import 'package:sagase_dictionary/src/datamodels/vocabs.dart';
import 'package:drift/native.dart';
// Start imports required for the generated database.g.dart
import 'package:sagase_dictionary/src/utils/converters.dart';
import 'package:sagase_dictionary/src/utils/enums.dart';
// end imports required for the generated database.g.dart

part 'database.g.dart';

@DriftDatabase(
  tables: [
    DictionaryInfos,
    FlashcardSets,
    Kanjis,
    KanjiReadings,
    KanjiMeaningWords,
    MyDictionaryLists,
    MyDictionaryListItems,
    PredefinedDictionaryLists,
    Radicals,
    SearchHistoryItems,
    SpacedRepetitionDatas,
    Vocabs,
    VocabWritings,
    VocabReadings,
    VocabDefinitions,
    VocabDefinitionWords,
  ],
  include: {
    'datamodels/kanjis.drift',
    'datamodels/my_dictionary_lists.drift',
    'datamodels/spaced_repetition_datas.drift',
    'datamodels/vocabs.drift',
  },
  daos: [
    DictionaryInfosDao,
    FlashcardSetsDao,
    KanjisDao,
    MyDictionaryListsDao,
    PredefinedDictionaryListsDao,
    RadicalsDao,
    SearchHistoryItemsDao,
    SpacedRepetitionDatasDao,
    VocabsDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? queryExecutor])
      : super(queryExecutor ?? NativeDatabase.memory());

  @override
  int get schemaVersion => 1;
}
