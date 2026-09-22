import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/skeleton.dart';
import '../shared/news_card_frame.dart';

/// Szkielet karty aktualności wyświetlany podczas ładowania listy.
class NewsCardSkeleton extends StatelessWidget {
  const NewsCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final lineWidth = MediaQuery.sizeOf(context).width;
    return NewsCardFrame(
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 10,
        children: [
          SkeletonFade(
            child: Container(
              width: 107,
              height: 60,
              decoration: const BoxDecoration(
                color: AppColors.tertiary,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            ),
          ),
          Flexible(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 5,
              children: [
                Container(width: 50, height: 16, color: AppColors.tertiary),
                SkeletonBox(
                  width: lineWidth,
                  height: 20,
                  duration: const Duration(milliseconds: 1000),
                ),
                SkeletonBox(
                  width: lineWidth,
                  height: 20,
                  duration: const Duration(milliseconds: 1200),
                ),
                const SkeletonBox(
                  width: 100,
                  height: 12,
                  duration: Duration(milliseconds: 1400),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Trzy szkielety kart o malejącej widoczności (1, 0,5, 0,1).
class NewsCardSkeletonGroup extends StatelessWidget {
  const NewsCardSkeletonGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      spacing: 20,
      children: [
        NewsCardSkeleton(),
        Opacity(opacity: 0.5, child: NewsCardSkeleton()),
        Opacity(opacity: 0.1, child: NewsCardSkeleton()),
      ],
    );
  }
}
