import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../../core/network/http_json_client.dart';

final getIt = GetIt.instance;

/// Rejestruje zależności aplikacji. Repozytoria i źródła danych są
/// singletonami (`registerLazySingleton`), cubity ekranów — fabrykami
/// (`registerFactory`), żeby każde wejście na ekran miało świeży stan.
Future<void> setupDependencies() async {
  _registerCore();
}

void _registerCore() {
  getIt
    ..registerLazySingleton<http.Client>(http.Client.new)
    ..registerLazySingleton(() => HttpJsonClient(getIt()));
}
