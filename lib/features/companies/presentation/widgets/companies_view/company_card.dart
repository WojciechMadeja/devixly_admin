import 'package:flutter/material.dart';

import '../../../../../core/l10n/l10n.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_icons.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/font_awesome_icon.dart';
import '../../../../../core/widgets/list_card.dart';
import '../../../../../core/widgets/tap_area.dart';
import '../../../domain/entities/company.dart';

/// Karta firmy: nazwa (z ikoną blokady) i liczba agentów, a po zaznaczeniu
/// ikony edycji, blokady i usunięcia (poza firmą właściciela platformy).
class CompanyCard extends StatelessWidget {
  const CompanyCard({
    super.key,
    required this.company,
    required this.selected,
    required this.onEdit,
    required this.onToggleBlocked,
    required this.onDelete,
  });

  final Company company;
  final bool selected;
  final VoidCallback onEdit;
  final VoidCallback onToggleBlocked;
  final VoidCallback onDelete;

  static final _countStyle = AppTextStyles.bodySmall.copyWith(
    fontWeight: FontWeight.w600,
  );

  @override
  Widget build(BuildContext context) {
    final showActions = selected && !company.isProtected;
    return ListCard(
      selected: selected,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 5,
              children: [
                Flexible(
                  child: Text(
                    company.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bodySemiBold,
                  ),
                ),
                if (company.isBlocked)
                  const Icon(
                    Icons.block_rounded,
                    color: AppColors.secondary,
                    size: 24,
                  ),
              ],
            ),
          ),
          if (showActions)
            Row(
              spacing: 10,
              children: [
                TapArea(
                  onTap: onEdit,
                  child: const FontAwesomeIcon(
                    AppIcons.edit,
                    color: AppColors.accent1,
                    size: 28,
                  ),
                ),
                TapArea(
                  onTap: onToggleBlocked,
                  child: const Icon(
                    Icons.block_sharp,
                    color: AppColors.tertiary,
                    size: 30,
                  ),
                ),
                TapArea(
                  onTap: onDelete,
                  child: const Icon(
                    Icons.delete,
                    color: AppColors.accent3,
                    size: 30,
                  ),
                ),
              ],
            )
          else
            Text(
              context.l10n.companyAgentsCount(company.agentsCount),
              style: _countStyle,
            ),
        ],
      ),
    );
  }
}
