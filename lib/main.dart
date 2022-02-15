import 'package:flutter/material.dart' hide FormState;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/form_words_validation_bloc/form_bloc.dart';
import 'blocs/navigation_bloc/navigation_bloc.dart';
import 'blocs/unique_words_list_bloc/list_bloc.dart';
import 'ui/widgets/navigator_wrapper.dart';

void main() => runApp(const Main());

class Main extends StatelessWidget {
  final String _title;
  const Main({String title = 'Words Validation', Key? key})
      : _title = title,
        super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: SafeArea(
          child: Scaffold(
            appBar: AppBar(title: Text(_title)),
            body: MultiBlocProvider(
              providers: [
                BlocProvider(create: (_) => NavigationBloc(), lazy: false),
                BlocProvider(create: (_) => FormBloc()),
                BlocProvider(create: (_) => ListBloc()),
              ],
              child: const NavigatorWrapper(),
            ),
          ),
        ),
      );
}
