import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokebook/app/cubit/theme_cubit.dart';
import 'package:pokebook/app/constants/themes.dart';
import 'package:pokebook/app/navigation/routes.dart';
import 'package:pokebook/features/pokemon/bloc/pokemon_bloc.dart';
import 'package:pokebook/features/pokemon/pages/home_page.dart';
import 'package:pokebook/l10n/l10n.dart';
import 'package:pokemon_repository/pokemon_repository.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => PokemonRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ThemeCubit(),
          ),
          BlocProvider(
            create: (context) => PokemonBloc(
              context.read<PokemonRepository>(),
            ),
          ),
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, Color>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: MaterialApp.router(
            theme: appTheme(state),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            routerConfig: CustomRoutes.goRouter,
          ),
        );
      },
    );
  }
}
