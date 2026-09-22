import 'package:flutter/material.dart';

import '../../l10n/l10n.dart';
import '../../theme/app_text_styles.dart';
import '../app_button.dart';
import '../app_text_field.dart';
import 'dialog_card.dart';

/// Dialog potwierdzenia akcji wymagający przepisania frazy (np. BLOCK,
/// DELETE). Działa jak `ConfirmDialog`: [onConfirm] wykonuje akcję i zwraca,
/// czy się udała.
class TypedConfirmationDialog extends StatefulWidget {
  const TypedConfirmationDialog({
    super.key,
    required this.messagePrefix,
    required this.highlight,
    required this.phrase,
    required this.mismatchMessage,
    required this.confirmLabel,
    required this.confirmColor,
    required this.onConfirm,
    this.messageSuffix = '',
  });

  /// Pytanie przed nazwą elementu, np. „Czy na pewno chcesz zablokować firmę ”.
  final String messagePrefix;

  /// Pogrubiona nazwa elementu.
  final String highlight;
  final String messageSuffix;

  /// Fraza, którą trzeba wpisać, żeby potwierdzić.
  final String phrase;

  /// Komunikat pod polem po wpisaniu złej frazy.
  final String mismatchMessage;
  final String confirmLabel;
  final Color confirmColor;
  final Future<bool> Function() onConfirm;

  @override
  State<TypedConfirmationDialog> createState() =>
      _TypedConfirmationDialogState();
}

class _TypedConfirmationDialogState extends State<TypedConfirmationDialog> {
  final _controller = TextEditingController();
  bool _showMismatch = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _confirm() async {
    if (_controller.text != widget.phrase) {
      setState(() => _showMismatch = true);
      return;
    }
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
    return DialogCard(
      spacing: 25,
      children: [
        Text(l10n.confirmChoiceTitle, style: AppTextStyles.dialogTitle),
        RichText(
          textScaler: MediaQuery.textScalerOf(context),
          textAlign: TextAlign.center,
          text: TextSpan(
            style: AppTextStyles.bodyLarge,
            children: [
              TextSpan(text: widget.messagePrefix),
              TextSpan(
                text: widget.highlight,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: widget.messageSuffix),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              SizedBox(
                width: 250,
                child: AppTextField(
                  controller: _controller,
                  hintText: l10n.typedConfirmationHint(widget.phrase),
                ),
              ),
              if (_showMismatch)
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 2, 0, 0),
                    child: Text(
                      widget.mismatchMessage,
                      style: AppTextStyles.fieldError,
                    ),
                  ),
                ),
            ],
          ),
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
