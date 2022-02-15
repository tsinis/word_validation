import 'package:flutter_test/flutter_test.dart';
import 'package:word_validation/blocs/form_words_validation_bloc/form_bloc.dart';

import '../../abstractions/testable_form_event.dart';

void main() {
  group('$FormEvent', () {
    test('$FormSubmitted', () {
      expect(const FormSubmitted(), equals(const FormSubmitted()));
      expect(const FormSubmitted(), isNot(const FormChanged(word: '')));
    });

    test('$FormChanged', () {
      expect(const FormChanged(word: ''), equals(const FormChanged(word: '')));
      expect(const FormChanged(word: ''), isNot(const FormSubmitted()));
    });

    test('$FormChanged props', () {
      expect(const FormChanged(word: '').props, ['']);
    });

    test('$FormEvent props', () {
      expect(TestableFormEvent().props, isEmpty);
    });
  });
}
