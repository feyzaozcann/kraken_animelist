import 'package:anime_app/core/error/failures.dart';
import 'package:anime_app/features/anime/domain/entities/anime_details.dart';
import 'package:anime_app/features/anime/domain/repositories/anime_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetAnimeDetailsUseCase {
  const GetAnimeDetailsUseCase(this.repository);

  final AnimeRepository repository;

  Future<Either<Failure, AnimeDetails>> call(int animeId) async {
    final result = await repository.getAnimeDetails(animeId);

    return result;
  }
}
