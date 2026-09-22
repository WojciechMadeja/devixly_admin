import 'package:devixly_admin/core/theme/app_colors.dart';
import 'package:devixly_admin/core/widgets/dialogs/confirm_dialog.dart';
import 'package:devixly_admin/core/widgets/dialogs/info_dialog.dart';
import 'package:devixly_admin/core/widgets/dialogs/typed_confirmation_dialog.dart';
import 'package:devixly_admin/core/widgets/option_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/app_harness.dart';

Future<bool> _noop() async => true;

void main() {
  testWidgets('OptionCard wygląda jak kafelek FlutterFlow', (tester) async {
    await pumpComponent(
      tester,
      const OptionCard(
        icon: Icon(Icons.note_add, color: AppColors.primary, size: 55),
        label: 'Dodaj do aktualności',
      ),
    );
    await expectLater(
      find.byType(MaterialApp),
      matchesGoldenFile(baselineGolden('components/option_card', depth: 2)),
    );
  });

  testWidgets('InfoDialog (błąd) wygląda jak dialog FlutterFlow', (
    tester,
  ) async {
    await pumpComponent(
      tester,
      const InfoDialog(
        title: 'Coś poszło nie tak',
        description: 'Coś poszło nie tak',
        isError: true,
      ),
    );
    await expectLater(
      find.byType(MaterialApp),
      matchesGoldenFile(
        baselineGolden('components/information_error', depth: 2),
      ),
    );
  });

  testWidgets('InfoDialog (sukces) wygląda jak dialog FlutterFlow', (
    tester,
  ) async {
    await pumpComponent(
      tester,
      const InfoDialog(
        title: 'Zmiany zapisanme',
        description: 'Zaktualizowano hasło do konta.',
        isError: false,
      ),
    );
    await expectLater(
      find.byType(MaterialApp),
      matchesGoldenFile(
        baselineGolden('components/information_success', depth: 2),
      ),
    );
  });

  testWidgets('ConfirmDialog wygląda jak potwierdzenie usunięcia FlutterFlow', (
    tester,
  ) async {
    await pumpComponent(
      tester,
      const ConfirmDialog(
        message: 'Czy na pewno chcesz usunąć aktualizację:',
        highlight: 'Nowa inwestycja w Dubaju',
        confirmLabel: 'Usuń',
        onConfirm: _noop,
      ),
    );
    await expectLater(
      find.byType(MaterialApp),
      matchesGoldenFile(
        baselineGolden('components/delete_news_confirm', depth: 2),
      ),
    );
  });

  testWidgets(
    'TypedConfirmationDialog wygląda jak potwierdzenie blokady FlutterFlow',
    (tester) async {
      await pumpComponent(
        tester,
        const TypedConfirmationDialog(
          messagePrefix: 'Czy na pewno chcesz zablokować firmę ',
          highlights: ['Devixly Sp. z o.o.'],
          messageSuffix: ' ze wszystkim przypisanymi jej agentami?',
          phrase: 'BLOCK',
          mismatchMessage: 'Wpisz BLOCK, aby zablokować',
          confirmLabel: 'Zablokuj',
          confirmColor: AppColors.accent1,
          onConfirm: _noop,
        ),
      );
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          baselineGolden('components/block_company_confirm', depth: 2),
        ),
      );
    },
  );
}
