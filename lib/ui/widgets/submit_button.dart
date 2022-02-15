import 'package:flutter/material.dart' hide FormState;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../blocs/form_words_validation_bloc/form_bloc.dart';

class SubmitButton extends StatelessWidget {
  final String _label;
  final EdgeInsets _padding;

  const SubmitButton({
    EdgeInsets padding = const EdgeInsets.symmetric(vertical: 16),
    String label = 'Submit',
    Key? key,
  })  : _padding = padding,
        _label = label,
        super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<FormBloc, FormState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (_, state) => Padding(
          padding: _padding,
          child: ElevatedButton(
            onPressed: state.status.isValidated
                ? () => context.read<FormBloc>().add(const FormSubmitted())
                : null,
            child: Text(_label),
          ),
        ),
      );
}
