import 'package:anime_app/core/error/failures.dart';
import 'package:anime_app/features/anime/domain/entities/anime.dart';
import 'package:anime_app/features/anime/domain/repositories/anime_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetAnimeListUseCase {
  const GetAnimeListUseCase(this.repository);

  final AnimeRepository repository;

  Future<Either<Failure, List<Anime>>> call(int page) async {
    return repository.getAnimeList(page);
  }
}
