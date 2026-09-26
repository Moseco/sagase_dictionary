import 'package:sagase_dictionary/src/utils/string_utils.dart';
import 'package:test/test.dart';

void main() {
  group('JapaneseTextHelpers', () {
    group('isKanji', () {
      test('Basic CJK block', () {
        expect('亜'.isKanji(), true);
        expect('悪'.isKanji(), true);
      });

      test('Kanji outside the basic CJK block', () {
        // CJK extension A
        expect('㐂'.isKanji(), true);
        // CJK compatibility ideograph
        expect('﨑'.isKanji(), true);
        // Supplementary plane (CJK extension B)
        expect('𠮟'.isKanji(), true);
      });

      test('Multiple kanji', () {
        expect('日本語'.isKanji(), true);
      });

      test('Kanji repetition mark', () {
        expect('々'.isKanji(), true);
        expect('人々'.isKanji(), true);
      });

      test('Non-kanji', () {
        expect(''.isKanji(), false);
        expect('a'.isKanji(), false);
        expect('あ'.isKanji(), false);
        expect('ア'.isKanji(), false);
        expect('。'.isKanji(), false);
      });

      test('Mixed kanji and non-kanji', () {
        expect('行く'.isKanji(), false);
        expect('日本語a'.isKanji(), false);
      });
    });

    group('fromKanjiCodePoint', () {
      test('Reverses kanjiCodePoint', () {
        expect(
            JapaneseTextHelpers.fromKanjiCodePoint('亜'.kanjiCodePoint()), '亜');
        expect(JapaneseTextHelpers.fromKanjiCodePoint('𠮟'.kanjiCodePoint()),
            '𠮟');
      });
    });

    group('sanitizeName', () {
      test('Removes new lines and trims whitespace', () {
        expect(' my\nlist '.sanitizeName(), 'mylist');
      });

      test('Enforces character limit', () {
        expect(('a' * 50 + 'b').sanitizeName(), 'a' * 50);
      });

      test('Does not split a surrogate pair at the cutoff', () {
        // 𠮟 consists of 2 code units; cutting at 50 code units would
        // leave an unpaired surrogate
        final name = ('a' * 49 + '𠮟𠮟').sanitizeName();
        expect(name, 'a' * 49 + '𠮟');
      });
    });

    group('expandIterationMarks', () {
      test('Repeats the previous kana unvoiced', () {
        expect('こゝろ'.expandIterationMarks(), 'こころ');
        expect('ミヽ'.expandIterationMarks(), 'ミミ');
        expect('づゝ'.expandIterationMarks(), 'づつ');
        expect('がゝ'.expandIterationMarks(), 'がか');
        expect('じゝ'.expandIterationMarks(), 'じし');
        expect('ゔゝ'.expandIterationMarks(), 'ゔう');
        expect('ヴヽ'.expandIterationMarks(), 'ヴウ');
      });

      test('Repeats the previous kana voiced', () {
        expect('いすゞ'.expandIterationMarks(), 'いすず');
        expect('みすゞ'.expandIterationMarks(), 'みすず');
        expect('たゞ'.expandIterationMarks(), 'ただ');
        expect('つゞく'.expandIterationMarks(), 'つづく');
        expect('うゞ'.expandIterationMarks(), 'うゔ');
        expect('ウヾ'.expandIterationMarks(), 'ウヴ');
        expect('じゞ'.expandIterationMarks(), 'じじ');
        expect('じゞい'.expandIterationMarks(), 'じじい');
        expect('なゞ'.expandIterationMarks(), 'なな');
      });

      test('Work with both hiragana and katakana', () {
        expect('スゞ'.expandIterationMarks(), 'スズ');
        expect('すヾ'.expandIterationMarks(), 'すず');
      });

      test('Leaves a mark that does not follow kana', () {
        expect('ゝ'.expandIterationMarks(), 'ゝ');
        expect('寿ゞ'.expandIterationMarks(), '寿ゞ');
        expect('ゞ寿'.expandIterationMarks(), 'ゞ寿');
        expect('山上ゝ泉'.expandIterationMarks(), '山上ゝ泉');
      });

      test('Repeats the kana a previous mark expanded to', () {
        expect('すゝゝ'.expandIterationMarks(), 'すすす');
        expect('たゞゝ'.expandIterationMarks(), 'ただた');
      });

      test('Text without marks is unchanged', () {
        expect('ひらがな'.expandIterationMarks(), 'ひらがな');
        expect(''.expandIterationMarks(), '');
      });

      test('Repeats kana that does not have voiced/unvoiced pair', () {
        expect('なゝ'.expandIterationMarks(), 'なな');
        expect('なゞ'.expandIterationMarks(), 'なな');
      });
    });
  });
}
