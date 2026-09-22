import 'package:flutter/material.dart';

import '../../../../../core/l10n/l10n.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../../../core/widgets/dialogs/dialog_card.dart';
import '../../../domain/entities/category.dart';

/// Dialog zmiany nazwy kategorii. [onRename] zapisuje zmianę i zwraca, czy
/// się udała — przy sukcesie dialog się zamyka.
class RenameCategoryDialog extends StatefulWidget {
  const RenameCategoryDialog({
    super.key,
    required this.category,
    required this.onRename,
  });

  final Category category;
  final Future<bool> Function(String name) onRename;

  @override
  State<RenameCategoryDialog> createState() => _RenameCategoryDialogState();
}

class _RenameCategoryDialogState extends State<RenameCategoryDialog> {
  late final _nameController = TextEditingController(
    text: widget.category.name,
  );
  bool _isSaving = false;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    setState(() => _isSaving = true);
    final succeeded = await widget.onRename(_nameController.text.trim());
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
        Text(l10n.categoryRenameTitle, style: AppTextStyles.dialogTitle),
        SizedBox(
          width: 250,
          child: AppTextField(
            controller: _nameController,
            hintText: l10n.categoryNameHint,
          ),
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
