import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:word_validation/blocs/unique_words_list_bloc/list_bloc.dart';
import 'package:word_validation/repositories/words_repository.dart';

import '../../constants.dart';

void main() {
  group('$ListBloc', () {
    test('initial state is $ListInitial', () {
      expect(ListBloc().state, const ListInitial());
    });

    blocTest<ListBloc, ListState>(
      'with non empty $WordsRepository',
      build: () => ListBloc(
        wordsRepository: WordsRepository(uniqueWords: {validWord}),
      ),
      act: (bloc) => bloc.add(const WordAdded(word: invalidWord)),
      expect: () => <TypeMatcher<ListState>>[isA<ListState>()],
      verify: (bloc) => expect(
        bloc.state,
        const ListFilled(uniqueWords: {validWord, invalidWord}),
      ),
    );

    blocTest<ListBloc, ListState>(
      '$WordAdded',
      build: ListBloc.new,
      act: (bloc) => bloc.add(const WordAdded(word: validWord)),
      expect: () => <TypeMatcher<ListState>>[isA<ListState>()],
      verify: (bloc) => expect(
        bloc.state,
        const ListFilled(uniqueWords: {validWord}),
      ),
    );
  });
}
