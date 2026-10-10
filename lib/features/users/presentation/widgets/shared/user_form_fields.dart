import 'package:flutter/widgets.dart';

import '../../../../../core/l10n/l10n.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_text_field.dart';

/// Kontrolery pól formularza użytkownika i administratora.
class UserFieldControllers {
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();

  List<TextEditingController> get _all => [
    email,
    firstName,
    lastName,
    phoneNumber,
    password,
  ];

  void clear() {
    for (final controller in _all) {
      controller.clear();
    }
  }

  void dispose() {
    for (final controller in _all) {
      controller.dispose();
    }
  }
}

/// Pola danych użytkownika: e-mail, imię, nazwisko, telefon i hasło.
class UserFormFields extends StatelessWidget {
  const UserFormFields({super.key, required this.controllers, this.trailing});

  final UserFieldControllers controllers;

  /// Dodatkowe pole pod hasłem (np. wybór firmy).
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final trailing = this.trailing;
    return Column(
      spacing: 20,
      children: [
        _Field(controller: controllers.email, hint: l10n.userEmailHint),
        _Field(controller: controllers.firstName, hint: l10n.userFirstNameHint),
        _Field(controller: controllers.lastName, hint: l10n.userLastNameHint),
        _Field(controller: controllers.phoneNumber, hint: l10n.userPhoneHint),
        _Field(
          controller: controllers.password,
          hint: l10n.userPasswordHint,
          obscure: true,
        ),
        SizedBox(
          width: 250,
          child: Text(
            l10n.userPasswordOptionalNote,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.secondaryText,
            ),
          ),
        ),
        ?trailing,
      ],
    );
  }
}

class _Field extends StatelessWidget {
  const _Field({
    required this.controller,
    required this.hint,
    this.obscure = false,
  });

  final TextEditingController controller;
  final String hint;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: AppTextField(
        controller: controller,
        hintText: hint,
        obscureText: obscure,
      ),
    );
  }
}
