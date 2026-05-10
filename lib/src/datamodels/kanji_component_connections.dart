import 'package:drift/drift.dart';

class KanjiComponentConnections extends Table {
  IntColumn get kanjiCodePoint => integer()();
  IntColumn get componentCodePoint => integer()();

  @override
  Set<Column<Object>> get primaryKey => {componentCodePoint, kanjiCodePoint};
}
