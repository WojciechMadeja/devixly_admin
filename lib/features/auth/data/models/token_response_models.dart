import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/json_readers.dart';
import 'admin_user_model.dart';
import 'auth_session_model.dart';

part 'token_response_models.freezed.dart';
part 'token_response_models.g.dart';

/// Odpowiedź `POST auth/admin/login`: dane i tokeny w polu `user`.
@freezed
abstract class LoginResponseModel with _$LoginResponseModel {
  const LoginResponseModel._();

  const factory LoginResponseModel({required LoginUserModel user}) =
      _LoginResponseModel;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  AuthSessionModel toSession() => AuthSessionModel(
        accessToken: user.authToken,
        refreshToken: user.refreshToken,
        refreshTokenId: user.refreshTokenId,
        accessTokenExpiresAt: user.authTokenExpireAt,
        sessionExpiresAt: user.expiresAt,
        user: AdminUserModel(
          id: user.id,
          email: user.email,
          firstName: user.firstName,
          lastName: user.lastName,
          phoneNumber: user.phoneNumber,
          company: user.company,
        ),
      );
}

@freezed
abstract class LoginUserModel with _$LoginUserModel {
  const factory LoginUserModel({
    required int id,
    required String authToken,
    required String refreshToken,
    required int refreshTokenId,
    int? authTokenExpireAt,
    int? expiresAt,
    @Default('') String email,
    @Default('') String firstName,
    @Default('') String lastName,
    @JsonKey(fromJson: stringFromJson) @Default('') String phoneNumber,
    @JsonKey(fromJson: stringFromJson) @Default('') String company,
  }) = _LoginUserModel;

  factory LoginUserModel.fromJson(Map<String, dynamic> json) =>
      _$LoginUserModelFromJson(json);
}

/// Odpowiedź `POST auth/refresh` (płaski obiekt). Brakujące dane
/// użytkownika uzupełniamy z poprzedniej sesji.
@freezed
abstract class RefreshResponseModel with _$RefreshResponseModel {
  const RefreshResponseModel._();

  const factory RefreshResponseModel({
    required int userId,
    required String authToken,
    required String refreshToken,
    required int refreshTokenId,
    int? authTokenExpireAt,
    int? expiresAt,
    String? email,
    String? firstName,
    String? lastName,
    @JsonKey(fromJson: _optionalString) String? phoneNumber,
    @JsonKey(fromJson: _optionalString) String? company,
  }) = _RefreshResponseModel;

  factory RefreshResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RefreshResponseModelFromJson(json);

  AuthSessionModel toSession({required AuthSessionModel previous}) {
    final user = previous.user;
    return AuthSessionModel(
      accessToken: authToken,
      refreshToken: refreshToken,
      refreshTokenId: refreshTokenId,
      accessTokenExpiresAt: authTokenExpireAt,
      sessionExpiresAt: expiresAt ?? previous.sessionExpiresAt,
      user: user.copyWith(
        id: userId,
        email: email ?? user.email,
        firstName: firstName ?? user.firstName,
        lastName: lastName ?? user.lastName,
        phoneNumber: phoneNumber ?? user.phoneNumber,
        company: company ?? user.company,
      ),
    );
  }
}

String? _optionalString(Object? value) =>
    value == null ? null : stringFromJson(value);
