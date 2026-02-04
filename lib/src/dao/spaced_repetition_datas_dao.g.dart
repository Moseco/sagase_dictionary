// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spaced_repetition_datas_dao.dart';

// ignore_for_file: type=lint
mixin _$SpacedRepetitionDatasDaoMixin on DatabaseAccessor<AppDatabase> {
  $SpacedRepetitionDatasTable get spacedRepetitionDatas =>
      attachedDatabase.spacedRepetitionDatas;
  SpacedRepetitionDatasDaoManager get managers =>
      SpacedRepetitionDatasDaoManager(this);
}

class SpacedRepetitionDatasDaoManager {
  final _$SpacedRepetitionDatasDaoMixin _db;
  SpacedRepetitionDatasDaoManager(this._db);
  $$SpacedRepetitionDatasTableTableManager get spacedRepetitionDatas =>
      $$SpacedRepetitionDatasTableTableManager(
          _db.attachedDatabase, _db.spacedRepetitionDatas);
}
