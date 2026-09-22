import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/auth_session_model.dart';

abstract interface class SessionLocalDataSource {
  AuthSessionModel? read();

  Future<void> write(AuthSessionModel session);

  Future<void> clear();
}

/// Przechowuje sesję w SharedPreferences (w przeglądarce: localStorage).
class SessionLocalDataSourceImpl implements SessionLocalDataSource {
  SessionLocalDataSourceImpl(this._preferences);

  final SharedPreferences _preferences;

  static const _key = 'admin_session';

  @override
  AuthSessionModel? read() {
    final raw = _preferences.getString(_key);
    if (raw == null) return null;
    // Uszkodzony wpis traktujemy jak brak sesji.
    try {
      final decoded = json.decode(raw);
      return decoded is Map<String, dynamic>
          ? AuthSessionModel.fromJson(decoded)
          : null;
    } on FormatException {
      return null;
    } on CheckedFromJsonException {
      return null;
    }
  }

  @override
  Future<void> write(AuthSessionModel session) =>
      _preferences.setString(_key, json.encode(session.toJson()));

  @override
  Future<void> clear() => _preferences.remove(_key);
}
