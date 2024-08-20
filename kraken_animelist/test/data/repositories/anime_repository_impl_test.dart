import 'package:anime_app/features/anime/data/models/anime_model.dart';
import 'package:anime_app/features/anime/data/repositories/anime_repository_impl.dart';
import 'package:anime_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockAnimeRemoteDataSource mockAnimeRemoteDataSource;
  late AnimeRepositoryImpl animeRepositoryImpl;

  setUp(() {
    mockAnimeRemoteDataSource = MockAnimeRemoteDataSource();
    animeRepositoryImpl = AnimeRepositoryImpl(
      mockAnimeRemoteDataSource,
    );
  });

  const testAnimeModel = AnimeModel(
    id: 2,
    imageUrl: 'https://example.com/some-other-image.jpg',
    title: 'Adventure in the Mountains',
    synopsis:
        'A thrilling story of a group of friends who embark on an unexpected adventure in the mountains, facing challenges and discovering new friendships.',
    score: 9.0,
    episodes: 24,
    genres: ['Adventure', 'Drama'],
    characters: [],
  );

  group('getAnimeList', () {
    const testPage = 1;

test('should return list of anime models when the call is successful', () async {

  when(mockAnimeRemoteDataSource.getAnimeList(testPage))
      .thenAnswer((_) async => [testAnimeModel]);

  final result = await animeRepositoryImpl.getAnimeList(testPage);

  verify(mockAnimeRemoteDataSource.getAnimeList(testPage));
  expect(result.toString(), const Right<Failure, List<AnimeModel>>([testAnimeModel]).toString());
});

    test('should return server failure when the call is unsuccessful', () async {
    
      when(mockAnimeRemoteDataSource.getAnimeList(testPage)).thenThrow(Exception());

      final result = await animeRepositoryImpl.getAnimeList(testPage);

      verify(mockAnimeRemoteDataSource.getAnimeList(testPage));
      expect(result, equals(Left<Failure, List<AnimeModel>>(ServerFailure())));
    });
  });
}
