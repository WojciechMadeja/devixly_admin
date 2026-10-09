import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injection.dart';
import '../../../../core/l10n/l10n.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/widgets/admin_page_scaffold.dart';
import '../../../../core/widgets/admin_shell.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/dialogs/info_dialog.dart';
import '../view_model/update_password_cubit.dart';
import '../view_model/update_password_state.dart';
import '../widgets/update_password_view/password_field.dart';

/// Zmiana hasła konta administratora.
class UpdatePasswordView extends StatelessWidget {
  const UpdatePasswordView({super.key});

  static const pageTitle = 'UpdatePasswordPage';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<UpdatePasswordCubit>(),
      child: const AdminPageScaffold(
        title: pageTitle,
        body: _UpdatePasswordBody(),
      ),
    );
  }
}

class _UpdatePasswordBody extends StatefulWidget {
  const _UpdatePasswordBody();

  @override
  State<_UpdatePasswordBody> createState() => _UpdatePasswordBodyState();
}

class _UpdatePasswordBodyState extends State<_UpdatePasswordBody> {
  final _oldPassword = TextEditingController();
  final _newPassword = TextEditingController();
  final _repeatedPassword = TextEditingController();

  @override
  void dispose() {
    _oldPassword.dispose();
    _newPassword.dispose();
    _repeatedPassword.dispose();
    super.dispose();
  }

  Future<void> _onStateChanged(
    BuildContext context,
    UpdatePasswordState state,
  ) async {
    final l10n = context.l10n;
    switch (state) {
      case UpdatePasswordSuccess():
        await showInfoDialog(
          context,
          title: l10n.profileSavedTitle,
          description: l10n.passwordUpdatedDescription,
          isError: false,
        );
      case UpdatePasswordEmptyFields():
        await showInfoDialog(
          context,
          title: l10n.emptyFieldsTitle,
          description: l10n.formIncomplete,
          isError: true,
        );
      case UpdatePasswordWeakPassword():
        await showInfoDialog(
          context,
          title: l10n.passwordTooShortTitle,
          description: l10n.passwordTooShortDescription,
          isError: true,
        );
      case UpdatePasswordMismatch():
        await showInfoDialog(
          context,
          title: l10n.passwordMismatchTitle,
          description: l10n.passwordMismatchDescription,
          isError: true,
        );
      case UpdatePasswordFailure():
        await showInfoDialog(
          context,
          title: l10n.errorDialogTitle,
          description: l10n.errorDialogDescription,
          isError: true,
        );
      case UpdatePasswordInitial() || UpdatePasswordSubmitting():
        break;
    }
  }

  void _submit(BuildContext context) =>
      context.read<UpdatePasswordCubit>().submit(
        oldPassword: _oldPassword.text,
        newPassword: _newPassword.text,
        repeatedPassword: _repeatedPassword.text,
      );

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final sidePadding = Responsive.percentOfWidth(context, 15);
    return BlocListener<UpdatePasswordCubit, UpdatePasswordState>(
      listener: _onStateChanged,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: sidePadding),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            spacing: 20,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  l10n.updatePasswordTitle,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.pageTitle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: PasswordField(
                  controller: _oldPassword,
                  hint: l10n.passwordCurrentHint,
                ),
              ),
              PasswordField(
                controller: _newPassword,
                hint: l10n.passwordNewHint,
              ),
              PasswordField(
                controller: _repeatedPassword,
                hint: l10n.passwordRepeatHint,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 20,
                  children: [
                    AppButton.large(
                      label: l10n.commonBack,
                      width: 150,
                      onPressed: AdminShell.of(context).onBack,
                    ),
                    BlocSelector<
                      UpdatePasswordCubit,
                      UpdatePasswordState,
                      bool
                    >(
                      selector: (state) => state is UpdatePasswordSubmitting,
                      builder: (context, isSubmitting) => AppButton.large(
                        label: l10n.commonSave,
                        width: 150,
                        color: AppColors.accent2,
                        isLoading: isSubmitting,
                        onPressed: () => _submit(context),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
