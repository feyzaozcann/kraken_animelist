import 'package:anime_app/features/anime/domain/entities/anime.dart';
import 'package:anime_app/features/anime/presentation/widgets/anime_detail_widget/anime_characters_widget.dart';
import 'package:anime_app/features/anime/presentation/widgets/anime_detail_widget/anime_info_widget.dart';
import 'package:flutter/material.dart';

class AnimeDetailsPage extends StatelessWidget {
  const AnimeDetailsPage({
    required this.anime,
    super.key,
  });

  final Anime anime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                anime.imageUrl,
                fit: BoxFit.contain,
                width: double.infinity,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimeInfo(anime: anime),
                  const SizedBox(height: 24),
                  const AnimeCharacters(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
