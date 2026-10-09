import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/l10n/l10n.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../../../core/widgets/dialogs/dialog_card.dart';
import '../../view_model/reset_password_cubit.dart';
import '../../view_model/reset_password_state.dart';

/// Drugi krok zapomnianego hasła: kod z e-maila i nowe hasło (dwa razy).
class ResetPasswordCodeCard extends StatefulWidget {
  const ResetPasswordCodeCard({super.key});

  @override
  State<ResetPasswordCodeCard> createState() => _ResetPasswordCodeCardState();
}

class _ResetPasswordCodeCardState extends State<ResetPasswordCodeCard> {
  final _codeController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatController = TextEditingController();

  @override
  void dispose() {
    _codeController.dispose();
    _passwordController.dispose();
    _repeatController.dispose();
    super.dispose();
  }

  void _submit() => context.read<ResetPasswordCubit>().finish(
    code: _codeController.text,
    newPassword: _passwordController.text,
    repeatedPassword: _repeatController.text,
  );

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return DialogCard(
      children: [
        Text(
          l10n.resetPasswordCodeTitle,
          textAlign: TextAlign.center,
          style: AppTextStyles.dialogTitle,
        ),
        SizedBox(
          width: 250,
          child: AppTextField(
            controller: _codeController,
            hintText: l10n.resetPasswordCodeHint,
            textInputAction: TextInputAction.next,
          ),
        ),
        SizedBox(
          width: 250,
          child: AppTextField(
            controller: _passwordController,
            hintText: l10n.passwordNewHint,
            obscureText: true,
            textInputAction: TextInputAction.next,
          ),
        ),
        SizedBox(
          width: 250,
          child: AppTextField(
            controller: _repeatController,
            hintText: l10n.passwordRepeatHint,
            obscureText: true,
            onFieldSubmitted: (_) => _submit(),
          ),
        ),
        DialogActions(
          children: [
            AppButton(
              label: l10n.commonCancel,
              onPressed: () => Navigator.pop(context),
            ),
            BlocSelector<ResetPasswordCubit, ResetPasswordState, bool>(
              selector: (state) =>
                  state is ResetPasswordAwaitingCode && state.submitting,
              builder: (context, isSubmitting) => AppButton(
                label: l10n.commonSave,
                color: AppColors.accent1,
                isLoading: isSubmitting,
                onPressed: _submit,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
