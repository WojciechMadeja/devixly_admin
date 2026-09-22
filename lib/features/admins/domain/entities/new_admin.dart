import 'package:equatable/equatable.dart';

/// Dane nowego administratora panelu.
class NewAdmin extends Equatable {
  const NewAdmin({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.password,
  });

  final String email;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String password;

  @override
  List<Object?> get props =>
      [email, firstName, lastName, phoneNumber, password];
}
