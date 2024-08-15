import 'package:anime_app/core/error/failures.dart';
import 'package:anime_app/core/network/api_client.dart';
import 'package:anime_app/features/anime/data/datasources/anime_remote_data_source.dart';
import 'package:anime_app/features/anime/data/models/anime_details_model.dart';
import 'package:anime_app/features/anime/data/models/anime_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AnimeRemoteDataSource)
class AnimeRemoteDataSourceImpl implements AnimeRemoteDataSource {
  const AnimeRemoteDataSourceImpl(this.client);

  final ApiClient client;

  @override
  Future<List<AnimeModel>> getAnimeList(int page) async {
    final response = await client.fetchAnimeList(page);
    if (response.isSuccessful && response.body != null) {
      final List<dynamic> animeListJson = response.body['data'];
      return animeListJson.map((json) => AnimeModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load anime list');
    }
  }

  @override
  Future<AnimeDetailsModel> getAnimeDetails(int animeId) async {
    final response = await client.fetchAnimeDetail(animeId);

    if (response.isSuccessful && response.body != null) {
      final animeDetails = AnimeDetailsModel.fromJson(response.body);
      return animeDetails;
    } else {
      throw ServerFailure();
    }
  }
}
