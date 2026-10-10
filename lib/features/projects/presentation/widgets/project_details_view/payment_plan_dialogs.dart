import 'package:flutter/material.dart';

import '../../../../../core/l10n/l10n.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../../../core/widgets/dialogs/dialog_card.dart';

/// Dodawanie planu płatności albo jego raty — oba mają nazwę i opis,
/// plan dodatkowo znacznik płatności po odbiorze. [onSave] zapisuje
/// i zwraca, czy się udało; dialog zamyka się tylko przy powodzeniu.
class PaymentEntryDialog extends StatefulWidget {
  const PaymentEntryDialog({
    super.key,
    required this.title,
    required this.nameHint,
    required this.descriptionHint,
    required this.onSave,
    this.withPostHandover = false,
  });

  final String title;
  final String nameHint;
  final String descriptionHint;
  final bool withPostHandover;

  /// Zapisuje wpis; `postHandover` ma znaczenie tylko dla planu.
  final Future<bool> Function({
    required String name,
    required String description,
    required bool postHandover,
  })
  onSave;

  @override
  State<PaymentEntryDialog> createState() => _PaymentEntryDialogState();
}

class _PaymentEntryDialogState extends State<PaymentEntryDialog> {
  final _name = TextEditingController();
  final _description = TextEditingController();
  bool _postHandover = false;
  bool _isSaving = false;
  bool _showNameRequired = false;

  @override
  void dispose() {
    _name.dispose();
    _description.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (_name.text.trim().isEmpty) {
      setState(() => _showNameRequired = true);
      return;
    }
    setState(() => _isSaving = true);
    final saved = await widget.onSave(
      name: _name.text.trim(),
      description: _description.text.trim(),
      postHandover: _postHandover,
    );
    if (!mounted) return;
    if (saved) {
      Navigator.pop(context);
    } else {
      setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return DialogCard(
      constraints: const BoxConstraints(minWidth: 320, maxWidth: 420),
      spacing: 15,
      children: [
        Text(widget.title, style: AppTextStyles.dialogTitle),
        SizedBox(
          width: 250,
          child: AppTextField(controller: _name, hintText: widget.nameHint),
        ),
        if (_showNameRequired)
          Text(l10n.paymentNameRequired, style: AppTextStyles.fieldError),
        SizedBox(
          width: 250,
          child: AppTextField(
            controller: _description,
            hintText: widget.descriptionHint,
            maxLines: 3,
          ),
        ),
        if (widget.withPostHandover)
          SizedBox(
            width: 250,
            child: Row(
              children: [
                Checkbox(
                  value: _postHandover,
                  activeColor: AppColors.primary,
                  onChanged: (value) =>
                      setState(() => _postHandover = value ?? false),
                ),
                Flexible(
                  child: Text(
                    l10n.projectDetailsPostHandover,
                    style: AppTextStyles.bodySemiBold,
                  ),
                ),
              ],
            ),
          ),
        DialogActions(
          children: [
            AppButton(
              label: l10n.commonCancel,
              color: AppColors.accent3,
              onPressed: () => Navigator.pop(context),
            ),
            AppButton(
              label: l10n.commonSave,
              color: AppColors.accent2,
              isLoading: _isSaving,
              onPressed: _save,
            ),
          ],
        ),
      ],
    );
  }
}
