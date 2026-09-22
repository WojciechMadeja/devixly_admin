import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../core/l10n/l10n.dart';
import '../core/theme/app_theme.dart';
import '../core/widgets/admin_shell.dart';
import '../features/auth/presentation/view_model/session_cubit.dart';
import 'router/app_router.dart';
import 'router/app_routes.dart';
import 'widgets/splash_gate.dart';

class App extends StatefulWidget {
  const App({super.key, required this.session});

  final SessionCubit session;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final GoRouter _router = createAppRouter(widget.session);

  @override
  void dispose() {
    _router.dispose();
    super.dispose();
  }

  void _back() {
    if (_router.canPop()) {
      _router.pop();
    } else {
      _router.go(AppRoutes.root);
    }
  }

  Future<void> _logout() async {
    _router.go(AppRoutes.login);
    await widget.session.logout();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.session,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Devixly Admin',
        theme: AppTheme.light,
        scrollBehavior: const AppScrollBehavior(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('pl'),
        routerConfig: _router,
        builder: (context, child) => AdminShell(
          onBack: _back,
          onHome: () => _router.go(AppRoutes.home),
          onLogout: _logout,
          child: SplashGate(child: child!),
        ),
      ),
    );
  }
}
