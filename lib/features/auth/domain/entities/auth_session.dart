import 'package:equatable/equatable.dart';

import 'admin_user.dart';

/// Sesja administratora: kto jest zalogowany. Tokeny trzyma klient backendu
/// (menedżer sesji Serverpod) i sam je odświeża.
class AuthSession extends Equatable {
  const AuthSession({required this.user});

  final AdminUser user;

  @override
  List<Object?> get props => [user];
}
