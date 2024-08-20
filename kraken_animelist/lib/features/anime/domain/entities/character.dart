import 'package:equatable/equatable.dart';

class Character extends Equatable {
  final String name;
  final String imageUrl;

  const Character({
    required this.name,
    required this.imageUrl,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['character']['name'] as String,
      imageUrl: json['character']['images']['jpg']['image_url'] as String,
    );
  }

  @override
  List<Object?> get props => [name, imageUrl];
}
