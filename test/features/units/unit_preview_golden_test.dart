import 'dart:io';

import 'package:devixly_admin/features/units/domain/entities/project_unit.dart';
import 'package:devixly_admin/features/units/presentation/widgets/shared/unit_preview_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/app_harness.dart';
import '../../helpers/fake_network_images.dart';
import '../../helpers/fixtures.dart';

/// Podgląd jednostki razem z rzutami — ekran bez odpowiednika w wersji
/// FlutterFlow, więc z własnym wzorcem.
void main() {
  setUpAll(() {
    HttpOverrides.global = FakeNetworkImagesOverrides(
      readFixtureBytes('images/news.png'),
    );
  });

  testWidgets('UnitPreviewDialog', (tester) async {
    await pumpComponent(
      tester,
      const UnitPreviewDialog(
        unit: ProjectUnit(
          id: 41,
          externalId: 7001,
          number: '1203',
          floor: '12',
          status: 'available',
          typeName: 'Apartament',
          layoutName: '2 sypialnie',
          price: 450000,
          pricePer: 450,
          area: 1000,
          layoutUrls: ['https://api.devixly.com/files/plan-1203.png'],
        ),
      ),
      viewport: const Size(700, 900),
    );

    await expectLater(
      find.byType(UnitPreviewDialog),
      matchesGoldenFile('goldens/unit_preview.png'),
    );
  });
}
