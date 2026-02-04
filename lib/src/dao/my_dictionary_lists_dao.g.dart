// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_dictionary_lists_dao.dart';

// ignore_for_file: type=lint
mixin _$MyDictionaryListsDaoMixin on DatabaseAccessor<AppDatabase> {
  $MyDictionaryListsTable get myDictionaryLists =>
      attachedDatabase.myDictionaryLists;
  $MyDictionaryListItemsTable get myDictionaryListItems =>
      attachedDatabase.myDictionaryListItems;
  MyDictionaryListsDaoManager get managers => MyDictionaryListsDaoManager(this);
}

class MyDictionaryListsDaoManager {
  final _$MyDictionaryListsDaoMixin _db;
  MyDictionaryListsDaoManager(this._db);
  $$MyDictionaryListsTableTableManager get myDictionaryLists =>
      $$MyDictionaryListsTableTableManager(
          _db.attachedDatabase, _db.myDictionaryLists);
  $$MyDictionaryListItemsTableTableManager get myDictionaryListItems =>
      $$MyDictionaryListItemsTableTableManager(
          _db.attachedDatabase, _db.myDictionaryListItems);
}
