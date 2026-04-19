import 'package:drift/drift.dart';
import 'package:sagase_dictionary/src/dao/dictionary_infos_dao.dart';
import 'package:sagase_dictionary/src/dao/flashcard_sets_dao.dart';
import 'package:sagase_dictionary/src/dao/grammars_dao.dart';
import 'package:sagase_dictionary/src/dao/kanjis_dao.dart';
import 'package:sagase_dictionary/src/dao/my_dictionary_lists_dao.dart';
import 'package:sagase_dictionary/src/dao/predefined_dictionary_lists_dao.dart';
import 'package:sagase_dictionary/src/dao/proper_nouns_dao.dart';
import 'package:sagase_dictionary/src/dao/radicals_dao.dart';
import 'package:sagase_dictionary/src/dao/search_history_items_dao.dart';
import 'package:sagase_dictionary/src/dao/spaced_repetition_datas_dao.dart';
import 'package:sagase_dictionary/src/dao/text_analysis_history_items_dao.dart';
import 'package:sagase_dictionary/src/dao/vocabs_dao.dart';
import 'package:sagase_dictionary/src/database.steps.dart';
import 'package:sagase_dictionary/src/datamodels/dictionary_infos.dart';
import 'package:sagase_dictionary/src/datamodels/flashcard_sets.dart';
import 'package:sagase_dictionary/src/datamodels/grammars.dart';
import 'package:sagase_dictionary/src/datamodels/kanji/kanji_notes.dart';
import 'package:sagase_dictionary/src/datamodels/kanji_component_connections.dart';
import 'package:sagase_dictionary/src/datamodels/kanjis.dart';
import 'package:sagase_dictionary/src/datamodels/my_dictionary_lists.dart';
import 'package:sagase_dictionary/src/datamodels/predefined_dictionary_lists.dart';
import 'package:sagase_dictionary/src/datamodels/proper_nouns.dart';
import 'package:sagase_dictionary/src/datamodels/radicals.dart';
import 'package:sagase_dictionary/src/datamodels/search_history_items.dart';
import 'package:sagase_dictionary/src/datamodels/spaced_repetition_datas.dart';
import 'package:sagase_dictionary/src/datamodels/text_analysis_history_items.dart';
import 'package:sagase_dictionary/src/datamodels/vocab/vocab_notes.dart';
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
    FlashcardSetReports,
    Grammars,
    Kanjis,
    KanjiReadings,
    KanjiMeaningWords,
    KanjiNotes,
    KanjiComponentConnections,
    MyDictionaryLists,
    MyDictionaryListItems,
    PredefinedDictionaryLists,
    ProperNouns,
    ProperNounRomajiWords,
    Radicals,
    SearchHistoryItems,
    SpacedRepetitionDatas,
    TextAnalysisHistoryItems,
    Vocabs,
    VocabWritings,
    VocabReadings,
    VocabDefinitions,
    VocabDefinitionWords,
    VocabNotes,
  ],
  include: {
    'datamodels/kanjis.drift',
    'datamodels/proper_nouns.drift',
    'datamodels/vocabs.drift',
  },
  daos: [
    DictionaryInfosDao,
    FlashcardSetsDao,
    GrammarsDao,
    KanjisDao,
    MyDictionaryListsDao,
    PredefinedDictionaryListsDao,
    ProperNounsDao,
    RadicalsDao,
    SearchHistoryItemsDao,
    SpacedRepetitionDatasDao,
    TextAnalysisHistoryItemsDao,
    VocabsDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? queryExecutor])
      : super(queryExecutor ?? NativeDatabase.memory());

  @override
  int get schemaVersion => 5;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onUpgrade: stepByStep(
        from1To2: (m, schema) async {
          await m.addColumn(
              schema.flashcardSets, schema.flashcardSets.showNote);
          await m.createTable(schema.vocabNotes);
          await m.createTable(schema.kanjiNotes);
        },
        from2To3: (m, schema) async {
          await m.addColumn(
              schema.vocabWritings, schema.vocabWritings.primaryPair);
          await m.addColumn(
              schema.vocabReadings, schema.vocabReadings.primaryPair);
        },
        from3To4: (m, schema) async {
          await m.alterTable(
            TableMigration(
              schema.spacedRepetitionDatas,
              columnTransformer: {
                schema.spacedRepetitionDatas.itemId:
                    schema.spacedRepetitionDatas.vocabId +
                        schema.spacedRepetitionDatas.kanjiId,
                schema.spacedRepetitionDatas.itemType:
                    schema.spacedRepetitionDatas.vocabId.caseMatch(
                  when: {
                    const Constant(0): Constant(DictionaryItemType.kanji.index),
                  },
                  orElse: Constant(DictionaryItemType.vocab.index),
                )
              },
            ),
          );

          await m.alterTable(
            TableMigration(
              schema.myDictionaryListItems,
              columnTransformer: {
                schema.myDictionaryListItems.itemId:
                    schema.myDictionaryListItems.vocabId +
                        schema.myDictionaryListItems.kanjiId,
                schema.myDictionaryListItems.itemType:
                    schema.myDictionaryListItems.vocabId.caseMatch(
                  when: {
                    const Constant(0): Constant(DictionaryItemType.kanji.index),
                  },
                  orElse: Constant(DictionaryItemType.vocab.index),
                )
              },
            ),
          );
        },
        from4To5: (m, schema) async {
          await m.drop(Index('IX_spaced_repetition_datas_vocab_id', ''));
          await m.drop(Index('IX_spaced_repetition_datas_kanji_id', ''));
          await m.alterTable(TableMigration(schema.spacedRepetitionDatas));

          await m.drop(Index('IX_my_dictionary_list_items_vocab_id', ''));
          await m.drop(Index('IX_my_dictionary_list_items_kanji_id', ''));
          await m.alterTable(TableMigration(schema.myDictionaryListItems));
          await m.createIndex(Index('IX_my_dictionary_list_items_item_id_type',
              'CREATE INDEX IX_my_dictionary_list_items_item_id_type ON my_dictionary_list_items (item_id, item_type)'));

          await m.createTable(schema.grammars);
          await m.createTable(schema.kanjiComponentConnections);

          await m.alterTable(
            TableMigration(
              schema.predefinedDictionaryLists,
              columnTransformer: {
                schema.predefinedDictionaryLists.grammar: const Constant('[]'),
              },
              newColumns: [schema.predefinedDictionaryLists.grammar],
            ),
          );
        },
      ),
    );
  }
}
