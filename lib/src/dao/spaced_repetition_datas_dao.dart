import 'package:drift/drift.dart';
import 'package:sagase_dictionary/src/database.dart';
import 'package:sagase_dictionary/src/datamodels/dictionary_item.dart';
import 'package:sagase_dictionary/src/datamodels/spaced_repetition_datas.dart';
import 'package:sagase_dictionary/src/datamodels/vocabs.dart';
import 'package:sagase_dictionary/src/utils/enums.dart';

part 'spaced_repetition_datas_dao.g.dart';

@DriftAccessor(tables: [SpacedRepetitionDatas])
class SpacedRepetitionDatasDao extends DatabaseAccessor<AppDatabase>
    with _$SpacedRepetitionDatasDaoMixin {
  SpacedRepetitionDatasDao(super.db);

  Future<void> set(SpacedRepetitionData spacedRepetitionData) async {
    await db
        .into(db.spacedRepetitionDatas)
        .insert(spacedRepetitionData, mode: InsertMode.insertOrReplace);
  }

  Future<void> deleteSpacedRepetitionData(
    DictionaryItem dictionaryItem,
    FrontType frontType,
  ) async {
    await (db.delete(db.spacedRepetitionDatas)
          ..where((data) => Expression.and([
                dictionaryItem is Vocab
                    ? data.vocabId.equalsNullable(dictionaryItem.id)
                    : data.kanjiId.equalsNullable(dictionaryItem.id),
                data.frontType.equals(frontType.index),
              ])))
        .go();
  }

  Future<List<SpacedRepetitionData>> getAll() async {
    return db.select(db.spacedRepetitionDatas).get();
  }

  Future<void> deleteAll() async {
    await db.delete(db.spacedRepetitionDatas).go();
  }
}
