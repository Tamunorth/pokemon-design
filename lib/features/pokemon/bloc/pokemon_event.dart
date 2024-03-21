part of 'pokemon_bloc.dart';

@freezed
class PokemonEvent with _$PokemonEvent {
  const factory PokemonEvent.started() = _Started;
  const factory PokemonEvent.getPokemons() = _GetPokemons;
  const factory PokemonEvent.searchPokemons() = _SearchPokemons;
}
