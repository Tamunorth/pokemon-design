import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:pokemon_repository/pokemon_repository.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';
part 'pokemon_bloc.freezed.dart';

class PokemonBloc extends HydratedBloc<PokemonEvent, PokemonState> {
  PokemonBloc(this._pokemonRepository) : super(const _Initial()) {
    on<_GetPokemons>(_getPokemons);
  }
  final PokemonRepository _pokemonRepository;

  Future<void> _getPokemons(
    PokemonEvent event,
    Emitter<PokemonState> emit,
  ) async {
    try {
      if (state is PokemonSuccess) {
        return;
      }
      emit(const PokemonState.loading());

      final pokemons = await _pokemonRepository.getPokemons();

      emit(PokemonState.success(pokemons: pokemons));
    } catch (e) {
      emit(const PokemonState.error(error: 'An Error Ocurred'));
    }
  }

  @override
  PokemonState? fromJson(Map<String, dynamic> json) {
    if (json.containsKey('pokemons')) {
      final pokemonJsonList = json['pokemons'] as List<dynamic>;
      final pokemons = pokemonJsonList
          .map(
            (pokemonJson) =>
                Pokemon.fromJson(pokemonJson as Map<String, dynamic>),
          )
          .toList();
      return PokemonState.success(pokemons: pokemons);
    }
    return null;
  }

  @override
  Map<String, dynamic>? toJson(PokemonState state) {
    if (state is PokemonSuccess) {
      return {
        'pokemons': [...state.pokemons.map((e) => e.toJson())]
      };
    }
    return null;
  }
}
