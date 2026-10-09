import 'dart:async';

import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/errors/guard.dart';
import '../../../../core/network/current_admin.dart';
import '../../domain/entities/admin_user.dart';
import '../../domain/entities/auth_session.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';
import '../datasources/session_local_data_source.dart';
import '../models/admin_user_model.dart';

/// Sesja administratora i dane zalogowanego admina (`CurrentAdmin`).
///
/// Tokeny trzyma klient backendu i sam je odświeża; to repozytorium pamięta
/// tylko, kto jest zalogowany. Gdy backend odrzuci sesję, klient woła
/// [sessionRejected] (patrz `createBackendClient` w `injection.dart`).
class AuthRepositoryImpl implements AuthRepository, CurrentAdmin {
  AuthRepositoryImpl(this._remote, this._local);

  final AuthRemoteDataSource _remote;
  final SessionLocalDataSource _local;

  final _changes = StreamController<AuthSession?>.broadcast();
  AdminUserModel? _user;

  @override
  Stream<AuthSession?> get sessionChanges => _changes.stream;

  @override
  AuthSession? get currentSession => switch (_user) {
    final user? => AuthSession(user: user.toEntity()),
    null => null,
  };

  @override
  Future<AuthSession?> restoreSession() async {
    await _remote.restore();
    if (!_remote.isSignedIn) {
      await _local.clear();
      _user = null;
      return null;
    }
    // Zapamiętanym danym ufamy od razu — nieważną sesję zakończy pierwsze
    // odrzucone żądanie. Bez nich pytamy backend.
    try {
      _user = _local.read() ?? await _remote.currentUser();
    } on AppException {
      await _remote.dropSession();
      await _local.clear();
      _user = null;
      return null;
    }
    await _local.write(_user!);
    return currentSession;
  }

  @override
  Future<Either<Failure, AuthSession>> login({
    required String email,
    required String password,
  }) {
    return guard(() async {
      final user = await _remote.login(email: email, password: password);
      await _setUser(user);
      return AuthSession(user: user.toEntity());
    });
  }

  @override
  Future<void> logout() async {
    final wasSignedIn = _user != null;
    await _setUser(null);
    if (wasSignedIn) {
      // Unieważnienie w tle — wylogowanie lokalne nie czeka na sieć.
      unawaited(
        _remote.signOut().catchError(
          (Object _) => _remote.dropSession(),
          test: (e) => e is AppException,
        ),
      );
    }
  }

  /// Backend odrzucił sesję (wygasła albo została unieważniona): kończymy
  /// ją lokalnie, a router przenosi do logowania.
  Future<void> sessionRejected() async {
    if (_user == null) return;
    await _setUser(null);
    await _remote.dropSession();
  }

  @override
  Future<Either<Failure, String>> requestPasswordReset(String email) =>
      guard(() => _remote.startPasswordReset(email));

  @override
  Future<Either<Failure, Unit>> finishPasswordReset({
    required String requestId,
    required String code,
    required String newPassword,
  }) => guard(() async {
    await _remote.finishPasswordReset(
      requestId: requestId,
      code: code,
      newPassword: newPassword,
    );
    return unit;
  });

  @override
  Future<void> updateCurrentUser(AdminUser user) async {
    if (_user == null) return;
    await _setUser(AdminUserModel.fromEntity(user));
  }

  @override
  int get id => _requireUser().id;

  @override
  String get email => _requireUser().email;

  AdminUserModel _requireUser() =>
      _user ?? (throw const UnauthorizedException());

  Future<void> _setUser(AdminUserModel? user) async {
    _user = user;
    if (user == null) {
      await _local.clear();
    } else {
      await _local.write(user);
    }
    _changes.add(currentSession);
  }
}
