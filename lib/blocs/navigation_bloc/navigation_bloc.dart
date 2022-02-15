import 'package:bloc/bloc.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState.first) {
    on<NavigationEvent>(_onNavigate);
  }

  void _onNavigate(NavigationEvent event, Emitter<NavigationState> emit) {
    switch (event) {
      case NavigationEvent.push:
        emit(
          state == NavigationState.second
              ? NavigationState.first
              : NavigationState.second,
        );
        break;
      case NavigationEvent.pop:
        emit(NavigationState.first);
        break;
    }
  }
}

enum NavigationEvent { push, pop }
enum NavigationState { first, second }
