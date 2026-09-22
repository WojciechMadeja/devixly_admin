import 'package:flutter/material.dart';

import '../../../../../core/l10n/l10n.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../../../core/widgets/dialogs/dialog_card.dart';
import '../../../../companies/domain/entities/company.dart';
import '../../../../companies/presentation/widgets/shared/company_picker_field.dart';
import '../../../domain/entities/managed_user.dart';
import '../../../domain/entities/user_drafts.dart';

/// Dialog edycji danych użytkownika. [onSave] zapisuje zmiany i zwraca, czy
/// się udały — przy sukcesie dialog się zamyka.
class EditUserDialog extends StatefulWidget {
  const EditUserDialog({
    super.key,
    required this.user,
    required this.companies,
    required this.onSave,
    required this.onAddCompany,
  });

  final ManagedUser user;
  final List<Company> companies;
  final Future<bool> Function(UserUpdate update) onSave;
  final VoidCallback onAddCompany;

  @override
  State<EditUserDialog> createState() => _EditUserDialogState();
}

class _EditUserDialogState extends State<EditUserDialog> {
  late final _lastName = TextEditingController(text: widget.user.lastName);
  late final _firstName = TextEditingController(text: widget.user.firstName);
  late final _email = TextEditingController(text: widget.user.email);
  late final _phoneNumber =
      TextEditingController(text: widget.user.phoneNumber);
  late Company? _company = widget.companies
      .where((company) => company.id == widget.user.company.id)
      .firstOrNull;
  bool _isSaving = false;

  @override
  void dispose() {
    _lastName.dispose();
    _firstName.dispose();
    _email.dispose();
    _phoneNumber.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    setState(() => _isSaving = true);
    final succeeded = await widget.onSave(
      UserUpdate(
        email: _email.text.trim(),
        firstName: _firstName.text.trim(),
        lastName: _lastName.text.trim(),
        phoneNumber: _phoneNumber.text.trim(),
        companyId: _company?.id ?? widget.user.company.id,
      ),
    );
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
        Text(l10n.userEditTitle, style: AppTextStyles.dialogTitle),
        SizedBox(
          width: 250,
          child: AppTextField(
              controller: _lastName, hintText: l10n.userLastNameHint),
        ),
        SizedBox(
          width: 250,
          child: AppTextField(
              controller: _firstName, hintText: l10n.userFirstNameHint),
        ),
        SizedBox(
          width: 250,
          child: AppTextField(controller: _email, hintText: l10n.userEmailHint),
        ),
        CompanyPickerField(
          companies: widget.companies,
          selected: _company,
          onSelected: (company) => setState(() => _company = company),
          onAddCompany: widget.onAddCompany,
        ),
        SizedBox(
          width: 250,
          child: AppTextField(
              controller: _phoneNumber, hintText: l10n.userPhoneHint),
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
