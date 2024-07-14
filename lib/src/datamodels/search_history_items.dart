import 'package:drift/drift.dart';

class SearchHistoryItems extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get searchText => text()();

  DateTimeColumn get timestamp => dateTime().withDefault(currentDateAndTime)();
}
