import 'package:devixly_admin/app/di/injection.dart';
import 'package:devixly_admin/core/l10n/l10n.dart';
import 'package:devixly_admin/core/services/media_picker.dart';
import 'package:devixly_admin/core/theme/app_colors.dart';
import 'package:devixly_admin/core/widgets/dialogs/confirm_dialog.dart';
import 'package:devixly_admin/core/widgets/dialogs/typed_confirmation_dialog.dart';
import 'package:devixly_admin/features/admins/presentation/view/add_admin_view.dart';
import 'package:devixly_admin/features/companies/domain/entities/company.dart';
import 'package:devixly_admin/features/users/domain/entities/managed_user.dart';
import 'package:devixly_admin/features/users/domain/entities/user_company.dart';
import 'package:devixly_admin/features/users/domain/entities/user_drafts.dart';
import 'package:devixly_admin/features/users/presentation/view/add_user_view.dart';
import 'package:devixly_admin/features/users/presentation/view/csv_import_view.dart';
import 'package:devixly_admin/features/users/presentation/view/users_list_view.dart';
import 'package:devixly_admin/features/users/presentation/widgets/csv_import_view/edit_csv_user_dialog.dart';
import 'package:devixly_admin/features/users/presentation/widgets/csv_import_view/invalid_emails_dialog.dart';
import 'package:devixly_admin/features/users/presentation/widgets/users_list_view/edit_user_dialog.dart';
import 'package:devixly_admin/features/users/presentation/widgets/users_list_view/user_preview_dialog.dart';
import 'package:devixly_admin/features/users/presentation/view_model/csv_import_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/app_harness.dart';
import '../../helpers/fake_media_picker.dart';
import '../../helpers/golden_helpers.dart';
import '../../helpers/test_dependencies.dart';

const _user = ManagedUser(
  id: 3,
  firstName: 'Piotr',
  lastName: 'Wiśniewski',
  email: 'piotr@devixly.com',
  phoneNumber: '+48 600 300 400',
  company: UserCompany(id: 2, name: 'Devixly Sp. z o.o.'),
);
const _admin = ManagedUser(
  id: 2,
  firstName: 'Anna',
  lastName: 'Nowak',
  email: 'anna.nowak@crowdempire.ae',
  phoneNumber: '+48 600 200 300',
  isAdministrator: true,
  company: UserCompany(id: 1, name: 'Crowd Empire'),
);
const _blockedUser = ManagedUser(
  id: 4,
  firstName: 'Ewa',
  lastName: 'Zielińska',
  email: 'ewa@lodzkie.pl',
  phoneNumber: '+48 600 400 500',
  isBlocked: true,
  company: UserCompany(id: 3, name: 'Łódzkie Nieruchomości', isBlocked: true),
);
const _companies = [
  Company(id: 1, name: 'Crowd Empire'),
  Company(id: 2, name: 'Devixly Sp. z o.o.'),
];
const _csvUser = CsvUser(
  firstName: 'Marek',
  lastName: 'Lewandowski',
  email: 'marek.lewandowski@example.com',
  phoneNumber: '+48 501 111 222',
);
const _tall = Size(800, 1100);

Future<void> _expectBaseline(String name) => expectLater(
  find.byType(MaterialApp),
  matchesGoldenFile(baselineGolden(name, depth: 2)),
);

Future<void> _expectBaselineWithBoldText(String name) =>
    expectGoldenWithTolerance(
      find.byType(MaterialApp),
      baselineGolden(name, depth: 2),
      tolerance: 0.01,
    );

void main() {
  tearDown(getIt.reset);

  testWidgets('UsersListView wygląda jak w FlutterFlow', (tester) async {
    await setUpTestDependencies();
    await pumpView(
      tester,
      const UsersListView(),
      viewport: GoldenViewport.desktop,
    );
    await _expectBaseline('pages/users_list_desktop');
  });

  testWidgets('AddUserView wygląda jak w FlutterFlow', (tester) async {
    await setUpTestDependencies();
    await pumpView(
      tester,
      const AddUserView(),
      viewport: GoldenViewport.desktop,
    );
    await _expectBaseline('pages/add_user_desktop');
  });

  testWidgets('AddAdminView wygląda jak w FlutterFlow', (tester) async {
    await setUpTestDependencies();
    await pumpView(
      tester,
      const AddAdminView(),
      viewport: GoldenViewport.desktop,
    );
    await _expectBaseline('pages/add_admin_desktop');
  });

  group('CsvImportView', () {
    testWidgets('bez pliku wygląda jak w FlutterFlow', (tester) async {
      await setUpTestDependencies();
      await pumpView(
        tester,
        const CsvImportView(),
        viewport: GoldenViewport.desktop,
      );
      await _expectBaseline('pages/add_list_of_users_desktop');
    });

    testWidgets('z wczytanym CSV wygląda jak w FlutterFlow', (tester) async {
      await setUpTestDependencies();
      getIt
        ..unregister<MediaPicker>()
        ..registerSingleton<MediaPicker>(FakeMediaPicker());
      await pumpView(
        tester,
        const CsvImportView(),
        viewport: GoldenViewport.desktop,
      );
      // Wczytujemy plik przez cubit (klikanie zostawiłoby przycisk
      // w stanie podświetlenia, którego nie ma we wzorcu).
      await tester
          .element(find.text('Załaduj plik'))
          .read<CsvImportCubit>()
          .pickFile();
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));
      await _expectBaseline('pages/add_list_of_users_csv_desktop');
    });
  });

  group('dialogi', () {
    // Jedyna różnica wobec wzorca: poprawiona etykieta pierwszego wiersza
    // („Imię i nazwisko:” zamiast błędnego „Numer telefonu:”).
    testWidgets('podgląd użytkownika wygląda jak w FlutterFlow', (
      tester,
    ) async {
      await pumpComponent(
        tester,
        const UserPreviewDialog(user: _user),
        viewport: _tall,
      );
      await _expectBaseline('components/display_user');
    });

    testWidgets('edycja użytkownika wygląda jak w FlutterFlow', (tester) async {
      await pumpComponent(
        tester,
        EditUserDialog(
          user: _user,
          companies: _companies,
          onSave: (_) async => true,
          onAddCompany: () {},
        ),
        viewport: _tall,
      );
      await _expectBaseline('components/update_user');
    });

    for (final (golden, user, block) in [
      ('block_user_confirm', _user, true),
      ('unblock_user_confirm', _blockedUser, false),
    ]) {
      testWidgets('$golden wygląda jak w FlutterFlow', (tester) async {
        await pumpComponent(
          tester,
          Builder(
            builder: (context) {
              final l10n = context.l10n;
              return TypedConfirmationDialog(
                messagePrefix: block
                    ? l10n.userBlockMessage
                    : l10n.userUnblockMessage,
                highlights: [user.lastName, user.firstName],
                messageSuffix: l10n.userQuestionMark,
                phrase: block ? l10n.blockPhrase : l10n.unblockPhrase,
                mismatchMessage: block
                    ? l10n.blockMismatch
                    : l10n.unblockMismatch,
                confirmLabel: block ? l10n.commonBlock : l10n.commonUnblock,
                confirmColor: block ? AppColors.accent1 : AppColors.accent2,
                onConfirm: () async => true,
              );
            },
          ),
        );
        await _expectBaselineWithBoldText('components/$golden');
      });
    }

    for (final (golden, user, isAdmin) in [
      ('delete_user_confirm', _user, false),
      ('delete_admin_user_confirm', _admin, true),
    ]) {
      testWidgets('$golden wygląda jak w FlutterFlow', (tester) async {
        await pumpComponent(
          tester,
          Builder(
            builder: (context) {
              final l10n = context.l10n;
              return TypedConfirmationDialog(
                messagePrefix: l10n.userDeleteMessage,
                highlights: [user.lastName, user.firstName],
                messageSuffix: isAdmin
                    ? l10n.userDeleteAdminSuffix
                    : l10n.userQuestionMark,
                phrase: isAdmin ? l10n.deleteAdminPhrase : l10n.deletePhrase,
                mismatchMessage: isAdmin
                    ? l10n.deleteAdminMismatch
                    : l10n.deleteMismatch,
                confirmLabel: l10n.commonDelete,
                confirmColor: AppColors.accent3,
                onConfirm: () async => true,
              );
            },
          ),
        );
        await _expectBaselineWithBoldText('components/$golden');
      });
    }

    testWidgets('edycja wiersza CSV wygląda jak w FlutterFlow', (tester) async {
      await pumpComponent(
        tester,
        const EditCsvUserDialog(user: _csvUser),
        viewport: _tall,
      );
      await _expectBaseline('components/update_csv_user');
    });

    testWidgets('usunięcie wiersza CSV wygląda jak w FlutterFlow', (
      tester,
    ) async {
      await pumpComponent(
        tester,
        Builder(
          builder: (context) => ConfirmDialog(
            message: context.l10n.csvDeleteMessage,
            highlight: _csvUser.displayName,
            confirmLabel: context.l10n.commonDelete,
            onConfirm: () async => true,
          ),
        ),
      );
      await _expectBaseline('components/delete_csv_user_confirm');
    });

    testWidgets('lista błędnych e-maili wygląda jak w FlutterFlow', (
      tester,
    ) async {
      await pumpComponent(
        tester,
        Builder(
          builder: (context) => InvalidEmailsDialog(
            title: context.l10n.csvInvalidEmailsTitle,
            description: context.l10n.csvInvalidEmailsDescription,
            errors: const [
              'linia 3: "jan.kowalski@"',
              'linia 7: "zofia@@example.com"',
            ],
          ),
        ),
      );
      await _expectBaseline('components/error_valid_email');
    });
  });
}
