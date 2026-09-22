import 'package:equatable/equatable.dart';

/// Zalogowany administrator panelu.
class AdminUser extends Equatable {
  const AdminUser({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.phoneNumber = '',
    this.company = '',
  });

  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String company;

  String get fullName => '$firstName $lastName';

  AdminUser copyWith({
    String? firstName,
    String? lastName,
    String? phoneNumber,
  }) {
    return AdminUser(
      id: id,
      email: email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      company: company,
    );
  }

  @override
  List<Object?> get props => [
    id,
    email,
    firstName,
    lastName,
    phoneNumber,
    company,
  ];
}
