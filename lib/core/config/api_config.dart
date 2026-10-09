/// Adres backendu Devixly (Serverpod): domyślnie produkcyjny. Do pracy
/// z lokalnym backendem: `--dart-define=SERVER_URL=http://localhost:8080/`.
abstract final class ApiConfig {
  static const serverUrl = String.fromEnvironment(
    'SERVER_URL',
    defaultValue: 'https://api.devixly.com/',
  );
}
