import 'package:drift/drift.dart';

@TableIndex(
  name: 'IX_kanji_component_connections_kanji',
  columns: {#kanjiCodePoint},
)
class KanjiComponentConnections extends Table {
  IntColumn get kanjiCodePoint => integer()();
  IntColumn get componentCodePoint => integer()();

  @override
  Set<Column<Object>> get primaryKey => {componentCodePoint, kanjiCodePoint};
}
