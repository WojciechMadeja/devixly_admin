import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import 'font_awesome_icon.dart';

/// Kwadratowy przycisk z ikoną — odpowiednik `FlutterFlowIconButton`.
/// Tak jak w FlutterFlow przycisk jest rysowany w stylu Material 3 (niezależnie
/// od motywu M2 aplikacji), co wpływa na jego wewnętrzne marginesy.
class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.icon,
    required this.iconSize,
    required this.iconColor,
    required this.buttonSize,
    required this.onPressed,
    this.borderRadius = 0,
    this.fillColor,
    this.fontAwesome = false,
  });

  final IconData icon;
  final double iconSize;
  final Color iconColor;
  final double buttonSize;
  final VoidCallback? onPressed;
  final double borderRadius;
  final Color? fillColor;

  /// Czy [icon] pochodzi z `AppIcons` (Font Awesome), a nie z `Icons`.
  final bool fontAwesome;

  static final ThemeData _material3Theme = ThemeData.from(
    colorScheme: AppTheme.light.colorScheme,
    useMaterial3: true,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonSize,
      height: buttonSize,
      child: Theme(
        data: _material3Theme,
        child: IconButton(
          icon: fontAwesome
              ? FontAwesomeIcon(icon, size: iconSize)
              : Icon(icon, size: iconSize),
          onPressed: onPressed,
          splashRadius: buttonSize,
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                side: const BorderSide(color: Colors.transparent, width: 0),
              ),
            ),
            iconColor: WidgetStatePropertyAll(iconColor),
            backgroundColor: WidgetStatePropertyAll(fillColor),
          ),
        ),
      ),
    );
  }
}
