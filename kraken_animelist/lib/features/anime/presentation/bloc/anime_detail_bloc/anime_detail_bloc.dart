import 'package:anime_app/features/anime/domain/usecases/get_anime_details.dart';
import 'package:anime_app/features/anime/presentation/bloc/anime_detail_bloc/anime_detail_event.dart';
import 'package:anime_app/features/anime/presentation/bloc/anime_detail_bloc/anime_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class AnimeDetailsBloc extends Bloc<AnimeDetailsEvent, AnimeDetailsState> {
  final GetAnimeDetailsUseCase getAnimeDetails;

  AnimeDetailsBloc(this.getAnimeDetails) : super(AnimeDetailsInitial()) {
    on<GetAnimeDetailsEvent>((event, emit) async {
      emit(AnimeDetailsLoading());

      final failureOrAnimeDetails = await getAnimeDetails(event.animeId);

      failureOrAnimeDetails.fold(
        (failure) => emit(const AnimeDetailsError('Failed to fetch anime details')),
        (animeDetails) => emit(AnimeDetailsLoaded(animeDetails: animeDetails)),
      );
    });
  }
}
