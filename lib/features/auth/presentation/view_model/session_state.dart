import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/admin_user.dart';

part 'session_state.freezed.dart';

@freezed
sealed class SessionState with _$SessionState {
  /// Sesja jest wczytywana przy starcie aplikacji.
  const factory SessionState.restoring() = SessionRestoring;

  const factory SessionState.authenticated(AdminUser user) =
      SessionAuthenticated;

  const factory SessionState.unauthenticated() = SessionUnauthenticated;
}
