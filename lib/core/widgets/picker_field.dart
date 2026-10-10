import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'tap_area.dart';

/// Pole, które wygląda jak `AppTextField`, ale zamiast pisania otwiera
/// listę wyboru: pokazuje wybraną wartość albo podpowiedź.
class PickerField extends StatefulWidget {
  const PickerField({
    super.key,
    required this.value,
    required this.placeholder,
    required this.onTap,
    this.width = 250,
  });

  /// Nazwa wybranej pozycji; `null` pokazuje [placeholder].
  final String? value;
  final String placeholder;
  final VoidCallback onTap;

  /// `null` oznacza szerokość rodzica.
  final double? width;

  @override
  State<PickerField> createState() => _PickerFieldState();
}

class _PickerFieldState extends State<PickerField> {
  bool _hovered = false;

  static final _labelStyle = AppTextStyles.bodySemiBold.copyWith(
    color: AppColors.secondaryText,
  );

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      opaque: false,
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: TapArea(
        onTap: widget.onTap,
        child: Container(
          width: widget.width,
          height: 40,
          decoration: BoxDecoration(
            color: _hovered
                ? AppColors.primaryBackground
                : AppColors.secondaryBackground,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.secondary, width: 2),
          ),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            widget.value ?? widget.placeholder,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: _labelStyle,
          ),
        ),
      ),
    );
  }
}
