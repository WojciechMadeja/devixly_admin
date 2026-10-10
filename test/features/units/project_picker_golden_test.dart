import 'package:devixly_admin/app/di/injection.dart';
import 'package:devixly_admin/features/units/presentation/view/add_unit_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/app_harness.dart';
import '../../helpers/golden_helpers.dart';
import '../../helpers/test_dependencies.dart';

/// Wygląd otwartej wyszukiwarki projektu.
void main() {
  tearDown(getIt.reset);

  testWidgets('ProjectPickerDialog (desktop)', (tester) async {
    await setUpTestDependencies();
    await pumpView(
      tester,
      const AddUnitView(),
      viewport: GoldenViewport.desktop,
    );
    await tester.tap(find.text('Wyszukaj projekt'));
    await tester.pumpAndSettle();

    await expectLater(
      find.byType(MaterialApp),
      matchesGoldenFile('goldens/project_picker_desktop.png'),
    );
  });
}
