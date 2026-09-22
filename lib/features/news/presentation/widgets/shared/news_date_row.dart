import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_icon_button.dart';

/// Wybrana data (albo „Wybierz datę”) i przycisk kalendarza.
class NewsDateRow extends StatelessWidget {
  const NewsDateRow({super.key, required this.label, required this.onPick});

  final String label;
  final VoidCallback onPick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(label, style: AppTextStyles.bodySemiBold),
          AppIconButton(
            icon: Icons.calendar_today,
            iconSize: 24,
            iconColor: AppColors.info,
            buttonSize: 40,
            borderRadius: 8,
            fillColor: AppColors.primary,
            onPressed: onPick,
          ),
        ],
      ),
    );
  }
}
