// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokebook/app/constants/custom_extensions.dart';
import 'package:pokebook/app/navigation/page_url.dart';
import 'package:pokebook/app/widgets/noise_scaffold.dart';
import 'package:pokebook/app/widgets/theme_dialog.dart';
import 'package:pokebook/features/pokemon/bloc/pokemon_bloc.dart';
import 'package:pokebook/gen/assets.gen.dart';
import 'package:pokebook/l10n/l10n.dart';
import 'package:pokemon_api/pokemon_api.dart';
import 'package:pokemon_repository/pokemon_repository.dart';

import '../../../app/widgets/widgets.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final inputDecoration = OutlineInputBorder(
      borderSide: BorderSide(color: context.theme.primaryColor, width: 8),
      borderRadius: const BorderRadius.all(Radius.circular(60)),
    );
    final textCtrl = useTextEditingController();
    return NoiseScaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 19,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: kToolbarHeight + 56,
            ),
            Hero(
                tag: const ValueKey('logo-image'),
                child: SvgPicture.asset(Assets.images.landingImage.path)),
            const Gap.h(30),
            Hero(
              tag: const ValueKey('logo'),
              child: RichText(
                text: TextSpan(
                  text: 'Poké',
                  style: context.textTheme.headlineLarge,
                  children: [
                    TextSpan(
                      text: 'book',
                      style: context.textTheme.headlineLarge?.copyWith(
                        color: context.theme.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Gap.h(8),
            Text(
              context.l10n.largestPokemonIndex,
              textAlign: TextAlign.center,
            ),
            const Gap.h(100),
            TextBoxField(
              controller: textCtrl,
              decoration: InputDecoration(
                hintText: context.l10n.enterPokemonName,
                hintStyle: context.textTheme.bodyLarge?.copyWith(
                  color: context.theme.hintColor,
                  fontWeight: FontWeight.w400,
                ),
                contentPadding: const EdgeInsets.all(20),
                suffixIcon: GestureDetector(
                  onTap: () => context.pushNamed(
                    PageUrl.viewAll,
                    queryParameters: {'id': '1'},
                  ),
                  child: Container(
                    width: 48,
                    height: 48,
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.theme.primaryColor,
                    ),
                    child: Icon(
                      Icons.search,
                      color: context.theme.colorScheme.onPrimary,
                    ),
                  ),
                ),
                border: inputDecoration,
                enabledBorder: inputDecoration,
                focusedBorder: inputDecoration,
              ),
            ),
            const Gap.h(16),
            InkWell(
              // onTap: () => context.pushNamed(
              //   PageUrl.viewAll,
              //   queryParameters: {'id': '1'},
              // ),

              onTap: () async {
                context
                    .read<PokemonBloc>()
                    .add(const PokemonEvent.getPokemons());
                await context.pushNamed(PageUrl.viewAll);
              },
              child: Text(
                context.l10n.viewAll,
                style: context.textTheme.titleSmall?.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
