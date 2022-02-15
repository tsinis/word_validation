part of 'list_bloc.dart';

abstract class ListState extends Equatable {
  final UniqueWords _uniqueWords;

  UniqueWords get uniqueWords => _uniqueWords;

  @override
  List<Object> get props => [_uniqueWords];

  const ListState(UniqueWords uniqueWords) : _uniqueWords = uniqueWords;
}

class ListInitial extends ListState {
  const ListInitial() : super(const {});
}

class ListFilled extends ListState {
  const ListFilled({required UniqueWords uniqueWords}) : super(uniqueWords);
}
