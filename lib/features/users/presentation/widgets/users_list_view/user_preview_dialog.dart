import 'package:flutter/material.dart';

import '../../../../../core/l10n/l10n.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/dialogs/dialog_close_button.dart';
import '../../../../../core/widgets/gold_divider.dart';
import '../../../domain/entities/managed_user.dart';

/// Podgląd danych użytkownika.
class UserPreviewDialog extends StatelessWidget {
  const UserPreviewDialog({super.key, required this.user});

  final ManagedUser user;

  static const _shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(24)),
  );

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return ClipRRect(
      child: Container(
        constraints: const BoxConstraints(
          minWidth: 320,
          minHeight: 320,
          maxWidth: 600,
          maxHeight: 500,
        ),
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: AppColors.secondaryBackground,
          elevation: 4,
          shape: _shape,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 20,
                    children: [
                      const GoldDivider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            user.company.name,
                            style: AppTextStyles.bodyLargeSemiBold,
                          ),
                        ],
                      ),
                      const GoldDivider(),
                      _DetailsSection(user: user),
                      const GoldDivider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            l10n.userPreviewDeals,
                            style: AppTextStyles.bodyLargeSemiBold,
                          ),
                        ],
                      ),
                      const GoldDivider(),
                    ],
                  ),
                ),
              ),
              DialogCloseButton(onPressed: () => Navigator.pop(context)),
            ],
          ),
        ),
      ),
    );
  }
}

class _DetailsSection extends StatelessWidget {
  const _DetailsSection({required this.user});

  final ManagedUser user;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return GoldDividerInset(
      child: Column(
        spacing: 15,
        children: [
          _DetailRow(label: l10n.userPreviewName, value: user.displayName),
          _DetailRow(label: l10n.userPreviewEmail, value: user.email),
          _DetailRow(label: l10n.userPreviewPhone, value: user.phoneNumber),
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 150,
          child: Text(label, style: AppTextStyles.bodySemiBold),
        ),
        Flexible(
          child: Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.input,
          ),
        ),
      ],
    );
  }
}
