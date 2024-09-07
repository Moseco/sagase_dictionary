import 'package:drift/drift.dart';

class TextAnalysisHistoryItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get analysisText => text()();
}
