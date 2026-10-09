import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';
import '../entities/admin_user.dart';
import '../entities/auth_session.dart';

abstract interface class AuthRepository {
  /// Każda zmiana sesji: logowanie, zmiana danych administratora,
  /// wylogowanie (`null`), także wymuszone, gdy backend odrzuci sesję.
  Stream<AuthSession?> get sessionChanges;

  AuthSession? get currentSession;

  /// Wczytuje zapisaną sesję; bez niej zwraca `null`.
  Future<AuthSession?> restoreSession();

  /// Loguje administratora. Konto bez uprawnień administratora nie dostaje
  /// sesji.
  Future<Either<Failure, AuthSession>> login({
    required String email,
    required String password,
  });

  /// Kończy sesję lokalnie i unieważnia ją na serwerze.
  Future<void> logout();

  /// Wysyła na [email] kod do zmiany hasła i zwraca identyfikator prośby,
  /// potrzebny w [finishPasswordReset]. Dla nieznanego adresu backend
  /// odpowiada tak samo (nie zdradza, czy konto istnieje).
  Future<Either<Failure, String>> requestPasswordReset(String email);

  /// Ustawia nowe hasło po podaniu kodu z e-maila.
  Future<Either<Failure, Unit>> finishPasswordReset({
    required String requestId,
    required String code,
    required String newPassword,
  });

  /// Aktualizuje dane administratora w sesji (np. po edycji profilu).
  Future<void> updateCurrentUser(AdminUser user);
}
