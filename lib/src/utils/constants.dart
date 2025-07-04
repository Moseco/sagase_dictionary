class SagaseDictionaryConstants {
  static const int dictionaryVersion = 15;

  static const int dictionaryListIdJouyou = 0;
  static const int dictionaryListIdJlptVocabN1 = 1;
  static const int dictionaryListIdJlptVocabN2 = 2;
  static const int dictionaryListIdJlptVocabN3 = 3;
  static const int dictionaryListIdJlptVocabN4 = 4;
  static const int dictionaryListIdJlptVocabN5 = 5;
  static const int dictionaryListIdJlptKanjiN1 = 6;
  static const int dictionaryListIdJlptKanjiN2 = 7;
  static const int dictionaryListIdJlptKanjiN3 = 8;
  static const int dictionaryListIdJlptKanjiN4 = 9;
  static const int dictionaryListIdJlptKanjiN5 = 10;
  static const int dictionaryListIdGradeLevel1 = 11;
  static const int dictionaryListIdGradeLevel2 = 12;
  static const int dictionaryListIdGradeLevel3 = 13;
  static const int dictionaryListIdGradeLevel4 = 14;
  static const int dictionaryListIdGradeLevel5 = 15;
  static const int dictionaryListIdGradeLevel6 = 16;
  static const int dictionaryListIdJinmeiyou = 17;
  static const int dictionaryListIdKenteiLevel10 = 18;
  static const int dictionaryListIdKenteiLevel9 = 19;
  static const int dictionaryListIdKenteiLevel8 = 20;
  static const int dictionaryListIdKenteiLevel7 = 21;
  static const int dictionaryListIdKenteiLevel6 = 22;
  static const int dictionaryListIdKenteiLevel5 = 23;
  static const int dictionaryListIdKenteiLevel4 = 24;
  static const int dictionaryListIdKenteiLevel3 = 25;
  static const int dictionaryListIdKenteiLevelPre2 = 26;
  static const int dictionaryListIdKenteiLevel2 = 27;
  static const int dictionaryListIdKenteiLevelPre1 = 28;
  static const int dictionaryListIdKenteiLevel1 = 29;
  static const int dictionaryListIdKaishi = 30;
  static const int dictionaryListId2k = 31;
  static const int dictionaryListId6k = 32;
  static const int dictionaryListId10k = 33;

  static const dictionaryDatabaseFile = 'dictionary.sqlite';
  static const properNounDictionaryDatabaseFile =
      'proper_noun_dictionary.sqlite';

  static const requiredAssetsTar = 'required_assets.tar';
  static const dictionaryZip = 'dictionary.zip';
  static const dictionaryWithProperNounsZip =
      'dictionary_with_proper_nouns.zip';
  static const properNounDictionaryZip = 'proper_noun_dictionary.zip';
  static const mecabZip = 'mecab.zip';

  static const backupDictionaryVersion = 'dictionary_version';
  static const backupTimestamp = 'timestamp';
  static const backupMyDictionaryLists = 'my_dictionary_lists';
  static const backupFlashcardSets = 'flashcard_sets';
  static const backupFlashcardSetReports = 'flashcard_set_reports';
  static const backupVocabSpacedRepetitionData = 'vocab_spaced_repetition_data';
  static const backupVocabSpacedRepetitionDataEnglish =
      'vocab_spaced_repetition_data_english';
  static const backupKanjiSpacedRepetitionData = 'kanji_spaced_repetition_data';
  static const backupKanjiSpacedRepetitionDataEnglish =
      'kanji_spaced_repetition_data_english';
  static const backupSearchHistory = 'search_history';
  static const backupTextAnalysisHistory = 'text_analysis_history';
  static const backupVocabNotes = 'vocab_notes';
  static const backupKanjiNotes = 'kanji_notes';

  static const backupFlashcardSetId = 'id';
  static const backupFlashcardSetName = 'name';
  static const backupFlashcardSetUsingSpacedRepetition =
      'using_spaced_repetition';
  static const backupFlashcardSetFrontType = 'front_type';
  static const backupFlashcardSetVocabShowReading = 'vocab_show_reading';
  static const backupFlashcardSetVocabShowReadingIfRareKanji =
      'vocab_show_reading_if_rare_kanji';
  static const backupFlashcardSetVocabShowAlternatives =
      'vocab_show_alternatives';
  static const backupFlashcardSetVocabShowPitchAccent =
      'vocab_show_pitch_accent';
  static const backupFlashcardSetKanjiShowReading = 'kanji_show_reading';
  static const backupFlashcardSetVocabShowPartsOfSpeech =
      'vocab_show_parts_of_speech';
  static const backupFlashcardSetShowNote = 'show_note';
  static const backupFlashcardSetTimestamp = 'timestamp';
  static const backupFlashcardSetPredefinedDictionaryLists =
      'predefined_dictionary_lists';
  static const backupFlashcardSetMyDictionaryLists = 'my_dictionary_lists';
  static const backupFlashcardSetStreak = 'streak';
  static const backupFlashcardSetReportId = 'id';
  static const backupFlashcardSetReportFlashcardSetId = 'flashcard_set_id';
  static const backupFlashcardSetReportDate = 'date';
  static const backupFlashcardSetReportDueFlashcardsCompleted =
      'due_flashcards_completed';
  static const backupFlashcardSetReportDueFlashcardsGotWrong =
      'due_flashcards_got_wrong';
  static const backupFlashcardSetReportNewFlashcardsCompleted =
      'new_flashcards_completed';
  static const backupMyDictionaryListId = 'id';
  static const backupMyDictionaryListName = 'name';
  static const backupMyDictionaryListTimestamp = 'timestamp';
  static const backupMyDictionaryListVocab = 'vocab';
  static const backupMyDictionaryListKanji = 'kanji';
  static const backupSpacedRepetitionDataInterval = 'interval';
  static const backupSpacedRepetitionDataRepetitions = 'repetitions';
  static const backupSpacedRepetitionDataEaseFactor = 'ease_factor';
  static const backupSpacedRepetitionDataDueDate = 'due_date';
  static const backupSpacedRepetitionDataTotalAnswers = 'total_answers';
  static const backupSpacedRepetitionDataTotalWrongAnswers =
      'total_wrong_answers';
  static const backupVocabNoteId = 'id';
  static const backupVocabNoteNote = 'note';
  static const backupKanjiNoteId = 'id';
  static const backupKanjiNoteNote = 'note';

  static const exportType = 'type';
  static const exportTypeBackup = 'backup';
  static const exportTypeMyList = 'my_dictionary_list';
  static const exportMyListName = 'name';
  static const exportMyListVocab = 'vocab';
  static const exportMyListKanji = 'kanji';
}
