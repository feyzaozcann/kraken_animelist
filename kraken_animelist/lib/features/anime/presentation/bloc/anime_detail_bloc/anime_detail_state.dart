import 'package:equatable/equatable.dart';
import 'package:anime_app/features/anime/domain/entities/anime_details.dart';

abstract class AnimeDetailsState extends Equatable {
  const AnimeDetailsState();

  @override
  List<Object?> get props => [];
}

class AnimeDetailsInitial extends AnimeDetailsState {}

class AnimeDetailsLoading extends AnimeDetailsState {}

class AnimeDetailsLoaded extends AnimeDetailsState {
  final AnimeDetails animeDetails;

  const AnimeDetailsLoaded({required this.animeDetails});

  @override
  List<Object?> get props => [animeDetails];
}


class AnimeDetailsError extends AnimeDetailsState {
  final String message;

  const AnimeDetailsError(this.message);

  @override
  List<Object?> get props => [message];
}
