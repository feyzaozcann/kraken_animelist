import 'package:equatable/equatable.dart';

abstract class AnimeDetailsEvent extends Equatable {
  const AnimeDetailsEvent();

  @override
  List<Object?> get props => [];
}

class GetAnimeDetailsEvent extends AnimeDetailsEvent {
  final int animeId;

  const GetAnimeDetailsEvent({required this.animeId});

  @override
  List<Object?> get props => [animeId];
}
