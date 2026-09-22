import 'package:equatable/equatable.dart';

/// Dane firmy wpisywane w formularzu (dodawanie i edycja).
class CompanyDraft extends Equatable {
  const CompanyDraft({
    required this.name,
    this.email = '',
    this.address = '',
    this.postCode = '',
    this.city = '',
    this.phoneNumber = '',
    this.representative = '',
  });

  final String name;
  final String email;
  final String address;
  final String postCode;
  final String city;
  final String phoneNumber;
  final String representative;

  @override
  List<Object?> get props =>
      [name, email, address, postCode, city, phoneNumber, representative];
}
