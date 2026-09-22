import 'package:flutter/material.dart';

import '../../l10n/l10n.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../app_button.dart';
import 'dialog_card.dart';
import 'show_app_dialog.dart';

/// Dialog z informacją lub błędem i przyciskiem „Zamknij” (zielonym przy
/// sukcesie, bordowym przy błędzie).
class InfoDialog extends StatelessWidget {
  const InfoDialog({
    super.key,
    required this.title,
    required this.description,
    required this.isError,
  });

  final String title;
  final String description;
  final bool isError;

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
          DialogActions(
            children: [
              AppButton(
                label: context.l10n.commonClose,
                color: isError ? AppColors.accent3 : AppColors.accent2,
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Future<void> showInfoDialog(
  BuildContext context, {
  required String title,
  required String description,
  required bool isError,
}) {
  return showAppDialog<void>(
    context,
    builder: (_) => InfoDialog(
      title: title,
      description: description,
      isError: isError,
    ),
  );
}
