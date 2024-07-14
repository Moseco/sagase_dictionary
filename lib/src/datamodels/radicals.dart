import 'package:drift/drift.dart' hide Index;
import 'package:sagase_dictionary/src/utils/converters.dart';
import 'package:sagase_dictionary/src/utils/enums.dart';

@TableIndex(name: 'UK_radicals_radical', columns: {#radical}, unique: true)
class Radicals extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get radical => text()();
  IntColumn get kangxiId => integer().nullable()();
  IntColumn get strokeCount => integer()();
  TextColumn get meaning => text()();
  TextColumn get reading => text()();
  IntColumn get position => intEnum<RadicalPosition>().nullable()();
  IntColumn get importance => intEnum<RadicalImportance>().nullable()();
  TextColumn get strokes =>
      text().map(const StringListConverter()).nullable()();
  TextColumn get variants =>
      text().map(const StringListConverter()).nullable()();
  TextColumn get variantOf => text().nullable()();
}
