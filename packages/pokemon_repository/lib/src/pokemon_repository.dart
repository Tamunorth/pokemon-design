import 'package:pokemon_api/pokemon_api.dart';
import 'package:pokemon_repository/src/models/pokemon.dart';

class PokemonRepository {
  PokemonRepository({PokemonApiClient? pokemonClient})
      : _pokemonClient = pokemonClient ?? PokemonApiClient();

  final PokemonApiClient _pokemonClient;

  Future<List<Pokemon>> getPokemons() async {
    final pokemonModel = await _pokemonClient.getPokemons();

    return [
      ...pokemonModel.map((e) => Pokemon(
            name: e.name,
            id: e.id,
            url: e.imageUrl,
            types: [],
          ))
    ];
  }

  Future<List<Pokemon>> getPokemonsAlt() async {
    final pokemonModel = await _pokemonClient.getPokemons();

    final pokemWithTypes = await fetchPokemonTypesForList(
        pokemonModel.map((e) => int.parse(e.id)).toList());

    // Create Pokemon models with types
    final List<Pokemon> pokemons = pokemonModel.map((model) {
      final List<String> types = pokemWithTypes[int.parse(model.id)] ?? [];
      return Pokemon(
        name: model.name,
        id: model.id,
        url: model.url,
        types: types,
      );
    }).toList();

    return pokemons;
  }

  // Function to efficiently fetch types of Pokémon for a list of IDs
  Future<Map<int, List<String>>> fetchPokemonTypesForList(
      List<int> pokemonIds) async {
    // Split the list of IDs into chunks (e.g., chunks of 50 IDs each)
    final chunkSize = 50;
    final chunks = <List<int>>[];
    for (var i = 0; i < pokemonIds.length; i += chunkSize) {
      chunks.add(pokemonIds.sublist(
          i,
          i + chunkSize > pokemonIds.length
              ? pokemonIds.length
              : i + chunkSize));
    }

    // Fetch types for each chunk concurrently
    final List<Future<Map<int, List<String>>>> futures = [];
    for (final chunk in chunks) {
      futures.add(Future(() async {
        final Map<int, List<String>> chunkResult = {};
        for (final id in chunk) {
          final types = await _pokemonClient.getPokemonsTypes(id);
          chunkResult[id] = types;
        }
        return chunkResult;
      }));
    }

    // Wait for all chunks to complete and combine results
    final List<Map<int, List<String>>> results = await Future.wait(futures);
    final Map<int, List<String>> allPokemonTypes = {};
    for (final chunkResult in results) {
      allPokemonTypes.addAll(chunkResult);
    }
    return allPokemonTypes;
  }
}
