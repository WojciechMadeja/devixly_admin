import 'package:flutter/material.dart';

import '../../../../../core/l10n/l10n.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_icons.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/font_awesome_icon.dart';
import '../../../../../core/widgets/list_card.dart';
import '../../../../../core/widgets/tap_area.dart';
import '../../../domain/entities/category.dart';

/// Karta kategorii: nazwa i liczba aktualności, a po zaznaczeniu ikony
/// edycji i usunięcia (poza kategorią właściciela platformy).
class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
    required this.selected,
    required this.onEdit,
    required this.onDelete,
  });

  final Category category;
  final bool selected;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  static final _countStyle = AppTextStyles.bodySmall.copyWith(
    fontWeight: FontWeight.w600,
  );

  @override
  Widget build(BuildContext context) {
    final showActions = selected && !category.isProtected;
    return ListCard(
      selected: selected,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Na wąskim ekranie długa nazwa skraca się zamiast wylewać poza kartę.
          Flexible(
            child: Text(
              category.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.bodySemiBold,
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
              context.l10n.categoryNewsCount(category.newsCount),
              style: _countStyle,
            ),
        ],
      ),
    );
  }
}
