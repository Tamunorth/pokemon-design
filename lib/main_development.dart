import 'package:pokebook/app/app.dart';

import 'bootstrap.dart';

void main() async {
  ///Sentry is not used in dev can be reported in
  ///console correctly
  await bootstrap(() => const App());
}
