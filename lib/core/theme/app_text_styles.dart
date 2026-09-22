import 'package:flutter/painting.dart';

import 'app_colors.dart';

/// Style tekstu panelu. Odtwarzają kombinacje z FlutterFlow (Inter / Inter
/// Tight, rozmiar, grubość, kolor bazowy) na fontach dołączonych w
/// `assets/fonts`. Rzadkie warianty budujemy przez `copyWith`.
abstract final class AppTextStyles {
  static const _inter = 'Inter';
  static const _interTight = 'InterTight';

  /// Treść pól tekstowych i zwykły tekst 16 px.
  static const input = TextStyle(
    fontFamily: _inter,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryText,
    letterSpacing: 0,
  );

  /// Etykieta pola (`labelStyle`).
  static const inputLabel = TextStyle(
    fontFamily: _inter,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.secondaryText,
    letterSpacing: 0,
  );

  /// Podpowiedź w pustym polu (`hintStyle`).
  static const inputHint = TextStyle(
    fontFamily: _inter,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.secondaryText,
    letterSpacing: 0,
  );

  /// Etykieta przycisku w dialogach (wysokość 40).
  static const button = TextStyle(
    fontFamily: _interTight,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.info,
    letterSpacing: 0,
  );

  /// Etykieta dużego przycisku formularza (wysokość 50).
  static const buttonLarge = TextStyle(
    fontFamily: _interTight,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.info,
    letterSpacing: 0,
  );

  /// Tytuł strony, np. „Lista użytkowników”.
  static const pageTitle = TextStyle(
    fontFamily: _inter,
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryText,
    letterSpacing: 0,
  );

  /// Tytuł dialogu, np. „Potwierdź swój wybór”.
  static const dialogTitle = TextStyle(
    fontFamily: _inter,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryText,
    letterSpacing: 0,
  );

  /// Treść dialogów i nagłówki sekcji 18 px.
  static const bodyLarge = TextStyle(
    fontFamily: _inter,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryText,
    letterSpacing: 0,
  );

  static const bodyLargeSemiBold = TextStyle(
    fontFamily: _inter,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryText,
    letterSpacing: 0,
  );

  static const bodyLargeBold = TextStyle(
    fontFamily: _inter,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryText,
    letterSpacing: 0,
  );

  static const bodySemiBold = TextStyle(
    fontFamily: _inter,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryText,
    letterSpacing: 0,
  );

  static const bodySmall = TextStyle(
    fontFamily: _inter,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryText,
    letterSpacing: 0,
  );

  static const caption = TextStyle(
    fontFamily: _inter,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryText,
    letterSpacing: 0,
  );

  /// Podpis kafelka opcji (Inter Tight 18).
  static const tileLabel = TextStyle(
    fontFamily: _interTight,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryText,
    letterSpacing: 0,
  );

  /// Czerwony komunikat pod polem, np. „Wpisz BLOCK, aby zablokować”.
  static const fieldError = TextStyle(
    fontFamily: _inter,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.accent3,
    letterSpacing: 0,
  );
}
