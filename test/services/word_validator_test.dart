import 'package:flutter_test/flutter_test.dart';
import 'package:word_validation/services/word_validator.dart';

import '../constants.dart';

void main() {
  group('$WordValidator', () {
    test('shortestWord', () {
      expect(WordValidator.shortestWord, '1');
    });

    test('longestWord', () {
      expect(
        WordValidator.longestWord,
        'pneumonoultramicroscopicsilicovolcanoconiosis',
      );
    });

    test('dirty invalid', () {
      expect(const WordValidator.dirty().valid, false);
    });

    test('dirty valid', () {
      expect(const WordValidator.dirty(validWord).valid, true);
    });

    test('pure invalid', () {
      expect(const WordValidator.pure().valid, false);
    });

    test('dirty valid', () {
      expect(const WordValidator.pure(validWord).valid, true);
    });
  });
}
