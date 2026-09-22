import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/di/injection.dart';
import '../../../../app/router/app_routes.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/l10n/l10n.dart';
import '../../../../core/state/loadable.dart';
import '../../../../core/state/submission_status.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/widgets/admin_page_scaffold.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_snack_bar.dart';
import '../../../companies/presentation/widgets/shared/company_picker_field.dart';
import '../view_model/user_form_cubit.dart';
import '../view_model/user_form_state.dart';
import '../widgets/shared/user_form_fields.dart';

/// Dodawanie użytkownika przypisanego do firmy.
class AddUserView extends StatelessWidget {
  const AddUserView({super.key});

  static const pageTitle = 'AddUserPage';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<UserFormCubit>()..loadCompanies(),
      child: const AdminPageScaffold(title: pageTitle, body: _AddUserBody()),
    );
  }
}

class _AddUserBody extends StatefulWidget {
  const _AddUserBody();

  @override
  State<_AddUserBody> createState() => _AddUserBodyState();
}

class _AddUserBodyState extends State<_AddUserBody> {
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
      case SubmissionFailure():
        AppSnackBar.show(
          messenger,
          message: l10n.userSaveFailed,
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
    return BlocListener<UserFormCubit, UserFormState>(
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
                  l10n.addUserTitle,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.pageTitle,
                ),
              ),
              UserFormFields(
                controllers: _fields,
                trailing: BlocBuilder<UserFormCubit, UserFormState>(
                  buildWhen: (a, b) =>
                      a.companies != b.companies ||
                      a.selectedCompany != b.selectedCompany,
                  builder: (context, state) => CompanyPickerField(
                    companies: switch (state.companies) {
                      Loaded(:final value) => value,
                      _ => const [],
                    },
                    selected: state.selectedCompany,
                    onSelected: context.read<UserFormCubit>().selectCompany,
                    onAddCompany: () => context.push(AppRoutes.companies),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: BlocSelector<UserFormCubit, UserFormState, bool>(
                  selector: (state) => state.submission is Submitting,
                  builder: (context, isSubmitting) => AppButton.large(
                    label: l10n.commonSave,
                    width: 200,
                    isLoading: isSubmitting,
                    onPressed: () => context.read<UserFormCubit>().submit(
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
