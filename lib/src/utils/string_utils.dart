import 'package:diacritic/diacritic.dart' as diacritic;

extension JapaneseTextHelpers on String {
  static const fullWidthRegExp = r'([\uff01-\uff5e])';
  static const halfWidthRegExp = r'([\u0021-\u007e])';
  static const halfFullWidthDelta = 0xfee0;

  String _convertWidth(String regExpPattern, int delta) {
    return replaceAllMapped(RegExp(regExpPattern),
        (m) => String.fromCharCode(m[1]!.codeUnits[0] + delta));
  }

  String romajiToFullWidth() =>
      _convertWidth(halfWidthRegExp, halfFullWidthDelta);

  String romajiToHalfWidth() =>
      _convertWidth(fullWidthRegExp, -halfFullWidthDelta);

  // Meant to be used on a single kanji
  // Gets the utf-16 code point from the 16-bit codeUnits (some kanji need 2)
  int kanjiCodePoint() {
    if (codeUnits.length == 1) {
      // Just return the single codeUnit
      return codeUnits[0];
    } else {
      // Bit shift and merge
      return codeUnits[0] << 16 | codeUnits[1];
    }
  }

  // Inverse of kanjiCodePoint()
  static String fromKanjiCodePoint(int codePoint) {
    if (codePoint <= 0xFFFF) return String.fromCharCode(codePoint);
    return String.fromCharCodes(
        [(codePoint >> 16) & 0xFFFF, codePoint & 0xFFFF]);
  }

  // Checks that the string is non-empty and contains only kanji
  bool isKanji() => isNotEmpty && runes.every(_isCodePointKanji);

  static bool _isCodePointKanji(int codePoint) =>
      (codePoint >= 0x4E00 && codePoint <= 0x9FFF) || // CJK Unified Ideographs
      (codePoint >= 0x3400 && codePoint <= 0x4DBF) || // CJK Extension A
      (codePoint >= 0xF900 && codePoint <= 0xFAFF) || // CJK Compatibility
      (codePoint >= 0x20000 && codePoint <= 0x2EBEF) || // CJK Extensions B-F
      (codePoint >= 0x2F800 && codePoint <= 0x2FA1F) || // CJK Compat. Suppl.
      (codePoint >= 0x30000 && codePoint <= 0x323AF) || // CJK Extensions G-H
      codePoint == 0x3005; // 々 kanji repetition mark

  // To be used with names for my dictionary lists and flashcard sets
  String sanitizeName() {
    // Remove new line characters
    String name = replaceAll('\n', '');
    // Enforce character length and trim whitespace
    // Operates on runes to avoid splitting a surrogate pair at the cutoff
    return String.fromCharCodes(name.runes.take(50)).trim();
  }

  static final splitWordsRegExp = RegExp(r'\b[^\s]+\b');

  List<String> splitWords() {
    return splitWordsRegExp.allMatches(this).map((e) => e[0]!).toList();
  }

  String removeDiacritics() {
    return diacritic.removeDiacritics(this);
  }

  static final iterationMarkRegExp = RegExp(r'[ゝゞヽヾ]');
  static final onlyIterationMarksRegExp = RegExp(r'^[ゝゞヽヾ]+$');
  static final kanaRegExp = RegExp(r'[\u3041-\u3096\u30a1-\u30fa]');

  static const _plainKana = 'かきくけこさしすせそたちつてとはひふへほう'
      'カキクケコサシスセソタチツテトハヒフヘホウ';
  static const _voicedKana = 'がぎぐげござじずぜぞだぢづでどばびぶべぼゔ'
      'ガギグゲゴザジズゼゾダヂヅデドバビブベボヴ';

  // Replaces kana iteration marks with the kana they repeat so that いすゞ
  // becomes いすず
  String expandIterationMarks() {
    if (!contains(iterationMarkRegExp)) return this;

    final buffer = StringBuffer();
    String? previous;
    for (final rune in runes) {
      String current = String.fromCharCode(rune);
      if (previous != null && kanaRegExp.hasMatch(previous)) {
        if (current == 'ゝ' || current == 'ヽ') {
          final voicedIndex = _voicedKana.indexOf(previous);
          current = voicedIndex == -1 ? previous : _plainKana[voicedIndex];
        } else if (current == 'ゞ' || current == 'ヾ') {
          final plainIndex = _plainKana.indexOf(previous);
          current = plainIndex == -1 ? previous : _voicedKana[plainIndex];
        }
      }
      buffer.write(current);
      previous = current;
    }
    return buffer.toString();
  }

  // Whether the text is only iteration marks, such as when searching for the
  // entry of a mark itself
  bool isIterationMarks() => onlyIterationMarksRegExp.hasMatch(this);
}
