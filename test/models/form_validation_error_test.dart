import 'package:flutter_test/flutter_test.dart';
import 'package:word_validation/models/form_validation_error.dart';

void main() {
  group('$FormValidationError', () {
    test('length', () {
      expect(FormValidationError.values.length, 1);
    });
  });
}
