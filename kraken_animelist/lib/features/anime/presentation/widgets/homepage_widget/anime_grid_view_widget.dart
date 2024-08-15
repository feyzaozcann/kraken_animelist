import 'package:anime_app/features/anime/domain/entities/anime.dart';
import 'package:anime_app/features/anime/presentation/widgets/homepage_widget/anime_grid_item_widget.dart';
import 'package:flutter/material.dart';

class AnimeGridView extends StatelessWidget {
  const AnimeGridView({
    required this.scrollController,
    required this.animeList,
    required this.onTap,
    super.key,
  });

  final ScrollController scrollController;
  final List<Anime> animeList;
  final Function(Anime) onTap;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: scrollController,
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.7,
      ),
      itemCount: animeList.length,
      itemBuilder: (context, index) {
        final anime = animeList[index];
        return InkWell(
          onTap: () => onTap(anime),
          child: AnimeGridItem(anime: anime),
        );
      },
    );
  }
}
