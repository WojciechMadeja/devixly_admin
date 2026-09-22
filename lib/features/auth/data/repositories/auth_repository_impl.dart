import 'dart:async';

import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/errors/guard.dart';
import '../../../../core/network/auth_token_provider.dart';
import '../../../../core/network/current_admin.dart';
import '../../domain/entities/admin_user.dart';
import '../../domain/entities/auth_session.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';
import '../datasources/session_local_data_source.dart';
import '../models/admin_user_model.dart';
import '../models/auth_session_model.dart';

/// Sesja administratora. Jest też źródłem tokenu dla klienta API
/// (`AuthTokenProvider`) i danych zalogowanego admina (`CurrentAdmin`).
///
/// Token odświeżamy tylko, gdy wygasa albo backend go odrzuci, i zawsze jednym
/// żądaniem naraz — Xano unieważnia użyty refresh token, więc dwa równoległe
/// odświeżenia kończyłyby się wylogowaniem.
class AuthRepositoryImpl
    implements AuthRepository, AuthTokenProvider, CurrentAdmin {
  AuthRepositoryImpl(
    this._remote,
    this._local, {
    DateTime Function() clock = DateTime.now,
  }) : _now = clock;

  final AuthRemoteDataSource _remote;
  final SessionLocalDataSource _local;
  final DateTime Function() _now;

  final _changes = StreamController<AuthSession?>.broadcast();
  AuthSessionModel? _session;
  Future<AuthSessionModel?>? _refreshInProgress;

  @override
  Stream<AuthSession?> get sessionChanges => _changes.stream;

  @override
  AuthSession? get currentSession => _session?.toEntity();

  @override
  Future<AuthSession?> restoreSession() async {
    final stored = _local.read();
    if (stored == null || stored.toEntity().isExpiredAt(_now())) {
      await _local.clear();
      _session = null;
      return null;
    }
    _session = stored;
    return stored.toEntity();
  }

  @override
  Future<Either<Failure, AuthSession>> login({
    required String email,
    required String password,
  }) {
    return guard(() async {
      final session = await _remote.login(email: email, password: password);
      await _setSession(session);
      return session.toEntity();
    });
  }

  @override
  Future<void> logout() async {
    final session = _session;
    await _setSession(null);
    if (session != null) {
      // Unieważnienie w tle — wylogowanie lokalne nie czeka na sieć.
      unawaited(
        _remote
            .revoke(session.refreshTokenId)
            .catchError((Object _) {}, test: (e) => e is AppException),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> requestPasswordReset(String email) {
    return guard(() async {
      await _remote.requestPasswordReset(email);
      return unit;
    });
  }

  @override
  Future<void> updateCurrentUser(AdminUser user) async {
    final session = _session;
    if (session == null) return;
    await _setSession(session.copyWith(user: AdminUserModel.fromEntity(user)));
  }

  @override
  Future<String?> validAccessToken() async {
    final session = _session;
    if (session == null) return null;
    if (!session.toEntity().accessTokenExpiresSoon(_now())) {
      return session.accessToken;
    }
    return (await _refreshOnce())?.accessToken;
  }

  @override
  Future<String?> refreshAfterUnauthorized() async =>
      (await _refreshOnce())?.accessToken;

  @override
  int get id => _requireSession().user.id;

  @override
  String get email => _requireSession().user.email;

  AuthSessionModel _requireSession() =>
      _session ?? (throw const UnauthorizedException());

  Future<AuthSessionModel?> _refreshOnce() =>
      _refreshInProgress ??= _refresh().whenComplete(
        () => _refreshInProgress = null,
      );

  Future<AuthSessionModel?> _refresh() async {
    final current = _session;
    if (current == null) return null;
    try {
      final refreshed = await _remote.refresh(current);
      await _setSession(refreshed);
      return refreshed;
    } on NetworkException {
      // Chwilowy brak sieci nie kończy sesji — żądanie zgłosi błąd sieci.
      rethrow;
    } on AppException {
      // Backend odrzucił odświeżenie: sesja jest nieważna.
      await logout();
      return null;
    }
  }

  Future<void> _setSession(AuthSessionModel? session) async {
    _session = session;
    if (session == null) {
      await _local.clear();
    } else {
      await _local.write(session);
    }
    _changes.add(session?.toEntity());
  }
}
