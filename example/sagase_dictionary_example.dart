import 'dart:ffi';
import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:isar/isar.dart';
import 'package:path/path.dart' as path;
import 'package:sagase_dictionary/src/datamodels/proper_noun.dart';
import 'package:sagase_dictionary/src/dictionary_builder.dart';

void main(List<String> arguments) async {
  if (arguments.isEmpty ||
      (arguments[0] != '1' && arguments[0] != '2' && arguments[0] != '3')) {
    print(
        'Invalid argument. Valid arguments:\n\t1 - create regular dictionary\n\t2 - create proper noun dictionary\n\t3 - create both');
    return;
  }

  // Create required directories and remove conflicting files
  String downloadPath = path.join(Directory.current.path, '.dart_tool', 'isar');
  await Directory(downloadPath).create(recursive: true);
  String examplePath = path.join(Directory.current.path, 'example');
  String inputFilesPath = path.join(examplePath, 'input_files');
  String tempFilesPath = path.join(examplePath, 'temp_files');
  if (await Directory(tempFilesPath).exists()) {
    await Directory(tempFilesPath).delete(recursive: true);
  }
  await Directory(tempFilesPath).create(recursive: true);
  String outputFilesPath = path.join(examplePath, 'output_files');
  await Directory(outputFilesPath).create(recursive: true);
  if (await File(path.join(outputFilesPath, 'db_export.zip')).exists()) {
    await File(path.join(outputFilesPath, 'db_export.zip')).delete();
  }
  if (await File(path.join(outputFilesPath, 'proper_nouns_export.zip'))
      .exists()) {
    await File(path.join(outputFilesPath, 'proper_nouns_export.zip')).delete();
  }

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
      throw Exception('Unsupported platform for dictionary creation');
  }

  // Downloads Isar binary file
  await Isar.initializeIsarCore(
    libraries: {Abi.current(): path.join(downloadPath, binaryName)},
    download: true,
  );

  // Open Isar instance
  final Isar isar = await Isar.open(
    DictionaryBuilder.dictionarySchemas,
    directory: tempFilesPath,
    inspector: false,
  );

  if (arguments[0] == '1' || arguments[0] == '3') {
    print('Creating dictionary');

    // Create regular dictionary
    await DictionaryBuilder.createDictionary(
      isar,
      File(path.join(inputFilesPath, 'JMdict_e_examp')).readAsStringSync(),
      File(path.join(inputFilesPath, 'kanjidic2.xml')).readAsStringSync(),
      File(path.join(inputFilesPath, 'kanji_radicals.json')).readAsStringSync(),
      File(path.join(inputFilesPath, 'kanji_strokes.json')).readAsStringSync(),
      File(path.join(inputFilesPath, 'kanji_components.json'))
          .readAsStringSync(),
      File(path.join(inputFilesPath, 'vocab_lists.json')).readAsStringSync(),
      File(path.join(inputFilesPath, 'kanji_lists.json')).readAsStringSync(),
      File(path.join(inputFilesPath, 'pitch_accents.txt')).readAsStringSync(),
      File(path.join(inputFilesPath, 'frequency_list.txt')).readAsStringSync(),
    );

    // Export isar to file
    await isar.copyToFile(path.join(tempFilesPath, 'db_export.isar'));

    // Compress the exported file
    final bytes =
        await File(path.join(tempFilesPath, 'db_export.isar')).readAsBytes();
    final archiveFile = ArchiveFile('db_export.isar', bytes.length, bytes);
    final archive = Archive();
    archive.addFile(archiveFile);
    final encodedArchive =
        ZipEncoder().encode(archive, level: Deflate.BEST_COMPRESSION);
    if (encodedArchive == null) {
      print('Compression did not work');
      return;
    }
    await File(path.join(outputFilesPath, 'db_export.zip'))
        .writeAsBytes(encodedArchive);
  }

  if (arguments[0] == '2' || arguments[0] == '3') {
    print('Creating proper noun dictionary');

    // Create proper noun dictionary
    await DictionaryBuilder.createProperNounDictionary(
      isar,
      File(path.join(inputFilesPath, 'enamdict_utf-8')).readAsStringSync(),
    );

    // Export to json and compress
    final archive = Archive();
    for (int i = 0; i < 30; i++) {
      await isar.properNouns
          .where()
          .offset(i * 25000)
          .limit(25000)
          .exportJsonRaw((bytes) async {
        final byteList = bytes.toList();
        archive.addFile(ArchiveFile(
          'proper_nouns_$i',
          byteList.length,
          byteList,
        ));
      });
    }

    final encodedArchive =
        ZipEncoder().encode(archive, level: Deflate.BEST_COMPRESSION);
    if (encodedArchive == null) {
      print('Compression did not work');
      return;
    }
    await File(path.join(outputFilesPath, 'proper_nouns_export.zip'))
        .writeAsBytes(encodedArchive);
  }

  // Close isar and delete the temp files
  await isar.close();
  await Directory(tempFilesPath).delete(recursive: true);
}
