part of 'list_bloc.dart';

abstract class ListEvent extends Equatable {
  @override
  List<Object> get props => [];

  const ListEvent();
}

class WordAdded extends ListEvent {
  final String _word;

  @override
  List<Object> get props => [_word];

  const WordAdded({required String word}) : _word = word;
}
