import 'package:flutter/material.dart' hide FormState;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/navigation_bloc/navigation_bloc.dart';
import '../../blocs/unique_words_list_bloc/list_bloc.dart';
import 'word_label.dart';

class WordsList extends StatelessWidget {
  final EdgeInsets _padding;
  final bool _isExtended;

  const WordsList({
    bool isExtended = false,
    EdgeInsets padding = const EdgeInsets.symmetric(
      vertical: 16,
      horizontal: 8,
    ),
    Key? key,
  })  : _isExtended = isExtended,
        _padding = padding,
        super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<ListBloc, ListState>(
        builder: (_, state) {
          final uniqueWords = state.uniqueWords;

          return Visibility(
            visible: uniqueWords.isNotEmpty,
            replacement: const Placeholder(color: Colors.transparent),
            child: Padding(
              padding: _padding,
              child: InkWell(
                onTap: () =>
                    context.read<NavigationBloc>().add(NavigationEvent.push),
                child: ListView.separated(
                  separatorBuilder: (_, __) => const Divider(),
                  itemCount: state.uniqueWords.length,
                  itemBuilder: (_, i) {
                    final word = uniqueWords.elementAt(i);

                    return WordLabel(
                      word: word,
                      isHighlighted: word == uniqueWords.first,
                      isExtended: _isExtended,
                    );
                  },
                ),
              ),
            ),
          );
        },
      );
}
