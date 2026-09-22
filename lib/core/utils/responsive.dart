import 'package:flutter/widgets.dart';

/// Punkty przełamania i odstępy układu przeniesione z FlutterFlow.
abstract final class Responsive {
  /// Szerokość, powyżej której panel używa układu „desktop”.
  static const compactBreakpoint = 600.0;

  static bool isWide(BuildContext context) =>
      MediaQuery.sizeOf(context).width > compactBreakpoint;

  /// Procent szerokości ekranu zaokrąglony w dół do pełnych pikseli —
  /// dokładnie jak `responsiveSizePerPrecent` z FlutterFlow.
  static double percentOfWidth(BuildContext context, int percent) =>
      (MediaQuery.sizeOf(context).width * (percent / 100)).toInt().toDouble();

  /// Poziomy margines nagłówka: 15% szerokości na desktopie, 5% na telefonie.
  static double headerPadding(BuildContext context) =>
      percentOfWidth(context, isWide(context) ? 15 : 5);
}
