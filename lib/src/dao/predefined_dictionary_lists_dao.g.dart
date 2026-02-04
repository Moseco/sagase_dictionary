// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'predefined_dictionary_lists_dao.dart';

// ignore_for_file: type=lint
mixin _$PredefinedDictionaryListsDaoMixin on DatabaseAccessor<AppDatabase> {
  $PredefinedDictionaryListsTable get predefinedDictionaryLists =>
      attachedDatabase.predefinedDictionaryLists;
  PredefinedDictionaryListsDaoManager get managers =>
      PredefinedDictionaryListsDaoManager(this);
}

class PredefinedDictionaryListsDaoManager {
  final _$PredefinedDictionaryListsDaoMixin _db;
  PredefinedDictionaryListsDaoManager(this._db);
  $$PredefinedDictionaryListsTableTableManager get predefinedDictionaryLists =>
      $$PredefinedDictionaryListsTableTableManager(
          _db.attachedDatabase, _db.predefinedDictionaryLists);
}
