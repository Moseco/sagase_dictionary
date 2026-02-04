// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_history_items_dao.dart';

// ignore_for_file: type=lint
mixin _$SearchHistoryItemsDaoMixin on DatabaseAccessor<AppDatabase> {
  $SearchHistoryItemsTable get searchHistoryItems =>
      attachedDatabase.searchHistoryItems;
  SearchHistoryItemsDaoManager get managers =>
      SearchHistoryItemsDaoManager(this);
}

class SearchHistoryItemsDaoManager {
  final _$SearchHistoryItemsDaoMixin _db;
  SearchHistoryItemsDaoManager(this._db);
  $$SearchHistoryItemsTableTableManager get searchHistoryItems =>
      $$SearchHistoryItemsTableTableManager(
          _db.attachedDatabase, _db.searchHistoryItems);
}
