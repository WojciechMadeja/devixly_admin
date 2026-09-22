import 'package:flutter/widgets.dart';

import '../../../domain/entities/company_draft.dart';

/// Kontrolery siedmiu pól danych firmy (formularz dodawania i dialog edycji).
class CompanyFieldControllers {
  CompanyFieldControllers([CompanyDraft? initial])
    : name = TextEditingController(text: initial?.name),
      email = TextEditingController(text: initial?.email),
      address = TextEditingController(text: initial?.address),
      postCode = TextEditingController(text: initial?.postCode),
      city = TextEditingController(text: initial?.city),
      phoneNumber = TextEditingController(text: initial?.phoneNumber),
      representative = TextEditingController(text: initial?.representative);

  final TextEditingController name;
  final TextEditingController email;
  final TextEditingController address;
  final TextEditingController postCode;
  final TextEditingController city;
  final TextEditingController phoneNumber;
  final TextEditingController representative;

  List<TextEditingController> get _all => [
    name,
    email,
    address,
    postCode,
    city,
    phoneNumber,
    representative,
  ];

  CompanyDraft toDraft() => CompanyDraft(
    name: name.text.trim(),
    email: email.text.trim(),
    address: address.text.trim(),
    postCode: postCode.text.trim(),
    city: city.text.trim(),
    phoneNumber: phoneNumber.text.trim(),
    representative: representative.text.trim(),
  );

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
