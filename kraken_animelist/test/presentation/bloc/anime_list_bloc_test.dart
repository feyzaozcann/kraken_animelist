import 'package:anime_app/core/error/failures.dart';
import 'package:anime_app/features/anime/domain/entities/anime.dart';
import 'package:anime_app/features/anime/presentation/bloc/anime_list_bloc/anime_list_bloc.dart';
import 'package:anime_app/features/anime/presentation/bloc/anime_list_bloc/anime_list_state.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockGetAnimeListUseCase mockGetAnimeListUseCase;
  late AnimeListBloc animeListBloc;

  setUp(() {
    mockGetAnimeListUseCase = MockGetAnimeListUseCase();
    animeListBloc = AnimeListBloc(mockGetAnimeListUseCase);
  });

  const testAnime = Anime(
    id: 1,
    imageUrl: 'https://example.com/image.jpg',
    title: 'Test Anime',
    synopsis: 'A test anime synopsis',
    score: 8.0,
    episodes: 12,
    genres: ['Action', 'Adventure'],
    characters: [],
  );

  const testAnimeList = [testAnime];

  blocTest<AnimeListBloc, AnimeListState>(
    'should emit [AnimeListLoading, AnimeListLoaded] when data is gotten successfully',
    build: () {
      when(mockGetAnimeListUseCase(any)).thenAnswer((_) async => const Right(testAnimeList));
      return animeListBloc;
    },
    act: (bloc) => bloc.add(const FetchAnimeList()),
    wait: const Duration(milliseconds: 200),
    expect: () => [
      const AnimeListLoading([], isFirstFetch: true),
      const AnimeListLoaded(
        animeList: testAnimeList,
        currentPage: 2,
        hasReachedMax: false,
      ),
    ],
  );

  blocTest<AnimeListBloc, AnimeListState>(
    'should emit [AnimeListLoading, AnimeListError] when a server exception occurs',
    build: () {
      when(mockGetAnimeListUseCase(any)).thenAnswer((_) async => Left(ServerFailure()));
      return animeListBloc;
    },
    act: (bloc) => bloc.add(const FetchAnimeList()),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      const AnimeListLoading([], isFirstFetch: true),
      const AnimeListError(message: 'Failed to load anime list'),
    ],
  );
}
