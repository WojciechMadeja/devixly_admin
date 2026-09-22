import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../constants/app_assets.dart';
import '../theme/app_colors.dart';
import '../theme/app_icons.dart';
import '../utils/responsive.dart';
import 'admin_shell.dart';
import 'app_icon_button.dart';
import 'font_awesome_icon.dart';
import 'tap_area.dart';

/// Biały pasek u góry każdej strony panelu: opcjonalna strzałka powrotu
/// (tylko poza przeglądarką), logo i ikona wylogowania.
class AdminHeader extends StatelessWidget {
  const AdminHeader({
    super.key,
    this.showBackButton = true,
    this.logoNavigatesHome = true,
  });

  final bool showBackButton;
  final bool logoNavigatesHome;

  static const _decoration = BoxDecoration(
    color: AppColors.secondaryBackground,
    boxShadow: [
      BoxShadow(
        blurRadius: 10,
        color: AppColors.headerShadow,
        offset: Offset(0, 2),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    final shell = AdminShell.of(context);
    final isWide = Responsive.isWide(context);
    final padding = Responsive.headerPadding(context);
    final logo = ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(
        AppAssets.logo,
        width: isWide ? 200 : 140,
        fit: BoxFit.fitWidth,
      ),
    );
    return Container(
      height: 120,
      decoration: _decoration,
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (showBackButton && !kIsWeb)
            AppIconButton(
              icon: Icons.arrow_back,
              iconSize: 34,
              iconColor: AppColors.primary,
              buttonSize: 50,
              borderRadius: 8,
              onPressed: shell.onBack,
            ),
          if (logoNavigatesHome)
            TapArea(onTap: shell.onHome, child: logo)
          else
            logo,
          TapArea(
            onTap: shell.onLogout,
            child: FontAwesomeIcon(
              AppIcons.signOut,
              color: AppColors.primary,
              size: isWide ? 45 : 34,
            ),
          ),
        ],
      ),
    );
  }
}
