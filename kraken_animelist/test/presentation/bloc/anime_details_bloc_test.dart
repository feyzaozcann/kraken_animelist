import 'package:anime_app/core/error/failures.dart';
import 'package:anime_app/features/anime/domain/entities/anime_details.dart';
import 'package:anime_app/features/anime/domain/entities/character.dart';
import 'package:anime_app/features/anime/presentation/bloc/anime_detail_bloc/anime_detail_bloc.dart';
import 'package:anime_app/features/anime/presentation/bloc/anime_detail_bloc/anime_detail_event.dart';
import 'package:anime_app/features/anime/presentation/bloc/anime_detail_bloc/anime_detail_state.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockGetAnimeDetailsUseCase mockGetAnimeDetailsUseCase;
  late AnimeDetailsBloc animeDetailsBloc;

  setUp(() {
    mockGetAnimeDetailsUseCase = MockGetAnimeDetailsUseCase();
    animeDetailsBloc = AnimeDetailsBloc(mockGetAnimeDetailsUseCase);
  });

  const testAnimeDetailEntity = AnimeDetails(
    character: [
      Character(
        name: 'Sakura Haruno',
        imageUrl: 'https://example.com/sakura.jpg',
      ),
      Character(
        name: 'Naruto Uzumaki',
        imageUrl: 'https://example.com/naruto.jpg',
      ),
      Character(
        name: 'Sasuke Uchiha',
        imageUrl: 'https://example.com/sasuke.jpg',
      ),
    ],
  );
  const testId = 1;

  blocTest(
    'should emit [AnimeDetailsLoading, AnimeDetailsLoaded] when data is gotten successfully',
    build: () {
      when(mockGetAnimeDetailsUseCase(any)).thenAnswer((_) async => const Right(testAnimeDetailEntity));
      return animeDetailsBloc;
    },
    act: (bloc) => bloc.add(const GetAnimeDetailsEvent(animeId: testId)),
    wait: const Duration(milliseconds: 200),
    expect: () => [
      AnimeDetailsLoading(),
      const AnimeDetailsLoaded(animeDetails: testAnimeDetailEntity),
    ],
  );

  blocTest<AnimeDetailsBloc, AnimeDetailsState>(
    'should emit [AnimeDetailsLoading, AnimeDetailsError] when getting data fails',
    build: () {
      when(mockGetAnimeDetailsUseCase(any)).thenAnswer((_) async => Left(ServerFailure()));
      return animeDetailsBloc;
    },
    act: (bloc) => bloc.add(const GetAnimeDetailsEvent(animeId: testId)),
    expect: () => [
      AnimeDetailsLoading(),
      const AnimeDetailsError('Failed to fetch anime details'),
    ],
  );
}
