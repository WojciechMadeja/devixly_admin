import 'package:flutter/material.dart';

/// Otwiera dialog panelu: przezroczysty `Dialog` bez marginesów, wyśrodkowany,
/// z kartą rysowaną przez sam dialog (np. `DialogCard`). Kliknięcie w dialog
/// zdejmuje fokus z pól tekstowych.
Future<T?> showAppDialog<T>(
  BuildContext context, {
  required WidgetBuilder builder,
}) {
  return showDialog<T>(
    context: context,
    builder: (dialogContext) => Dialog(
      elevation: 0,
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () => FocusScope.of(dialogContext).unfocus(),
        child: builder(dialogContext),
      ),
    ),
  );
}
