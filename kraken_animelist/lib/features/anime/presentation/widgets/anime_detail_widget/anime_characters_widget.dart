import 'package:anime_app/features/anime/presentation/bloc/anime_detail_bloc/anime_detail_bloc.dart';
import 'package:anime_app/features/anime/presentation/bloc/anime_detail_bloc/anime_detail_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimeCharacters extends StatelessWidget {
  const AnimeCharacters({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimeDetailsBloc, AnimeDetailsState>(
      builder: (context, state) {
        if (state is AnimeDetailsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is AnimeDetailsLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Characters",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              ...state.animeDetails.character.map((character) {
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      character.imageUrl,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.broken_image, size: 50, color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                  title: Text(
                    character.name,
                    style: const TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                );
              }),
            ],
          );
        } else if (state is AnimeDetailsError) {
          return Center(child: Text(state.message, style: const TextStyle(color: Colors.red)));
        } else {
          return const Center(
            child: Text(
              "No characters available.",
              style: TextStyle(color: Colors.black87),
            ),
          );
        }
      },
    );
  }
}
