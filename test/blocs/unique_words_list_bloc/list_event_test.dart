import 'package:flutter_test/flutter_test.dart';
import 'package:word_validation/blocs/unique_words_list_bloc/list_bloc.dart';

import '../../abstractions/testable_list_event.dart';
import '../../constants.dart';

void main() {
  group('$ListEvent', () {
    test('$WordAdded', () {
      expect(
        const WordAdded(word: validWord),
        equals(const WordAdded(word: validWord)),
      );
      expect(
        const WordAdded(word: validWord),
        isNot(const WordAdded(word: invalidWord)),
      );
    });

    test('$ListEvent props', () {
      expect(TestableListEvent().props, isEmpty);
    });
  });
}
