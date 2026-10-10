import 'package:devixly_admin/app/di/injection.dart';
import 'package:devixly_admin/features/projects/presentation/view/project_details_view.dart';
import 'package:devixly_admin/features/projects/presentation/view/projects_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/app_harness.dart';
import '../../helpers/golden_helpers.dart';
import '../../helpers/test_dependencies.dart';

/// Ekrany bez odpowiednika w wersji FlutterFlow — mają własne wzorce.
void main() {
  tearDown(getIt.reset);

  testWidgets('ProjectsListView (desktop)', (tester) async {
    await setUpTestDependencies();
    await pumpView(
      tester,
      const ProjectsListView(),
      viewport: GoldenViewport.desktop,
    );
    await tester.pump(const Duration(milliseconds: 300));

    await expectLater(
      find.byType(MaterialApp),
      matchesGoldenFile('goldens/projects_list_desktop.png'),
    );
  });

  testWidgets('ProjectDetailsView (desktop)', (tester) async {
    await setUpTestDependencies();
    await pumpView(
      tester,
      const ProjectDetailsView(projectId: 1),
      viewport: const Size(1440, 1400),
    );
    await tester.pump(const Duration(milliseconds: 300));

    await expectLater(
      find.byType(MaterialApp),
      matchesGoldenFile('goldens/project_details_desktop.png'),
    );
  });
}
