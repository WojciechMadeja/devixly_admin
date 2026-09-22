/// Walidacja danych formularzy (reguły przeniesione 1:1 z wersji FlutterFlow).
abstract final class Validators {
  static final _localPart = RegExp(r"^[A-Za-z0-9!#$%&'*+/=?^_`{|}~.-]+$");
  static final _domain = RegExp(r'^[A-Za-z0-9.-]+$');
  static final _topLevelDomain = RegExp(r'^[A-Za-z]{2,24}$');

  /// Praktyczna walidacja adresu e-mail: część lokalna ≤ 64 znaki, domena
  /// ≤ 255 znaków, co najmniej dwa człony domeny i literowe TLD.
  static bool isValidEmail(String email) {
    final value = email.trim();
    if (value.isEmpty || value.length > 320) return false;

    final parts = value.split('@');
    if (parts.length != 2) return false;
    final [local, domain] = parts;
    if (local.isEmpty || domain.isEmpty) return false;
    if (local.length > 64 || domain.length > 255) return false;
    if (local.startsWith('.') || local.endsWith('.')) return false;
    if (local.contains('..') || domain.contains('..')) return false;
    if (!_localPart.hasMatch(local) || !_domain.hasMatch(domain)) return false;

    final labels = domain.split('.');
    if (labels.length < 2) return false;
    for (final label in labels) {
      if (label.isEmpty || label.length > 63) return false;
      if (label.startsWith('-') || label.endsWith('-')) return false;
    }
    return _topLevelDomain.hasMatch(labels.last);
  }
}
