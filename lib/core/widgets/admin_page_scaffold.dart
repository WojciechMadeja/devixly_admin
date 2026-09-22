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
  });

  /// Tytuł karty przeglądarki (jak w wersji FlutterFlow, np. „HomePage”).
  final String title;
  final Widget body;
  final bool showBackButton;
  final bool logoNavigatesHome;

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
                Expanded(child: body),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
