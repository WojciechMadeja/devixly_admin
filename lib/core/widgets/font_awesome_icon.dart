import 'package:flutter/widgets.dart';

/// Rysuje ikonę Font Awesome (patrz `AppIcons`) jako glif tekstu w jego
/// naturalnej szerokości — tak jak `FaIcon` z pakietu font_awesome_flutter,
/// którego używała wersja FlutterFlow. Zwykły `Icon` wciska glif w kwadrat,
/// co zmienia wygląd niekwadratowych ikon.
class FontAwesomeIcon extends StatelessWidget {
  const FontAwesomeIcon(this.icon, {super.key, this.size, this.color});

  final IconData icon;
  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final iconTheme = IconTheme.of(context);
    var iconColor = color ?? iconTheme.color!;
    final opacity = iconTheme.opacity ?? 1.0;
    if (opacity != 1.0) {
      iconColor = iconColor.withValues(alpha: iconColor.a * opacity);
    }
    return ExcludeSemantics(
      child: RichText(
        overflow: TextOverflow.visible,
        textDirection: Directionality.of(context),
        text: TextSpan(
          text: String.fromCharCode(icon.codePoint),
          style: TextStyle(
            inherit: false,
            color: iconColor,
            fontSize: size ?? iconTheme.size,
            fontFamily: icon.fontFamily,
            package: icon.fontPackage,
            shadows: iconTheme.shadows,
          ),
        ),
      ),
    );
  }
}
