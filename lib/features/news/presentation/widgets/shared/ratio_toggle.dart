import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_icons.dart';
import '../../../../../core/widgets/app_icon_button.dart';
import '../../../domain/entities/news_ratio.dart';

/// Trzy przyciski wyboru proporcji obrazka; wybrany jest złoty.
class RatioToggle extends StatelessWidget {
  const RatioToggle({super.key, required this.ratio, required this.onChanged});

  final NewsRatio ratio;
  final ValueChanged<NewsRatio> onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (final option in NewsRatio.values)
            AppIconButton(
              icon: switch (option) {
                NewsRatio.horizontal => AppIcons.arrowsLeftRight,
                NewsRatio.vertical => AppIcons.arrowsUpDown,
                NewsRatio.square => Icons.square_rounded,
              },
              fontAwesome: option != NewsRatio.square,
              iconSize: 24,
              iconColor: AppColors.info,
              buttonSize: 60,
              borderRadius: 8,
              fillColor: option == ratio
                  ? AppColors.accent1
                  : AppColors.secondary,
              onPressed: () => onChanged(option),
            ),
        ],
      ),
    );
  }
}
