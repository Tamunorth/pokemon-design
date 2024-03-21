import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokemon_api/pokemon_api.dart';

part 'pokemon_list_model.freezed.dart';
part 'pokemon_list_model.g.dart';

@freezed
class PokemonListModel with _$PokemonListModel {
  const PokemonListModel._();
  factory PokemonListModel({
    required String name,
    required String url,
  }) = _PokemonListModel;

  factory PokemonListModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonListModelFromJson(json);

  // Add a getter method to return the last character of the URL
  String get id {
    final segments = url.split('/');

    // logger.e(segments[segments.length - 2]);

    return segments[segments.length - 2];
  }

  // Add a getter method to return the imageUrl
  String get imageUrl {
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/$id.svg';
  }
}
