import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/l10n/l10n.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../view_model/login_cubit.dart';
import '../../view_model/login_state.dart';
import 'forgot_password_link.dart';
import 'password_visibility_toggle.dart';

/// Logo, pola e-mail i hasła, link resetu hasła i przycisk logowania.
class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _passwordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    context.read<LoginCubit>().submit(
          email: _emailController.text,
          password: _passwordController.text,
        );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 600),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 30,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                AppAssets.logo,
                width: 300,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            width: 250,
            child: AppTextField(
              controller: _emailController,
              hintText: l10n.loginEmailHint,
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          SizedBox(
            width: 250,
            child: AppTextField(
              controller: _passwordController,
              hintText: l10n.loginPasswordHint,
              obscureText: !_passwordVisible,
              onFieldSubmitted: (_) => _submit(),
              suffixIcon: PasswordVisibilityToggle(
                visible: _passwordVisible,
                onToggle: () =>
                    setState(() => _passwordVisible = !_passwordVisible),
              ),
            ),
          ),
          const ForgotPasswordLink(),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: BlocSelector<LoginCubit, LoginState, bool>(
              selector: (state) => state is LoginSubmitting,
              builder: (context, isSubmitting) => AppButton.large(
                label: l10n.loginSubmit,
                width: 200,
                isLoading: isSubmitting,
                onPressed: _submit,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
