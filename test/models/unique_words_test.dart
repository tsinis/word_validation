import 'package:flutter_test/flutter_test.dart';
import 'package:word_validation/models/unique_words.dart';

void main() {
  group('$UniqueWords', () {
    test('is <Set<String>>', () => expect(<String>{}, isA<UniqueWords>()));
  });
}
