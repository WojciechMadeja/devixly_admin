/// Zalogowany administrator — wiele endpointów Xano wymaga jego e-maila
/// (`admin_email`) albo id. Implementuje feature `auth`.
abstract interface class CurrentAdmin {
  /// Rzuca `UnauthorizedException`, gdy nikt nie jest zalogowany.
  int get id;

  /// Rzuca `UnauthorizedException`, gdy nikt nie jest zalogowany.
  String get email;
}
