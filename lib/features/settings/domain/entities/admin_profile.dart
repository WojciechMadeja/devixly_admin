import 'package:equatable/equatable.dart';

/// Dane konta zalogowanego administratora pobrane z `GET /user/{id}` —
/// pełniejsze niż to, co trzyma sesja (m.in. firma razem z jej id).
class AdminProfile extends Equatable {
  const AdminProfile({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.companyId,
    required this.companyName,
  });

  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final int companyId;
  final String companyName;

  String get fullName => '$firstName $lastName';

  AdminProfile copyWith({
    String? firstName,
    String? lastName,
    String? phoneNumber,
  }) {
    return AdminProfile(
      id: id,
      email: email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      companyId: companyId,
      companyName: companyName,
    );
  }

  @override
  List<Object?> get props =>
      [id, email, firstName, lastName, phoneNumber, companyId, companyName];
}
