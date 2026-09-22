/// Punkt wejścia panelu administracyjnego Devixly.
library;

import 'package:flutter/widgets.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app/app.dart';
import 'app/di/injection.dart';
import 'features/auth/presentation/view_model/session_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  usePathUrlStrategy();
  await initializeDateFormatting('pl');
  await setupDependencies();

  final session = getIt<SessionCubit>();
  await session.restore();
  runApp(App(session: session));
}
