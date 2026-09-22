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
import '../../features/categories/data/datasources/categories_remote_data_source.dart';
import '../../features/categories/data/repositories/categories_repository_impl.dart';
import '../../features/categories/domain/repositories/categories_repository.dart';
import '../../features/categories/presentation/view_model/categories_cubit.dart';
import '../../features/categories/presentation/view_model/category_form_cubit.dart';
import '../../features/companies/data/datasources/companies_remote_data_source.dart';
import '../../features/companies/data/repositories/companies_repository_impl.dart';
import '../../features/companies/domain/repositories/companies_repository.dart';
import '../../features/companies/presentation/view_model/companies_cubit.dart';
import '../../features/companies/presentation/view_model/company_form_cubit.dart';

final getIt = GetIt.instance;

/// Rejestruje zależności aplikacji. Repozytoria i źródła danych są
/// singletonami (`registerLazySingleton`), cubity ekranów — fabrykami
/// (`registerFactory`), żeby każde wejście na ekran miało świeży stan.
///
/// [httpClient] pozwala testom podstawić atrapę backendu.
Future<void> setupDependencies({http.Client? httpClient}) async {
  final preferences = await SharedPreferences.getInstance();
  _registerCore(preferences, httpClient ?? http.Client());
  _registerAuth();
  _registerCategories();
  _registerCompanies();
}

void _registerCore(SharedPreferences preferences, http.Client httpClient) {
  getIt
    ..registerSingleton(preferences)
    ..registerSingleton(httpClient)
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

void _registerCategories() {
  getIt
    ..registerLazySingleton<CategoriesRemoteDataSource>(
      () => CategoriesRemoteDataSourceImpl(getIt(), getIt()),
    )
    ..registerLazySingleton<CategoriesRepository>(
      () => CategoriesRepositoryImpl(getIt()),
    )
    ..registerFactory(() => CategoriesCubit(getIt()))
    ..registerFactory(() => CategoryFormCubit(getIt()));
}

void _registerCompanies() {
  getIt
    ..registerLazySingleton<CompaniesRemoteDataSource>(
      () => CompaniesRemoteDataSourceImpl(getIt(), getIt()),
    )
    ..registerLazySingleton<CompaniesRepository>(
      () => CompaniesRepositoryImpl(getIt()),
    )
    ..registerFactory(() => CompaniesCubit(getIt()))
    ..registerFactory(() => CompanyFormCubit(getIt()));
}
