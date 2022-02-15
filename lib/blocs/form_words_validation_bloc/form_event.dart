part of 'form_bloc.dart';

abstract class FormEvent extends Equatable {
  @override
  List<Object> get props => [];

  const FormEvent();
}

class FormChanged extends FormEvent {
  final String _word;

  @override
  List<Object> get props => [_word];

  const FormChanged({required String word}) : _word = word;
}

class FormSubmitted extends FormEvent {
  const FormSubmitted();
}
