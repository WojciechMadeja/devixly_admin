import 'package:flutter/material.dart';

import '../../../../../core/widgets/app_text_field.dart';
import '../../../../../core/widgets/password_visibility_toggle.dart';

/// Pole hasła z ikoną odsłaniającą wpisany tekst.
class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    required this.controller,
    required this.hint,
  });

  final TextEditingController controller;
  final String hint;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: AppTextField(
        controller: widget.controller,
        hintText: widget.hint,
        obscureText: !_visible,
        suffixIcon: PasswordVisibilityToggle(
          visible: _visible,
          onToggle: () => setState(() => _visible = !_visible),
        ),
      ),
    );
  }
}
