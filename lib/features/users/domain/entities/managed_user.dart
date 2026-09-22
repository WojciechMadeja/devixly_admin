import 'package:equatable/equatable.dart';

import 'user_company.dart';

/// Użytkownik aplikacji zarządzany z panelu.
class ManagedUser extends Equatable {
  const ManagedUser({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.company,
    this.phoneNumber = '',
    this.isAdministrator = false,
    this.isBlocked = false,
  });

  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final bool isAdministrator;
  final bool isBlocked;
  final UserCompany company;

  /// Nazwisko i imię — w takiej kolejności pokazuje je lista.
  String get displayName => '$lastName $firstName';

  ManagedUser copyWith({bool? isBlocked}) => ManagedUser(
        id: id,
        firstName: firstName,
        lastName: lastName,
        email: email,
        phoneNumber: phoneNumber,
        isAdministrator: isAdministrator,
        isBlocked: isBlocked ?? this.isBlocked,
        company: company,
      );

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        email,
        phoneNumber,
        isAdministrator,
        isBlocked,
        company,
      ];
}
