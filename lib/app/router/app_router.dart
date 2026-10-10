import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/view/login_view.dart';
import '../../features/auth/presentation/view_model/session_cubit.dart';
import '../../features/auth/presentation/view_model/session_state.dart';
import '../../features/categories/presentation/view/categories_view.dart';
import '../../features/companies/presentation/view/companies_view.dart';
import '../../features/home/presentation/view/home_view.dart';
import '../../features/news/domain/entities/news.dart';
import '../../features/news/presentation/view/add_news_view.dart';
import '../../features/news/presentation/view/edit_news_view.dart';
import '../../features/admins/presentation/view/add_admin_view.dart';
import '../../features/news/presentation/view/news_list_view.dart';
import '../../features/projects/presentation/view/add_project_view.dart';
import '../../features/projects/presentation/view/project_details_view.dart';
import '../../features/projects/presentation/view/projects_list_view.dart';
import '../../features/settings/presentation/view/edit_profile_view.dart';
import '../../features/settings/presentation/view/settings_view.dart';
import '../../features/settings/presentation/view/update_password_view.dart';
import '../../features/units/presentation/view/add_unit_view.dart';
import '../../features/users/presentation/view/add_user_view.dart';
import '../../features/users/presentation/view/csv_import_view.dart';
import '../../features/users/presentation/view/users_list_view.dart';
import 'app_routes.dart';
import 'stream_listenable.dart';

/// Trasy panelu. Wszystkie poza logowaniem wymagają sesji — bez niej router
/// przekierowuje na logowanie i zapamiętuje adres w `?from=`, żeby po
/// zalogowaniu wrócić w to samo miejsce.
GoRouter createAppRouter(SessionCubit session) {
  bool loggedIn() => session.state is SessionAuthenticated;

  return GoRouter(
    initialLocation: AppRoutes.root,
    debugLogDiagnostics: kDebugMode,
    refreshListenable: StreamListenable(session.stream),
    redirect: (context, state) {
      const publicPaths = {AppRoutes.root, AppRoutes.login};
      if (loggedIn() || publicPaths.contains(state.matchedLocation)) {
        return null;
      }
      return Uri(
        path: AppRoutes.login,
        queryParameters: {'from': state.uri.toString()},
      ).toString();
    },
    // Nieznany adres prowadzi na stronę główną albo do logowania.
    errorBuilder: (context, state) =>
        loggedIn() ? const HomeView() : const LoginView(),
    routes: [
      GoRoute(
        path: AppRoutes.root,
        builder: (context, state) =>
            loggedIn() ? const HomeView() : const LoginView(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) =>
            LoginView(redirectTo: state.uri.queryParameters['from']),
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: AppRoutes.categories,
        builder: (context, state) => const CategoriesView(),
      ),
      GoRoute(
        path: AppRoutes.companies,
        builder: (context, state) => const CompaniesView(),
      ),
      GoRoute(
        path: AppRoutes.newsList,
        builder: (context, state) => const NewsListView(),
      ),
      GoRoute(
        path: AppRoutes.addNews,
        builder: (context, state) => const AddNewsView(),
      ),
      GoRoute(
        path: AppRoutes.usersList,
        builder: (context, state) => const UsersListView(),
      ),
      GoRoute(
        path: AppRoutes.addUser,
        builder: (context, state) => const AddUserView(),
      ),
      GoRoute(
        path: AppRoutes.importUsers,
        builder: (context, state) => const CsvImportView(),
      ),
      GoRoute(
        path: AppRoutes.addAdmin,
        builder: (context, state) => const AddAdminView(),
      ),
      GoRoute(
        path: AppRoutes.addProject,
        builder: (context, state) => const AddProjectView(),
      ),
      GoRoute(
        path: AppRoutes.editProject,
        redirect: (context, state) =>
            int.tryParse(state.uri.queryParameters['id'] ?? '') == null
            ? AppRoutes.projectsList
            : null,
        builder: (context, state) => AddProjectView(
          projectId: int.parse(state.uri.queryParameters['id']!),
        ),
      ),
      GoRoute(
        path: AppRoutes.projectsList,
        builder: (context, state) => const ProjectsListView(),
      ),
      GoRoute(
        path: AppRoutes.projectDetails,
        redirect: (context, state) =>
            int.tryParse(state.uri.queryParameters['id'] ?? '') == null
            ? AppRoutes.projectsList
            : null,
        builder: (context, state) => ProjectDetailsView(
          projectId: int.parse(state.uri.queryParameters['id']!),
        ),
      ),
      GoRoute(
        path: AppRoutes.addUnit,
        builder: (context, state) => const AddUnitView(),
      ),
      GoRoute(
        path: AppRoutes.settings,
        builder: (context, state) => const SettingsView(),
      ),
      GoRoute(
        path: AppRoutes.editProfile,
        builder: (context, state) => const EditProfileView(),
      ),
      GoRoute(
        path: AppRoutes.updatePassword,
        builder: (context, state) => const UpdatePasswordView(),
      ),
      GoRoute(
        path: AppRoutes.editNews,
        redirect: (context, state) =>
            int.tryParse(state.uri.queryParameters['id'] ?? '') == null
            ? AppRoutes.newsList
            : null,
        builder: (context, state) => EditNewsView(
          newsId: int.parse(state.uri.queryParameters['id']!),
          news: state.extra is News ? state.extra! as News : null,
        ),
      ),
    ],
  );
}
