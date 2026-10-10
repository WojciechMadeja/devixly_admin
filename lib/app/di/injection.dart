import 'dart:async';

import 'package:background_devixly_client/background_devixly_client.dart'
    show Client;
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/network/backend_client.dart';
import '../../core/network/current_admin.dart';
import '../../core/network/file_upload.dart';
import '../../core/services/media_picker.dart';
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
import '../../features/news/data/datasources/news_remote_data_source.dart';
import '../../features/news/data/repositories/news_repository_impl.dart';
import '../../features/news/domain/repositories/news_repository.dart';
import '../../features/news/presentation/view_model/news_editor_cubit.dart';
import '../../features/admins/data/datasources/admins_remote_data_source.dart';
import '../../features/admins/data/repositories/admins_repository_impl.dart';
import '../../features/admins/domain/repositories/admins_repository.dart';
import '../../features/admins/presentation/view_model/admin_form_cubit.dart';
import '../../features/lookups/data/datasources/lookups_remote_data_source.dart';
import '../../features/lookups/data/repositories/lookups_repository_impl.dart';
import '../../features/lookups/domain/repositories/lookups_repository.dart';
import '../../features/news/presentation/view_model/news_list_cubit.dart';
import '../../features/projects/data/datasources/projects_remote_data_source.dart';
import '../../features/projects/data/repositories/projects_repository_impl.dart';
import '../../features/projects/domain/repositories/projects_repository.dart';
import '../../features/projects/presentation/view_model/project_details_cubit.dart';
import '../../features/projects/presentation/view_model/project_form_cubit.dart';
import '../../features/projects/presentation/view_model/projects_list_cubit.dart';
import '../../features/units/data/datasources/units_remote_data_source.dart';
import '../../features/units/data/repositories/units_repository_impl.dart';
import '../../features/units/domain/repositories/units_repository.dart';
import '../../features/units/presentation/view_model/add_unit_cubit.dart';
import '../../features/settings/data/datasources/profile_remote_data_source.dart';
import '../../features/settings/data/repositories/profile_repository_impl.dart';
import '../../features/settings/domain/repositories/profile_repository.dart';
import '../../features/settings/presentation/view_model/edit_profile_cubit.dart';
import '../../features/settings/presentation/view_model/profile_cubit.dart';
import '../../features/settings/presentation/view_model/update_password_cubit.dart';
import '../../features/users/data/datasources/users_remote_data_source.dart';
import '../../features/users/data/repositories/users_repository_impl.dart';
import '../../features/users/domain/repositories/users_repository.dart';
import '../../features/users/domain/usecases/parse_users_csv.dart';
import '../../features/users/presentation/view_model/csv_import_cubit.dart';
import '../../features/users/presentation/view_model/user_form_cubit.dart';
import '../../features/users/presentation/view_model/users_list_cubit.dart';

final getIt = GetIt.instance;

/// Rejestruje zależności aplikacji. Repozytoria i źródła danych są
/// singletonami (`registerLazySingleton`), cubity ekranów — fabrykami
/// (`registerFactory`), żeby każde wejście na ekran miało świeży stan.
///
/// [httpClient] i [uploadFile] pozwalają testom podstawić atrapę backendu
/// i wysyłki plików.
Future<void> setupDependencies({
  http.Client? httpClient,
  FileUploadFunction uploadFile = uploadToBackend,
}) async {
  final preferences = await SharedPreferences.getInstance();
  _registerCore(preferences, httpClient, uploadFile);
  _registerAuth();
  _registerCategories();
  _registerCompanies();
  _registerNews();
  _registerUsers();
  _registerAdmins();
  _registerSettings();
  _registerLookups();
  _registerProjects();
  _registerUnits();
}

void _registerCore(
  SharedPreferences preferences,
  http.Client? httpClient,
  FileUploadFunction uploadFile,
) {
  getIt
    ..registerSingleton(preferences)
    // Backend odrzucił sesję (wygasła albo została unieważniona): kończymy
    // ją lokalnie, a router przenosi do logowania. Repozytorium sesji
    // powstaje później niż klient, stąd leniwe sięgnięcie do `getIt`.
    ..registerLazySingleton<Client>(
      () => createBackendClient(
        preferences: preferences,
        httpClient: httpClient,
        onUnauthorized: () =>
            unawaited(getIt<AuthRepositoryImpl>().sessionRejected()),
      ),
    )
    ..registerSingleton<FileUploadFunction>(uploadFile)
    ..registerLazySingleton<MediaPicker>(DeviceMediaPicker.new);
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
    ..registerLazySingleton<CurrentAdmin>(() => getIt<AuthRepositoryImpl>())
    // Sesja żyje przez cały czas działania aplikacji.
    ..registerLazySingleton(() => SessionCubit(getIt()))
    ..registerFactory(() => LoginCubit(getIt()))
    ..registerFactory(() => ResetPasswordCubit(getIt()));
}

void _registerCategories() {
  getIt
    ..registerLazySingleton<CategoriesRemoteDataSource>(
      () => CategoriesRemoteDataSourceImpl(getIt()),
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
      () => CompaniesRemoteDataSourceImpl(getIt()),
    )
    ..registerLazySingleton<CompaniesRepository>(
      () => CompaniesRepositoryImpl(getIt()),
    )
    ..registerFactory(() => CompaniesCubit(getIt()))
    ..registerFactory(() => CompanyFormCubit(getIt()));
}

void _registerNews() {
  getIt
    ..registerLazySingleton<NewsRemoteDataSource>(
      () => NewsRemoteDataSourceImpl(getIt(), getIt()),
    )
    ..registerLazySingleton<NewsRepository>(() => NewsRepositoryImpl(getIt()))
    ..registerFactory(() => NewsListCubit(getIt(), getIt()))
    ..registerFactory(
      () => NewsEditorCubit(getIt(), getIt(), getIt(), getIt()),
    );
}

void _registerUsers() {
  getIt
    ..registerLazySingleton<UsersRemoteDataSource>(
      () => UsersRemoteDataSourceImpl(getIt()),
    )
    ..registerLazySingleton<UsersRepository>(() => UsersRepositoryImpl(getIt()))
    ..registerLazySingleton(() => const ParseUsersCsv())
    ..registerFactory(() => UsersListCubit(getIt(), getIt(), getIt()))
    ..registerFactory(() => UserFormCubit(getIt(), getIt()))
    ..registerFactory(() => CsvImportCubit(getIt(), getIt(), getIt(), getIt()));
}

void _registerSettings() {
  getIt
    ..registerLazySingleton<ProfileRemoteDataSource>(
      () => ProfileRemoteDataSourceImpl(getIt()),
    )
    ..registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl(getIt(), getIt()),
    )
    ..registerFactory(() => ProfileCubit(getIt()))
    ..registerFactory(() => EditProfileCubit(getIt(), getIt()))
    ..registerFactory(() => UpdatePasswordCubit(getIt()));
}

/// Słowniki (dzielnice, deweloperzy, typy jednostek, układy) są wspólne
/// dla formularzy projektu i jednostki.
void _registerLookups() {
  getIt
    ..registerLazySingleton<LookupsRemoteDataSource>(
      () => LookupsRemoteDataSourceImpl(getIt()),
    )
    ..registerLazySingleton<LookupsRepository>(
      () => LookupsRepositoryImpl(getIt()),
    );
}

void _registerProjects() {
  getIt
    ..registerLazySingleton<ProjectsRemoteDataSource>(
      () => ProjectsRemoteDataSourceImpl(getIt()),
    )
    ..registerLazySingleton<ProjectsRepository>(
      () => ProjectsRepositoryImpl(getIt()),
    )
    ..registerFactory(() => ProjectFormCubit(getIt(), getIt()))
    ..registerFactory(() => ProjectsListCubit(getIt()))
    ..registerFactory(() => ProjectDetailsCubit(getIt(), getIt(), getIt()));
}

void _registerUnits() {
  getIt
    ..registerLazySingleton<UnitsRemoteDataSource>(
      () => UnitsRemoteDataSourceImpl(getIt()),
    )
    ..registerLazySingleton<UnitsRepository>(() => UnitsRepositoryImpl(getIt()))
    ..registerFactory(() => AddUnitCubit(getIt(), getIt(), getIt()));
}

void _registerAdmins() {
  getIt
    ..registerLazySingleton<AdminsRemoteDataSource>(
      () => AdminsRemoteDataSourceImpl(getIt()),
    )
    ..registerLazySingleton<AdminsRepository>(
      () => AdminsRepositoryImpl(getIt()),
    )
    ..registerFactory(() => AdminFormCubit(getIt()));
}
