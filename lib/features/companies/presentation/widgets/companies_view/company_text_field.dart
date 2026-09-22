import 'package:flutter/widgets.dart';

import '../../../../../core/widgets/app_text_field.dart';

/// Pole danych firmy o stałej szerokości 250.
class CompanyTextField extends StatelessWidget {
  const CompanyTextField({
    super.key,
    required this.controller,
    required this.hint,
  });

  final TextEditingController controller;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: AppTextField(controller: controller, hintText: hint),
    );
  }
}
