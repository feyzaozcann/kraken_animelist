import 'package:equatable/equatable.dart';
import 'package:anime_app/features/anime/domain/entities/anime.dart';

abstract class AnimeListState extends Equatable {
  const AnimeListState();

  @override
  List<Object> get props => [];
}

class AnimeListInitial extends AnimeListState {}

class AnimeListLoading extends AnimeListState {
  final List<Anime> oldList;
  final bool isFirstFetch;

  const AnimeListLoading(this.oldList, {this.isFirstFetch=false});

  @override
  List<Object> get props => [oldList];
}

class AnimeListLoaded extends AnimeListState {
  final List<Anime> animeList;
  final int currentPage;
  final bool hasReachedMax;

  const AnimeListLoaded({
    required this.animeList,
    required this.currentPage,
    required this.hasReachedMax,
  });

  @override
  List<Object> get props => [animeList, currentPage, hasReachedMax];
}

class AnimeListError extends AnimeListState {
  final String message;

  const AnimeListError({required this.message});

  @override
  List<Object> get props => [message];
}
