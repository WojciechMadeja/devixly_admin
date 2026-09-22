import 'package:flutter/material.dart';

import '../../../../../core/l10n/l10n.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../../../core/widgets/dialogs/dialog_card.dart';
import '../../../domain/entities/user_drafts.dart';

/// Poprawianie danych wiersza wczytanego z pliku CSV (tylko lokalnie).
class EditCsvUserDialog extends StatefulWidget {
  const EditCsvUserDialog({super.key, required this.user});

  final CsvUser user;

  @override
  State<EditCsvUserDialog> createState() => _EditCsvUserDialogState();
}

class _EditCsvUserDialogState extends State<EditCsvUserDialog> {
  late final _lastName = TextEditingController(text: widget.user.lastName);
  late final _firstName = TextEditingController(text: widget.user.firstName);
  late final _email = TextEditingController(text: widget.user.email);
  late final _phoneNumber =
      TextEditingController(text: widget.user.phoneNumber);

  @override
  void dispose() {
    _lastName.dispose();
    _firstName.dispose();
    _email.dispose();
    _phoneNumber.dispose();
    super.dispose();
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
              onPressed: () => Navigator.pop(
                context,
                widget.user.copyWith(
                  lastName: _lastName.text.trim(),
                  firstName: _firstName.text.trim(),
                  email: _email.text.trim(),
                  phoneNumber: _phoneNumber.text.trim(),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
