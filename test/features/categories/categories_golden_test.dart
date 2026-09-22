import 'package:devixly_admin/app/di/injection.dart';
import 'package:devixly_admin/core/l10n/l10n.dart';
import 'package:devixly_admin/core/widgets/dialogs/confirm_dialog.dart';
import 'package:devixly_admin/core/widgets/list_card.dart';
import 'package:devixly_admin/features/categories/domain/entities/category.dart';
import 'package:devixly_admin/features/categories/presentation/view/categories_view.dart';
import 'package:devixly_admin/features/categories/presentation/widgets/categories_view/category_card.dart';
import 'package:devixly_admin/features/categories/presentation/widgets/categories_view/rename_category_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/app_harness.dart';
import '../../helpers/fake_xano_api.dart';
import '../../helpers/golden_helpers.dart';
import '../../helpers/test_dependencies.dart';

const _investments = Category(id: 2, name: 'Inwestycje', newsCount: 5);
const _owner = Category(id: 1, name: 'Crowd Empire', newsCount: 3);
const _card = Size(800, 240);

Future<bool> _noop() async => true;

void main() {
  tearDown(getIt.reset);

  group('CategoriesView', () {
    testWidgets('desktop wygląda jak w FlutterFlow', (tester) async {
      await setUpTestDependencies();
      await pumpView(
        tester,
        const CategoriesView(),
        viewport: GoldenViewport.desktop,
      );
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          baselineGolden('pages/add_category_desktop', depth: 2),
        ),
      );
    });

    testWidgets('ładowanie wygląda jak w FlutterFlow', (tester) async {
      await setUpTestDependencies(
        api: FakeXanoApi(responseDelay: const Duration(seconds: 10)),
      );
      await pumpView(
        tester,
        const CategoriesView(),
        viewport: GoldenViewport.desktop,
      );
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          baselineGolden('pages/add_category_loading_desktop', depth: 2),
        ),
      );
      await tester.pump(const Duration(seconds: 11));
    });

    // Stary układ mobilny wylewał się poza ekran — nowy ma własny wzorzec.
    testWidgets('mobile mieści się na ekranie', (tester) async {
      await setUpTestDependencies();
      await pumpView(
        tester,
        const CategoriesView(),
        viewport: GoldenViewport.mobile,
      );
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/categories_mobile.png'),
      );
    });
  });

  group('komponenty', () {
    for (final (golden, category, selected) in [
      ('category_card', _investments, false),
      ('category_card_selected', _investments, true),
      ('category_card_protected_selected', _owner, true),
    ]) {
      testWidgets('$golden wygląda jak w FlutterFlow', (tester) async {
        await pumpComponent(
          tester,
          CategoryCard(
            category: category,
            selected: selected,
            onEdit: () {},
            onDelete: () {},
          ),
          viewport: _card,
        );
        await expectLater(
          find.byType(MaterialApp),
          matchesGoldenFile(baselineGolden('components/$golden', depth: 2)),
        );
      });
    }

    testWidgets('szkielet karty wygląda jak w FlutterFlow', (tester) async {
      await pumpComponent(tester, const ListCardSkeleton(), viewport: _card);
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          baselineGolden('components/placeholder_company_card', depth: 2),
        ),
      );
    });

    testWidgets('dialog zmiany nazwy wygląda jak w FlutterFlow', (
      tester,
    ) async {
      await pumpComponent(
        tester,
        RenameCategoryDialog(
          category: _investments,
          onRename: (_) async => true,
        ),
      );
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          baselineGolden('components/update_category_name', depth: 2),
        ),
      );
    });

    testWidgets('potwierdzenie usunięcia wygląda jak w FlutterFlow', (
      tester,
    ) async {
      await pumpComponent(
        tester,
        Builder(
          builder: (context) => ConfirmDialog(
            message: context.l10n.categoryDeleteMessage,
            highlight: _investments.name,
            confirmLabel: context.l10n.commonDelete,
            onConfirm: _noop,
          ),
        ),
      );
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          baselineGolden('components/delete_category_confirm', depth: 2),
        ),
      );
    });
  });
}
