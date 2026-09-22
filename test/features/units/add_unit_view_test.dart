import 'package:devixly_admin/core/errors/failures.dart';
import 'package:devixly_admin/features/units/domain/entities/unit_draft.dart';
import 'package:devixly_admin/features/units/domain/repositories/units_repository.dart';
import 'package:devixly_admin/features/units/presentation/view/add_unit_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';

import '../../helpers/app_harness.dart';
import '../../helpers/golden_helpers.dart';

/// Atrapa repozytorium — ekran nie ma jeszcze endpointu w Xano.
class _RecordingUnitsRepository implements UnitsRepository {
  final drafts = <UnitDraft>[];

  @override
  Future<Either<Failure, Unit>> addUnit(UnitDraft draft) async {
    drafts.add(draft);
    return const Right(unit);
  }
}

void main() {
  late _RecordingUnitsRepository repository;

  setUp(() => repository = _RecordingUnitsRepository());

  testWidgets('AddUnitView wygląda jak w FlutterFlow', (tester) async {
    await pumpView(
      tester,
      AddUnitView(repository: repository),
      viewport: GoldenViewport.desktop,
    );
    await expectLater(
      find.byType(MaterialApp),
      matchesGoldenFile(baselineGolden('pages/add_unity_desktop', depth: 2)),
    );
  });

  testWidgets('zapis przekazuje dane jednostki, a nie rejestruje admina',
      (tester) async {
    await pumpView(
      tester,
      AddUnitView(repository: repository),
      viewport: GoldenViewport.desktop,
    );

    await tester.enterText(find.byType(TextFormField).at(0), '12A');
    await tester.enterText(find.byType(TextFormField).at(1), '450000');
    await tester.enterText(find.byType(TextFormField).at(2), 'Kowalski');
    await tester.enterText(find.byType(TextFormField).at(3), '+48 600 100 200');
    await tester.tap(find.text('Zapisz'));
    await tester.pump();

    expect(repository.drafts, [
      const UnitDraft(
        apartmentNumber: '12A',
        price: '450000',
        ownerLastName: 'Kowalski',
        phoneNumber: '+48 600 100 200',
      ),
    ]);
  });

  testWidgets('niepełny formularz nie trafia do repozytorium', (tester) async {
    await pumpView(
      tester,
      AddUnitView(repository: repository),
      viewport: GoldenViewport.desktop,
    );

    await tester.enterText(find.byType(TextFormField).at(0), '12A');
    await tester.tap(find.text('Zapisz'));
    await tester.pump();

    expect(repository.drafts, isEmpty);
    expect(find.text('Wszystkie pola powinny być wypełnione'), findsOneWidget);
  });
}
