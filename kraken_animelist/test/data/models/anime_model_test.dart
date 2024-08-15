import 'dart:convert';

import 'package:anime_app/features/anime/data/models/anime_model.dart';
import 'package:anime_app/features/anime/domain/entities/anime.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/dummy_data/json_reader.dart';

void main() {
  const testAnimeModel = AnimeModel(
    id: 2,
    imageUrl: 'https://example.com/some-other-image.jpg',
    title: 'Adventure in the Mountains',
    synopsis:
        'A thrilling story of a group of friends who embark on an unexpected adventure in the mountains, facing challenges and discovering new friendships.', // Different Synopsis
    score: 9.0,
    episodes: 24,
    genres: ['Adventure', 'Drama'],
    characters: [],
  );

  test('should be a subclass of anime entity', () async {
    expect(testAnimeModel, isA<Anime>());
  });

  test('should return a valid model from json', () async {
    final List<dynamic> jsonList = json.decode(readJson('helpers/dummy_data/dummy_anime_response.json'));

    final singleAnimeJson = jsonList.first;

    final result = AnimeModel.fromJson(singleAnimeJson);

    expect(result, equals(isA<AnimeModel>()));
  });

  test('should return a json map containing proper data', () async {
    final result = testAnimeModel.toJson();

    final expectedJsonMap = {
      "mal_id": 2,
      "title": "Adventure in the Mountains",
      "images": {
        "jpg": {"image_url": "https://example.com/some-other-image.jpg"},
      },
      "score": 9.0,
      "synopsis":
          "A thrilling story of a group of friends who embark on an unexpected adventure in the mountains, facing challenges and discovering new friendships.",
      "episodes": 24,
      "genres": [
        {"name": "Adventure"},
        {"name": "Drama"},
      ],
      "characters": [],
    };

    expect(result, equals(expectedJsonMap));
  });
}
