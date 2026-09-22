import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/di/injection.dart';
import '../../../../app/router/app_routes.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/l10n/l10n.dart';
import '../../../../core/state/loadable.dart';
import '../../../../core/state/submission_status.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/widgets/admin_page_scaffold.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_snack_bar.dart';
import '../../../../core/widgets/dialogs/confirm_dialog.dart';
import '../../../../core/widgets/dialogs/info_dialog.dart';
import '../../../../core/widgets/dialogs/show_app_dialog.dart';
import '../../../companies/presentation/widgets/shared/company_picker_field.dart';
import '../../domain/entities/user_drafts.dart';
import '../view_model/csv_import_cubit.dart';
import '../view_model/csv_import_state.dart';
import '../widgets/csv_import_view/csv_users_table.dart';
import '../widgets/csv_import_view/edit_csv_user_dialog.dart';
import '../widgets/csv_import_view/invalid_emails_dialog.dart';

/// Import użytkowników z pliku CSV.
class CsvImportView extends StatelessWidget {
  const CsvImportView({super.key});

  static const pageTitle = 'AddListOfUsersPage';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CsvImportCubit>()..loadCompanies(),
      child: MultiBlocListener(
        listeners: [
          BlocListener<CsvImportCubit, CsvImportState>(
            listenWhen: (a, b) => a.fileStatus != b.fileStatus,
            listener: _onFileStatus,
          ),
          BlocListener<CsvImportCubit, CsvImportState>(
            listenWhen: (a, b) => a.submission != b.submission,
            listener: (context, state) =>
                _onSubmission(context, state.submission),
          ),
        ],
        child:
            const AdminPageScaffold(title: pageTitle, body: _CsvImportBody()),
      ),
    );
  }

  void _onFileStatus(BuildContext context, CsvImportState state) {
    final l10n = context.l10n;
    switch (state.fileStatus) {
      case CsvFileInvalidEmails(:final errors):
        showAppDialog<void>(
          context,
          builder: (_) => InvalidEmailsDialog(
            title: l10n.csvInvalidEmailsTitle,
            description: l10n.csvInvalidEmailsDescription,
            errors: errors,
          ),
        );
      case CsvFileMissingHeaders():
        showInfoDialog(
          context,
          title: l10n.csvNotRecognizedTitle,
          description: l10n.csvMissingHeadersDescription,
          isError: true,
        );
      case CsvFileNotRecognized():
        showInfoDialog(
          context,
          title: l10n.csvNotRecognizedTitle,
          description: l10n.csvNotRecognizedDescription,
          isError: true,
        );
      case CsvFileIdle():
        break;
    }
  }

  void _onSubmission(BuildContext context, SubmissionStatus status) {
    final messenger = ScaffoldMessenger.of(context);
    final l10n = context.l10n;
    switch (status) {
      case SubmissionSuccess():
        AppSnackBar.show(
          messenger,
          message: l10n.csvImported,
          backgroundColor: AppColors.secondary,
        );
      case SubmissionFailure(failure: ValidationFailure()):
        AppSnackBar.error(messenger, l10n.csvNothingToImport);
      case SubmissionFailure():
        AppSnackBar.error(messenger, l10n.csvImportFailed);
      case SubmissionIdle() || Submitting():
        break;
    }
  }
}

class _CsvImportBody extends StatelessWidget {
  const _CsvImportBody();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final cubit = context.read<CsvImportCubit>();
    final sidePadding = Responsive.percentOfWidth(context, 15);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sidePadding),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          spacing: 25,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                l10n.addUserTitle,
                textAlign: TextAlign.center,
                style: AppTextStyles.pageTitle,
              ),
            ),
            AppButton.large(
              label: l10n.csvLoadFile,
              width: 200,
              color: AppColors.accent1,
              onPressed: cubit.pickFile,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: BlocBuilder<CsvImportCubit, CsvImportState>(
                buildWhen: (a, b) => a.users != b.users,
                builder: (context, state) => state.users.isEmpty
                    ? const SizedBox.shrink()
                    : _CsvTable(users: state.users),
              ),
            ),
            BlocBuilder<CsvImportCubit, CsvImportState>(
              buildWhen: (a, b) =>
                  a.companies != b.companies ||
                  a.selectedCompany != b.selectedCompany,
              builder: (context, state) => CompanyPickerField(
                companies: switch (state.companies) {
                  Loaded(:final value) => value,
                  _ => const [],
                },
                selected: state.selectedCompany,
                onSelected: cubit.selectCompany,
                onAddCompany: () => context.push(AppRoutes.companies),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: BlocSelector<CsvImportCubit, CsvImportState, bool>(
                selector: (state) => state.submission is Submitting,
                builder: (context, isSubmitting) => AppButton.large(
                  label: l10n.commonSave,
                  width: 200,
                  isLoading: isSubmitting,
                  onPressed: cubit.submit,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CsvTable extends StatefulWidget {
  const _CsvTable({required this.users});

  final List<CsvUser> users;

  @override
  State<_CsvTable> createState() => _CsvTableState();
}

class _CsvTableState extends State<_CsvTable> {
  bool? _sortedAscending;

  Future<void> _edit(int index) async {
    final cubit = context.read<CsvImportCubit>();
    final updated = await showAppDialog<CsvUser>(
      context,
      builder: (_) => EditCsvUserDialog(user: widget.users[index]),
    );
    if (updated != null) cubit.updateUser(index, updated);
  }

  Future<void> _delete(int index) async {
    final cubit = context.read<CsvImportCubit>();
    final user = widget.users[index];
    await showAppDialog<void>(
      context,
      builder: (dialogContext) => ConfirmDialog(
        message: dialogContext.l10n.csvDeleteMessage,
        highlight: user.displayName,
        confirmLabel: dialogContext.l10n.commonDelete,
        onConfirm: () async {
          cubit.removeUser(index);
          return true;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CsvUsersTable(
      users: widget.users,
      sortedAscending: _sortedAscending,
      onSort: ({required bool ascending}) {
        setState(() => _sortedAscending = ascending);
        context.read<CsvImportCubit>().sortByName(ascending: ascending);
      },
      onEdit: _edit,
      onDelete: _delete,
    );
  }
}
