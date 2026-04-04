// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grammar_lessons_dao.dart';

// ignore_for_file: type=lint
mixin _$GrammarLessonsDaoMixin on DatabaseAccessor<AppDatabase> {
  $GrammarLessonsTable get grammarLessons => attachedDatabase.grammarLessons;
  GrammarLessonsDaoManager get managers => GrammarLessonsDaoManager(this);
}

class GrammarLessonsDaoManager {
  final _$GrammarLessonsDaoMixin _db;
  GrammarLessonsDaoManager(this._db);
  $$GrammarLessonsTableTableManager get grammarLessons =>
      $$GrammarLessonsTableTableManager(
          _db.attachedDatabase, _db.grammarLessons);
}
