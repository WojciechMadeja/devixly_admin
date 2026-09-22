import '../../../../core/config/api_config.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/http_json_client.dart';
import '../models/auth_session_model.dart';
import '../models/token_response_models.dart';

abstract interface class AuthRemoteDataSource {
  Future<AuthSessionModel> login({
    required String email,
    required String password,
  });

  Future<AuthSessionModel> refresh(AuthSessionModel session);

  Future<void> revoke(int refreshTokenId);

  Future<void> requestPasswordReset(String email);
}

/// Endpointy logowania Xano. Nie wymagają nagłówka Bearer, dlatego używają
/// klienta bez autoryzacji (to też zapobiega cyklowi zależności z
/// odświeżaniem tokenu).
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this._client);

  final HttpJsonClient _client;

  static const _auth = '${XanoApiGroup.auth}/auth';

  @override
  Future<AuthSessionModel> login({
    required String email,
    required String password,
  }) async {
    final json = await _client.post(
      '$_auth/admin/login',
      body: {'email': email, 'password': password},
    );
    return LoginResponseModel.fromJson(_asMap(json)).toSession();
  }

  @override
  Future<AuthSessionModel> refresh(AuthSessionModel session) async {
    final json = await _client.post(
      '$_auth/refresh',
      body: {
        'refreshToken': session.refreshToken,
        'refreshTokenId': session.refreshTokenId,
        'userId': session.user.id,
      },
    );
    return RefreshResponseModel.fromJson(_asMap(json))
        .toSession(previous: session);
  }

  @override
  Future<void> revoke(int refreshTokenId) => _client.post(
        '$_auth/revoke_token',
        body: {'refreshTokenId': refreshTokenId},
      );

  @override
  Future<void> requestPasswordReset(String email) =>
      _client.post('$_auth/reset_password', body: {'email': email});

  static Map<String, dynamic> _asMap(Object? json) {
    if (json is Map<String, dynamic>) return json;
    throw const ParsingException('Nieoczekiwana odpowiedź serwera logowania.');
  }
}
