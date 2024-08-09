import 'package:anime_app/core/network/api_client.dart';
import 'package:anime_app/features/anime/data/datasources/anime_remote_data_source_impl.dart';
import 'package:anime_app/features/anime/data/models/anime_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ApiClient apiClient;
  late AnimeRemoteDataSourceImpl animeRemoteDataSourceImpl;

  setUp(() {
    apiClient = ApiClient.create(); 
    animeRemoteDataSourceImpl = AnimeRemoteDataSourceImpl(apiClient);
  });

  const testPage = 1;

  test('should return a list of AnimeListModel from the real API', () async {
    final result = await animeRemoteDataSourceImpl.getAnimeList(testPage);

  
    expect(result, isA<List<AnimeModel>>());
    expect(result.isNotEmpty, true); 


    final firstAnime = result.first;
    expect(firstAnime.title.isNotEmpty, true); 
    expect(firstAnime.score > 0, true); 
    expect(firstAnime.synopsis.isNotEmpty, true); 
    expect(firstAnime.episodes > 0, true); 
  });
}
