# Sagase 探せ Dictionary

Creates the dictionary for the [Sagase Japanese-English dictionary app](https://github.com/Moseco/sagase).

## Getting started

Prepare source files to be placed in ```example/input_files/```

### Externally managed files

- [JMdict_e_examp](https://www.edrdg.org/wiki/index.php/JMdict-EDICT_Dictionary_Project)
    - Version used: English only with examples sentences
- [kanjidic2.xml](https://www.edrdg.org/wiki/index.php/KANJIDIC_Project)
    - Version used: kanjidic2 containing all 13,108 kanji
- [accents.txt](https://github.com/mifunetoshiro/kanjium/blob/master/data/source_files/raw/accents.txt)
    - Pitch accent information
- frequency_list.txt
    - Frequency list file in the format frequency score (higher is more frequent), tab, and then the lemma (e.g., "22100273	月")
- [enamdict_utf-8](http://www.edrdg.org/enamdict/enamdict_doc.html)
    - Proper nouns

### Self-managed files

- kanji_radicals.json
- kanji_components.json
- kanji_strokes.json
- vocab_lists.json
- kanji_lists.json

## Usage

```dart run example/sagase_dictionary_example.dart```

## Special thanks

Thanks to [Electronic Dictionary Research and Development Group](http://www.edrdg.org/) for managing the source vocab and kanji dictionary files.

Thanks to the [KanjiVG project](http://kanjivg.tagaini.net/) for the kanji stroke order and kanji component data.

Thanks to [mifunetoshiro on Github](https://github.com/mifunetoshiro/kanjium) for providing the pitch accent data.

Thank to [Wiktionary and Wikipedia](https://en.wiktionary.org/wiki/Wiktionary:Frequency_lists/Japanese) for the frequency data.
