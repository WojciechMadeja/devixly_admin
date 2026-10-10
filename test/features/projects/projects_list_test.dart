import 'dart:io';

import 'package:devixly_admin/app/di/injection.dart';
import 'package:devixly_admin/features/projects/presentation/view/project_details_view.dart';
import 'package:devixly_admin/features/projects/presentation/view/projects_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:devixly_admin/core/widgets/dialogs/typed_confirmation_dialog.dart';
import 'package:devixly_admin/core/widgets/image_gallery.dart';
import 'package:devixly_admin/features/projects/presentation/widgets/project_details_view/payment_plan_dialogs.dart';
import 'package:devixly_admin/features/units/presentation/widgets/shared/edit_unit_dialog.dart';
import 'package:devixly_admin/features/units/presentation/widgets/shared/unit_preview_dialog.dart';
import 'package:devixly_admin/features/units/presentation/widgets/shared/units_table.dart';

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

    testWidgets('usuwanie projektu wymaga przepisania frazy', (tester) async {
      await pumpView(
        tester,
        const ProjectsListView(),
        viewport: GoldenViewport.desktop,
      );
      await tester.pump(const Duration(milliseconds: 300));

      await tester.tap(find.byIcon(Icons.delete_outline).first);
      await tester.pumpAndSettle();
      // Projekt z GenieMap wraca przy synchronizacji — dialog o tym mówi.
      expect(
        find.textContaining('nocna synchronizacja', findRichText: true),
        findsOneWidget,
      );

      await tester.tap(find.text('Usuń'));
      await tester.pump();
      expect(api.callsOf('project.delete'), isEmpty);

      await tester.enterText(
        find.descendant(
          of: find.byType(TypedConfirmationDialog),
          matching: find.byType(TextFormField),
        ),
        'DELETE',
      );
      await tester.tap(find.text('Usuń'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(api.callsOf('project.delete').single.arguments, {'id': 1});
      expect(find.text('Marina Heights'), findsNothing);
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

    testWidgets('dodaje plan płatności bez numeru z GenieMap', (tester) async {
      await pumpView(
        tester,
        const ProjectDetailsView(projectId: 1),
        viewport: const Size(1440, 1400),
      );
      await tester.pump(const Duration(milliseconds: 300));

      await tester.tap(find.text('Dodaj plan'));
      await tester.pumpAndSettle();
      await tester.enterText(
        find
            .descendant(
              of: find.byType(PaymentEntryDialog),
              matching: find.byType(TextFormField),
            )
            .first,
        '80/20',
      );
      await tester.tap(find.text('Zapisz'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      final call = api.callsOf('paymentPlan.create').single;
      final input = call.arguments['input']! as Map<String, Object?>;
      expect(input['projectId'], 1);
      expect(input['name'], '80/20');
      // Numer nadaje backend — ręczne plany dostają ujemny.
      expect(input.containsKey('externalId'), isFalse);
      // Po zapisie czytamy projekt od nowa, żeby zobaczyć nowy plan.
      await tester.pump(const Duration(milliseconds: 500));
      expect(api.callsOf('project.getById'), hasLength(2));
    });

    testWidgets('dodaje ratę do planu', (tester) async {
      await pumpView(
        tester,
        const ProjectDetailsView(projectId: 1),
        viewport: const Size(1440, 1400),
      );
      await tester.pump(const Duration(milliseconds: 300));

      await tester.tap(find.text('Dodaj ratę').first);
      await tester.pumpAndSettle();
      await tester.enterText(
        find
            .descendant(
              of: find.byType(PaymentEntryDialog),
              matching: find.byType(TextFormField),
            )
            .first,
        '10% przy odbiorze',
      );
      await tester.tap(find.text('Zapisz'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      final input =
          api.callsOf('item.create').single.arguments['input']!
              as Map<String, Object?>;
      expect(input['paymentPlanId'], 10);
      expect(input['name'], '10% przy odbiorze');
    });

    testWidgets('edycja jednostki zapisuje zmiany', (tester) async {
      await pumpView(
        tester,
        const ProjectDetailsView(projectId: 1),
        viewport: const Size(1440, 1400),
      );
      await tester.pump(const Duration(milliseconds: 300));

      await tester.tap(
        find
            .descendant(
              of: find.byType(UnitsTable),
              matching: find.byIcon(Icons.edit_outlined),
            )
            .first,
      );
      await tester.pumpAndSettle();

      // Pierwsze pole dialogu to numer jednostki.
      await tester.enterText(
        find
            .descendant(
              of: find.byType(EditUnitDialog),
              matching: find.byType(TextFormField),
            )
            .first,
        '1204',
      );
      await tester.tap(find.text('Zapisz'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      final call = api.callsOf('unit.update').single;
      expect(call.arguments['id'], 41);
      expect(call.arguments['input'], containsPair('number', '1204'));
    });

    testWidgets('usuwanie jednostki zdejmuje ją z tabeli', (tester) async {
      await pumpView(
        tester,
        const ProjectDetailsView(projectId: 1),
        viewport: const Size(1440, 1400),
      );
      await tester.pump(const Duration(milliseconds: 300));

      await tester.tap(
        find
            .descendant(
              of: find.byType(UnitsTable),
              matching: find.byIcon(Icons.delete_outline),
            )
            .first,
      );
      await tester.pumpAndSettle();
      await tester.enterText(
        find.descendant(
          of: find.byType(TypedConfirmationDialog),
          matching: find.byType(TextFormField),
        ),
        'DELETE',
      );
      await tester.tap(find.text('Usuń'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(api.callsOf('unit.delete').single.arguments, {'id': 41});
      expect(find.text('1203'), findsNothing);
    });
  });
}
