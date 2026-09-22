import 'package:devixly_admin/core/l10n/l10n.dart';
import 'package:devixly_admin/core/theme/app_theme.dart';
import 'package:devixly_admin/core/widgets/admin_shell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'fake_network_images.dart';
import 'golden_helpers.dart';

/// Konfiguracja MaterialApp nowej aplikacji do testów widoków i widgetów.
Widget testApp(Widget home) {
  return AdminShell(
    onBack: () {},
    onHome: () {},
    onLogout: () {},
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      scrollBehavior: const AppScrollBehavior(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('pl'),
      home: home,
    ),
  );
}

/// Renderuje widget na tle strony tak samo jak harness wzorców FlutterFlow
/// (`pumpLegacyComponent`), żeby wyniki dało się porównać piksel w piksel.
Future<void> pumpComponent(
  WidgetTester tester,
  Widget component, {
  Size viewport = const Size(480, 720),
  Duration settle = const Duration(milliseconds: 300),
}) async {
  setViewport(tester, viewport);
  await tester.pumpWidget(
    testApp(
      Scaffold(
        backgroundColor: const Color(0xFFF1F4F8),
        body: Center(child: component),
      ),
    ),
  );
  await tester.pump();
  await tester.pump(settle);
  await precacheImages(tester);
}

/// Ścieżka do wzorca wyglądu wersji FlutterFlow (względem pliku testu
/// położonego [depth] katalogów pod `test/`).
String baselineGolden(String name, {required int depth}) =>
    '${'../' * depth}goldens/baseline/$name.png';
