import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/di/injection.dart';
import '../../../../app/router/app_routes.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/l10n/l10n.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/dialogs/info_dialog.dart';
import '../view_model/login_cubit.dart';
import '../view_model/login_state.dart';
import '../widgets/login_view/login_form.dart';

/// Ekran logowania administratora.
class LoginView extends StatelessWidget {
  const LoginView({super.key, this.redirectTo});

  /// Adres, na który wracamy po zalogowaniu (np. po wygaśnięciu sesji).
  final String? redirectTo;

  static const pageTitle = 'LoginPage';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LoginCubit>(),
      child: BlocListener<LoginCubit, LoginState>(
        listener: _onStateChanged,
        child: Title(
          title: pageTitle,
          color: AppColors.primary,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: const Scaffold(
              backgroundColor: AppColors.primaryBackground,
              body: SafeArea(child: Center(child: LoginForm())),
            ),
          ),
        ),
      ),
    );
  }

  void _onStateChanged(BuildContext context, LoginState state) {
    final l10n = context.l10n;
    switch (state) {
      case LoginSuccess():
        context.go(redirectTo ?? AppRoutes.home);
      case LoginEmptyFields():
        showInfoDialog(
          context,
          title: l10n.loginEmptyFieldsTitle,
          description: l10n.loginEmptyFieldsDescription,
          isError: true,
        );
      case LoginInvalidEmail():
        showInfoDialog(
          context,
          title: l10n.invalidEmailTitle,
          description: l10n.invalidEmailDescription,
          isError: true,
        );
      case LoginFailure(:final failure):
        final (title, description) = switch (failure) {
          InvalidCredentialsFailure() => (
            l10n.loginInvalidCredentialsTitle,
            l10n.loginInvalidCredentialsDescription,
          ),
          NotAnAdministratorFailure() => (
            l10n.loginNotAdminTitle,
            l10n.loginNotAdminDescription,
          ),
          AccountBlockedFailure() => (
            l10n.loginBlockedTitle,
            l10n.loginBlockedDescription,
          ),
          NetworkFailure() => (
            l10n.loginNoConnectionTitle,
            l10n.loginNoConnectionDescription,
          ),
          _ => (l10n.errorGeneric, l10n.errorGeneric),
        };
        showInfoDialog(
          context,
          title: title,
          description: description,
          isError: true,
        );
      case LoginInitial() || LoginSubmitting():
        break;
    }
  }
}
