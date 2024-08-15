import 'package:anime_app/features/anime/domain/entities/character.dart';
import 'package:equatable/equatable.dart';

class AnimeDetails extends Equatable {
  const AnimeDetails({required this.character});

  final List<Character> character;

  @override
  List<Object?> get props => [character];
}
