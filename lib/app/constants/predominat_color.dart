import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:palette_generator/palette_generator.dart';

Future<List<Color>?> retrievePredominantColorsFromSVG(
  String url,
) async {
  final paletteGenerator = await PaletteGenerator.fromImageProvider(
    Svg(
      url,
      source: SvgSource.network,
    ),
  );

  if (paletteGenerator.colors.isNotEmpty) {
    return [
      paletteGenerator.dominantColor!.color,
      paletteGenerator.darkMutedColor!.color,
    ];
  }
  return null;
}
