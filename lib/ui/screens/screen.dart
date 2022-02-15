import 'package:flutter/material.dart' hide FormState;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../blocs/form_words_validation_bloc/form_bloc.dart';
import '../../../blocs/unique_words_list_bloc/list_bloc.dart';
import '../widgets/score_header.dart';
import '../widgets/submit_button.dart';
import '../widgets/word_input.dart';
import '../widgets/words_list.dart';

class Screen extends StatelessWidget {
  static const _kDefaultPadding = EdgeInsets.all(16);

  final List<Widget> _children;
  final EdgeInsets _padding;

  const Screen.first({
    EdgeInsets padding = _kDefaultPadding,
    Key? key,
  })  : _children = const [
          Flexible(child: WordsList()),
          WordInput(),
          SubmitButton(),
        ],
        _padding = padding,
        super(key: key);

  const Screen.second({
    EdgeInsets padding = _kDefaultPadding,
    Key? key,
  })  : _children = const [
          ScoreHeader(),
          Flexible(child: WordsList(isExtended: true)),
        ],
        _padding = padding,
        super(key: key);

  @override
  Widget build(BuildContext context) => BlocListener<FormBloc, FormState>(
        listener: (_, state) {
          if (state.status.isSubmissionInProgress) {
            context.read<ListBloc>().add(WordAdded(word: state.word.value));
          }
        },
        child: Padding(
          padding: _padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: _children,
          ),
        ),
      );
}
