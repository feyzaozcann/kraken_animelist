import 'package:chopper/chopper.dart';


part 'api_client.chopper.dart';

@ChopperApi()
abstract class ApiClient extends ChopperService {
  @Get(path: 'top/anime?limit=20')
  Future<Response> fetchAnimeList(@Query('page') int page);

  @Get(path: 'anime/{id}/characters')
  Future<Response> fetchAnimeDetail(@Path('id') int id);

  static ApiClient create() {
    final client = ChopperClient(
      baseUrl: Uri.parse('https://api.jikan.moe/v4/'),
      services: [
        _$ApiClient(),
      ],
      converter: const JsonConverter(),
    );
    return _$ApiClient(client);
  }
}
