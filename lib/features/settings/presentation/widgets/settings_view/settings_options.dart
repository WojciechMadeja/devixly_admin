import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../app/router/app_routes.dart';
import '../../../../../core/l10n/l10n.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/option_card.dart';
import '../../../../../core/widgets/tap_area.dart';

/// Kafelki ustawień: edycja danych osobowych i zmiana hasła.
class SettingsOptions extends StatelessWidget {
  const SettingsOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Wrap(
      spacing: 30,
      runSpacing: 30,
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.start,
      clipBehavior: Clip.none,
      children: [
        _OptionTile(
          icon: Icons.perm_contact_cal_rounded,
          label: l10n.settingsEditProfile,
          route: AppRoutes.editProfile,
        ),
        _OptionTile(
          icon: Icons.password_rounded,
          label: l10n.settingsChangePassword,
          route: AppRoutes.updatePassword,
        ),
      ],
    );
  }
}

class _OptionTile extends StatelessWidget {
  const _OptionTile({
    required this.icon,
    required this.label,
    required this.route,
  });

  final IconData icon;
  final String label;
  final String route;

  @override
  Widget build(BuildContext context) {
    return TapArea(
      onTap: () => context.push(route),
      child: OptionCard(
        icon: Icon(icon, color: AppColors.primary, size: 55),
        label: label,
      ),
    );
  }
}
