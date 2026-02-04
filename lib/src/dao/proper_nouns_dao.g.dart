// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proper_nouns_dao.dart';

// ignore_for_file: type=lint
mixin _$ProperNounsDaoMixin on DatabaseAccessor<AppDatabase> {
  $ProperNounsTable get properNouns => attachedDatabase.properNouns;
  ProperNounsDaoManager get managers => ProperNounsDaoManager(this);
}

class ProperNounsDaoManager {
  final _$ProperNounsDaoMixin _db;
  ProperNounsDaoManager(this._db);
  $$ProperNounsTableTableManager get properNouns =>
      $$ProperNounsTableTableManager(_db.attachedDatabase, _db.properNouns);
}
