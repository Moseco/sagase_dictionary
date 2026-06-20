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
  });
}
