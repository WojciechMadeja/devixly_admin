import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../app/router/app_routes.dart';
import '../../../../../core/l10n/l10n.dart';
import '../../../../../core/theme/app_icons.dart';
import 'home_tile.dart';

/// Siatka kafelków ekranu głównego (zawijana, wyśrodkowana, odstępy 30).
class HomeTileGrid extends StatelessWidget {
  const HomeTileGrid({super.key, required this.compact});

  /// Układ telefonu — inna ikona kafelka „Dodaj jednostki” (jak dotąd).
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    void open(String route) => context.push(route);
    return Wrap(
      spacing: 30,
      runSpacing: 30,
      alignment: WrapAlignment.center,
      clipBehavior: Clip.none,
      children: [
        HomeTile(
          icon: Icons.note_add,
          label: l10n.homeAddNews,
          onTap: () => open(AppRoutes.addNews),
        ),
        HomeTile(
          icon: Icons.newspaper_sharp,
          label: l10n.homeNewsList,
          onTap: () => open(AppRoutes.newsList),
        ),
        HomeTile(
          icon: AppIcons.tags,
          fontAwesome: true,
          label: l10n.homeCategories,
          onTap: () => open(AppRoutes.categories),
        ),
        HomeTile(
          icon: AppIcons.city,
          fontAwesome: true,
          label: l10n.homeCompanies,
          onTap: () => open(AppRoutes.companies),
        ),
        HomeTile(
          icon: Icons.domain_add,
          label: l10n.homeAddProjects,
          onTap: () => open(AppRoutes.addProject),
        ),
        HomeTile(
          icon: Icons.apartment,
          label: l10n.homeProjectsList,
          onTap: () => open(AppRoutes.projectsList),
        ),
        HomeTile(
          icon: compact ? Icons.other_houses_rounded : Icons.other_houses,
          label: l10n.homeAddUnits,
          onTap: () => open(AppRoutes.addUnit),
        ),
        HomeTile(
          icon: Icons.person_add,
          label: l10n.homeAddUser,
          onTap: () => open(AppRoutes.addUser),
        ),
        HomeTile(
          icon: Icons.group_add,
          label: l10n.homeImportUsers,
          onTap: () => open(AppRoutes.importUsers),
        ),
        HomeTile(
          icon: Icons.list,
          label: l10n.homeUsersList,
          onTap: () => open(AppRoutes.usersList),
        ),
        HomeTile(
          icon: Icons.admin_panel_settings,
          label: l10n.homeAddAdmin,
          onTap: () => open(AppRoutes.addAdmin),
        ),
        // Funkcja ofert nie jest jeszcze gotowa.
        HomeTile(icon: Icons.house, label: l10n.homeOffers),
        HomeTile(
          icon: Icons.settings_rounded,
          label: l10n.homeSettings,
          onTap: () => open(AppRoutes.settings),
        ),
      ],
    );
  }
}
