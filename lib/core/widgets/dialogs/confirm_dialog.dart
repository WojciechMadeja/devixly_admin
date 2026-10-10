import 'package:flutter/material.dart';

import '../../l10n/l10n.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../app_button.dart';
import 'dialog_card.dart';

/// Dialog potwierdzenia akcji, np. usunięcia. [onConfirm] wykonuje akcję
/// (zwykle metodę cubita ekranu) i zwraca, czy się udała: przy sukcesie
/// dialog zamyka się z wynikiem `true`, przy porażce zostaje otwarty, a błąd
/// pokazuje ekran, który go otworzył.
class ConfirmDialog extends StatefulWidget {
  const ConfirmDialog({
    super.key,
    required this.message,
    required this.confirmLabel,
    required this.onConfirm,
    this.highlight,
    this.hint,
    this.confirmColor = AppColors.accent3,
  });

  final String message;

  /// Pogrubiona nazwa elementu pod pytaniem, np. tytuł aktualności.
  final String? highlight;

  /// Dodatkowe ostrzeżenie pod nazwą, np. że rekord wróci przy najbliższej
  /// synchronizacji.
  final String? hint;
  final String confirmLabel;
  final Color confirmColor;
  final Future<bool> Function() onConfirm;

  @override
  State<ConfirmDialog> createState() => _ConfirmDialogState();
}

class _ConfirmDialogState extends State<ConfirmDialog> {
  bool _isLoading = false;

  Future<void> _confirm() async {
    setState(() => _isLoading = true);
    final succeeded = await widget.onConfirm();
    if (!mounted) return;
    if (succeeded) {
      Navigator.pop(context, true);
    } else {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final highlight = widget.highlight;
    return DialogCard(
      children: [
        Text(l10n.confirmChoiceTitle, style: AppTextStyles.dialogTitle),
        Text(
          widget.message,
          textAlign: TextAlign.center,
          style: AppTextStyles.bodyLarge,
        ),
        if (highlight != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              highlight,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyLargeBold,
            ),
          ),
        if (widget.hint case final hint?)
          Text(
            hint,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodySmall.copyWith(color: AppColors.accent1),
          ),
        DialogActions(
          children: [
            AppButton(
              label: l10n.commonCancel,
              onPressed: () => Navigator.pop(context),
            ),
            AppButton(
              label: widget.confirmLabel,
              color: widget.confirmColor,
              isLoading: _isLoading,
              onPressed: _confirm,
            ),
          ],
        ),
      ],
    );
  }
}
