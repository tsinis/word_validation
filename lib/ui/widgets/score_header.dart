import 'package:flutter/material.dart' hide FormState;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/unique_words_list_bloc/list_bloc.dart';

class ScoreHeader extends StatelessWidget {
  final EdgeInsets _padding;

  const ScoreHeader({
    EdgeInsets padding = const EdgeInsets.all(8),
    Key? key,
  })  : _padding = padding,
        super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<ListBloc, ListState>(
        builder: (_, state) {
          final overallPoints = state.uniqueWords.join().length;

          return Padding(
            padding: _padding,
            child: Text(
              'Score: $overallPoints',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
          );
        },
      );
}
