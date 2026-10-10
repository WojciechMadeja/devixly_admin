import 'dart:io';

import 'package:devixly_admin/app/di/injection.dart';
import 'package:devixly_admin/features/projects/presentation/view/project_details_view.dart';
import 'package:devixly_admin/features/projects/presentation/view/projects_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:devixly_admin/core/widgets/image_gallery.dart';
import 'package:devixly_admin/features/units/presentation/widgets/shared/unit_preview_dialog.dart';

import '../../helpers/app_harness.dart';
import '../../helpers/fake_network_images.dart';
import '../../helpers/fixtures.dart';
import '../../helpers/fake_backend.dart';
import '../../helpers/golden_helpers.dart';
import '../../helpers/test_dependencies.dart';

void main() {
  late FakeBackend api;

  setUpAll(() {
    HttpOverrides.global = FakeNetworkImagesOverrides(
      readFixtureBytes('images/news.png'),
    );
  });
  setUp(() async => api = await setUpTestDependencies());
  tearDown(getIt.reset);

  group('ProjectsListView', () {
    testWidgets('pokazuje projekty z backendu', (tester) async {
      await pumpView(
        tester,
        const ProjectsListView(),
        viewport: GoldenViewport.desktop,
      );
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.text('Marina Heights'), findsOneWidget);
      expect(find.text('Dubai Marina'), findsOneWidget);
      expect(find.text('Emaar'), findsOneWidget);
      // Projekt dodany ręcznie jest oznaczony.
      expect(find.text('Ręczna inwestycja'), findsOneWidget);
      expect(find.text('ręczny'), findsOneWidget);
    });

    testWidgets('wyszukiwanie pyta backend o nazwę', (tester) async {
      await pumpView(
        tester,
        const ProjectsListView(),
        viewport: GoldenViewport.desktop,
      );
      await tester.pump(const Duration(milliseconds: 300));

      await tester.enterText(find.byType(TextFormField).first, 'marina');
      // Pytamy dopiero, gdy użytkownik przestanie pisać.
      await tester.pump(const Duration(milliseconds: 100));
      expect(api.callsOf('project.list'), hasLength(1));

      await tester.pump(const Duration(milliseconds: 400));
      expect(api.callsOf('project.list'), hasLength(2));
      expect(
        api.callsOf('project.list').last.arguments,
        containsPair('nameContains', 'marina'),
      );
    });
  });

  group('ProjectDetailsView', () {
    testWidgets('pokazuje plany płatności i jednostki', (tester) async {
      await pumpView(
        tester,
        const ProjectDetailsView(projectId: 1),
        viewport: const Size(1440, 1400),
      );
      await tester.pump(const Duration(milliseconds: 300));

      expect(api.callsOf('project.getById').single.arguments, {'id': 1});
      expect(api.callsOf('unit.getByProject').single.arguments, {
        'projectId': 1,
        'limit': null,
        'offset': null,
      });

      // Plan płatności z ratami, po polsku.
      expect(find.text('60/40 z odbiorem'), findsOneWidget);
      expect(find.text('20% przy rezerwacji'), findsOneWidget);
      expect(find.text('Płatności po odbiorze'), findsOneWidget);

      // Jednostki projektu, w tym dodana ręcznie.
      expect(find.text('1203'), findsOneWidget);
      expect(find.text('Apartament'), findsOneWidget);
      expect(find.text('12A'), findsOneWidget);
    });

    testWidgets('pokazuje zdjęcia projektu, kopie ze storage przed źródłem', (
      tester,
    ) async {
      await pumpView(
        tester,
        const ProjectDetailsView(projectId: 1),
        viewport: const Size(1440, 1400),
      );
      await tester.pump(const Duration(milliseconds: 300));
      await precacheImages(tester);

      final gallery = tester.widget<ImageGallery>(
        find.byType(ImageGallery).first,
      );
      // Kolejność z pola `position`, nie z odpowiedzi.
      expect(gallery.urls, [
        'https://api.devixly.com/files/5001-1.png',
        'https://api.devixly.com/files/5001-2.png',
      ]);
    });

    testWidgets('podgląd jednostki pokazuje jej rzuty', (tester) async {
      await pumpView(
        tester,
        const ProjectDetailsView(projectId: 1),
        viewport: const Size(1440, 1400),
      );
      await tester.pump(const Duration(milliseconds: 300));
      await precacheImages(tester);

      await tester.tap(find.byIcon(Icons.info_outline).first);
      await tester.pumpAndSettle();
      await precacheImages(tester);

      expect(find.byType(UnitPreviewDialog), findsOneWidget);
      final gallery = tester.widget<ImageGallery>(
        find.descendant(
          of: find.byType(UnitPreviewDialog),
          matching: find.byType(ImageGallery),
        ),
      );
      expect(gallery.urls, ['https://api.devixly.com/files/plan-1203.png']);
    });
  });
}
