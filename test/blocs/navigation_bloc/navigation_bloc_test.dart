import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:word_validation/blocs/navigation_bloc/navigation_bloc.dart';

void main() {
  group('$NavigationBloc', () {
    test('initial state is ${NavigationState.first}', () {
      expect(NavigationBloc().state, NavigationState.first);
    });

    blocTest<NavigationBloc, NavigationState>(
      '${NavigationEvent.pop}',
      build: NavigationBloc.new,
      act: (bloc) => bloc.add(NavigationEvent.pop),
      expect: () => <TypeMatcher<NavigationState>>[isA<NavigationState>()],
      verify: (bloc) => expect(bloc.state, NavigationState.first),
    );

    blocTest<NavigationBloc, NavigationState>(
      '${NavigationEvent.push}',
      build: NavigationBloc.new,
      act: (bloc) => bloc.add(NavigationEvent.push),
      expect: () => <TypeMatcher<NavigationState>>[isA<NavigationState>()],
      verify: (bloc) => expect(bloc.state, NavigationState.second),
    );

    blocTest<NavigationBloc, NavigationState>(
      '${NavigationEvent.push} 2x',
      build: NavigationBloc.new,
      act: (bloc) => bloc
        ..add(NavigationEvent.push)
        ..add(NavigationEvent.push),
      skip: 1,
      expect: () => <TypeMatcher<NavigationState>>[isA<NavigationState>()],
      verify: (bloc) => expect(bloc.state, NavigationState.first),
    );
  });

  group('$NavigationState', () {
    test('length', () => expect(NavigationState.values.length, 2));
  });

  group('$NavigationEvent', () {
    test('length', () => expect(NavigationEvent.values.length, 2));
  });
}
