import 'package:anime_app/features/anime/presentation/bloc/anime_list_bloc/anime_list_bloc.dart';
import 'package:anime_app/features/anime/presentation/bloc/anime_list_bloc/anime_list_state.dart';
import 'package:anime_app/features/anime/presentation/pages/home_page.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class MockAnimeListBloc extends MockBloc<AnimeListEvent, AnimeListState> implements AnimeListBloc {}

void main() {
  late MockAnimeListBloc mockAnimeListBloc;

  setUp(() {
    mockAnimeListBloc = MockAnimeListBloc();
  });

  Widget testWidget(Widget body) {
    return MaterialApp(
      home: BlocProvider<AnimeListBloc>(
        create: (context) => mockAnimeListBloc,
        child: body,
      ),
    );
  }

  testWidgets('should display loading indicator when state is AnimeListLoading with first fetch',
      (WidgetTester tester) async {
    whenListen(
      mockAnimeListBloc,
      Stream<AnimeListState>.fromIterable([
        const AnimeListLoading([], isFirstFetch: true),
      ]),
      initialState: const AnimeListLoading([], isFirstFetch: true),
    );

    await tester.pumpWidget(testWidget(const HomePage()));
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('should display error message when state is AnimeListError', (WidgetTester tester) async {
    whenListen(
      mockAnimeListBloc,
      Stream<AnimeListState>.fromIterable([
        const AnimeListError(message: 'Failed to load data'),
      ]),
      initialState: const AnimeListError(message: 'Failed to load data'),
    );

    await tester.pumpWidget(testWidget(const HomePage()));
    await tester.pump();

    expect(find.text('Failed to load data'), findsOneWidget);
  });
}
