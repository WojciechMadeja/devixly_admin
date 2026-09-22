/// Źródło tokenu dostępu dla `AuthorizedApiClient`. Implementuje je feature
/// `auth` (sesja administratora).
abstract interface class AuthTokenProvider {
  /// Aktualny token dostępu — odświeżony, jeśli właśnie wygasa — albo `null`,
  /// gdy nikt nie jest zalogowany.
  Future<String?> validAccessToken();

  /// Wywoływane, gdy backend odrzuci token (401). Odświeża sesję (jedno
  /// odświeżenie dla wszystkich równoległych żądań) i zwraca nowy token albo
  /// kończy sesję i zwraca `null`.
  Future<String?> refreshAfterUnauthorized();
}
