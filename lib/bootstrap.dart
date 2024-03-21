import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pokebook/app/view/app.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  // Add cross-flavor configuration here
  runApp(await builder());

  Sentry.configureScope(
    (scope) => scope.setUser(SentryUser(email: 'tam@mailinator.com')),
  );
}

Future<void> initAppWithSentry(String env) async {
  await SentryFlutter.init(
    (options) {
      options
        ..dsn =
            'https://1ef5f2d51b330e04c6b5559626d2ac4a@o4506930224889856.ingest.us.sentry.io/4506930225938432'
        ..environment = env
        ..tracesSampleRate = 0.5;
    },
    appRunner: () => bootstrap(() => const App()),
  );
}
