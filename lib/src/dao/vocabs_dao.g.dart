// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vocabs_dao.dart';

// ignore_for_file: type=lint
mixin _$VocabsDaoMixin on DatabaseAccessor<AppDatabase> {
  $VocabsTable get vocabs => attachedDatabase.vocabs;
  $VocabWritingsTable get vocabWritings => attachedDatabase.vocabWritings;
  $VocabReadingsTable get vocabReadings => attachedDatabase.vocabReadings;
  $VocabDefinitionsTable get vocabDefinitions =>
      attachedDatabase.vocabDefinitions;
  VocabsDaoManager get managers => VocabsDaoManager(this);
}

class VocabsDaoManager {
  final _$VocabsDaoMixin _db;
  VocabsDaoManager(this._db);
  $$VocabsTableTableManager get vocabs =>
      $$VocabsTableTableManager(_db.attachedDatabase, _db.vocabs);
  $$VocabWritingsTableTableManager get vocabWritings =>
      $$VocabWritingsTableTableManager(_db.attachedDatabase, _db.vocabWritings);
  $$VocabReadingsTableTableManager get vocabReadings =>
      $$VocabReadingsTableTableManager(_db.attachedDatabase, _db.vocabReadings);
  $$VocabDefinitionsTableTableManager get vocabDefinitions =>
      $$VocabDefinitionsTableTableManager(
          _db.attachedDatabase, _db.vocabDefinitions);
}
