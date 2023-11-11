import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:math';

import 'package:isar/isar.dart';
import 'package:sagase_dictionary/sagase_dictionary.dart';
import 'package:sagase_dictionary/src/dictionary_builder.dart';
import 'package:test/test.dart';
import 'package:path/path.dart' as path;

void main() {
  group('MyDictionaryListTest', () {
    group('Isar required', () {
      late Isar isar;

      setUp(() async {
        // Create directory .dart_tool/isar/test_files
        final dartToolDir = path.join(Directory.current.path, '.dart_tool');
        String testTempPath = path.join(dartToolDir, 'isar', 'test_files');
        String downloadPath = path.join(dartToolDir, 'isar');
        await Directory(testTempPath).create(recursive: true);

        // Get name of isar binary based on platform
        late String binaryName;
        switch (Abi.current()) {
          case Abi.macosX64:
            binaryName = 'libisar.dylib';
            break;
          case Abi.linuxX64:
            binaryName = 'libisar.so';
            break;
          case Abi.windowsX64:
            binaryName = 'isar.dll';
            break;
          default:
            throw Exception('Unsupported platform for testing');
        }

        // Downloads Isar binary file
        await Isar.initializeIsarCore(
          libraries: {Abi.current(): path.join(downloadPath, binaryName)},
          download: true,
        );

        // Open Isar instance with random name
        isar = await Isar.open(
          DictionaryBuilder.dictionarySchemas,
          directory: testTempPath,
          name: Random().nextInt(pow(2, 32) as int).toString(),
          inspector: false,
        );
      });

      tearDown(() => isar.close(deleteFromDisk: true));

      test('Backup current version', () async {
        final myList = MyDictionaryList();

        final now = DateTime.now();
        await isar.writeTxn(() async {
          // Create and add my list to isar
          myList
            ..id = 1
            ..name = 'list1'
            ..timestamp = now
            ..vocab = [0, 1]
            ..kanji = ['a'.kanjiCodePoint(), 'b'.kanjiCodePoint()];

          await isar.myDictionaryLists.put(myList);

          // Add vocab and kanji to isar and add to my list
          final vocab1 = Vocab()..id = 1;
          final vocab2 = Vocab()..id = 2;
          final kanji1 = Kanji()
            ..id = 0
            ..kanji = 'b'
            ..radical = 'b'
            ..strokeCount = 0;
          final kanji2 = Kanji()
            ..id = 1
            ..kanji = 'c'
            ..radical = 'c'
            ..strokeCount = 0;

          await isar.vocabs.put(vocab1);
          await isar.vocabs.put(vocab2);
          await isar.kanjis.put(kanji1);
          await isar.kanjis.put(kanji2);

          myList.vocabLinks.add(vocab1);
          myList.vocabLinks.add(vocab2);
          myList.kanjiLinks.add(kanji1);
          myList.kanjiLinks.add(kanji2);

          await myList.vocabLinks.save();
          await myList.kanjiLinks.save();
        });

        // Backup and import
        final newMyList = MyDictionaryList.fromBackupJson(
          jsonDecode(myList.toBackupJson()),
          SagaseDictionaryConstants.dictionaryVersion,
        );

        expect(newMyList.id, 1);
        expect(newMyList.name, 'list1');
        expect(newMyList.timestamp.millisecondsSinceEpoch,
            now.millisecondsSinceEpoch);
        expect(newMyList.vocab.length, 3);
        expect(newMyList.vocab.contains(0), true);
        expect(newMyList.vocab.contains(1), true);
        expect(newMyList.vocab.contains(2), true);
        expect(newMyList.kanji.length, 3);
        expect(newMyList.kanji.contains('a'.kanjiCodePoint()), true);
        expect(newMyList.kanji.contains('b'.kanjiCodePoint()), true);
        expect(newMyList.kanji.contains('c'.kanjiCodePoint()), true);
      });
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
  });
}
