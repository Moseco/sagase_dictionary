import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:drift/drift.dart';
import 'package:path/path.dart' as path;
import 'package:sagase_dictionary/src/database.dart';
import 'package:sagase_dictionary/src/dictionary_builder.dart';

void main() async {
  // Create required directories and remove conflicting files
  String examplePath = path.join(Directory.current.path, 'example');
  String inputFilesPath = path.join(examplePath, 'input_files');
  String tempFilesPath = path.join(examplePath, 'temp_files');
  if (Directory(tempFilesPath).existsSync()) {
    Directory(tempFilesPath).deleteSync(recursive: true);
  }
  Directory(tempFilesPath).createSync(recursive: true);
  String outputFilesPath = path.join(examplePath, 'output_files');
  Directory(outputFilesPath).createSync(recursive: true);
  if (File(path.join(outputFilesPath, 'dictionary.zip')).existsSync()) {
    File(path.join(outputFilesPath, 'dictionary.zip')).deleteSync();
  }

  print('Creating dictionary');

  // Open database
  late final AppDatabase database;
  try {
    database = AppDatabase();

    // Create dictionary
    await DictionaryBuilder.createDictionary(
      database,
      File(path.join(inputFilesPath, 'JMdict_e_examp')).readAsStringSync(),
      File(path.join(inputFilesPath, 'kanjidic2.xml')).readAsStringSync(),
      File(path.join(inputFilesPath, 'radicals.json')).readAsStringSync(),
      File(path.join(inputFilesPath, 'kanji_strokes.json')).readAsStringSync(),
      File(path.join(inputFilesPath, 'kanji_components.json'))
          .readAsStringSync(),
      File(path.join(inputFilesPath, 'vocab_lists.json')).readAsStringSync(),
      File(path.join(inputFilesPath, 'kanji_lists.json')).readAsStringSync(),
      File(path.join(inputFilesPath, 'pitch_accents.txt')).readAsStringSync(),
      File(path.join(inputFilesPath, 'frequency_list.txt')).readAsStringSync(),
      showProgress: true,
    );
    print('');
  } on ArgumentError catch (e) {
    // Catch error relating to not being able to open sqlite3
    if (e.message
        .toString()
        .startsWith('Failed to load dynamic library \'sqlite3.dll\'')) {
      print(
        'Failed to load sqlite3. Make sure it is installed and in your path.',
      );
      // Delete temp directory and exit
      await Directory(tempFilesPath).delete(recursive: true);
      return;
    } else {
      rethrow;
    }
  }

  // Confirm vocab and kanji counts
  int vocabCount = await database.vocabs.count().getSingle();
  print('Vocab count - $vocabCount');
  int kanjiCount = await database.kanjis.count().getSingle();
  print('Kanji ${kanjiCount == 13108 ? "valid" : "INVALID"} - $kanjiCount');

  // Export database to file
  print('Exporting...');
  final file = File(path.join(tempFilesPath, 'dictionary.sqlite'));
  if (file.existsSync()) file.deleteSync();
  await database.customStatement('VACUUM INTO ?', [file.path]);

  // Compress the exported file
  print('Compressing...');
  final bytes =
      await File(path.join(tempFilesPath, 'dictionary.sqlite')).readAsBytes();
  final archiveFile = ArchiveFile('dictionary.sqlite', bytes.length, bytes);
  final archive = Archive();
  archive.addFile(archiveFile);
  final encodedArchive =
      ZipEncoder().encode(archive, level: Deflate.BEST_COMPRESSION);
  if (encodedArchive == null) {
    print('Compression did not work');
    return;
  }
  await File(path.join(outputFilesPath, 'dictionary.zip'))
      .writeAsBytes(encodedArchive);

  // Close database and delete the temp files
  await database.close();
  await Directory(tempFilesPath).delete(recursive: true);

  print('Done!');
}
