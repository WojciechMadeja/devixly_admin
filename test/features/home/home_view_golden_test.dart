import 'package:devixly_admin/features/home/presentation/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/app_harness.dart';
import '../../helpers/golden_helpers.dart';

void main() {
  for (final (name, viewport) in [
    ('desktop', GoldenViewport.desktop),
    ('mobile', GoldenViewport.mobile),
  ]) {
    testWidgets('HomeView ($name) wygląda jak w FlutterFlow', (tester) async {
      await pumpView(tester, const HomeView(), viewport: viewport);
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(baselineGolden('pages/home_$name', depth: 2)),
      );
    });
  }
}
