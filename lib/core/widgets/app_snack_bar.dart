import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// SnackBary panelu — te same kolory, style i czas wyświetlania (4 s) co w
/// wersji FlutterFlow. Tekst dziedziczy krój z motywu (jak dotąd).
abstract final class AppSnackBar {
  static const _duration = Duration(milliseconds: 4000);

  /// Tekst komunikatów o zapisie formularza (biały, 20, półgruby).
  static const emphasizedText = TextStyle(
    color: AppColors.secondaryBackground,
    fontWeight: FontWeight.w600,
    fontSize: 20,
  );

  /// Tekst zwykłych komunikatów.
  static const plainText = TextStyle(color: AppColors.primaryText);

  static void show(
    ScaffoldMessengerState messenger, {
    required String message,
    required Color backgroundColor,
    TextStyle textStyle = plainText,
  }) {
    messenger.showSnackBar(
      SnackBar(
        content: Text(message, style: textStyle),
        duration: _duration,
        backgroundColor: backgroundColor,
      ),
    );
  }

  /// Komunikat o powodzeniu (biały tekst na oliwkowym tle).
  static void success(ScaffoldMessengerState messenger, String message) => show(
    messenger,
    message: message,
    backgroundColor: AppColors.accent2,
    textStyle: emphasizedText,
  );

  /// Komunikat o błędzie (biały tekst na bordowym tle).
  static void error(ScaffoldMessengerState messenger, String message) => show(
    messenger,
    message: message,
    backgroundColor: AppColors.accent3,
    textStyle: emphasizedText,
  );
}
