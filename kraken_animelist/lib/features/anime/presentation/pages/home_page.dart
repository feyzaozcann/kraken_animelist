import 'package:anime_app/features/anime/domain/entities/anime.dart';
import 'package:anime_app/features/anime/domain/usecases/get_anime_details.dart';
import 'package:anime_app/features/anime/presentation/bloc/anime_detail_bloc/anime_detail_bloc.dart';
import 'package:anime_app/features/anime/presentation/bloc/anime_detail_bloc/anime_detail_event.dart';
import 'package:anime_app/features/anime/presentation/bloc/anime_list_bloc/anime_list_bloc.dart';
import 'package:anime_app/features/anime/presentation/bloc/anime_list_bloc/anime_list_state.dart';
import 'package:anime_app/features/anime/presentation/pages/anime_details_page.dart';
import 'package:anime_app/features/anime/presentation/widgets/homepage_widget/anime_grid_view_widget.dart';
import 'package:anime_app/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = context.read<AnimeListBloc>().scrollController;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kraken Anime'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 171, 187, 231),
        elevation: 0,
      ),
      body: BlocBuilder<AnimeListBloc, AnimeListState>(
        buildWhen: (previous, current) =>
            current is AnimeListLoaded || current is AnimeListError || current is AnimeListLoading,
        builder: (context, state) {
          if (state is AnimeListLoading && state.isFirstFetch) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AnimeListLoaded || (state is AnimeListLoading && state.oldList.isNotEmpty)) {
            final animeList = (state is AnimeListLoaded) ? state.animeList : (state as AnimeListLoading).oldList;

            return Column(
              children: [
                Expanded(
                  child: AnimeGridView(
                    scrollController: scrollController,
                    animeList: animeList,
                    onAnimeTapped: (anime) async => onTap(context, anime),
                  ),
                ),
                if (state is AnimeListLoading && !state.isFirstFetch)
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: CircularProgressIndicator(),
                  ),
              ],
            );
          } else if (state is AnimeListError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text("Could not fetch data!"));
          }
        },
      ),
    );
  }

  Future<void> onTap(BuildContext context, Anime animeItem) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) =>
              AnimeDetailsBloc(getIt<GetAnimeDetailsUseCase>())..add(GetAnimeDetailsEvent(animeId: animeItem.id)),
          child: AnimeDetailsPage(anime: animeItem),
        ),
      ),
    );
  }
}
