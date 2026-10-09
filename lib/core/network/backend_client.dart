import 'dart:convert';

import 'package:background_devixly_client/background_devixly_client.dart';
import 'package:http/http.dart' as http;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/api_config.dart';

/// Tworzy klienta backendu Devixly (Serverpod).
///
/// Sesję (token dostępu JWT i refresh token) trzyma menedżer sesji klienta
/// w [preferences] (w przeglądarce: localStorage) i sam odświeża token
/// dostępu tuż przed wygaśnięciem — jednym żądaniem naraz, także między
/// kartami. [onUnauthorized] jest wywoływane, gdy backend mimo to odrzuci
/// żądanie jako niezalogowane, czyli sesja jest nieważna (wygasła, została
/// unieważniona albo konto zablokowano).
///
/// [httpClient] pozwala testom podstawić atrapę backendu.
Client createBackendClient({
  required SharedPreferences preferences,
  required void Function() onUnauthorized,
  http.Client? httpClient,
  String serverUrl = ApiConfig.serverUrl,
}) {
  return Client(
      serverUrl.endsWith('/') ? serverUrl : '$serverUrl/',
      httpClientOverride: httpClient,
      onFailedCall: (context, error, stackTrace) {
        if (error is ServerpodClientUnauthorized) onUnauthorized();
      },
    )
    ..authSessionManager = ClientAuthSessionManager(
      storage: PreferencesAuthStorage(preferences),
    );
}

/// Zapis sesji klienta w SharedPreferences.
class PreferencesAuthStorage implements ClientAuthSuccessStorage {
  PreferencesAuthStorage(this._preferences);

  static const key = 'admin_auth';

  final SharedPreferences _preferences;

  @override
  Future<AuthSuccess?> get() async {
    final raw = _preferences.getString(key);
    if (raw == null) return null;
    // Uszkodzony wpis traktujemy jak brak sesji.
    try {
      return AuthSuccess.fromJson(jsonDecode(raw) as Map<String, dynamic>);
    } on Object {
      return null;
    }
  }

  @override
  Future<void> set(AuthSuccess? data) async {
    if (data == null) {
      await _preferences.remove(key);
    } else {
      await _preferences.setString(key, jsonEncode(data.toJson()));
    }
  }
}
