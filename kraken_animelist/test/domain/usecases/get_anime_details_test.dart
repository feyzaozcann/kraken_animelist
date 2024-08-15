import 'package:anime_app/core/error/failures.dart';
import 'package:anime_app/features/anime/data/models/anime_details_model.dart';
import 'package:anime_app/features/anime/domain/entities/character.dart';
import 'package:anime_app/features/anime/domain/usecases/get_anime_details.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetAnimeDetailsUseCase getAnimeDetailsUseCase;
  late MockAnimeRepository mockAnimeRepository;

  setUp(() {
    mockAnimeRepository = MockAnimeRepository();
    getAnimeDetailsUseCase = GetAnimeDetailsUseCase(mockAnimeRepository);
  });

  const testAnimeDetail = AnimeDetailsModel(
    character: [
      Character(
        name: 'Sakura Haruno',
        imageUrl: 'https://example.com/sakura.jpg',
      ),
    ],
  );

  const testId = 1;

  test('should get anime details from the repository', () async {
    when(mockAnimeRepository.getAnimeDetails(testId)).thenAnswer((_) async => const Right(testAnimeDetail));

    final result = await getAnimeDetailsUseCase.call(testId);

    expect(result.isRight(), true);
  });

  test('should return server failure when the repository fails', () async {
    when(mockAnimeRepository.getAnimeDetails(testId)).thenAnswer((_) async => Left(ServerFailure()));

    final result = await getAnimeDetailsUseCase.call(testId);

    expect(result.isLeft(), true);
  });
}
