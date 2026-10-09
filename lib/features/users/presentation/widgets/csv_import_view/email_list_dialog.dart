import 'package:flutter/material.dart';

import '../../../../../core/l10n/l10n.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/dialogs/dialog_card.dart';

/// Dialog z listą adresów e-mail: błędnych w pliku CSV albo takich, na
/// które nie udało się wysłać hasła po imporcie.
class EmailListDialog extends StatelessWidget {
  const EmailListDialog({
    super.key,
    required this.title,
    required this.description,
    required this.emails,
  });

  final String title;
  final String description;
  final List<String> emails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: DialogCard(
        constraints: const BoxConstraints(minWidth: 320, maxWidth: 500),
        spacing: 20,
        children: [
          Text(title, style: AppTextStyles.dialogTitle),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyLarge,
            ),
          ),
          Column(
            spacing: 5,
            children: [
              for (final email in emails)
                Text(email, style: AppTextStyles.input),
            ],
          ),
          DialogActions(
            children: [
              AppButton(
                label: context.l10n.commonClose,
                color: AppColors.accent3,
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
