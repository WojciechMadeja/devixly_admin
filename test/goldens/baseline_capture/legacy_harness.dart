// Harness do renderowania STAREGO kodu FlutterFlow w testach — służy tylko do
// wygenerowania wzorców wyglądu (test/goldens/baseline). Usuwany w fazie
// przełączenia razem z lib/flutter_flow i resztą kodu FlutterFlow.
import 'dart:async';
import 'dart:io';

import 'package:devixly_admin/app_state.dart';
import 'package:devixly_admin/auth/custom_auth/auth_util.dart';
import 'package:devixly_admin/auth/custom_auth/custom_auth_user_provider.dart';
import 'package:devixly_admin/backend/schema/structs/index.dart';
import 'package:devixly_admin/flutter_flow/internationalization.dart';
import 'package:devixly_admin/main.dart' show MyAppScrollBehavior;
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helpers/fake_network_images.dart';
import '../../helpers/fake_xano_api.dart';
import '../../helpers/fixtures.dart';
import '../../helpers/golden_helpers.dart';

StreamSubscription<DevixlyAdminAuthUser>? _authSubscription;

/// Loguje admina z fixture'a (sesja ważna do 2100 r.) i czyści FFAppState.
Future<void> setUpLegacySession() async {
  SharedPreferences.setMockInitialValues({});
  await authManager.initialize();
  _authSubscription ??= devixlyAdminAuthUserStream().listen((_) {});
  await authManager.signIn(
    authenticationToken: 'auth-token-1',
    refreshToken: 'refresh-token-1',
    tokenExpiration: DateTime(2100),
    authUid: '1',
    userData: UserStruct(
      id: 1,
      firstName: 'Jan',
      lastName: 'Kowalski',
      email: 'admin@devixly.com',
      phoneNumber: '+48 600 100 200',
      company: 'Crowd Empire',
      refreshTokenId: 7,
      expireAt: DateTime(2100),
    ),
  );
  await Future<void>.delayed(Duration.zero);
  FFAppState.reset();
}

void installFakeNetworkImages() {
  HttpOverrides.global =
      FakeNetworkImagesOverrides(readFixtureBytes('images/news.png'));
}

/// Konfiguracja MaterialApp identyczna jak w starym `lib/main.dart`.
Widget legacyApp(Widget home) {
  return ChangeNotifierProvider(
    create: (_) => FFAppState(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Devixly Admin',
      scrollBehavior: MyAppScrollBehavior(),
      localizationsDelegates: const [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FallbackMaterialLocalizationDelegate(),
        FallbackCupertinoLocalizationDelegate(),
      ],
      supportedLocales: const [Locale('pl')],
      theme: ThemeData(
        brightness: Brightness.light,
        scrollbarTheme: ScrollbarThemeData(
          thumbColor:
              WidgetStateProperty.resolveWith((_) => const Color(0x00000000)),
        ),
        useMaterial3: false,
      ),
      home: home,
    ),
  );
}

/// Renderuje stary ekran z fałszywym API; `settle` to czas, po którym
/// robimy zdjęcie (animacje szkieletów są zapętlone, więc bez pumpAndSettle).
Future<void> pumpLegacyPage(
  WidgetTester tester,
  Widget page, {
  required Size viewport,
  FakeXanoApi? api,
  Duration settle = const Duration(milliseconds: 500),
  void Function()? beforePump,
}) async {
  setViewport(tester, viewport);
  final fakeApi = api ?? FakeXanoApi();
  await http.runWithClient(() async {
    beforePump?.call();
    await tester.pumpWidget(legacyApp(page));
    await GoogleFonts.pendingFonts();
    await tester.pump();
    await tester.pump(settle);
  }, () => fakeApi.client);
  await precacheImages(tester);
  await tester.pump(const Duration(milliseconds: 16));
}

/// Renderuje pojedynczy komponent na tle strony (dialogi tak jak w
/// `showDialog` — wycentrowane, bez przyciemnienia).
Future<void> pumpLegacyComponent(
  WidgetTester tester,
  Widget component, {
  Size viewport = const Size(480, 720),
  Duration settle = const Duration(milliseconds: 300),
}) async {
  setViewport(tester, viewport);
  await tester.pumpWidget(
    legacyApp(
      Scaffold(
        backgroundColor: const Color(0xFFF1F4F8),
        body: Center(child: component),
      ),
    ),
  );
  await GoogleFonts.pendingFonts();
  await tester.pump();
  await tester.pump(settle);
  await precacheImages(tester);
}
