import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injection.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/l10n/l10n.dart';
import '../../../../core/state/submission_status.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/widgets/admin_page_scaffold.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_snack_bar.dart';
import '../../../users/presentation/widgets/shared/user_form_fields.dart';
import '../view_model/admin_form_cubit.dart';
import '../view_model/admin_form_state.dart';

/// Dodawanie administratora panelu (te same pola co użytkownik, bez firmy).
class AddAdminView extends StatelessWidget {
  const AddAdminView({super.key});

  static const pageTitle = 'AddAdminPage';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AdminFormCubit>(),
      child: const AdminPageScaffold(title: pageTitle, body: _AddAdminBody()),
    );
  }
}

class _AddAdminBody extends StatefulWidget {
  const _AddAdminBody();

  @override
  State<_AddAdminBody> createState() => _AddAdminBodyState();
}

class _AddAdminBodyState extends State<_AddAdminBody> {
  final _fields = UserFieldControllers();

  @override
  void dispose() {
    _fields.dispose();
    super.dispose();
  }

  void _onSubmission(BuildContext context, SubmissionStatus status) {
    final messenger = ScaffoldMessenger.of(context);
    final l10n = context.l10n;
    switch (status) {
      case SubmissionSuccess():
        _fields.clear();
        AppSnackBar.success(messenger, l10n.userSaved);
      case SubmissionFailure(failure: ValidationFailure()):
        AppSnackBar.error(messenger, l10n.formIncomplete);
      case SubmissionFailure(failure: WeakPasswordFailure()):
        AppSnackBar.error(messenger, l10n.passwordTooShortDescription);
      case SubmissionFailure(:final failure):
        // Backend potrafi powiedzieć, co konkretnie jest nie tak
        // (np. zajęty adres e-mail) — pokazujemy to zamiast ogólnika.
        AppSnackBar.show(
          messenger,
          message: failure.message ?? l10n.userSaveFailed,
          backgroundColor: AppColors.accent3,
          textStyle: AppSnackBar.emphasizedText,
        );
      case SubmissionIdle() || Submitting():
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final sidePadding = Responsive.percentOfWidth(context, 15);
    return BlocListener<AdminFormCubit, AdminFormState>(
      listenWhen: (a, b) => a.submission != b.submission,
      listener: (context, state) => _onSubmission(context, state.submission),
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
                  l10n.addAdminTitle,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.pageTitle,
                ),
              ),
              UserFormFields(controllers: _fields),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: BlocSelector<AdminFormCubit, AdminFormState, bool>(
                  selector: (state) => state.submission is Submitting,
                  builder: (context, isSubmitting) => AppButton.large(
                    label: l10n.commonSave,
                    width: 200,
                    isLoading: isSubmitting,
                    onPressed: () => context.read<AdminFormCubit>().submit(
                      email: _fields.email.text,
                      firstName: _fields.firstName.text,
                      lastName: _fields.lastName.text,
                      phoneNumber: _fields.phoneNumber.text,
                      password: _fields.password.text,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
