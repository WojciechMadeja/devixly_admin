import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

/// Przycisk panelu — wierne odwzorowanie przycisków z wersji FlutterFlow:
/// zaokrąglenie 8, brak cienia, poziomy padding 16, etykieta skalowana w dół
/// gdy brakuje miejsca, a podczas ładowania spinner w miejscu etykiety
/// (przycisk zachowuje wtedy szerokość i ignoruje kliknięcia).
class AppButton extends StatelessWidget {
  /// Przycisk dialogowy: wysokość 40, szerokość dopasowana do etykiety.
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.color = AppColors.primary,
    this.isLoading = false,
  }) : height = 40,
       width = null,
       textStyle = AppTextStyles.button;

  /// Duży przycisk formularza: wysokość 50 i stała szerokość.
  const AppButton.large({
    super.key,
    required this.label,
    required this.onPressed,
    required double this.width,
    this.color = AppColors.primary,
    this.isLoading = false,
  }) : height = 50,
       textStyle = AppTextStyles.buttonLarge;

  final String label;
  final VoidCallback? onPressed;
  final Color color;
  final bool isLoading;
  final double height;
  final double? width;
  final TextStyle textStyle;

  static const _shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );

  @override
  Widget build(BuildContext context) {
    final onPressed = this.onPressed;
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed == null ? null : (isLoading ? () {} : onPressed),
        style: ButtonStyle(
          shape: const WidgetStatePropertyAll(_shape),
          foregroundColor: WidgetStatePropertyAll(textStyle.color),
          backgroundColor: WidgetStatePropertyAll(color),
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 16),
          ),
          elevation: const WidgetStatePropertyAll(0),
        ),
        child: isLoading
            ? _LoadingLabel(
                label: label,
                textStyle: textStyle,
                fixedWidth: width != null,
              )
            : AutoSizeText(
                label,
                style: textStyle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
      ),
    );
  }
}

/// Spinner zastępujący etykietę; przy szerokości „auto” zajmuje tyle miejsca
/// co etykieta, żeby przycisk nie zmieniał rozmiaru.
class _LoadingLabel extends StatelessWidget {
  const _LoadingLabel({
    required this.label,
    required this.textStyle,
    required this.fixedWidth,
  });

  final String label;
  final TextStyle textStyle;
  final bool fixedWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fixedWidth ? null : _labelWidth(),
      child: Center(
        child: SizedBox(
          width: 23,
          height: 23,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(textStyle.color ?? Colors.white),
          ),
        ),
      ),
    );
  }

  double _labelWidth() {
    final painter = TextPainter(
      text: TextSpan(text: label, style: textStyle),
      textDirection: TextDirection.ltr,
      maxLines: 1,
    )..layout();
    final width = painter.size.width;
    painter.dispose();
    return width;
  }
}
