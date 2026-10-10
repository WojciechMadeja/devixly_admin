import 'package:devixly_admin/app/di/injection.dart';
import 'package:devixly_admin/core/state/loadable.dart';
import 'package:devixly_admin/core/widgets/dialogs/searchable_picker_dialog.dart';
import 'package:devixly_admin/features/projects/domain/entities/project_option.dart';
import 'package:devixly_admin/features/units/data/datasources/units_remote_data_source.dart';
import 'package:devixly_admin/features/units/domain/entities/unit_draft.dart';
import 'package:devixly_admin/features/units/presentation/view/add_unit_view.dart';
import 'package:devixly_admin/features/units/presentation/view_model/add_unit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/app_harness.dart';
import '../../helpers/fake_backend.dart';
import '../../helpers/golden_helpers.dart';
import '../../helpers/test_dependencies.dart';

void main() {
  late FakeBackend api;

  setUp(() async => api = await setUpTestDependencies());
  tearDown(getIt.reset);

  group('kontrakt', () {
    test('unit.create wysyła jednostkę razem z projektem', () async {
      await getIt<UnitsRemoteDataSource>().addUnit(
        const UnitDraft(
          projectId: 1,
          number: '12A',
          price: 450000,
          area: 1000,
          floor: '3',
          status: 'available',
          height: 'Simplex',
          typeOfSale: 'offPlan',
          unitTypeId: 4,
          layoutId: 6,
        ),
      );

      final call = api.calls.single;
      expect(call.route, 'unit.create');
      expect(call.arguments['input'], {
        'projectId': 1,
        'number': '12A',
        'price': 450000,
        'status': 'available',
        'height': 'Simplex',
        'floor': '3',
        'area': 1000.0,
        'typeOfSale': 'offPlan',
        'unitTypeId': 4,
        'layoutId': 6,
      });
    });
  });

  group('AddUnitView', () {
    testWidgets('wyszukiwarka pokazuje projekty i zawęża listę', (
      tester,
    ) async {
      await pumpView(
        tester,
        const AddUnitView(),
        viewport: GoldenViewport.desktop,
      );

      await tester.tap(find.text('Wyszukaj projekt'));
      await tester.pumpAndSettle();
      expect(find.text('Marina Heights'), findsOneWidget);
      expect(find.text('Palm Residence'), findsOneWidget);

      await tester.enterText(
        find.descendant(
          of: find.byType(SearchablePickerDialog<ProjectOption>),
          matching: find.byType(TextFormField),
        ),
        'pal',
      );
      await tester.pump();
      expect(find.text('Marina Heights'), findsNothing);
      expect(find.text('Palm Residence'), findsOneWidget);

      await tester.tap(find.text('Palm Residence'));
      await tester.pumpAndSettle();
      // Wybrany projekt zostaje w polu wyszukiwarki.
      expect(find.text('Palm Residence'), findsOneWidget);
    });

    testWidgets('bez projektu nie wysyłamy jednostki', (tester) async {
      await pumpView(
        tester,
        const AddUnitView(),
        viewport: GoldenViewport.desktop,
      );

      await tester.enterText(find.byType(TextFormField).first, '12A');
      // Formularz jest dłuższy niż ekran — przycisk trzeba najpierw
      // przewinąć w widok.
      await tester.ensureVisible(find.text('Zapisz'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Zapisz'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(api.callsOf('unit.create'), isEmpty);
      expect(
        find.text('Wybierz projekt i podaj numer jednostki'),
        findsOneWidget,
      );
    });

    testWidgets('zapis wysyła jednostkę do wybranego projektu', (tester) async {
      await pumpView(
        tester,
        const AddUnitView(),
        viewport: GoldenViewport.desktop,
      );

      // Projekt wybieramy przez cubit — klikanie w dialogu zostawiłoby
      // przycisk w stanie podświetlenia, a sprawdzamy tu samo żądanie.
      final cubit = tester.element(find.text('Zapisz')).read<AddUnitCubit>();
      final projects = switch (cubit.state.projects) {
        Loaded(:final value) => value,
        _ => const <ProjectOption>[],
      };
      cubit.selectProject(projects.first);
      await tester.pump();
      await tester.enterText(find.byType(TextFormField).first, '12A');
      // Formularz jest dłuższy niż ekran — przycisk trzeba najpierw
      // przewinąć w widok.
      await tester.ensureVisible(find.text('Zapisz'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Zapisz'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      final call = api.callsOf('unit.create').single;
      expect(call.arguments['input'], containsPair('projectId', 1));
      expect(call.arguments['input'], containsPair('number', '12A'));
    });
  });
}
