/// Zalogowany administrator: jego id i e-mail, np. do pobrania własnego
/// profilu albo pominięcia siebie na liście. Implementuje feature `auth`.
abstract interface class CurrentAdmin {
  /// Rzuca `UnauthorizedException`, gdy nikt nie jest zalogowany.
  int get id;

  /// Rzuca `UnauthorizedException`, gdy nikt nie jest zalogowany.
  String get email;
}
