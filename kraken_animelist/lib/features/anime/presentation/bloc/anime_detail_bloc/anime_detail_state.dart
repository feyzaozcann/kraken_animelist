import 'package:anime_app/features/anime/domain/entities/anime_details.dart';
import 'package:equatable/equatable.dart';

abstract class AnimeDetailsState extends Equatable {
  const AnimeDetailsState();

  @override
  List<Object?> get props => [];
}

class AnimeDetailsInitial extends AnimeDetailsState {}

class AnimeDetailsLoading extends AnimeDetailsState {}

class AnimeDetailsLoaded extends AnimeDetailsState {
  const AnimeDetailsLoaded({required this.animeDetails});

  final AnimeDetails animeDetails;

  @override
  List<Object?> get props => [animeDetails];
}

class AnimeDetailsError extends AnimeDetailsState {
  const AnimeDetailsError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
