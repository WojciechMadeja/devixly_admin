import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/auth_session.dart';
import '../../domain/repositories/auth_repository.dart';
import 'session_state.dart';

/// Stan zalogowania całej aplikacji — czyta go router (przekierowanie do
/// logowania) i nagłówek (wylogowanie).
class SessionCubit extends Cubit<SessionState> {
  SessionCubit(this._auth) : super(const SessionState.restoring()) {
    _subscription = _auth.sessionChanges.listen(_onSessionChanged);
  }

  final AuthRepository _auth;
  late final StreamSubscription<AuthSession?> _subscription;

  Future<void> restore() async {
    _onSessionChanged(await _auth.restoreSession());
  }

  Future<void> logout() => _auth.logout();

  void _onSessionChanged(AuthSession? session) {
    if (isClosed) return;
    emit(
      session == null
          ? const SessionState.unauthenticated()
          : SessionState.authenticated(session.user),
    );
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    return super.close();
  }
}
