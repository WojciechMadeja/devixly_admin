import 'package:devixly_admin/app/di/injection.dart';
import 'package:devixly_admin/core/l10n/l10n.dart';
import 'package:devixly_admin/core/theme/app_colors.dart';
import 'package:devixly_admin/core/widgets/dialogs/typed_confirmation_dialog.dart';
import 'package:devixly_admin/features/companies/domain/entities/company.dart';
import 'package:devixly_admin/features/companies/presentation/view/companies_view.dart';
import 'package:devixly_admin/features/companies/presentation/widgets/companies_view/company_card.dart';
import 'package:devixly_admin/features/companies/presentation/widgets/companies_view/edit_company_dialog.dart';
import 'package:devixly_admin/features/companies/presentation/widgets/shared/company_picker_dialog.dart';
import 'package:devixly_admin/features/companies/presentation/widgets/shared/company_select_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/app_harness.dart';
import '../../helpers/fake_xano_api.dart';
import '../../helpers/golden_helpers.dart';
import '../../helpers/test_dependencies.dart';

const _owner = Company(id: 1, name: 'Crowd Empire', agentsCount: 12);
const _devixly = Company(
  id: 2,
  name: 'Devixly Sp. z o.o.',
  email: 'kontakt@devixly.com',
  address: 'ul. Długa 5',
  postCode: '30-001',
  city: 'Kraków',
  phoneNumber: '+48 12 300 40 50',
  representative: 'Piotr Wiśniewski',
  agentsCount: 4,
);
const _blocked = Company(
  id: 3,
  name: 'Łódzkie Nieruchomości',
  isBlocked: true,
);
const _card = Size(800, 240);
const _tall = Size(800, 1100);

Future<bool> _noop() async => true;

Future<void> _expectBaseline(String name) => expectLater(
      find.byType(MaterialApp),
      matchesGoldenFile(baselineGolden(name, depth: 2)),
    );

/// Dialogi z pogrubioną nazwą w `RichText`: prawdziwy Inter Bold zamiast
/// sztucznego pogrubienia z FlutterFlow (świadoma różnica, ok. 0,5–0,8%).
Future<void> _expectBaselineWithBoldText(String name) =>
    expectGoldenWithTolerance(
      find.byType(MaterialApp),
      baselineGolden(name, depth: 2),
      tolerance: 0.01,
    );

void main() {
  tearDown(getIt.reset);

  group('CompaniesView', () {
    testWidgets('desktop wygląda jak w FlutterFlow', (tester) async {
      await setUpTestDependencies();
      await pumpView(
        tester,
        const CompaniesView(),
        viewport: GoldenViewport.desktop,
      );
      await _expectBaseline('pages/add_company_desktop');
    });

    testWidgets('ładowanie wygląda jak w FlutterFlow', (tester) async {
      await setUpTestDependencies(
        api: FakeXanoApi(responseDelay: const Duration(seconds: 10)),
      );
      await pumpView(
        tester,
        const CompaniesView(),
        viewport: GoldenViewport.desktop,
      );
      await _expectBaseline('pages/add_company_loading_desktop');
      await tester.pump(const Duration(seconds: 11));
    });

    // Stary układ mobilny wylewał się poza ekran — nowy ma własny wzorzec.
    testWidgets('mobile mieści się na ekranie', (tester) async {
      await setUpTestDependencies();
      await pumpView(
        tester,
        const CompaniesView(),
        viewport: GoldenViewport.mobile,
      );
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/companies_mobile.png'),
      );
    });
  });

  group('karta firmy', () {
    for (final (golden, company, selected) in [
      ('company_card', _devixly, false),
      ('company_card_selected', _devixly, true),
      ('company_card_blocked_selected', _blocked, true),
      ('company_card_protected_selected', _owner, true),
    ]) {
      testWidgets('$golden wygląda jak w FlutterFlow', (tester) async {
        await pumpComponent(
          tester,
          CompanyCard(
            company: company,
            selected: selected,
            onEdit: () {},
            onToggleBlocked: () {},
            onDelete: () {},
          ),
          viewport: _card,
        );
        await _expectBaseline('components/$golden');
      });
    }
  });

  group('dialogi', () {
    testWidgets('edycja firmy wygląda jak w FlutterFlow', (tester) async {
      await pumpComponent(
        tester,
        EditCompanyDialog(company: _devixly, onSave: (_) async => true),
        viewport: _tall,
      );
      await _expectBaseline('components/update_company_name');
    });

    for (final (golden, company, block) in [
      ('block_company_confirm', _devixly, true),
      ('unblock_company_confirm', _blocked, false),
    ]) {
      testWidgets('$golden wygląda jak w FlutterFlow', (tester) async {
        await pumpComponent(
          tester,
          Builder(
            builder: (context) {
              final l10n = context.l10n;
              return TypedConfirmationDialog(
                messagePrefix: block
                    ? l10n.companyBlockMessage
                    : l10n.companyUnblockMessage,
                highlight: company.name,
                messageSuffix: l10n.companyWithAgentsSuffix,
                phrase: block ? l10n.blockPhrase : l10n.unblockPhrase,
                mismatchMessage:
                    block ? l10n.blockMismatch : l10n.unblockMismatch,
                confirmLabel: block ? l10n.commonBlock : l10n.commonUnblock,
                confirmColor: block ? AppColors.accent1 : AppColors.accent2,
                onConfirm: _noop,
              );
            },
          ),
        );
        await _expectBaselineWithBoldText('components/$golden');
      });
    }

    testWidgets('usunięcie firmy wygląda jak w FlutterFlow', (tester) async {
      await pumpComponent(
        tester,
        Builder(
          builder: (context) {
            final l10n = context.l10n;
            return TypedConfirmationDialog(
              messagePrefix: l10n.companyDeleteMessage,
              highlight: _devixly.name,
              messageSuffix: l10n.companyWithAgentsSuffix,
              phrase: l10n.deletePhrase,
              mismatchMessage: l10n.deleteMismatch,
              confirmLabel: l10n.commonDelete,
              confirmColor: AppColors.accent3,
              onConfirm: _noop,
            );
          },
        ),
      );
      await _expectBaselineWithBoldText('components/delete_company_confirm');
    });
  });

  group('wybór firmy', () {
    testWidgets('lista firm wygląda jak w FlutterFlow', (tester) async {
      await pumpComponent(
        tester,
        CompanyPickerDialog(
          companies: const [_owner, _devixly, _blocked],
          onAddCompany: () {},
        ),
        viewport: _tall,
      );
      await _expectBaseline('components/companies_list_for_select');
    });

    testWidgets('pusta lista wygląda jak w FlutterFlow', (tester) async {
      await pumpComponent(
        tester,
        CompanyPickerDialog(companies: const [], onAddCompany: () {}),
      );
      await _expectBaseline('components/companies_list_for_select_empty');
    });

    testWidgets('karta wyboru wygląda jak w FlutterFlow', (tester) async {
      await pumpComponent(
        tester,
        const CompanySelectCard(company: _devixly),
        viewport: _card,
      );
      await _expectBaseline('components/company_select_card');
    });
  });
}
