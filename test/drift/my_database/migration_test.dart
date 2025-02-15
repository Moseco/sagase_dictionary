// dart format width=80
// ignore_for_file: unused_local_variable, unused_import
import 'package:drift/drift.dart';
import 'package:drift_dev/api/migrations_native.dart';
import 'package:sagase_dictionary/src/database.dart';
import 'package:test/test.dart';
import 'generated/schema.dart';

import 'generated/schema_v1.dart' as v1;
import 'generated/schema_v2.dart' as v2;

void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
  late SchemaVerifier verifier;

  setUpAll(() {
    verifier = SchemaVerifier(GeneratedHelper());
  });

  group('simple database migrations', () {
    // These simple tests verify all possible schema updates with a simple (no
    // data) migration. This is a quick way to ensure that written database
    // migrations properly alter the schema.
    final versions = GeneratedHelper.versions;
    for (final (i, fromVersion) in versions.indexed) {
      group('from $fromVersion', () {
        for (final toVersion in versions.skip(i + 1)) {
          test('to $toVersion', () async {
            final schema = await verifier.schemaAt(fromVersion);
            final db = AppDatabase(schema.newConnection());
            await verifier.migrateAndValidate(db, toVersion);
            await db.close();
          });
        }
      });
    }
  });

  // The following template shows how to write tests ensuring your migrations
  // preserve existing data.
  // Testing this can be useful for migrations that change existing columns
  // (e.g. by alterating their type or constraints). Migrations that only add
  // tables or columns typically don't need these advanced tests. For more
  // information, see https://drift.simonbinder.eu/migrations/tests/#verifying-data-integrity
  // TODO: This generated template shows how these tests could be written. Adopt
  // it to your own needs when testing migrations with data integrity.
  test("migration from v1 to v2 does not corrupt data", () async {
    // Add data to insert into the old database, and the expected rows after the
    // migration.
    // TODO: Fill these lists
    final oldVocabWritingsData = <v1.VocabWritingsData>[];
    final expectedNewVocabWritingsData = <v2.VocabWritingsData>[];

    final oldVocabReadingsData = <v1.VocabReadingsData>[];
    final expectedNewVocabReadingsData = <v2.VocabReadingsData>[];

    final oldVocabsData = <v1.VocabsData>[];
    final expectedNewVocabsData = <v2.VocabsData>[];

    final oldVocabDefinitionsData = <v1.VocabDefinitionsData>[];
    final expectedNewVocabDefinitionsData = <v2.VocabDefinitionsData>[];

    final oldVocabDefinitionWordsData = <v1.VocabDefinitionWordsData>[];
    final expectedNewVocabDefinitionWordsData = <v2.VocabDefinitionWordsData>[];

    final oldKanjisData = <v1.KanjisData>[];
    final expectedNewKanjisData = <v2.KanjisData>[];

    final oldKanjiReadingsData = <v1.KanjiReadingsData>[];
    final expectedNewKanjiReadingsData = <v2.KanjiReadingsData>[];

    final oldKanjiMeaningWordsData = <v1.KanjiMeaningWordsData>[];
    final expectedNewKanjiMeaningWordsData = <v2.KanjiMeaningWordsData>[];

    final oldTextAnalysisHistoryItemsData = <v1.TextAnalysisHistoryItemsData>[];
    final expectedNewTextAnalysisHistoryItemsData =
        <v2.TextAnalysisHistoryItemsData>[];

    final oldSpacedRepetitionDatasData = <v1.SpacedRepetitionDatasData>[];
    final expectedNewSpacedRepetitionDatasData =
        <v2.SpacedRepetitionDatasData>[];

    final oldSearchHistoryItemsData = <v1.SearchHistoryItemsData>[];
    final expectedNewSearchHistoryItemsData = <v2.SearchHistoryItemsData>[];

    final oldRadicalsData = <v1.RadicalsData>[];
    final expectedNewRadicalsData = <v2.RadicalsData>[];

    final oldProperNounsData = <v1.ProperNounsData>[];
    final expectedNewProperNounsData = <v2.ProperNounsData>[];

    final oldProperNounRomajiWordsData = <v1.ProperNounRomajiWordsData>[];
    final expectedNewProperNounRomajiWordsData =
        <v2.ProperNounRomajiWordsData>[];

    final oldPredefinedDictionaryListsData =
        <v1.PredefinedDictionaryListsData>[];
    final expectedNewPredefinedDictionaryListsData =
        <v2.PredefinedDictionaryListsData>[];

    final oldMyDictionaryListsData = <v1.MyDictionaryListsData>[];
    final expectedNewMyDictionaryListsData = <v2.MyDictionaryListsData>[];

    final oldMyDictionaryListItemsData = <v1.MyDictionaryListItemsData>[];
    final expectedNewMyDictionaryListItemsData =
        <v2.MyDictionaryListItemsData>[];

    final oldFlashcardSetsData = <v1.FlashcardSetsData>[];
    final expectedNewFlashcardSetsData = <v2.FlashcardSetsData>[];

    final oldFlashcardSetReportsData = <v1.FlashcardSetReportsData>[];
    final expectedNewFlashcardSetReportsData = <v2.FlashcardSetReportsData>[];

    final oldDictionaryInfosData = <v1.DictionaryInfosData>[];
    final expectedNewDictionaryInfosData = <v2.DictionaryInfosData>[];

    await verifier.testWithDataIntegrity(
      oldVersion: 1,
      newVersion: 2,
      createOld: v1.DatabaseAtV1.new,
      createNew: v2.DatabaseAtV2.new,
      openTestedDatabase: AppDatabase.new,
      createItems: (batch, oldDb) {
        batch.insertAll(oldDb.vocabWritings, oldVocabWritingsData);
        batch.insertAll(oldDb.vocabReadings, oldVocabReadingsData);
        batch.insertAll(oldDb.vocabs, oldVocabsData);
        batch.insertAll(oldDb.vocabDefinitions, oldVocabDefinitionsData);
        batch.insertAll(
            oldDb.vocabDefinitionWords, oldVocabDefinitionWordsData);
        batch.insertAll(oldDb.kanjis, oldKanjisData);
        batch.insertAll(oldDb.kanjiReadings, oldKanjiReadingsData);
        batch.insertAll(oldDb.kanjiMeaningWords, oldKanjiMeaningWordsData);
        batch.insertAll(
            oldDb.textAnalysisHistoryItems, oldTextAnalysisHistoryItemsData);
        batch.insertAll(
            oldDb.spacedRepetitionDatas, oldSpacedRepetitionDatasData);
        batch.insertAll(oldDb.searchHistoryItems, oldSearchHistoryItemsData);
        batch.insertAll(oldDb.radicals, oldRadicalsData);
        batch.insertAll(oldDb.properNouns, oldProperNounsData);
        batch.insertAll(
            oldDb.properNounRomajiWords, oldProperNounRomajiWordsData);
        batch.insertAll(
            oldDb.predefinedDictionaryLists, oldPredefinedDictionaryListsData);
        batch.insertAll(oldDb.myDictionaryLists, oldMyDictionaryListsData);
        batch.insertAll(
            oldDb.myDictionaryListItems, oldMyDictionaryListItemsData);
        batch.insertAll(oldDb.flashcardSets, oldFlashcardSetsData);
        batch.insertAll(oldDb.flashcardSetReports, oldFlashcardSetReportsData);
        batch.insertAll(oldDb.dictionaryInfos, oldDictionaryInfosData);
      },
      validateItems: (newDb) async {
        expect(expectedNewVocabWritingsData,
            await newDb.select(newDb.vocabWritings).get());
        expect(expectedNewVocabReadingsData,
            await newDb.select(newDb.vocabReadings).get());
        expect(expectedNewVocabsData, await newDb.select(newDb.vocabs).get());
        expect(expectedNewVocabDefinitionsData,
            await newDb.select(newDb.vocabDefinitions).get());
        expect(expectedNewVocabDefinitionWordsData,
            await newDb.select(newDb.vocabDefinitionWords).get());
        expect(expectedNewKanjisData, await newDb.select(newDb.kanjis).get());
        expect(expectedNewKanjiReadingsData,
            await newDb.select(newDb.kanjiReadings).get());
        expect(expectedNewKanjiMeaningWordsData,
            await newDb.select(newDb.kanjiMeaningWords).get());
        expect(expectedNewTextAnalysisHistoryItemsData,
            await newDb.select(newDb.textAnalysisHistoryItems).get());
        expect(expectedNewSpacedRepetitionDatasData,
            await newDb.select(newDb.spacedRepetitionDatas).get());
        expect(expectedNewSearchHistoryItemsData,
            await newDb.select(newDb.searchHistoryItems).get());
        expect(
            expectedNewRadicalsData, await newDb.select(newDb.radicals).get());
        expect(expectedNewProperNounsData,
            await newDb.select(newDb.properNouns).get());
        expect(expectedNewProperNounRomajiWordsData,
            await newDb.select(newDb.properNounRomajiWords).get());
        expect(expectedNewPredefinedDictionaryListsData,
            await newDb.select(newDb.predefinedDictionaryLists).get());
        expect(expectedNewMyDictionaryListsData,
            await newDb.select(newDb.myDictionaryLists).get());
        expect(expectedNewMyDictionaryListItemsData,
            await newDb.select(newDb.myDictionaryListItems).get());
        expect(expectedNewFlashcardSetsData,
            await newDb.select(newDb.flashcardSets).get());
        expect(expectedNewFlashcardSetReportsData,
            await newDb.select(newDb.flashcardSetReports).get());
        expect(expectedNewDictionaryInfosData,
            await newDb.select(newDb.dictionaryInfos).get());
      },
    );
  });
}
