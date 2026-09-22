import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/view/login_view.dart';
import '../../features/auth/presentation/view_model/session_cubit.dart';
import '../../features/auth/presentation/view_model/session_state.dart';
import '../../features/home/presentation/view/home_view.dart';
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
    ],
  );
}
