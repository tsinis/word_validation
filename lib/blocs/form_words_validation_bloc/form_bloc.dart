import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../services/word_validator.dart';

part 'form_event.dart';
part 'form_state.dart';

class FormBloc extends Bloc<FormEvent, FormState> {
  FormBloc() : super(const FormState()) {
    on<FormChanged>(_onWordChanged);
    on<FormSubmitted>(_onFormSubmitted);
  }

  void _onWordChanged(FormChanged event, Emitter<FormState> emit) {
    final word = WordValidator.dirty(event._word);
    emit(
      state.copyWith(
        word: word.valid ? word : WordValidator.pure(event._word),
        status: Formz.validate([word]),
      ),
    );
  }

  void _onFormSubmitted(FormEvent _, Emitter<FormState> emit) {
    final word = WordValidator.dirty(state.word.value);
    emit(state.copyWith(word: word, status: Formz.validate([word])));

    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    }
  }
}
