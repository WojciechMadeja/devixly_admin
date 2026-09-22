import 'package:flutter/painting.dart';

/// Paleta panelu — wartości 1:1 z motywu FlutterFlow (`LightModeTheme`).
abstract final class AppColors {
  static const primary = Color(0xFF1A2E5A);
  static const secondary = Color(0xFFD9CAB3);
  static const tertiary = Color(0xFF8A9BA8);
  static const primaryText = Color(0xFF14181B);
  static const secondaryText = Color(0xFF57636C);
  static const primaryBackground = Color(0xFFF1F4F8);
  static const secondaryBackground = Color(0xFFFFFFFF);

  /// Złoty akcent: obramowanie aktywnego pola, ikony edycji, zaznaczenia.
  static const accent1 = Color(0xFFC6A15B);

  /// Oliwkowy akcent: SnackBary sukcesu.
  static const accent2 = Color(0xFF6B8E23);

  /// Bordowy akcent: akcje niszczące i SnackBary błędów.
  static const accent3 = Color(0xFF800020);
  static const error = Color(0xFFFF5963);
  static const info = Color(0xFFFFFFFF);

  /// Cień pod nagłówkiem strony.
  static const headerShadow = Color(0x33000000);

  /// Tło zaznaczonej karty kategorii / firmy.
  static const selectedCard = Color(0xFFDDE1E3);
}
