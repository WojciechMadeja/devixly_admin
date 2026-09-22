import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/font_awesome_icon.dart';
import '../../../../../core/widgets/option_card.dart';
import '../../../../../core/widgets/tap_area.dart';

/// Kafelek ekranu głównego. Bez [onTap] kafelek jest widoczny, ale nieaktywny
/// (tak jak „Dodaj jednostki” i „Oferty”).
class HomeTile extends StatelessWidget {
  const HomeTile({
    super.key,
    required this.icon,
    required this.label,
    this.fontAwesome = false,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final bool fontAwesome;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final card = OptionCard(
      icon: fontAwesome
          ? FontAwesomeIcon(icon, color: AppColors.primary, size: 55)
          : Icon(icon, color: AppColors.primary, size: 55),
      label: label,
    );
    return onTap == null ? card : TapArea(onTap: onTap, child: card);
  }
}
