import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/di/injection.dart';
import '../../../../../core/l10n/l10n.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../../../core/widgets/dialogs/dialog_card.dart';
import '../../../../../core/widgets/dialogs/info_dialog.dart';
import '../../view_model/reset_password_cubit.dart';
import '../../view_model/reset_password_state.dart';

enum ResetPasswordResult { sent, failed }

/// Dialog wysłania e-maila resetującego hasło. Zamyka się z wynikiem
/// wysyłki; zły format e-maila zgłasza bez zamykania.
class ResetPasswordDialog extends StatelessWidget {
  const ResetPasswordDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ResetPasswordCubit>(),
      child: BlocListener<ResetPasswordCubit, ResetPasswordState>(
        listener: (context, state) {
          final l10n = context.l10n;
          switch (state) {
            case ResetPasswordInvalidEmail():
              showInfoDialog(
                context,
                title: l10n.invalidEmailTitle,
                description: l10n.invalidEmailDescription,
                isError: true,
              );
            case ResetPasswordSent():
              Navigator.pop(context, ResetPasswordResult.sent);
            case ResetPasswordFailed():
              Navigator.pop(context, ResetPasswordResult.failed);
            case ResetPasswordInitial() || ResetPasswordSubmitting():
              break;
          }
        },
        child: const _ResetPasswordCard(),
      ),
    );
  }
}

class _ResetPasswordCard extends StatefulWidget {
  const _ResetPasswordCard();

  @override
  State<_ResetPasswordCard> createState() => _ResetPasswordCardState();
}

class _ResetPasswordCardState extends State<_ResetPasswordCard> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return DialogCard(
      children: [
        Text(
          l10n.resetPasswordTitle,
          textAlign: TextAlign.center,
          style: AppTextStyles.dialogTitle,
        ),
        SizedBox(
          width: 250,
          child: AppTextField(
            controller: _emailController,
            hintText: l10n.loginEmailHint,
            keyboardType: TextInputType.emailAddress,
          ),
        ),
        DialogActions(
          children: [
            AppButton(
              label: l10n.commonCancel,
              onPressed: () => Navigator.pop(context),
            ),
            BlocSelector<ResetPasswordCubit, ResetPasswordState, bool>(
              selector: (state) => state is ResetPasswordSubmitting,
              builder: (context, isSubmitting) => AppButton(
                label: l10n.resetPasswordSubmit,
                color: AppColors.accent1,
                isLoading: isSubmitting,
                onPressed: () => context
                    .read<ResetPasswordCubit>()
                    .submit(_emailController.text),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
