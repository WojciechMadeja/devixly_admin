// Wzorce wyglądu ekranów wersji FlutterFlow. Uruchamiane z --update-goldens
// tylko w Fazie 0; nowe widoki porównują się z tymi samymi plikami PNG.
import 'package:devixly_admin/app_state.dart';
import 'package:devixly_admin/pages/add_admin_page/add_admin_page_widget.dart';
import 'package:devixly_admin/pages/add_category_page/add_category_page_widget.dart';
import 'package:devixly_admin/pages/add_company_page/add_company_page_widget.dart';
import 'package:devixly_admin/pages/add_list_of_users_page/add_list_of_users_page_widget.dart';
import 'package:devixly_admin/pages/add_news_page/add_news_page_widget.dart';
import 'package:devixly_admin/pages/add_unity_page/add_unity_page_widget.dart';
import 'package:devixly_admin/pages/add_user_page/add_user_page_widget.dart';
import 'package:devixly_admin/pages/edit_news_page/edit_news_page_widget.dart';
import 'package:devixly_admin/pages/edit_person_data_page/edit_person_data_page_widget.dart';
import 'package:devixly_admin/pages/home_page/home_page_widget.dart';
import 'package:devixly_admin/pages/login_page/login_page_widget.dart';
import 'package:devixly_admin/pages/news_list_page/news_list_page_widget.dart';
import 'package:devixly_admin/pages/settings_page/settings_page_widget.dart';
import 'package:devixly_admin/pages/update_password_page/update_password_page_widget.dart';
import 'package:devixly_admin/pages/users_list_page/users_list_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/fake_xano_api.dart';
import '../../helpers/golden_helpers.dart';
import 'legacy_fixtures.dart';
import 'legacy_harness.dart';

final _pages = <String, Widget Function()>{
  'login': () => const LoginPageWidget(),
  'home': () => const HomePageWidget(),
  'news_list': () => const NewsListPageWidget(),
  'add_news': () => const AddNewsPageWidget(),
  'edit_news': () => EditNewsPageWidget(news: legacyNews),
  'add_category': () => const AddCategoryPageWidget(),
  'add_company': () => const AddCompanyPageWidget(),
  'add_user': () => const AddUserPageWidget(),
  'add_list_of_users': () => const AddListOfUsersPageWidget(),
  'users_list': () => const UsersListPageWidget(),
  'add_admin': () => const AddAdminPageWidget(),
  'settings': () => const SettingsPageWidget(),
  'edit_person_data': () => const EditPersonDataPageWidget(),
  'update_password': () => const UpdatePasswordPageWidget(),
  'add_unity': () => const AddUnityPageWidget(),
};

/// Ekrany ze szkieletami ładowania (dane przychodzą z opóźnieniem).
final _loadingPages = <String, Widget Function()>{
  'news_list': () => const NewsListPageWidget(),
  'add_news': () => const AddNewsPageWidget(),
  'add_category': () => const AddCategoryPageWidget(),
  'add_company': () => const AddCompanyPageWidget(),
  'settings': () => const SettingsPageWidget(),
};

const _viewports = {
  'desktop': GoldenViewport.desktop,
  'mobile': GoldenViewport.mobile,
};

/// Stary układ wylewa się poza ekran na części widoków mobilnych (390 px).
/// Zapisujemy je jako referencję, a listę drukujemy na końcu przebiegu.
final _overflowingGoldens = <String>{};

Future<void> _captureTolerant(
  String golden,
  Future<void> Function() body,
) async {
  final originalOnError = FlutterError.onError;
  FlutterError.onError = (details) {
    if (details.exceptionAsString().contains('overflowed')) {
      _overflowingGoldens.add(golden);
      return;
    }
    originalOnError?.call(details);
  };
  try {
    await body();
  } finally {
    FlutterError.onError = originalOnError;
  }
}

void main() {
  setUpAll(installFakeNetworkImages);
  setUp(setUpLegacySession);
  tearDownAll(() {
    // ignore: avoid_print
    print('Widoki z przepełnieniem układu: ${_overflowingGoldens.toList()..sort()}');
  });

  for (final page in _pages.entries) {
    for (final viewport in _viewports.entries) {
      final golden = '${page.key}_${viewport.key}';
      testWidgets('${page.key} (${viewport.key})', (tester) async {
        await _captureTolerant(golden, () async {
          await pumpLegacyPage(tester, page.value(), viewport: viewport.value);
          await expectLater(
            find.byType(MaterialApp),
            matchesGoldenFile('../baseline/pages/$golden.png'),
          );
        });
      });
    }
  }

  for (final page in _loadingPages.entries) {
    testWidgets('${page.key} loading (desktop)', (tester) async {
      await pumpLegacyPage(
        tester,
        page.value(),
        viewport: GoldenViewport.desktop,
        api: FakeXanoApi(responseDelay: const Duration(seconds: 10)),
      );
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('../baseline/pages/${page.key}_loading_desktop.png'),
      );
      // Kolejne wywołania API czekają po 10 s — dokańczamy je przed końcem testu.
      for (var i = 0; i < 8; i++) {
        await tester.pump(const Duration(seconds: 11));
      }
    });
  }

  for (final viewport in _viewports.entries) {
    final golden = 'add_list_of_users_csv_${viewport.key}';
    testWidgets('add_list_of_users with csv (${viewport.key})', (tester) async {
      await _captureTolerant(golden, () async {
        await pumpLegacyPage(
          tester,
          const AddListOfUsersPageWidget(),
          viewport: viewport.value,
          beforePump: () => FFAppState().csvListOfUser = [...legacyCsvUsers],
        );
        await expectLater(
          find.byType(MaterialApp),
          matchesGoldenFile('../baseline/pages/$golden.png'),
        );
      });
    });
  }
}
