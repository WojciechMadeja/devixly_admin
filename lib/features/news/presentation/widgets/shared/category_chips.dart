import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/skeleton.dart';
import '../../../../categories/domain/entities/category.dart';

/// Wielokrotny wybór kategorii aktualności (zaznaczone chipy są szare).
class CategoryChips extends StatelessWidget {
  const CategoryChips({
    super.key,
    required this.categories,
    required this.selectedIds,
    required this.onToggle,
  });

  final List<Category> categories;
  final Set<int> selectedIds;
  final ValueChanged<int> onToggle;

  static final _selectedStyle = AppTextStyles.bodySemiBold.copyWith(
    color: AppColors.info,
  );
  static final _unselectedStyle = AppTextStyles.bodySemiBold.copyWith(
    color: AppColors.secondaryText,
  );
  static const _shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    side: BorderSide(color: Colors.transparent, width: 0),
  );

  @override
  Widget build(BuildContext context) {
    final chipTheme = Theme.of(context).copyWith(
      canvasColor: Colors.transparent,
    );
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 800),
      child: Wrap(
        spacing: 15,
        runSpacing: 8,
        alignment: WrapAlignment.spaceEvenly,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          for (final category in categories)
            Theme(
              key: ValueKey(category.id),
              data: chipTheme,
              child: _CategoryChip(
                label: category.name,
                selected: selectedIds.contains(category.id),
                onSelected: () => onToggle(category.id),
              ),
            ),
        ],
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  const _CategoryChip({
    required this.label,
    required this.selected,
    required this.onSelected,
  });

  final String label;
  final bool selected;
  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      selected: selected,
      onSelected: (_) => onSelected(),
      label: Text(
        label,
        style: selected
            ? CategoryChips._selectedStyle
            : CategoryChips._unselectedStyle,
        overflow: TextOverflow.ellipsis,
      ),
      labelPadding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      elevation: 4,
      selectedColor: selected ? AppColors.tertiary : null,
      backgroundColor: selected ? null : AppColors.secondaryBackground,
      shape: CategoryChips._shape,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}

/// Pięć szkieletów chipów o malejącej widoczności (podczas ładowania).
class CategoryChipsSkeleton extends StatelessWidget {
  const CategoryChipsSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 800),
      child: const Wrap(
        spacing: 15,
        runSpacing: 8,
        alignment: WrapAlignment.spaceEvenly,
        clipBehavior: Clip.none,
        children: [
          _ChipSkeleton(),
          Opacity(opacity: 0.7, child: _ChipSkeleton()),
          Opacity(opacity: 0.5, child: _ChipSkeleton()),
          Opacity(opacity: 0.3, child: _ChipSkeleton()),
          Opacity(opacity: 0.1, child: _ChipSkeleton()),
        ],
      ),
    );
  }
}

class _ChipSkeleton extends StatelessWidget {
  const _ChipSkeleton();

  static const _shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 4,
      shape: _shape,
      child: Container(
        width: 200,
        height: 35,
        decoration: const BoxDecoration(
          color: AppColors.secondaryBackground,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        alignment: Alignment.center,
        child: const SkeletonBox(width: 120, height: 20),
      ),
    );
  }
}
