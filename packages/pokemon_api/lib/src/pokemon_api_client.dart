import 'package:dio/dio.dart';
import 'package:logger/web.dart';
import 'package:pokemon_api/src/models/pokemon_list_model.dart';
import 'package:pokemon_api/src/url_config.dart';

final logger = Logger();

/// Exception thrown when PokemonRequest fails.
class PokemonRequestError implements Exception {}

class PokemonApiClient {
  final Dio _httpClient;

  ///Network call [connectTimeOut] time
  static const connectTimeOut = Duration(seconds: 30);

  ///Network call [receiveTimeOut] time

  static const receiveTimeOut = Duration(seconds: 30);

  PokemonApiClient({Dio? httpClient})
      : _httpClient = httpClient ??
            Dio(
              BaseOptions(
                connectTimeout: connectTimeOut,
                receiveTimeout: receiveTimeOut,
                baseUrl: UrlConfig.baseUrl,
              ),
            );

  Future<List<PokemonListModel>> getPokemons() async {
    final pokemonData =
        await _httpClient.get(UrlConfig.pokemon, queryParameters: {
      'limit': 500,
    });

    if (pokemonData.statusCode != 200) {
      throw PokemonRequestError();
    }

    final locationJson = pokemonData.data;
    // logger.i(locationJson);

    final results = locationJson['results'] as List;
    // logger.i(results.first);

    return results
        .map(
          (e) => PokemonListModel.fromJson(e),
        )
        .toList();
  }

  Future<List<String>> getPokemonsTypes(int id) async {
    final pokemonData = await _httpClient.get('${UrlConfig.pokemon}$id');

    if (pokemonData.statusCode != 200) {
      throw PokemonRequestError();
    }

    final pokemonJson = pokemonData.data;
    // logger.i(locationJson);

    final results = pokemonJson['types'] as List;
    // logger.i(results.first);

    final typeList = results.map((e) => e["type"]['name']).toList();

    return [...typeList.map((e) => e)];
  }
}
