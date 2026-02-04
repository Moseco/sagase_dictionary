// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dictionary_infos_dao.dart';

// ignore_for_file: type=lint
mixin _$DictionaryInfosDaoMixin on DatabaseAccessor<AppDatabase> {
  $DictionaryInfosTable get dictionaryInfos => attachedDatabase.dictionaryInfos;
  DictionaryInfosDaoManager get managers => DictionaryInfosDaoManager(this);
}

class DictionaryInfosDaoManager {
  final _$DictionaryInfosDaoMixin _db;
  DictionaryInfosDaoManager(this._db);
  $$DictionaryInfosTableTableManager get dictionaryInfos =>
      $$DictionaryInfosTableTableManager(
          _db.attachedDatabase, _db.dictionaryInfos);
}
