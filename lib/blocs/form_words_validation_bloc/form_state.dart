part of 'form_bloc.dart';

class FormState extends Equatable {
  final WordValidator _word;
  final FormzStatus _status;

  WordValidator get word => _word;
  FormzStatus get status => _status;

  @override
  List<Object> get props => [_word, _status];

  const FormState({
    WordValidator word = const WordValidator.pure(),
    FormzStatus status = FormzStatus.pure,
  })  : _word = word,
        _status = status;

  const FormState.clear()
      : _word = const WordValidator.pure(),
        _status = FormzStatus.pure;

  FormState copyWith({WordValidator? word, FormzStatus? status}) =>
      FormState(word: word ?? _word, status: status ?? _status);
}
