import 'package:flutter/material.dart';

/// Klikalny obszar bez efektów wizualnych (ripple, hover, focus) — tak
/// działały klikalne elementy w wersji FlutterFlow.
class TapArea extends StatelessWidget {
  const TapArea({
    super.key,
    required this.child,
    this.onTap,
    this.onDoubleTap,
  });

  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      child: child,
    );
  }
}
