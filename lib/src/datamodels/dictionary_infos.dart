import 'package:drift/drift.dart';

class DictionaryInfos extends Table {
  IntColumn get id => integer().withDefault(const Constant(0))();
  IntColumn get version => integer()();
}
