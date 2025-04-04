import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:drift/drift.dart';
import 'package:path/path.dart' as path;
import 'package:sagase_dictionary/sagase_dictionary.dart';
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

  // Export database without proper nouns to file
  await _exportAndCompressDatabase(
    database,
    path.join(tempFilesPath, SagaseDictionaryConstants.dictionaryDatabaseFile),
    path.join(outputFilesPath, SagaseDictionaryConstants.dictionaryZip),
  );

  // Add proper nouns to database
  print('Adding proper nouns...');
  await DictionaryBuilder.createProperNounDictionary(
    database,
    File(path.join(inputFilesPath, 'enamdict_utf-8')).readAsStringSync(),
    showProgress: true,
  );

  int properNounCount = await database.properNouns.count().getSingle();
  print('\nProper noun count - $properNounCount');

  // Export database with proper nouns to file
  await _exportAndCompressDatabase(
    database,
    path.join(tempFilesPath, SagaseDictionaryConstants.dictionaryDatabaseFile),
    path.join(
      outputFilesPath,
      SagaseDictionaryConstants.dictionaryWithProperNounsZip,
    ),
  );

  // Close database
  await database.close();

  // Open proper noun database
  print('Creating proper noun dictionary...');
  final properNounDatabase = AppDatabase();
  await DictionaryBuilder.createProperNounDictionary(
    properNounDatabase,
    File(path.join(inputFilesPath, 'enamdict_utf-8')).readAsStringSync(),
    showProgress: true,
  );
  print('');

  // Export proper noun database
  await _exportAndCompressDatabase(
    properNounDatabase,
    path.join(
      tempFilesPath,
      SagaseDictionaryConstants.properNounDictionaryDatabaseFile,
    ),
    path.join(
      outputFilesPath,
      SagaseDictionaryConstants.properNounDictionaryZip,
    ),
  );

  // Close proper noun database
  await properNounDatabase.close();

  // Create required assets tar
  print("Creating required assets tar");
  final archive = Archive();

  String dictionaryPath = path.join(
    outputFilesPath,
    SagaseDictionaryConstants.dictionaryZip,
  );
  String mecabPath = path.join(
    inputFilesPath,
    SagaseDictionaryConstants.mecabZip,
  );

  final dictionaryBytes = await File(dictionaryPath).readAsBytes();
  final dictionaryArchiveFile = ArchiveFile(
      SagaseDictionaryConstants.dictionaryZip,
      dictionaryBytes.length,
      dictionaryBytes);
  archive.addFile(dictionaryArchiveFile);

  final mecabBytes = await File(mecabPath).readAsBytes();
  final mecabArchiveFile = ArchiveFile(
    SagaseDictionaryConstants.mecabZip,
    mecabBytes.length,
    mecabBytes,
  );
  archive.addFile(mecabArchiveFile);

  final encodedArchive = TarEncoder().encode(archive);

  File(path.join(
    outputFilesPath,
    SagaseDictionaryConstants.requiredAssetsTar,
  )).writeAsBytesSync(encodedArchive);

  // Delete temp files
  await Directory(tempFilesPath).delete(recursive: true);

  print('Done!');
}

Future<void> _exportAndCompressDatabase(
  AppDatabase database,
  String dbFilePath,
  String archiveFilePath,
) async {
  print('Exporting...');
  final dbFile = File(dbFilePath);
  if (dbFile.existsSync()) dbFile.deleteSync();
  await database.customStatement('VACUUM INTO ?', [dbFile.path]);

  // Compress the exported file
  print('Compressing...');
  final bytes = dbFile.readAsBytesSync();
  final archiveFile =
      ArchiveFile(dbFile.uri.pathSegments.last, bytes.length, bytes);
  final archive = Archive();
  archive.addFile(archiveFile);
  final encodedArchive =
      ZipEncoder().encodeBytes(archive, level: DeflateLevel.bestCompression);
  File(archiveFilePath).writeAsBytesSync(encodedArchive);
}
