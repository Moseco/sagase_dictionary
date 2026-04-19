// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kanjis_dao.dart';

// ignore_for_file: type=lint
mixin _$KanjisDaoMixin on DatabaseAccessor<AppDatabase> {
  $KanjisTable get kanjis => attachedDatabase.kanjis;
  $KanjiReadingsTable get kanjiReadings => attachedDatabase.kanjiReadings;
  $SpacedRepetitionDatasTable get spacedRepetitionDatas =>
      attachedDatabase.spacedRepetitionDatas;
  $KanjiComponentConnectionsTable get kanjiComponentConnections =>
      attachedDatabase.kanjiComponentConnections;
  KanjisDaoManager get managers => KanjisDaoManager(this);
}

class KanjisDaoManager {
  final _$KanjisDaoMixin _db;
  KanjisDaoManager(this._db);
  $$KanjisTableTableManager get kanjis =>
      $$KanjisTableTableManager(_db.attachedDatabase, _db.kanjis);
  $$KanjiReadingsTableTableManager get kanjiReadings =>
      $$KanjiReadingsTableTableManager(_db.attachedDatabase, _db.kanjiReadings);
  $$SpacedRepetitionDatasTableTableManager get spacedRepetitionDatas =>
      $$SpacedRepetitionDatasTableTableManager(
          _db.attachedDatabase, _db.spacedRepetitionDatas);
  $$KanjiComponentConnectionsTableTableManager get kanjiComponentConnections =>
      $$KanjiComponentConnectionsTableTableManager(
          _db.attachedDatabase, _db.kanjiComponentConnections);
}
