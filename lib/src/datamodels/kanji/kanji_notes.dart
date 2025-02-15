import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:sagase_dictionary/sagase_dictionary.dart';

@UseRowClass(KanjiNote)
class KanjiNotes extends Table {
  IntColumn get id => integer()();
  TextColumn get note => text()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class KanjiNote implements Insertable<KanjiNote> {
  final int id;
  final String note;

  KanjiNote({required this.id, required this.note});

  String toBackupJson() {
    return jsonEncode({
      SagaseDictionaryConstants.backupKanjiNoteId: id,
      SagaseDictionaryConstants.backupKanjiNoteNote: note,
    });
  }

  static KanjiNote fromBackupJson(Map<String, dynamic> map) {
    return KanjiNote(
      id: map[SagaseDictionaryConstants.backupKanjiNoteId],
      note: map[SagaseDictionaryConstants.backupKanjiNoteNote],
    );
  }

  @override
  Map<String, Expression<Object>> toColumns(bool nullToAbsent) {
    return KanjiNotesCompanion(
      id: Value(id),
      note: Value(note),
    ).toColumns(nullToAbsent);
  }
}
