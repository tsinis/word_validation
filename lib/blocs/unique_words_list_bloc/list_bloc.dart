import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/unique_words.dart';
import '../../repositories/words_repository.dart';

part 'list_event.dart';
part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  final WordsRepository _wordsRepository;

  ListBloc({WordsRepository? wordsRepository})
      : _wordsRepository = wordsRepository ?? WordsRepository(uniqueWords: {}),
        super(const ListInitial()) {
    on<WordAdded>(_onWordAdded);
  }

  void _onWordAdded(WordAdded event, Emitter<ListState> emit) {
    _wordsRepository.addWord(event._word);
    emit(ListFilled(uniqueWords: _wordsRepository.words));
  }
}
