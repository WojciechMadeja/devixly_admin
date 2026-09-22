import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/network/auth_token_provider.dart';
import '../../core/network/authorized_api_client.dart';
import '../../core/network/current_admin.dart';
import '../../core/network/http_json_client.dart';
import '../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../features/auth/data/datasources/session_local_data_source.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/presentation/view_model/login_cubit.dart';
import '../../features/auth/presentation/view_model/reset_password_cubit.dart';
import '../../features/auth/presentation/view_model/session_cubit.dart';

final getIt = GetIt.instance;

/// Rejestruje zależności aplikacji. Repozytoria i źródła danych są
/// singletonami (`registerLazySingleton`), cubity ekranów — fabrykami
/// (`registerFactory`), żeby każde wejście na ekran miało świeży stan.
Future<void> setupDependencies() async {
  final preferences = await SharedPreferences.getInstance();
  _registerCore(preferences);
  _registerAuth();
}

void _registerCore(SharedPreferences preferences) {
  getIt
    ..registerSingleton(preferences)
    ..registerLazySingleton<http.Client>(http.Client.new)
    ..registerLazySingleton(() => HttpJsonClient(getIt()))
    ..registerLazySingleton(() => AuthorizedApiClient(getIt(), getIt()));
}

void _registerAuth() {
  getIt
    ..registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(getIt()),
    )
    ..registerLazySingleton<SessionLocalDataSource>(
      () => SessionLocalDataSourceImpl(getIt()),
    )
    ..registerLazySingleton(() => AuthRepositoryImpl(getIt(), getIt()))
    ..registerLazySingleton<AuthRepository>(() => getIt<AuthRepositoryImpl>())
    ..registerLazySingleton<AuthTokenProvider>(
        () => getIt<AuthRepositoryImpl>())
    ..registerLazySingleton<CurrentAdmin>(() => getIt<AuthRepositoryImpl>())
    // Sesja żyje przez cały czas działania aplikacji.
    ..registerLazySingleton(() => SessionCubit(getIt()))
    ..registerFactory(() => LoginCubit(getIt()))
    ..registerFactory(() => ResetPasswordCubit(getIt()));
}
