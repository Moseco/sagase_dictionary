import 'package:drift/drift.dart';
import 'package:sagase_dictionary/src/database.dart';
import 'package:sagase_dictionary/src/datamodels/flashcard_sets.dart';
import 'package:sagase_dictionary/src/datamodels/my_dictionary_lists.dart';
import 'package:sagase_dictionary/src/utils/string_utils.dart';

part 'flashcard_sets_dao.g.dart';

@DriftAccessor(tables: [FlashcardSets, FlashcardSetLogs])
class FlashcardSetsDao extends DatabaseAccessor<AppDatabase>
    with _$FlashcardSetsDaoMixin {
  FlashcardSetsDao(super.db);

  Future<FlashcardSet> create(String name) async {
    String sanitizedName = name.sanitizeName();
    if (sanitizedName.isEmpty) sanitizedName = 'New flashcard set';

    int id = await db.into(db.flashcardSets).insert(
          FlashcardSetsCompanion(
            name: Value(sanitizedName),
          ),
        );

    return (db.select(db.flashcardSets)..where((set) => set.id.equals(id)))
        .getSingle();
  }

  Future<void> setFlashcardSet(FlashcardSet flashcardSet) async {
    flashcardSet.name = flashcardSet.name.sanitizeName();
    if (flashcardSet.name.isEmpty) flashcardSet.name = 'Flashcard set';

    await db
        .into(db.flashcardSets)
        .insert(flashcardSet, mode: InsertMode.insertOrReplace);
  }

  Future<void> deleteFlashcardSet(FlashcardSet flashcardSet) async {
    await (db.delete(db.flashcardSets)
          ..where((set) => set.id.equals(flashcardSet.id)))
        .go();
  }

  Future<List<FlashcardSet>> getAll() async {
    return (db.select(db.flashcardSets)
          ..orderBy([(set) => OrderingTerm.desc(set.timestamp)]))
        .get();
  }

  Future<void> removeMyDictionaryList(MyDictionaryList myDictionaryList) async {
    final flashcardSets = await getAll();
    for (final flashcardSet in flashcardSets) {
      if (flashcardSet.myDictionaryLists.remove(myDictionaryList.id)) {
        await setFlashcardSet(flashcardSet);
      }
    }
  }

  Future<void> importBackup(String source) async {
    final flashcardSet = FlashcardSet.fromBackupJson(source);
    flashcardSet.name = flashcardSet.name.sanitizeName();
    if (flashcardSet.name.isEmpty) flashcardSet.name = 'Flashcard set';

    // Remove predefined dictionary lists that don't exist
    for (int i = 0; i < flashcardSet.predefinedDictionaryLists.length; i++) {
      if (!await db.predefinedDictionaryListsDao
          .exists(flashcardSet.predefinedDictionaryLists[i])) {
        flashcardSet.predefinedDictionaryLists.removeAt(i--);
      }
    }

    // Remove my dictionary lists that don't exist
    for (int i = 0; i < flashcardSet.myDictionaryLists.length; i++) {
      if (!await db.myDictionaryListsDao
          .exists(flashcardSet.myDictionaryLists[i])) {
        flashcardSet.myDictionaryLists.removeAt(i--);
      }
    }

    // Add flashcard set itself
    await setFlashcardSet(flashcardSet);
  }

  Future<FlashcardSetLog> createFlashcardSetLog(
    FlashcardSet flashcardSet,
    int date,
  ) async {
    int id = await db.into(db.flashcardSetLogs).insert(
          FlashcardSetLogsCompanion(
            flashcardSetId: Value(flashcardSet.id),
            date: Value(date),
          ),
        );

    return (db.select(db.flashcardSetLogs)
          ..where((stats) => stats.id.equals(id)))
        .getSingle();
  }

  Future<void> setFlashcardSetLog(FlashcardSetLog flashcardSetLog) async {
    await db
        .into(db.flashcardSetLogs)
        .insert(flashcardSetLog, mode: InsertMode.insertOrReplace);
  }

  Future<FlashcardSetLog?> getFlashcardSetLog(
    FlashcardSet flashcardSet,
    int date,
  ) async {
    return (db.select(db.flashcardSetLogs)
          ..where((stats) => Expression.and([
                stats.flashcardSetId.equals(flashcardSet.id),
                stats.date.equals(date),
              ])))
        .getSingleOrNull();
  }

  Future<List<FlashcardSetLog>> getFlashcardSetLogRange(
    FlashcardSet flashcardSet,
    int startDate,
    int endDate,
  ) async {
    return (db.select(db.flashcardSetLogs)
          ..where((stats) => Expression.and([
                stats.flashcardSetId.equals(flashcardSet.id),
                stats.date.isBiggerOrEqualValue(startDate),
                stats.date.isSmallerOrEqualValue(endDate),
              ]))
          ..orderBy([(stats) => OrderingTerm.desc(stats.date)]))
        .get();
  }

  Future<void> deleteFlashcardSetLogs(FlashcardSet flashcardSet) async {
    await (db.delete(db.flashcardSetLogs)
          ..where((stats) => stats.flashcardSetId.equals(flashcardSet.id)))
        .go();
  }

  Future<void> deleteAll() async {
    await db.delete(db.flashcardSets).go();
    await db.delete(db.flashcardSetLogs).go();
  }
}
