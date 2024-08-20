import 'package:anime_app/core/error/failures.dart';
import 'package:anime_app/features/anime/domain/entities/anime_details.dart';
import 'package:anime_app/features/anime/domain/entities/character.dart';

class AnimeDetailsModel extends AnimeDetails {
  const AnimeDetailsModel({required super.character});

  factory AnimeDetailsModel.fromJson(Map<String, dynamic> json) {
    try {
      final charactersJson = json['data'] as List<dynamic>?;
      final characters = charactersJson?.map((characterJson) {
            final characterImages = characterJson['character']['images']?['jpg']?['image_url'] as String? ??
                'https://via.placeholder.com/150';

            return Character(
              name: characterJson['character']['name'] as String,
              imageUrl: characterImages,
            );
          }).toList() ??
          [];

      return AnimeDetailsModel(character: characters);
    } catch (error) {
      throw ServerFailure();
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'characters': character
          .map(
            (character) => {
              'name': character.name,
              'images': {
                'jpg': {
                  'image_url': character.imageUrl,
                },
              },
            },
          )
          .toList(),
    };
  }
}
