// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'app_modules.dart' as _i110;
import 'core/network/api_client.dart' as _i871;
import 'features/anime/data/datasources/anime_remote_data_source.dart' as _i910;
import 'features/anime/data/datasources/anime_remote_data_source_impl.dart'
    as _i983;
import 'features/anime/data/repositories/anime_repository_impl.dart' as _i73;
import 'features/anime/domain/repositories/anime_repository.dart' as _i746;
import 'features/anime/domain/usecases/get_anime_details.dart' as _i633;
import 'features/anime/domain/usecases/get_anime_list.dart' as _i586;
import 'features/anime/presentation/bloc/anime_detail_bloc/anime_detail_bloc.dart'
    as _i145;
import 'features/anime/presentation/bloc/anime_list_bloc/anime_list_bloc.dart'
    as _i951;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appModules = _$AppModules();
  gh.lazySingleton<_i871.ApiClient>(() => appModules.apiClient);
  gh.factory<_i910.AnimeRemoteDataSource>(
      () => _i983.AnimeRemoteDataSourceImpl(gh<_i871.ApiClient>()));
  gh.factory<_i746.AnimeRepository>(
      () => _i73.AnimeRepositoryImpl(gh<_i910.AnimeRemoteDataSource>()));
  gh.factory<_i586.GetAnimeListUseCase>(
      () => _i586.GetAnimeListUseCase(gh<_i746.AnimeRepository>()));
  gh.factory<_i633.GetAnimeDetailsUseCase>(
      () => _i633.GetAnimeDetailsUseCase(gh<_i746.AnimeRepository>()));
  gh.factory<_i145.AnimeDetailsBloc>(
      () => _i145.AnimeDetailsBloc(gh<_i633.GetAnimeDetailsUseCase>()));
  gh.factory<_i951.AnimeListBloc>(
      () => _i951.AnimeListBloc(gh<_i586.GetAnimeListUseCase>()));
  return getIt;
}

class _$AppModules extends _i110.AppModules {}
