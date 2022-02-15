import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/navigation_bloc/navigation_bloc.dart';
import '../screens/screen.dart';

class NavigatorWrapper extends StatelessWidget {
  const NavigatorWrapper({Key? key}) : super(key: key);

  @override
  // ignore: lines_longer_than_80_chars
  Widget build(BuildContext context) => BlocBuilder<NavigationBloc, NavigationState>(
        builder: (_, state) => Navigator(
          pages: [
            if (state == NavigationState.first)
              const MaterialPage<void>(child: Screen.first())
            else
              const MaterialPage<void>(child: Screen.second()),
          ],
          // ignore: avoid_annotating_with_dynamic, avoid-dynamic
          onPopPage: (_, dynamic __) {
            context.read<NavigationBloc>().add(NavigationEvent.pop);

            return false;
          },
        ),
      );
}
