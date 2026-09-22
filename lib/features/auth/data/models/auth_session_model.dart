import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/date_formatters.dart';
import '../../domain/entities/auth_session.dart';
import 'admin_user_model.dart';

part 'auth_session_model.freezed.dart';
part 'auth_session_model.g.dart';

/// Sesja w postaci zapisywanej lokalnie (czasy w milisekundach od epoki,
/// tak jak zwraca je Xano).
@freezed
abstract class AuthSessionModel with _$AuthSessionModel {
  const AuthSessionModel._();

  const factory AuthSessionModel({
    required String accessToken,
    required String refreshToken,
    required int refreshTokenId,
    required AdminUserModel user,
    int? accessTokenExpiresAt,
    int? sessionExpiresAt,
  }) = _AuthSessionModel;

  factory AuthSessionModel.fromJson(Map<String, dynamic> json) =>
      _$AuthSessionModelFromJson(json);

  AuthSession toEntity() => AuthSession(
    accessToken: accessToken,
    refreshToken: refreshToken,
    refreshTokenId: refreshTokenId,
    user: user.toEntity(),
    accessTokenExpiresAt: _date(accessTokenExpiresAt),
    sessionExpiresAt: _date(sessionExpiresAt),
  );

  static DateTime? _date(int? millis) =>
      millis == null ? null : DateFormatters.fromEpochMillis(millis);
}
