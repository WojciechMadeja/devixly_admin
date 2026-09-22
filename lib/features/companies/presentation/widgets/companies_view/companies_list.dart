import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/l10n/l10n.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/app_snack_bar.dart';
import '../../../../../core/widgets/dialogs/show_app_dialog.dart';
import '../../../../../core/widgets/dialogs/typed_confirmation_dialog.dart';
import '../../../../../core/widgets/tap_area.dart';
import '../../../domain/entities/company.dart';
import '../../view_model/companies_cubit.dart';
import 'company_card.dart';
import 'edit_company_dialog.dart';

/// Przewijana lista kart firm. Kliknięcie zaznacza kartę, podwójne
/// kliknięcie odznacza.
class CompaniesList extends StatelessWidget {
  const CompaniesList({
    super.key,
    required this.companies,
    required this.selectedId,
    this.scrollable = true,
  });

  final List<Company> companies;
  final int? selectedId;

  /// Gdy `false`, lista nie przewija się sama (przewija się cała strona).
  final bool scrollable;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CompaniesCubit>();
    final list = Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        spacing: 5,
        children: [
          for (final company in companies)
            TapArea(
              key: ValueKey(company.id),
              onTap: () => cubit.select(company.id),
              onDoubleTap: cubit.clearSelection,
              child: CompanyCard(
                company: company,
                selected: company.id == selectedId,
                onEdit: () => _edit(context, company),
                onToggleBlocked: () => _toggleBlocked(context, company),
                onDelete: () => _delete(context, company),
              ),
            ),
        ],
      ),
    );
    return scrollable ? SingleChildScrollView(child: list) : list;
  }

  Future<void> _edit(BuildContext context, Company company) {
    final cubit = context.read<CompaniesCubit>();
    return showAppDialog<void>(
      context,
      builder: (_) => EditCompanyDialog(
        company: company,
        onSave: (draft) =>
            _reportFailure(context, cubit.update(company, draft)),
      ),
    );
  }

  Future<void> _toggleBlocked(BuildContext context, Company company) {
    final cubit = context.read<CompaniesCubit>();
    final l10n = context.l10n;
    final block = !company.isBlocked;
    return showAppDialog<void>(
      context,
      builder: (_) => TypedConfirmationDialog(
        messagePrefix:
            block ? l10n.companyBlockMessage : l10n.companyUnblockMessage,
        highlight: company.name,
        messageSuffix: l10n.companyWithAgentsSuffix,
        phrase: block ? l10n.blockPhrase : l10n.unblockPhrase,
        mismatchMessage: block ? l10n.blockMismatch : l10n.unblockMismatch,
        confirmLabel: block ? l10n.commonBlock : l10n.commonUnblock,
        confirmColor: block ? AppColors.accent1 : AppColors.accent2,
        onConfirm: () =>
            _reportFailure(context, cubit.setBlocked(company, block)),
      ),
    );
  }

  Future<void> _delete(BuildContext context, Company company) {
    final cubit = context.read<CompaniesCubit>();
    final l10n = context.l10n;
    return showAppDialog<void>(
      context,
      builder: (_) => TypedConfirmationDialog(
        messagePrefix: l10n.companyDeleteMessage,
        highlight: company.name,
        messageSuffix: l10n.companyWithAgentsSuffix,
        phrase: l10n.deletePhrase,
        mismatchMessage: l10n.deleteMismatch,
        confirmLabel: l10n.commonDelete,
        confirmColor: AppColors.accent3,
        onConfirm: () => _reportFailure(context, cubit.delete(company)),
      ),
    );
  }

  /// Pokazuje komunikat, gdy operacja się nie udała (dialog zostaje otwarty).
  Future<bool> _reportFailure(BuildContext context, Future<bool> action) async {
    final messenger = ScaffoldMessenger.of(context);
    final message = context.l10n.errorGeneric;
    final succeeded = await action;
    if (!succeeded) AppSnackBar.error(messenger, message);
    return succeeded;
  }
}
