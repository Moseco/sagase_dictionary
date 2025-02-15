import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:sagase_dictionary/sagase_dictionary.dart';

@UseRowClass(VocabNote)
class VocabNotes extends Table {
  IntColumn get id => integer()();
  TextColumn get note => text()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class VocabNote implements Insertable<VocabNote> {
  final int id;
  final String note;

  VocabNote({required this.id, required this.note});

  String toBackupJson() {
    return jsonEncode({
      SagaseDictionaryConstants.backupVocabNoteId: id,
      SagaseDictionaryConstants.backupVocabNoteNote: note,
    });
  }

  static VocabNote fromBackupJson(Map<String, dynamic> map) {
    return VocabNote(
      id: map[SagaseDictionaryConstants.backupVocabNoteId],
      note: map[SagaseDictionaryConstants.backupVocabNoteNote],
    );
  }

  @override
  Map<String, Expression<Object>> toColumns(bool nullToAbsent) {
    return VocabNotesCompanion(
      id: Value(id),
      note: Value(note),
    ).toColumns(nullToAbsent);
  }
}
