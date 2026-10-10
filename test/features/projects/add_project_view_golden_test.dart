import 'package:devixly_admin/app/di/injection.dart';
import 'package:devixly_admin/features/projects/presentation/view/add_project_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/app_harness.dart';
import '../../helpers/golden_helpers.dart';
import '../../helpers/test_dependencies.dart';

/// Ekran bez odpowiednika w wersji FlutterFlow — wzorzec jest własny,
/// pilnuje spójności z resztą formularzy panelu.
void main() {
  tearDown(getIt.reset);

  testWidgets('AddProjectView (desktop)', (tester) async {
    await setUpTestDependencies();
    await pumpView(
      tester,
      const AddProjectView(),
      viewport: GoldenViewport.desktop,
    );
    await expectLater(
      find.byType(MaterialApp),
      matchesGoldenFile('goldens/add_project_desktop.png'),
    );
  });
}
