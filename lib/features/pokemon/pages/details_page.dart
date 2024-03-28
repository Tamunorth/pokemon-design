import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pokebook/app/widgets/widgets.dart';
import 'package:pokebook/features/pokemon/bloc/pokemon_bloc.dart';
import 'package:pokebook/gen/assets.gen.dart';
import 'package:pokemon_repository/pokemon_repository.dart';
import 'package:pokebook/app/constants/custom_extensions.dart';

import '../../../app/constants/predominat_color.dart';

class DetailsPage extends HookWidget {
  const DetailsPage({required this.pokemon, super.key});

  final Pokemon pokemon;

  static const double bottomOverflow = 65;
  List<Color>? usePredominantColorsFromSVG(String url) {
    final predominantColors = useState<List<Color>?>([]);

    useEffect(
      () {
        retrievePredominantColorsFromSVG(url).then((colors) {
          predominantColors.value = colors;
        }).catchError((error) {});

        return null;
      },
      [url],
    );

    return predominantColors.value ?? [];
  }

  @override
  Widget build(BuildContext context) {
    // print(predominantColors);
    final predominantColors = usePredominantColorsFromSVG(
      pokemon.url,
    );
    return Scaffold(
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (state is PokemonSuccess) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          gradient: LinearGradient(
                            colors: (predominantColors != null &&
                                    predominantColors.isNotEmpty)
                                ? predominantColors
                                : [
                                    context.theme.hintColor.withOpacity(0.5),
                                    context.theme.hintColor,
                                  ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(24),
                          ),
                        ),
                        height: MediaQuery.sizeOf(context).height * 0.35,
                        width: double.infinity,
                        child: GestureDetector(
                          onTap: () => context.pop(),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              margin: const EdgeInsets.only(
                                top: kToolbarHeight,
                                left: 20,
                              ),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Icon(
                                Icons.arrow_back,
                                size: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -bottomOverflow,
                        left: 0,
                        right: 0,
                        child: Hero(
                          tag: ValueKey('pokemon-${pokemon.id}'),
                          child: Align(
                            child: SvgPicture.network(
                              pokemon.url,
                              width: 250,
                              height: 250,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap.h(30 + bottomOverflow),
                  Column(
                    children: [
                      Text(
                        'chirizard',
                        style: context.textTheme.headlineLarge
                            ?.copyWith(fontSize: 56),
                      ),
                      const Gap.h(11),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          2,
                          (index) => Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 16,
                            ),
                            margin: const EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  context.theme.colorScheme.secondaryContainer,
                              borderRadius: BorderRadius.circular(53),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('🦋 Flying'),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          }

          return Text('Error');
        },
      ),
    );
  }
}
