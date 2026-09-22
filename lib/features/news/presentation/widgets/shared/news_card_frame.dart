import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/responsive.dart';

/// Biała, mocno zaokrąglona rama karty aktualności z marginesem 10% szerokości
/// ekranu z lewej i 15% z prawej (jak w wersji FlutterFlow). Treść: lewa część
/// (obrazek i tekst) oraz ikony akcji wyrównane do prawej. Na wąskim ekranie
/// karta nie ma dodatkowych marginesów, rośnie razem z tekstem, a ikony zajmują
/// tyle miejsca, ile potrzebują (wcześniej treść wylewała się poza kartę).
class NewsCardFrame extends StatelessWidget {
  const NewsCardFrame({
    super.key,
    required this.leading,
    this.actions = const [],
  });

  final Widget leading;
  final List<Widget> actions;

  static const _decoration = BoxDecoration(
    color: AppColors.secondaryBackground,
    borderRadius: BorderRadius.all(Radius.circular(28)),
  );

  @override
  Widget build(BuildContext context) {
    final isWide = Responsive.isWide(context);
    final actionsRow = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      spacing: 20,
      children: actions,
    );
    return Padding(
      padding: isWide
          ? EdgeInsets.only(
              left: Responsive.percentOfWidth(context, 10),
              right: Responsive.percentOfWidth(context, 15),
            )
          : EdgeInsets.zero,
      child: Container(
        constraints: BoxConstraints(
          minHeight: 100,
          maxWidth: 600,
          maxHeight: isWide ? 120 : double.infinity,
        ),
        decoration: _decoration,
        padding:
            EdgeInsets.symmetric(horizontal: 20, vertical: isWide ? 0 : 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 15,
          children: isWide
              ? [
                  Flexible(flex: 4, child: leading),
                  Flexible(child: actionsRow),
                ]
              : [
                  Expanded(child: leading),
                  if (actions.isNotEmpty) actionsRow,
                ],
        ),
      ),
    );
  }
}
