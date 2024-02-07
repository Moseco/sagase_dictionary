import 'dart:convert';
import 'package:sagase_dictionary/sagase_dictionary.dart';
import 'package:test/test.dart';

void main() {
  group('MyDictionaryListTest', () {
    test('Backup current version', () async {
      final now = DateTime.now();
      final myList = MyDictionaryList()
        ..id = 1
        ..name = 'list1'
        ..timestamp = now
        ..vocab = [0, 1]
        ..kanji = ['a'.kanjiCodePoint(), 'b'.kanjiCodePoint()];

      // Backup and import
      final newMyList = MyDictionaryList.fromBackupJson(
        jsonDecode(myList.toBackupJson()),
        SagaseDictionaryConstants.dictionaryVersion,
      );

      expect(newMyList.id, 1);
      expect(newMyList.name, 'list1');
      expect(newMyList.timestamp.millisecondsSinceEpoch,
          now.millisecondsSinceEpoch);
      expect(newMyList.vocab.length, 2);
      expect(newMyList.vocab.contains(0), true);
      expect(newMyList.vocab.contains(1), true);
      expect(newMyList.kanji.length, 2);
      expect(newMyList.kanji.contains('a'.kanjiCodePoint()), true);
      expect(newMyList.kanji.contains('b'.kanjiCodePoint()), true);
    });

    test('fromBackupJson version 11', () {
      final now = DateTime.now();

      final json = '''{
      "id": 1,
      "name": "list1",
      "timestamp": ${now.millisecondsSinceEpoch},
      "vocab": [0, 1],
      "kanji": ["a", "b"]
}''';

      final newMyList = MyDictionaryList.fromBackupJson(jsonDecode(json), 11);

      expect(newMyList.id, 1);
      expect(newMyList.name, 'list1');
      expect(newMyList.timestamp.millisecondsSinceEpoch,
          now.millisecondsSinceEpoch);
      expect(newMyList.vocab.length, 2);
      expect(newMyList.vocab[0], 0);
      expect(newMyList.vocab[1], 1);
      expect(newMyList.kanji.length, 2);
      expect(newMyList.kanji[0], 'a'.kanjiCodePoint());
      expect(newMyList.kanji[1], 'b'.kanjiCodePoint());
    });

    test('toExportJson and fromExportJson', () {
      final myList = MyDictionaryList()
        ..id = 1
        ..name = 'list1'
        ..timestamp = DateTime.now()
        ..vocab = [0, 1]
        ..kanji = ['a'.kanjiCodePoint(), 'b'.kanjiCodePoint()];

      String json = myList.toExportJson();

      expect(
        json,
        '{"type":"my_dictionary_list","name":"list1","vocab":[0,1],"kanji":[97,98]}',
      );

      final newMyList = MyDictionaryList.fromExportJson(json);

      expect(newMyList!.name, 'list1');
      expect(newMyList.vocab, [0, 1]);
      expect(newMyList.kanji, ['a'.kanjiCodePoint(), 'b'.kanjiCodePoint()]);
    });

    test('fromExportJson with invalid input', () {
      String json = '{"name":"list1","vocab":[0,1],"kanji":[97,98]}';

      final myList = MyDictionaryList.fromExportJson(json);

      expect(myList, null);
    });
  });
}
