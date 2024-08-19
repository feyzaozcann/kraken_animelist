import 'package:anime_app/features/anime/domain/entities/anime.dart';
import 'package:anime_app/features/anime/domain/usecases/get_anime_list.dart';
import 'package:anime_app/features/anime/presentation/bloc/anime_list_bloc/anime_list_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'anime_list_event.dart';

@Injectable()
class AnimeListBloc extends Bloc<AnimeListEvent, AnimeListState> {
  AnimeListBloc(this.getAnimeListUseCase) : super(AnimeListInitial()) {
    scrollController.addListener(_onScroll);
    on<FetchAnimeList>(_onFetchAnimeList);
  }

  final GetAnimeListUseCase getAnimeListUseCase;
  final ScrollController scrollController = ScrollController();
  int _currentPage = 1;
  bool hasReachedMax = false;

  void _onScroll() {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      add(const FetchAnimeList());
    }
  }

  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }

  Future<void> _onFetchAnimeList(FetchAnimeList event, Emitter<AnimeListState> emit) async {
    if (hasReachedMax) return;

    try {
      final currentState = state;

      var oldList = <Anime>[];
      if (currentState is AnimeListLoaded) {
        oldList = currentState.animeList;
      }

      emit(AnimeListLoading(oldList, isFirstFetch: _currentPage == 1));

      final getAnimeListResult = await getAnimeListUseCase(_currentPage);

      getAnimeListResult.fold(
        (failure) => emit(const AnimeListError(message: 'Failed to load anime list')),
        (animeList) {
          if (animeList.isEmpty) {
            hasReachedMax = true;
          } else {
            final updatedList = List<Anime>.from(oldList)..addAll(animeList);
            _currentPage += 1;

            emit(
              AnimeListLoaded(
                animeList: updatedList,
                currentPage: _currentPage,
                hasReachedMax: hasReachedMax,
              ),
            );
          }
        },
      );
    } catch (e) {
      emit(AnimeListError(message: e.toString()));
    }
  }
}
