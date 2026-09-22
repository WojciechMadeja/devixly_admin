import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/di/injection.dart';
import '../../../../app/router/app_routes.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/l10n/l10n.dart';
import '../../../../core/state/submission_status.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/widgets/admin_page_scaffold.dart';
import '../../../../core/widgets/admin_shell.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/dialogs/info_dialog.dart';
import '../view_model/edit_profile_cubit.dart';
import '../view_model/edit_profile_state.dart';

/// Edycja danych osobowych zalogowanego administratora.
class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  static const pageTitle = 'EditPersonDataPage';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<EditProfileCubit>()..load(),
      child:
          const AdminPageScaffold(title: pageTitle, body: _EditProfileBody()),
    );
  }
}

class _EditProfileBody extends StatefulWidget {
  const _EditProfileBody();

  @override
  State<_EditProfileBody> createState() => _EditProfileBodyState();
}

class _EditProfileBodyState extends State<_EditProfileBody> {
  late final TextEditingController _email;
  late final TextEditingController _firstName;
  late final TextEditingController _lastName;
  late final TextEditingController _phoneNumber;

  @override
  void initState() {
    super.initState();
    // Pola wypełniamy danymi z sesji, żeby formularz był gotowy od razu.
    final user = context.read<EditProfileCubit>().state.user;
    _email = TextEditingController(text: user?.email ?? '');
    _firstName = TextEditingController(text: user?.firstName ?? '');
    _lastName = TextEditingController(text: user?.lastName ?? '');
    _phoneNumber = TextEditingController(text: user?.phoneNumber ?? '');
  }

  @override
  void dispose() {
    _email.dispose();
    _firstName.dispose();
    _lastName.dispose();
    _phoneNumber.dispose();
    super.dispose();
  }

  Future<void> _onSubmission(
    BuildContext context,
    SubmissionStatus status,
  ) async {
    final l10n = context.l10n;
    final router = GoRouter.of(context);
    switch (status) {
      case SubmissionSuccess():
        await showInfoDialog(
          context,
          title: l10n.profileSavedTitle,
          description: l10n.profileSavedDescription,
          isError: false,
        );
        router.go(AppRoutes.settings);
      case SubmissionFailure(failure: ValidationFailure()):
        await showInfoDialog(
          context,
          title: l10n.emptyFieldsTitle,
          description: l10n.formIncomplete,
          isError: true,
        );
      case SubmissionFailure():
        await showInfoDialog(
          context,
          title: l10n.errorDialogTitle,
          description: l10n.errorDialogDescription,
          isError: true,
        );
      case SubmissionIdle() || Submitting():
        break;
    }
  }

  void _submit(BuildContext context) => context.read<EditProfileCubit>().submit(
        email: _email.text,
        firstName: _firstName.text,
        lastName: _lastName.text,
        phoneNumber: _phoneNumber.text,
      );

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final sidePadding = Responsive.percentOfWidth(context, 15);
    return BlocListener<EditProfileCubit, EditProfileState>(
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
                  l10n.editProfileTitle,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.pageTitle,
                ),
              ),
              _Field(
                controller: _email,
                hint: l10n.userEmailHint,
                readOnly: true,
              ),
              _Field(controller: _firstName, hint: l10n.userFirstNameHint),
              _Field(controller: _lastName, hint: l10n.userLastNameHint),
              _Field(controller: _phoneNumber, hint: l10n.userPhoneHint),
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
                    BlocSelector<EditProfileCubit, EditProfileState, bool>(
                      selector: (state) => state.submission is Submitting,
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

class _Field extends StatelessWidget {
  const _Field({
    required this.controller,
    required this.hint,
    this.readOnly = false,
  });

  final TextEditingController controller;
  final String hint;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: AppTextField(
        controller: controller,
        hintText: hint,
        readOnly: readOnly,
      ),
    );
  }
}
