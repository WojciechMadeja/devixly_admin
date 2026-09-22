import 'package:equatable/equatable.dart';

/// Firma przypisana do użytkownika (skrót danych z listy użytkowników).
class UserCompany extends Equatable {
  const UserCompany({
    required this.id,
    required this.name,
    this.isBlocked = false,
  });

  final int id;
  final String name;
  final bool isBlocked;

  @override
  List<Object?> get props => [id, name, isBlocked];
}
