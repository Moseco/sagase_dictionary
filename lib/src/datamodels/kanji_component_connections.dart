import 'package:drift/drift.dart';

class KanjiComponentConnections extends Table {
  IntColumn get kanjiId => integer()();
  IntColumn get componentCodePoint => integer()();

  @override
  Set<Column<Object>> get primaryKey => {componentCodePoint, kanjiId};
}
