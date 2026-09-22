import 'package:equatable/equatable.dart';

import 'admin_user.dart';

/// Sesja administratora: tokeny Xano i dane zalogowanego użytkownika.
class AuthSession extends Equatable {
  const AuthSession({
    required this.accessToken,
    required this.refreshToken,
    required this.refreshTokenId,
    required this.user,
    this.accessTokenExpiresAt,
    this.sessionExpiresAt,
  });

  final String accessToken;
  final String refreshToken;
  final int refreshTokenId;
  final AdminUser user;

  /// Wygaśnięcie tokenu dostępu (`authTokenExpireAt`).
  final DateTime? accessTokenExpiresAt;

  /// Wygaśnięcie całej sesji (`expiresAt`) — po nim trzeba zalogować się
  /// ponownie.
  final DateTime? sessionExpiresAt;

  static const _refreshMargin = Duration(seconds: 30);

  bool isExpiredAt(DateTime now) =>
      sessionExpiresAt != null && !sessionExpiresAt!.isAfter(now);

  /// Czy token dostępu wygasa w ciągu najbliższych 30 sekund.
  bool accessTokenExpiresSoon(DateTime now) =>
      accessTokenExpiresAt != null &&
      !accessTokenExpiresAt!.isAfter(now.add(_refreshMargin));

  @override
  List<Object?> get props => [
    accessToken,
    refreshToken,
    refreshTokenId,
    user,
    accessTokenExpiresAt,
    sessionExpiresAt,
  ];
}
