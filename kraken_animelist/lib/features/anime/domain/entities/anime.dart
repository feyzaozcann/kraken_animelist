import 'package:equatable/equatable.dart';

class Anime extends Equatable {
  const Anime({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.score,
    required this.synopsis,
    required this.episodes,
    required this.genres,
    required this.characters,
  });

  final int id;
  final String title;
  final String imageUrl;
  final double score;
  final String synopsis;
  final int episodes;
  final List<String> genres;
  final List<String> characters;

  @override
  List<Object?> get props => [
        id,
        title,
        imageUrl,
        score,
        synopsis,
        episodes,
        genres,
        characters,
      ];
}
