import 'package:anime_app/core/error/failures.dart';
import 'package:anime_app/features/anime/data/models/anime_model.dart';
import 'package:anime_app/features/anime/domain/usecases/get_anime_list.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetAnimeListUseCase getAnimeListUseCase;
  late MockAnimeRepository mockAnimeRepository;

  setUp(() {
    mockAnimeRepository = MockAnimeRepository();
    getAnimeListUseCase = GetAnimeListUseCase(mockAnimeRepository);
  });

  const testAnime = AnimeModel(
    id: 1,
    imageUrl:
        'https://static.vecteezy.com/system/resources/thumbnails/033/662/051/small/cartoon-lofi-young-manga-style-girl-while-listening-to-music-in-the-rain-ai-generative-photo.jpg',
    title: 'Music in Rain',
    synopsis:
        'A heartwarming story of a young girl who finds solace in music during rainy days, capturing the essence of lofi vibes.',
    score: 8.5,
    episodes: 12,
    genres: ['Slice of Life', 'Music', 'Drama'],
    characters: [],
  );

  const testPage = 1;

  test(
    'should get anime list from the repository',
    () async {
      when(mockAnimeRepository.getAnimeList(testPage)).thenAnswer((_) async => const Right([testAnime]));

      final result = await getAnimeListUseCase.call(testPage);

      expect(result.isRight(), true);
    },
  );

  test('should return server failure when th repository fails', () async {
    when(mockAnimeRepository.getAnimeList(testPage)).thenAnswer((_) async => Left(ServerFailure()));

    final result = await getAnimeListUseCase.call(testPage);

    expect(result.isLeft(), true);
  });
}
