import 'package:anime_app/features/anime/domain/entities/anime.dart';




class AnimeModel extends Anime {
  const AnimeModel({
    required super.id,
    required super.title,
    required super.imageUrl,
    required super.score,
    required super.synopsis,
    required super.episodes,
    required super.genres,
    required super.characters
  });
  


  factory AnimeModel.fromJson(Map<String, dynamic> json) {
    return AnimeModel(
      id: json['mal_id'] ?? 0, 
      title: json['title'] ?? 'Unknown Title', 
      imageUrl: (json['images'] != null && json['images']['jpg'] != null)
          ? json['images']['jpg']['image_url'] ?? ''
          : '', 
      score: (json['score'] != null) ? (json['score'] as num).toDouble() : 0.0,
      synopsis: json['synopsis'] ?? '', 
      episodes: json['episodes'] ?? 0, 
      genres: (json['genres'] != null)
          ? (json['genres'] as List<dynamic>).map((genre) => genre['name'] as String).toList()
          : [], 
      characters: const [],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'mal_id': id,
      'title': title,
      'images': {'jpg': {'image_url': imageUrl}},
      'score': score,
      'synopsis': synopsis,
      'episodes': episodes,
      'genres': genres.map((genre) => {'name': genre}).toList(),
      'characters': characters
    };
  }
}
