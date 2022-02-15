// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:word_validation/blocs/form_words_validation_bloc/form_bloc.dart';

import '../../constants.dart';

void main() {
  group('$FormBloc', () {
    test('initial state is $FormState', () {
      expect(FormBloc().state, const FormState());
    });

    blocTest<FormBloc, FormState>(
      '$FormChanged valid word',
      build: FormBloc.new,
      act: (bloc) => bloc.add(const FormChanged(word: validWord)),
      expect: () => <TypeMatcher<FormState>>[isA<FormState>()],
      verify: (bloc) {
        expect(bloc.state.status, FormzStatus.valid);
        expect(bloc.state.word.value, validWord);
      },
    );

    blocTest<FormBloc, FormState>(
      '$FormChanged invalid word',
      build: FormBloc.new,
      act: (bloc) => bloc.add(const FormChanged(word: invalidWord)),
      expect: () => <TypeMatcher<FormState>>[isA<FormState>()],
      verify: (bloc) {
        expect(bloc.state.status, FormzStatus.invalid);
        expect(bloc.state.word.value, invalidWord);
      },
    );

    blocTest<FormBloc, FormState>(
      '$FormSubmitted',
      build: FormBloc.new,
      act: (bloc) => bloc.add(const FormSubmitted()),
      expect: () => <TypeMatcher<FormState>>[isA<FormState>()],
      verify: (bloc) {
        expect(bloc.state.status, FormzStatus.invalid);
        expect(bloc.state.word.value.isEmpty, true);
      },
    );

    blocTest<FormBloc, FormState>(
      '$FormSubmitted from invalid',
      build: FormBloc.new,
      act: (bloc) => bloc
        ..add(const FormChanged(word: invalidWord))
        ..add(const FormSubmitted()),
      skip: 1,
      expect: () => <TypeMatcher<FormState>>[isA<FormState>()],
      verify: (bloc) {
        expect(bloc.state.status, FormzStatus.invalid);
        expect(bloc.state.word.value.isEmpty, true);
      },
    );

    blocTest<FormBloc, FormState>(
      '$FormSubmitted from valid',
      build: FormBloc.new,
      act: (bloc) => bloc
        ..add(const FormChanged(word: validWord))
        ..add(const FormSubmitted()),
      skip: 1,
      verify: (bloc) {
        expect(bloc.state.status, FormzStatus.submissionSuccess);
        expect(bloc.state.word.value, validWord);
      },
    );
  });
}
