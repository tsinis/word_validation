import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:word_validation/blocs/form_words_validation_bloc/form_bloc.dart';

void main() {
  group('$FormState', () {
    test('invalid status', () {
      expect(
        const FormState(status: FormzStatus.invalid),
        equals(const FormState(status: FormzStatus.invalid)),
      );
      expect(
        const FormState(status: FormzStatus.invalid),
        isNot(const FormState.clear()),
      );
    });

    test('clear()', () {
      expect(const FormState.clear(), equals(const FormState()));
      expect(
        const FormState.clear(),
        isNot(const FormState(status: FormzStatus.invalid)),
      );
    });
  });
}
