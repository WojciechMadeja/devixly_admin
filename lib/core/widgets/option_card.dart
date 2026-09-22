import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

/// Kafelek opcji (ekran główny, ustawienia): ikona i podpis na białej karcie.
class OptionCard extends StatelessWidget {
  const OptionCard({super.key, required this.icon, required this.label});

  final Widget icon;
  final String label;

  static const _shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(16)),
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: AppColors.secondaryBackground,
      elevation: 4,
      shape: _shape,
      child: Container(
        width: 155,
        height: 170,
        color: AppColors.secondaryBackground,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          spacing: 10,
          children: [
            icon,
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.tileLabel,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
