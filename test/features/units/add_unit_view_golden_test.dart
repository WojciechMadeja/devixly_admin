import 'package:devixly_admin/app/di/injection.dart';
import 'package:devixly_admin/features/units/presentation/view/add_unit_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/app_harness.dart';
import '../../helpers/golden_helpers.dart';
import '../../helpers/test_dependencies.dart';

/// Formularz jednostki powstał od nowa (wersja FlutterFlow była kopią
/// ekranu użytkownika i zapisywała konto administratora), więc ma własny
/// wzorzec zamiast porównania z `goldens/baseline/pages/add_unity_*`.
void main() {
  tearDown(getIt.reset);

  testWidgets('AddUnitView (desktop)', (tester) async {
    await setUpTestDependencies();
    await pumpView(
      tester,
      const AddUnitView(),
      viewport: GoldenViewport.desktop,
    );
    await expectLater(
      find.byType(MaterialApp),
      matchesGoldenFile('goldens/add_unit_desktop.png'),
    );
  });
}
