import 'package:anime_app/features/anime/domain/entities/character.dart';
import 'package:equatable/equatable.dart';

class AnimeDetails extends Equatable {
  final List<Character> character;

  const AnimeDetails({

    required this.character,
  });

  @override
  List<Object?> get props => [character];
}
