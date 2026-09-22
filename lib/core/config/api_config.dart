/// Adres backendu Xano. Można go nadpisać przy budowaniu:
/// `--dart-define=XANO_BASE_URL=https://...`.
abstract final class ApiConfig {
  static const baseUrl = String.fromEnvironment(
    'XANO_BASE_URL',
    defaultValue: 'https://xxiz-mxuj-zpyz.n7e.xano.io',
  );
}

/// Grupy API w Xano (segment `api:...` w ścieżce).
abstract final class XanoApiGroup {
  static const auth = 'api:Q_aNNNvL';
  static const news = 'api:iiXsTPtO';
  static const users = 'api:om78GTVu';
  static const companies = 'api:lUs0VlvB';
  static const categories = 'api:Qct1TYOV';
}
