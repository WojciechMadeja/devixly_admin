import 'package:flutter/widgets.dart';

/// Ikony Font Awesome 6 Free Solid (font `assets/fonts/fa-solid-900.ttf`) —
/// te same glify, które panel miał w wersji FlutterFlow. Rysuje je
/// `FontAwesomeIcon`.
abstract final class AppIcons {
  static const _family = 'FontAwesomeSolid';

  static const signOut = IconData(0xf2f5, fontFamily: _family);
  static const edit = IconData(0xf044, fontFamily: _family);
  static const tags = IconData(0xf02c, fontFamily: _family);
  static const city = IconData(0xf64f, fontFamily: _family);
  static const arrowsLeftRight = IconData(0xf337, fontFamily: _family);
  static const arrowsUpDown = IconData(0xf338, fontFamily: _family);
}
