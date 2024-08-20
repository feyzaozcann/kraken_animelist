import 'package:anime_app/features/anime/domain/entities/anime.dart';
import 'package:equatable/equatable.dart';

abstract class AnimeListState extends Equatable {
  const AnimeListState();

  @override
  List<Object> get props => [];
}

class AnimeListInitial extends AnimeListState {}

class AnimeListLoading extends AnimeListState {
  const AnimeListLoading(
    this.oldList, {
    this.isFirstFetch = false,
  });

  final List<Anime> oldList;
  final bool isFirstFetch;

  @override
  List<Object> get props => [oldList];
}

class AnimeListLoaded extends AnimeListState {
  const AnimeListLoaded({
    required this.animeList,
    required this.currentPage,
    required this.hasReachedMax,
  });

  final List<Anime> animeList;
  final int currentPage;
  final bool hasReachedMax;

  @override
  List<Object> get props => [
        animeList,
        currentPage,
        hasReachedMax,
      ];
}

class AnimeListError extends AnimeListState {
  const AnimeListError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
