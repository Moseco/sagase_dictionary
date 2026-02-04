// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flashcard_sets_dao.dart';

// ignore_for_file: type=lint
mixin _$FlashcardSetsDaoMixin on DatabaseAccessor<AppDatabase> {
  $FlashcardSetsTable get flashcardSets => attachedDatabase.flashcardSets;
  $FlashcardSetReportsTable get flashcardSetReports =>
      attachedDatabase.flashcardSetReports;
  FlashcardSetsDaoManager get managers => FlashcardSetsDaoManager(this);
}

class FlashcardSetsDaoManager {
  final _$FlashcardSetsDaoMixin _db;
  FlashcardSetsDaoManager(this._db);
  $$FlashcardSetsTableTableManager get flashcardSets =>
      $$FlashcardSetsTableTableManager(_db.attachedDatabase, _db.flashcardSets);
  $$FlashcardSetReportsTableTableManager get flashcardSetReports =>
      $$FlashcardSetReportsTableTableManager(
          _db.attachedDatabase, _db.flashcardSetReports);
}
