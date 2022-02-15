import 'package:flutter_test/flutter_test.dart';
import 'package:word_validation/blocs/unique_words_list_bloc/list_bloc.dart';

import '../../constants.dart';

void main() {
  group('$ListState', () {
    test('uniqueWords', () {
      expect(const ListInitial().uniqueWords, <String>{});
    });

    test('$ListInitial', () {
      expect(const ListInitial(), equals(const ListInitial()));
      expect(
        const ListInitial(),
        isNot(const ListFilled(uniqueWords: {})),
      );
    });

    test('$ListFilled', () {
      expect(
        const ListFilled(uniqueWords: {}),
        equals(const ListFilled(uniqueWords: {})),
      );
      expect(
        const ListFilled(uniqueWords: {validWord}),
        isNot(const ListFilled(uniqueWords: {invalidWord})),
      );

      expect(
        const ListFilled(uniqueWords: {}),
        isNot(const ListInitial()),
      );
    });
  });
}
