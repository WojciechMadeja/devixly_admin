// Tymczasowy zamiennik pakietu font_awesome_flutter 10.7.0 dla kodu
// FlutterFlow — ta wersja pakietu nie kompiluje się na Flutterze 3.44
// (IconData jest klasą final), a nowsze wersje zawierają glify Font Awesome 7,
// które wyglądają inaczej. Renderuje identycznie jak FaIcon 10.7.0, z tego
// samego fontu Font Awesome 6 Free Solid (assets/fonts/fa-solid-900.ttf).
// Do usunięcia razem z lib/flutter_flow w fazie przełączenia.
import 'package:flutter/widgets.dart';

abstract final class FontAwesomeIcons {
  static const IconData signOutAlt =
      IconData(0xf2f5, fontFamily: 'FontAwesomeSolid');
  static const IconData solidEdit =
      IconData(0xf044, fontFamily: 'FontAwesomeSolid');
  static const IconData tags = IconData(0xf02c, fontFamily: 'FontAwesomeSolid');
  static const IconData city = IconData(0xf64f, fontFamily: 'FontAwesomeSolid');
  static const IconData arrowsAltH =
      IconData(0xf337, fontFamily: 'FontAwesomeSolid');
  static const IconData arrowsAltV =
      IconData(0xf338, fontFamily: 'FontAwesomeSolid');
}

class FaIcon extends StatelessWidget {
  const FaIcon(
    this.icon, {
    super.key,
    this.size,
    this.color,
  });

  final IconData? icon;
  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final iconTheme = IconTheme.of(context);
    final iconSize = size ?? iconTheme.size;
    if (icon == null) {
      return SizedBox(width: iconSize, height: iconSize);
    }
    var iconColor = color ?? iconTheme.color!;
    final iconOpacity = iconTheme.opacity ?? 1.0;
    if (iconOpacity != 1.0) {
      iconColor = iconColor.withValues(alpha: iconColor.a * iconOpacity);
    }
    return ExcludeSemantics(
      child: RichText(
        overflow: TextOverflow.visible,
        textDirection: Directionality.of(context),
        text: TextSpan(
          text: String.fromCharCode(icon!.codePoint),
          style: TextStyle(
            inherit: false,
            color: iconColor,
            fontSize: iconSize,
            fontFamily: icon!.fontFamily,
            package: icon!.fontPackage,
            shadows: iconTheme.shadows,
          ),
        ),
      ),
    );
  }
}
