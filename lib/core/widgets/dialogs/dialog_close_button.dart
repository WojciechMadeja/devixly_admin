import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../app_icon_button.dart';

/// Okrągły przycisk zamknięcia w prawym górnym rogu dialogu podglądu.
class DialogCloseButton extends StatelessWidget {
  const DialogCloseButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 23, right: 23),
        child: AppIconButton(
          icon: Icons.close_rounded,
          iconSize: 15,
          iconColor: AppColors.info,
          buttonSize: 35,
          borderRadius: 50,
          fillColor: AppColors.accent1,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
