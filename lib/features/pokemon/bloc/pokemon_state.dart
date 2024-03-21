part of 'pokemon_bloc.dart';

@freezed
class PokemonState with _$PokemonState {
  const factory PokemonState.initial() = _Initial;
  const factory PokemonState.loading() = PokemonLoading;
  const factory PokemonState.success({required List<Pokemon> pokemons}) =
      PokemonSuccess;

  const factory PokemonState.error({required String error}) = _Error;
}
