import 'package:formz/formz.dart';

import '../models/form_validation_error.dart';

class WordValidator extends FormzInput<String, FormValidationError> {
  static const longestWord = 'pneumonoultramicroscopicsilicovolcanoconiosis';
  static const shortestWord = '1';

  const WordValidator.pure([String value = '']) : super.pure(value);
  const WordValidator.dirty([String value = '']) : super.dirty(value);

  @override
  FormValidationError? validator(String? value) {
    final word = value ?? '';

    return word.length > longestWord.length || word.length < shortestWord.length
        ? FormValidationError.invalid
        : null;
  }
}
