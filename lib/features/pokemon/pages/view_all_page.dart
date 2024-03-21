// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:pokebook/app/constants/custom_extensions.dart';
import 'package:pokebook/app/navigation/page_url.dart';
import 'package:pokebook/features/pokemon/bloc/pokemon_bloc.dart';
import 'package:pokebook/gen/assets.gen.dart';
import 'package:pokebook/l10n/l10n.dart';
import 'package:pokemon_repository/pokemon_repository.dart';

import '../../../app/widgets/widgets.dart';

class ViewAllPage extends HookWidget {
  const ViewAllPage({super.key, this.query});

  final String? query;

  @override
  Widget build(BuildContext context) {
    final searchCtrl = useTextEditingController();
    return NoiseScaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: kToolbarHeight * 2.2,
                color: context.theme.scaffoldBackgroundColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () async {
                        await showDialog<void>(
                          context: context,
                          builder: (context) {
                            return const ThemeDialog();
                          },
                        );
                      },
                      icon: ThemeSelector(
                        radius: 40,
                        color: context.theme.primaryColor,
                        selected: true,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: -10,
                child: Row(
                  children: [
                    Hero(
                      tag: const ValueKey('logo-image'),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: SvgPicture.asset(
                          Assets.images.landingImage.path,
                          width: 114,
                        ),
                      ),
                    ),
                    Hero(
                      tag: const ValueKey('logo'),
                      child: Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Poké',
                              style: context.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                              children: [
                                TextSpan(
                                  text: 'book',
                                  style:
                                      context.textTheme.titleMedium?.copyWith(
                                    color: context.theme.primaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Gap.h(41),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 19,
            ),
            child: TextBoxField(
              controller: searchCtrl,
              hintText: context.l10n.enterPokemonName,
              prefixIcon: Icon(
                Icons.search,
                color: context.theme.hintColor,
              ),
            ),
          ),
          const Gap.h(30),
          Expanded(
            child: BlocBuilder<PokemonBloc, PokemonState>(
              builder: (context, state) {
                return state.when(
                  initial: () {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  loading: () {
                    return const Center(child: CircularProgressIndicator());
                  },
                  success: (pokemons) => ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 19,
                    ),
                    itemCount: pokemons.length,
                    itemBuilder: (context, index) {
                      final singleItem = pokemons[index];
                      return PokemonItem(
                        name: singleItem.name,
                        id: singleItem.id,
                        pokemon: singleItem,
                        image: singleItem.url,
                      );
                    },
                  ),
                  error: (error) => Text('Error: $error'),
                );
              },
            ),
          ),
          const Gap.h(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: NumberPaginator(
              numberPages: 10,
              onPageChange: (int index) {},
              config: NumberPaginatorUIConfig(
                height: 40,
                buttonShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                buttonTextStyle: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                ),
                buttonSelectedForegroundColor:
                    context.theme.colorScheme.onPrimary,
                buttonUnselectedForegroundColor:
                    context.theme.colorScheme.onSecondaryContainer,
                buttonUnselectedBackgroundColor:
                    context.theme.colorScheme.secondaryContainer,
                buttonSelectedBackgroundColor:
                    context.theme.colorScheme.primary,
              ),
            ),
          ),
          const Gap.h(40),
        ],
      ),
    );
  }
}

class PokemonItem extends StatelessWidget {
  const PokemonItem({
    required this.name,
    required this.id,
    required this.image,
    required this.pokemon,
    super.key,
    this.onTap,
  });

  final String name;
  final String id;
  final String image;
  final Pokemon pokemon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 21),
      child: GestureDetector(
        onTap: () => context.pushNamed(PageUrl.details, extra: pokemon),
        child: Stack(
          children: [
            Container(
              height: 420,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 361,
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(
                  13,
                  13,
                  13,
                  30,
                ),
                decoration: BoxDecoration(
                  color: context.theme.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(26),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        padding: const EdgeInsets.all(13),
                        decoration: BoxDecoration(
                          color: context.theme.colorScheme.secondaryContainer,
                          borderRadius: BorderRadius.circular(26),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          name,
                          style: context.textTheme.titleLarge,
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
                                color: context
                                    .theme.colorScheme.secondaryContainer,
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
              ),
            ),
            Hero(
              tag: ValueKey('pokemon-$id'),
              child: Align(
                child: SvgPicture.network(
                  image,
                  width: 250,
                  height: 250,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
