import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

/// Pole tekstowe panelu z dekoracją 1:1 z wersji FlutterFlow: wypełnione na
/// biało, 2-pikselowe beżowe obramowanie, złote po aktywacji, zaokrąglenie 8.
class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    this.focusNode,
    this.hintText,
    this.obscureText = false,
    this.readOnly = false,
    this.suffixIcon,
    this.maxLines = 1,
    this.minLines,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.onFieldSubmitted,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? hintText;
  final bool obscureText;
  final bool readOnly;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? minLines;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;

  static OutlineInputBorder _border(Color color) => OutlineInputBorder(
        borderSide: BorderSide(color: color, width: 2),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      );

  static final _enabledBorder = _border(AppColors.secondary);
  static final _focusedBorder = _border(AppColors.accent1);
  static final _errorBorder = _border(AppColors.error);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      obscureText: obscureText,
      readOnly: readOnly,
      maxLines: maxLines,
      minLines: minLines,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        isDense: true,
        labelStyle: AppTextStyles.inputLabel,
        hintText: hintText,
        hintStyle: AppTextStyles.inputHint,
        enabledBorder: _enabledBorder,
        focusedBorder: _focusedBorder,
        errorBorder: _errorBorder,
        focusedErrorBorder: _errorBorder,
        filled: true,
        fillColor: AppColors.secondaryBackground,
        hoverColor: AppColors.primaryBackground,
        suffixIcon: suffixIcon,
      ),
      style: AppTextStyles.input,
      cursorColor: AppColors.primaryText,
    );
  }
}
