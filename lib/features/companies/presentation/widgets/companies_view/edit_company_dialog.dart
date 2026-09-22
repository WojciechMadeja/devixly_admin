import 'package:flutter/material.dart';

import '../../../../../core/l10n/l10n.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/dialogs/dialog_card.dart';
import '../../../domain/entities/company.dart';
import '../../../domain/entities/company_draft.dart';
import 'company_fields.dart';
import 'company_text_field.dart';

/// Dialog edycji danych firmy. [onSave] zapisuje zmiany i zwraca, czy się
/// udały — przy sukcesie dialog się zamyka.
class EditCompanyDialog extends StatefulWidget {
  const EditCompanyDialog({
    super.key,
    required this.company,
    required this.onSave,
  });

  final Company company;
  final Future<bool> Function(CompanyDraft draft) onSave;

  @override
  State<EditCompanyDialog> createState() => _EditCompanyDialogState();
}

class _EditCompanyDialogState extends State<EditCompanyDialog> {
  late final _fields = CompanyFieldControllers(widget.company.toDraft());
  bool _isSaving = false;

  @override
  void dispose() {
    _fields.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    setState(() => _isSaving = true);
    final succeeded = await widget.onSave(_fields.toDraft());
    if (!mounted) return;
    if (succeeded) {
      Navigator.pop(context);
    } else {
      setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return DialogCard(
      children: [
        Text(l10n.companyEditTitle, style: AppTextStyles.dialogTitle),
        CompanyTextField(controller: _fields.name, hint: l10n.companyNameHint),
        CompanyTextField(
          controller: _fields.email,
          hint: l10n.companyEditEmailHint,
        ),
        CompanyTextField(
          controller: _fields.address,
          hint: l10n.companyAddressHint,
        ),
        CompanyTextField(
          controller: _fields.postCode,
          hint: l10n.companyPostCodeHint,
        ),
        CompanyTextField(controller: _fields.city, hint: l10n.companyCityHint),
        CompanyTextField(
          controller: _fields.phoneNumber,
          hint: l10n.companyPhoneHint,
        ),
        CompanyTextField(
          controller: _fields.representative,
          hint: l10n.companyRepresentativeHint,
        ),
        DialogActions(
          children: [
            AppButton(
              label: l10n.commonCancel,
              onPressed: () => Navigator.pop(context),
            ),
            AppButton(
              label: l10n.commonSave,
              color: AppColors.accent1,
              isLoading: _isSaving,
              onPressed: _save,
            ),
          ],
        ),
      ],
    );
  }
}
