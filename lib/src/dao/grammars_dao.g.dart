// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grammars_dao.dart';

// ignore_for_file: type=lint
mixin _$GrammarsDaoMixin on DatabaseAccessor<AppDatabase> {
  $GrammarsTable get grammars => attachedDatabase.grammars;
  GrammarsDaoManager get managers => GrammarsDaoManager(this);
}

class GrammarsDaoManager {
  final _$GrammarsDaoMixin _db;
  GrammarsDaoManager(this._db);
  $$GrammarsTableTableManager get grammars =>
      $$GrammarsTableTableManager(_db.attachedDatabase, _db.grammars);
}
