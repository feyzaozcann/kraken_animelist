import 'package:anime_app/core/error/failures.dart';
import 'package:anime_app/features/anime/data/models/anime_model.dart';
import 'package:anime_app/features/anime/domain/entities/anime_details.dart';
import 'package:dartz/dartz.dart';

abstract class AnimeRepository {
  Future<Either<Failure, List<AnimeModel>>> getAnimeList(int page);
  Future<Either<Failure, AnimeDetails>> getAnimeDetails(int animeId);
}
