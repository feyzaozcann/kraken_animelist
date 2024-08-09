import 'package:anime_app/features/anime/data/models/anime_details_model.dart';
import 'package:anime_app/features/anime/data/models/anime_model.dart';

abstract class AnimeRemoteDataSource {
  Future<List<AnimeModel>> getAnimeList(int page);

  Future<AnimeDetailsModel> getAnimeDetails(int id);
}
