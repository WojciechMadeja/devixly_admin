import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';

/// Ikona w polu hasła przełączająca jego widoczność.
class PasswordVisibilityToggle extends StatelessWidget {
  const PasswordVisibilityToggle({
    super.key,
    required this.visible,
    required this.onToggle,
  });

  final bool visible;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onToggle,
      canRequestFocus: false,
      child: Icon(
        visible ? Icons.visibility_outlined : Icons.visibility_off_outlined,
        color: AppColors.accent1,
        size: 22,
      ),
    );
  }
}
