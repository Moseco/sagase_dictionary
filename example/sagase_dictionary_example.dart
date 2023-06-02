import 'dart:ffi';
import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:isar/isar.dart';
import 'package:path/path.dart' as path;
import 'package:sagase_dictionary/src/dictionary_builder.dart';

void main() async {
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

  // Create the dictionary
  await DictionaryBuilder.createDictionary(
    isar,
    File(path.join(inputFilesPath, 'JMdict_e_examp')).readAsStringSync(),
    File(path.join(inputFilesPath, 'kanjidic2.xml')).readAsStringSync(),
    File(path.join(inputFilesPath, 'kanji_radicals.json')).readAsStringSync(),
    File(path.join(inputFilesPath, 'kanji_strokes.json')).readAsStringSync(),
    File(path.join(inputFilesPath, 'kanji_components.json')).readAsStringSync(),
    File(path.join(inputFilesPath, 'vocab_lists.json')).readAsStringSync(),
    File(path.join(inputFilesPath, 'kanji_lists.json')).readAsStringSync(),
    File(path.join(inputFilesPath, 'pitch_accents.txt')).readAsStringSync(),
  );

  // Export isar to file and close isar
  await isar.copyToFile(path.join(tempFilesPath, 'db_export.isar'));
  await isar.close();

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

  // Delete the temp files
  await Directory(tempFilesPath).delete(recursive: true);
}
