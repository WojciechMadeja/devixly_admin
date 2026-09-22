import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'admin_header.dart';

/// Wspólna rama stron panelu: tytuł karty przeglądarki, zdejmowanie fokusu
/// po kliknięciu w tło, nagłówek i treść wypełniająca resztę ekranu.
class AdminPageScaffold extends StatelessWidget {
  const AdminPageScaffold({
    super.key,
    required this.title,
    required this.body,
    this.showBackButton = true,
    this.logoNavigatesHome = true,
    this.headerGap = 16,
  });

  /// Tytuł karty przeglądarki (jak w wersji FlutterFlow, np. „HomePage”).
  final String title;
  final Widget body;
  final bool showBackButton;
  final bool logoNavigatesHome;

  /// Odstęp między nagłówkiem a treścią (16 na większości stron).
  final double headerGap;

  @override
  Widget build(BuildContext context) {
    return Title(
      title: title,
      color: AppColors.primary,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: AppColors.primaryBackground,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AdminHeader(
                  showBackButton: showBackButton,
                  logoNavigatesHome: logoNavigatesHome,
                ),
                SizedBox(height: headerGap),
                Expanded(child: body),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
