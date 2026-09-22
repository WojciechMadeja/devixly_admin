import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../utils/responsive.dart';

/// Złota linia oddzielająca sekcje w dialogach podglądu.
class GoldDivider extends StatelessWidget {
  const GoldDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return GoldDividerInset(
      child: Container(
        width: double.infinity,
        height: 2,
        color: AppColors.accent1,
      ),
    );
  }
}

/// Margines boczny sekcji dialogu podglądu (6% szerokości ekranu).
class GoldDividerInset extends StatelessWidget {
  const GoldDividerInset({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.percentOfWidth(context, 6),
      ),
      child: child,
    );
  }
}
