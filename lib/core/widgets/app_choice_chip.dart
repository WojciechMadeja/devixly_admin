import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

/// Chip wyboru w stylu panelu: zaznaczony szary z białym tekstem,
/// niezaznaczony biały z szarym napisem.
class AppChoiceChip extends StatelessWidget {
  const AppChoiceChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onSelected,
  });

  final String label;
  final bool selected;
  final VoidCallback onSelected;

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
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        selected: selected,
        onSelected: (_) => onSelected(),
        label: Text(
          label,
          style: selected ? _selectedStyle : _unselectedStyle,
          overflow: TextOverflow.ellipsis,
        ),
        labelPadding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        elevation: 4,
        selectedColor: selected ? AppColors.tertiary : null,
        backgroundColor: selected ? null : AppColors.secondaryBackground,
        shape: _shape,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}
