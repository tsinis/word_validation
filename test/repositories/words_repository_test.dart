import 'package:flutter_test/flutter_test.dart';
import 'package:word_validation/repositories/words_repository.dart';

import '../constants.dart';

void main() {
  group('$WordsRepository', () {
    late WordsRepository wordsRepository;

    setUp(() => wordsRepository = WordsRepository(uniqueWords: {}));
    test('initial state', () {
      expect(wordsRepository.words.isEmpty, true);
    });

    test('addWord', () {
      wordsRepository
        ..addWord(validWord)
        ..addWord(invalidWord);
      expect(wordsRepository.words, {invalidWord, validWord});
    });

    test('words', () {
      wordsRepository.addWord(validWord);
      expect(wordsRepository.words, {validWord});
    });
  });
}
