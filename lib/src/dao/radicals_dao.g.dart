// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radicals_dao.dart';

// ignore_for_file: type=lint
mixin _$RadicalsDaoMixin on DatabaseAccessor<AppDatabase> {
  $RadicalsTable get radicals => attachedDatabase.radicals;
  RadicalsDaoManager get managers => RadicalsDaoManager(this);
}

class RadicalsDaoManager {
  final _$RadicalsDaoMixin _db;
  RadicalsDaoManager(this._db);
  $$RadicalsTableTableManager get radicals =>
      $$RadicalsTableTableManager(_db.attachedDatabase, _db.radicals);
}
