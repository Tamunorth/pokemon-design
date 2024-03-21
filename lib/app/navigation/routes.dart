import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokebook/features/pokemon/pages/details_page.dart';
import 'package:pokebook/features/pokemon/pages/home_page.dart';
import 'package:pokebook/features/pokemon/pages/view_all_page.dart';
import 'package:pokemon_repository/pokemon_repository.dart';

import 'page_url.dart';

// private navigators
final _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'rootNavigator');

// ignore: avoid_classes_with_only_static_members
/// Documentation for CustomRoute
class CustomRoutes {
  /// The code is creating an instance of the [GoRouter]
  ///  class and assigning it
  ///
  ///
  static final goRouter = GoRouter(
    initialLocation: '/home',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: kDebugMode,
    routes: [
      GoRoute(
        path: '/home',
        name: PageUrl.home,
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: '/viewAll',
        name: PageUrl.viewAll,
        builder: (context, state) => ViewAllPage(
          query: state.uri.queryParameters['query'] ?? '',
        ),
      ),
      GoRoute(
        path: '/details',
        name: PageUrl.details,
        builder: (context, state) {
          return DetailsPage(
            pokemon: state.extra! as Pokemon,
          );
        },
      ),
    ],
  );
}
