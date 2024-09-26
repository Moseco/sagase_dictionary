import 'package:drift/drift.dart';
import 'package:sagase_dictionary/src/database.dart';
import 'package:sagase_dictionary/src/datamodels/flashcard_sets.dart';
import 'package:sagase_dictionary/src/datamodels/my_dictionary_lists.dart';
import 'package:sagase_dictionary/src/utils/string_utils.dart';

part 'flashcard_sets_dao.g.dart';

@DriftAccessor(tables: [FlashcardSets, FlashcardSetReports])
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

  Future<FlashcardSetReport> createFlashcardSetReport(
    FlashcardSet flashcardSet,
    int date,
  ) async {
    int id = await db.into(db.flashcardSetReports).insert(
          FlashcardSetReportsCompanion(
            flashcardSetId: Value(flashcardSet.id),
            date: Value(date),
          ),
        );

    return (db.select(db.flashcardSetReports)
          ..where((report) => report.id.equals(id)))
        .getSingle();
  }

  Future<void> setFlashcardSetReport(
    FlashcardSetReport flashcardSetReport,
  ) async {
    await db
        .into(db.flashcardSetReports)
        .insert(flashcardSetReport, mode: InsertMode.insertOrReplace);
  }

  Future<FlashcardSetReport?> getFlashcardSetReport(
    FlashcardSet flashcardSet,
    int date,
  ) async {
    return (db.select(db.flashcardSetReports)
          ..where((report) => Expression.and([
                report.flashcardSetId.equals(flashcardSet.id),
                report.date.equals(date),
              ])))
        .getSingleOrNull();
  }

  Future<FlashcardSetReport?> getRecentFlashcardSetReport(
    FlashcardSet flashcardSet,
  ) async {
    return (db.select(db.flashcardSetReports)
          ..orderBy([(report) => OrderingTerm.desc(report.date)])
          ..limit(1))
        .getSingleOrNull();
  }

  Future<List<FlashcardSetReport>> getAllFlashcardSetReports() async {
    return db.select(db.flashcardSetReports).get();
  }

  Future<List<FlashcardSetReport>> getFlashcardSetReportRange(
    FlashcardSet flashcardSet,
    int startDate,
    int endDate,
  ) async {
    return (db.select(db.flashcardSetReports)
          ..where((report) => Expression.and([
                report.flashcardSetId.equals(flashcardSet.id),
                report.date.isBiggerOrEqualValue(startDate),
                report.date.isSmallerOrEqualValue(endDate),
              ]))
          ..orderBy([(report) => OrderingTerm.asc(report.date)]))
        .get();
  }

  Future<void> deleteFlashcardSetReports(FlashcardSet flashcardSet) async {
    await (db.delete(db.flashcardSetReports)
          ..where((report) => report.flashcardSetId.equals(flashcardSet.id)))
        .go();
  }

  Future<void> deleteAll() async {
    await db.delete(db.flashcardSets).go();
    await db.delete(db.flashcardSetReports).go();
  }
}
