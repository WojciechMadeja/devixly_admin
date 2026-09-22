import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

/// Biała karta dialogu (zaokrąglenie 24, cień 4) z kolumną treści oddzieloną
/// odstępem [spacing] i marginesem 20 u góry i u dołu.
class DialogCard extends StatelessWidget {
  const DialogCard({
    super.key,
    required this.children,
    this.spacing = 15,
    this.width = 320,
    this.constraints,
  });

  final List<Widget> children;
  final double spacing;

  /// Stała szerokość karty; ignorowana, gdy podano [constraints].
  final double? width;
  final BoxConstraints? constraints;

  static const _shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(24)),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: constraints == null ? width : null,
      constraints: constraints,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: AppColors.secondaryBackground,
        elevation: 4,
        shape: _shape,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 20, 5, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: spacing,
            children: children,
          ),
        ),
      ),
    );
  }
}

/// Rząd przycisków dialogu rozłożonych równomiernie.
class DialogActions extends StatelessWidget {
  const DialogActions({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: children,
    );
  }
}
