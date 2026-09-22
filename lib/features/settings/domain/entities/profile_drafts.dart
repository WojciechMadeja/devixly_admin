import 'package:equatable/equatable.dart';

/// Zmiana danych osobowych administratora (e-mail i firma pozostają bez
/// zmian — pole e-mail jest na ekranie tylko do odczytu).
class ProfileUpdate extends Equatable {
  const ProfileUpdate({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
  });

  final String firstName;
  final String lastName;
  final String phoneNumber;

  @override
  List<Object?> get props => [firstName, lastName, phoneNumber];
}

/// Zmiana hasła konta.
class PasswordChange extends Equatable {
  const PasswordChange({required this.oldPassword, required this.newPassword});

  final String oldPassword;
  final String newPassword;

  @override
  List<Object?> get props => [oldPassword, newPassword];
}
