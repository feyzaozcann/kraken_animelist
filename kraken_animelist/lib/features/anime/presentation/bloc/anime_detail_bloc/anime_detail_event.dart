import 'package:equatable/equatable.dart';

abstract class AnimeDetailsEvent extends Equatable {
  const AnimeDetailsEvent();

  @override
  List<Object?> get props => [];
}

class GetAnimeDetailsEvent extends AnimeDetailsEvent {
  const GetAnimeDetailsEvent({required this.animeId});

  final int animeId;

  @override
  List<Object?> get props => [animeId];
}
