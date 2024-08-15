import 'package:anime_app/features/anime/domain/entities/anime.dart';
import 'package:anime_app/features/anime/presentation/bloc/anime_detail_bloc/anime_detail_bloc.dart';
import 'package:anime_app/features/anime/presentation/bloc/anime_detail_bloc/anime_detail_event.dart';
import 'package:anime_app/features/anime/presentation/bloc/anime_list_bloc/anime_list_bloc.dart';
import 'package:anime_app/features/anime/presentation/pages/anime_details_page.dart';
import 'package:anime_app/features/anime/presentation/pages/home_page.dart';
import 'package:anime_app/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Anime App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (_) => getIt<AnimeListBloc>()..add(const FetchAnimeList()),
        child: const HomePage(),
      ),
      onGenerateRoute: (settings) {
        if (settings.name == '/animeDetails') {
          final arguments = settings.arguments as Map<String, dynamic>;
          final anime = arguments['anime'] as Anime;

          return MaterialPageRoute(
            builder: (context) {
              return BlocProvider(
                create: (context) => getIt<AnimeDetailsBloc>()..add(GetAnimeDetailsEvent(animeId: anime.id)),
                child: AnimeDetailsPage(anime: anime),
              );
            },
          );
        }

        return null;
      },
    );
  }
}
