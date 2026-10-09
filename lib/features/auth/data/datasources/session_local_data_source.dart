import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/admin_user_model.dart';

/// Dane zalogowanego administratora zapamiętane między uruchomieniami, żeby
/// panel wiedział, kto jest zalogowany, zanim odpowie backend. Tokeny
/// przechowuje klient backendu (`PreferencesAuthStorage`).
abstract interface class SessionLocalDataSource {
  AdminUserModel? read();

  Future<void> write(AdminUserModel user);

  Future<void> clear();
}

/// Przechowuje dane w SharedPreferences (w przeglądarce: localStorage).
class SessionLocalDataSourceImpl implements SessionLocalDataSource {
  SessionLocalDataSourceImpl(this._preferences);

  final SharedPreferences _preferences;

  static const key = 'admin_user';

  @override
  AdminUserModel? read() {
    final raw = _preferences.getString(key);
    if (raw == null) return null;
    // Uszkodzony wpis traktujemy jak brak danych.
    try {
      final decoded = json.decode(raw);
      return decoded is Map<String, dynamic>
          ? AdminUserModel.fromJson(decoded)
          : null;
    } on FormatException {
      return null;
    } on CheckedFromJsonException {
      return null;
    }
  }

  @override
  Future<void> write(AdminUserModel user) =>
      _preferences.setString(key, json.encode(user.toJson()));

  @override
  Future<void> clear() => _preferences.remove(key);
}
