import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Kalendarz wyboru daty w kolorach panelu (granatowy nagłówek, data
/// w Inter Tight 32) — ten sam wygląd co w wersji FlutterFlow.
Future<DateTime?> showAppDatePicker(
  BuildContext context, {
  required DateTime initialDate,
}) {
  return showDatePicker(
    context: context,
    initialDate: initialDate,
    firstDate: DateTime(1900),
    lastDate: DateTime(2050),
    builder: (context, child) => _DatePickerTheme(child: child!),
  );
}

class _DatePickerTheme extends StatelessWidget {
  const _DatePickerTheme({required this.child});

  final Widget child;

  static const _headerTextStyle = TextStyle(
    fontFamily: 'InterTight',
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryText,
    letterSpacing: 0,
  );

  @override
  Widget build(BuildContext context) {
    const foreground = AppColors.primaryText;
    final dayForeground = WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return foreground.withValues(alpha: 0.6);
      }
      if (states.contains(WidgetState.selected)) return AppColors.info;
      if (states.isEmpty) return foreground;
      return null;
    });
    final dayBackground = WidgetStateProperty.resolveWith(
      (states) =>
          states.contains(WidgetState.selected) ? AppColors.primary : null,
    );
    final base = Theme.of(context);
    return Theme(
      data: base.copyWith(
        colorScheme: base.colorScheme.copyWith(onSurface: foreground),
        disabledColor: foreground.withValues(alpha: 0.3),
        textTheme: base.textTheme.copyWith(
          headlineSmall: _headerTextStyle,
          headlineMedium: _headerTextStyle,
        ),
        iconTheme: base.iconTheme.copyWith(size: 24),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: const WidgetStatePropertyAll(foreground),
            overlayColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.hovered)) {
                return foreground.withValues(alpha: 0.04);
              }
              if (states.contains(WidgetState.focused) ||
                  states.contains(WidgetState.pressed)) {
                return foreground.withValues(alpha: 0.12);
              }
              return null;
            }),
          ),
        ),
        datePickerTheme: DatePickerThemeData(
          backgroundColor: AppColors.secondaryBackground,
          headerBackgroundColor: AppColors.primary,
          headerForegroundColor: AppColors.info,
          weekdayStyle: base.textTheme.labelMedium!.copyWith(color: foreground),
          dayBackgroundColor: dayBackground,
          todayBackgroundColor: dayBackground,
          yearBackgroundColor: dayBackground,
          dayForegroundColor: dayForeground,
          todayForegroundColor: dayForeground,
          yearForegroundColor: dayForeground,
        ),
      ),
      child: child,
    );
  }
}
