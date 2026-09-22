import 'package:equatable/equatable.dart';

/// Dane nowego użytkownika (formularz „Dodaj użytkownika”).
class NewUser extends Equatable {
  const NewUser({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.password,
    required this.companyId,
  });

  final String email;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String password;
  final int companyId;

  @override
  List<Object?> get props => [
    email,
    firstName,
    lastName,
    phoneNumber,
    password,
    companyId,
  ];
}

/// Zmiana danych istniejącego użytkownika.
class UserUpdate extends Equatable {
  const UserUpdate({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.companyId,
  });

  final String email;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final int companyId;

  @override
  List<Object?> get props => [
    email,
    firstName,
    lastName,
    phoneNumber,
    companyId,
  ];
}

/// Wiersz z pliku CSV (import użytkowników).
class CsvUser extends Equatable {
  const CsvUser({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
  });

  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;

  String get displayName => '$lastName $firstName';

  CsvUser copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
  }) => CsvUser(
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    email: email ?? this.email,
    phoneNumber: phoneNumber ?? this.phoneNumber,
  );

  @override
  List<Object?> get props => [firstName, lastName, email, phoneNumber];
}
