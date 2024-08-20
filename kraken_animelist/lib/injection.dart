import 'package:anime_app/core/network/api_client.dart';
import 'package:anime_app/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true, // default
  asExtension: false, // default
  ignoreUnregisteredTypes: [ApiClient],
)
void configureDependencies() => $initGetIt(getIt);
