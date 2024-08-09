import 'package:anime_app/core/network/api_client.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModules {
  @LazySingleton()
  ApiClient get apiClient => ApiClient.create();


}
