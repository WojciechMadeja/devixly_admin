import 'package:devixly_admin/features/home/presentation/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/app_harness.dart';
import '../../helpers/golden_helpers.dart';

/// Ekran główny ma o jeden kafelek więcej niż wersja FlutterFlow („Dodaj
/// projekty”), więc porównujemy go z własnym wzorcem, a nie z
/// `goldens/baseline/pages/home_*`. Reszta układu — odstępy, rozmiary
/// kafelków, kolejność pozostałych pozycji — zostaje bez zmian.
void main() {
  for (final (name, viewport) in [
    ('desktop', GoldenViewport.desktop),
    ('mobile', GoldenViewport.mobile),
  ]) {
    testWidgets('HomeView ($name) z kafelkiem projektów', (tester) async {
      await pumpView(tester, const HomeView(), viewport: viewport);
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/home_$name.png'),
      );
    });
  }
}
