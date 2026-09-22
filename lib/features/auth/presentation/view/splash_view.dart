import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/app_colors.dart';

/// Ekran powitalny wyświetlany przy starcie aplikacji.
class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return ColoredBox(
      color: AppColors.secondaryBackground,
      child: Center(
        child: Image.asset(
          AppAssets.splash,
          width: size.width * 0.7,
          height: size.height * 0.5,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
