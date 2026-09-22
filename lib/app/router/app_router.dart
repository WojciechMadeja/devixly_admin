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
import '../../features/news/presentation/view/news_list_view.dart';
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
