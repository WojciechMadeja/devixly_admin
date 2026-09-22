import 'package:devixly_admin/app/di/injection.dart';
import 'package:devixly_admin/features/settings/presentation/view/edit_profile_view.dart';
import 'package:devixly_admin/features/settings/presentation/view/settings_view.dart';
import 'package:devixly_admin/features/settings/presentation/view/update_password_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/app_harness.dart';
import '../../helpers/fake_xano_api.dart';
import '../../helpers/golden_helpers.dart';
import '../../helpers/test_dependencies.dart';

Future<void> _expectBaseline(String name) => expectLater(
  find.byType(MaterialApp),
  matchesGoldenFile(baselineGolden(name, depth: 2)),
);

void main() {
  tearDown(getIt.reset);

  testWidgets('SettingsView wygląda jak w FlutterFlow', (tester) async {
    await setUpTestDependencies();
    await pumpView(
      tester,
      const SettingsView(),
      viewport: GoldenViewport.desktop,
    );
    await _expectBaseline('pages/settings_desktop');
  });

  testWidgets('SettingsView w trakcie pobierania danych pokazuje szkielet', (
    tester,
  ) async {
    await setUpTestDependencies(
      api: FakeXanoApi(responseDelay: const Duration(seconds: 10)),
    );
    await pumpView(
      tester,
      const SettingsView(),
      viewport: GoldenViewport.desktop,
    );
    await _expectBaseline('pages/settings_loading_desktop');
    // Odpowiedź przychodzi po 10 s — dokańczamy ją przed końcem testu.
    await tester.pump(const Duration(seconds: 11));
  });

  testWidgets('EditProfileView wygląda jak w FlutterFlow', (tester) async {
    await setUpTestDependencies();
    await pumpView(
      tester,
      const EditProfileView(),
      viewport: GoldenViewport.desktop,
    );
    await _expectBaseline('pages/edit_person_data_desktop');
  });

  testWidgets('UpdatePasswordView wygląda jak w FlutterFlow', (tester) async {
    await setUpTestDependencies();
    await pumpView(
      tester,
      const UpdatePasswordView(),
      viewport: GoldenViewport.desktop,
    );
    await _expectBaseline('pages/update_password_desktop');
  });
}
