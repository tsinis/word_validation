import 'package:flutter/material.dart' hide FormState;
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../blocs/form_words_validation_bloc/form_bloc.dart';
import '../../services/word_validator.dart';

class WordInput extends StatefulWidget {
  final bool _autofocus;
  final int? _errorMaxLines;
  final String? _errorText;
  final int? _helperMaxLines;
  final String? _helperText;
  final EdgeInsets _padding;
  final String _filterPattern;

  const WordInput({
    String filterPattern = '[a-zA-Z]',
    bool autofocus = true,
    int? helperMaxLines = 1,
    int? errorMaxLines = 2,
    String? helperText = 'Please input word.',
    EdgeInsets padding = EdgeInsets.zero,
    String? errorText =
        '''The min. word length is ${WordValidator.shortestWord.length} and the max. length is ${WordValidator.longestWord.length}!''',
    Key? key,
  })  : _padding = padding,
        _autofocus = autofocus,
        _helperMaxLines = helperMaxLines,
        _errorMaxLines = errorMaxLines,
        _errorText = errorText,
        _filterPattern = filterPattern,
        _helperText = helperText,
        super(key: key);

  @override
  State<WordInput> createState() => _WordInputState();
}

class _WordInputState extends State<WordInput> {
  final _textEditingController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<FormBloc, FormState>(
        builder: (_, state) {
          if (state.status.isSubmissionSuccess) {
            _textEditingController.clear();
            FocusScope.of(context).requestFocus(_focusNode);
          }

          return Padding(
            padding: widget._padding,
            child: TextFormField(
              controller: _textEditingController,
              focusNode: _focusNode,
              autofocus: widget._autofocus,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(
                  RegExp(
                    widget._filterPattern,
                  ),
                ),
              ],
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                helperText: widget._helperText,
                helperMaxLines: widget._helperMaxLines,
                errorMaxLines: widget._errorMaxLines,
                errorText: state.word.invalid ? widget._errorText : null,
              ),
              onFieldSubmitted: (_) =>
                  context.read<FormBloc>().add(const FormSubmitted()),
              onChanged: (value) {
                context.read<FormBloc>().add(FormChanged(word: value));
              },
            ),
          );
        },
      );
}
