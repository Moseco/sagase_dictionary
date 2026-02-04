// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_analysis_history_items_dao.dart';

// ignore_for_file: type=lint
mixin _$TextAnalysisHistoryItemsDaoMixin on DatabaseAccessor<AppDatabase> {
  $TextAnalysisHistoryItemsTable get textAnalysisHistoryItems =>
      attachedDatabase.textAnalysisHistoryItems;
  TextAnalysisHistoryItemsDaoManager get managers =>
      TextAnalysisHistoryItemsDaoManager(this);
}

class TextAnalysisHistoryItemsDaoManager {
  final _$TextAnalysisHistoryItemsDaoMixin _db;
  TextAnalysisHistoryItemsDaoManager(this._db);
  $$TextAnalysisHistoryItemsTableTableManager get textAnalysisHistoryItems =>
      $$TextAnalysisHistoryItemsTableTableManager(
          _db.attachedDatabase, _db.textAnalysisHistoryItems);
}
