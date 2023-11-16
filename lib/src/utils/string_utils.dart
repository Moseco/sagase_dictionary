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
}
