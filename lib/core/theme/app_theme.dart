import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Motyw aplikacji. Celowo identyczny z wersją FlutterFlow: Material 2 z
/// domyślnym schematem kolorów (widgety bez jawnych kolorów, np. paginator
/// tabeli, wyglądają dzięki temu tak samo) i niewidocznym paskiem przewijania.
/// Kolory i style panelu nadają jawnie wspólne widgety z `core/widgets`.
abstract final class AppTheme {
  static ThemeData get light => ThemeData(
        brightness: Brightness.light,
        useMaterial3: false,
        scrollbarTheme: const ScrollbarThemeData(
          thumbColor: WidgetStatePropertyAll(Color(0x00000000)),
        ),
      );
}

/// Przewijanie przeciąganiem także myszą i touchpadem (jak w FlutterFlow).
class AppScrollBehavior extends MaterialScrollBehavior {
  const AppScrollBehavior();

  @override
  Set<PointerDeviceKind> get dragDevices => const {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}
