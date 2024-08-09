
import 'package:anime_app/features/anime/data/datasources/anime_remote_data_source.dart';
import 'package:anime_app/features/anime/domain/repositories/anime_repository.dart';
import 'package:anime_app/features/anime/domain/usecases/get_anime_details.dart';
import 'package:anime_app/features/anime/domain/usecases/get_anime_list.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks(
  [
    AnimeRepository,
    AnimeRemoteDataSource,
    GetAnimeListUseCase,
    GetAnimeDetailsUseCase,

  ],
 
)
void main() {
  
}
