import 'package:anime_app/features/anime/domain/entities/anime.dart';
import 'package:anime_app/features/anime/presentation/widgets/anime_detail_widget/anime_detail_row_widget.dart';
import 'package:flutter/material.dart';

class AnimeInfo extends StatelessWidget {
  const AnimeInfo({
    required this.anime,
    super.key,
  });

  final Anime anime;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          anime.title,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          "Synopsis:",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          anime.synopsis,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        AnimeDetailRow(
          label: "Rating:",
          value: "${anime.score}",
          icon: Icons.star,
          iconColor: Colors.amber,
        ),
        const SizedBox(height: 16),
        AnimeDetailRow(
          label: "Genres:",
          value: anime.genres.join(', '),
        ),
        const SizedBox(height: 16),
        AnimeDetailRow(
          label: "Episodes:",
          value: "${anime.episodes}",
        ),
      ],
    );
  }
}
