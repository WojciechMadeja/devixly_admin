import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';
import '../entities/admin_user.dart';
import '../entities/auth_session.dart';

abstract interface class AuthRepository {
  /// Każda zmiana sesji: logowanie, odświeżenie tokenu, wylogowanie
  /// (`null`), także wymuszone po odrzuceniu odświeżenia.
  Stream<AuthSession?> get sessionChanges;

  AuthSession? get currentSession;

  /// Wczytuje zapisaną sesję; wygasłą usuwa i zwraca `null`.
  Future<AuthSession?> restoreSession();

  Future<Either<Failure, AuthSession>> login({
    required String email,
    required String password,
  });

  /// Kończy sesję lokalnie i unieważnia refresh token na serwerze.
  Future<void> logout();

  Future<Either<Failure, Unit>> requestPasswordReset(String email);

  /// Aktualizuje dane administratora w sesji (np. po edycji profilu).
  Future<void> updateCurrentUser(AdminUser user);
}
