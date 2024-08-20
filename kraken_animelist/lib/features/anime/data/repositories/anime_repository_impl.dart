import 'package:anime_app/features/anime/data/models/anime_model.dart';
import 'package:anime_app/features/anime/domain/entities/anime_details.dart';
import 'package:dartz/dartz.dart';
import 'package:anime_app/core/error/failures.dart';
import 'package:anime_app/features/anime/domain/repositories/anime_repository.dart';
import 'package:anime_app/features/anime/data/datasources/anime_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AnimeRepository)
class AnimeRepositoryImpl implements AnimeRepository {
  final AnimeRemoteDataSource remoteDataSource;

  AnimeRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<AnimeModel>>> getAnimeList(int page) async {
    try {
      final animeModelList = await remoteDataSource.getAnimeList(page);
      return Right(animeModelList);
    } catch (error) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, AnimeDetails>> getAnimeDetails(int animeId) async {
    try {
      final animeDetailsModel = await remoteDataSource.getAnimeDetails(animeId);
      return Right(animeDetailsModel);
    } catch (error) {
      return Left(ServerFailure());
    }
  }
}
