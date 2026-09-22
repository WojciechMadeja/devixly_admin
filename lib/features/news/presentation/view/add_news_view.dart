import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injection.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/l10n/l10n.dart';
import '../../../../core/state/submission_status.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/widgets/admin_page_scaffold.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_snack_bar.dart';
import '../view_model/news_editor_cubit.dart';
import '../view_model/news_editor_state.dart';
import '../widgets/shared/news_form.dart';

/// Dodawanie aktualności.
class AddNewsView extends StatelessWidget {
  const AddNewsView({super.key});

  static const pageTitle = 'AddNewsPage';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<NewsEditorCubit>()..startAdding(),
      child: const AdminPageScaffold(title: pageTitle, body: _AddNewsBody()),
    );
  }
}

class _AddNewsBody extends StatefulWidget {
  const _AddNewsBody();

  @override
  State<_AddNewsBody> createState() => _AddNewsBodyState();
}

class _AddNewsBodyState extends State<_AddNewsBody> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _onSubmission(BuildContext context, SubmissionStatus status) {
    final messenger = ScaffoldMessenger.of(context);
    final l10n = context.l10n;
    switch (status) {
      case SubmissionSuccess():
        _titleController.clear();
        _contentController.clear();
        AppSnackBar.show(
          messenger,
          message: l10n.newsAdded,
          backgroundColor: AppColors.accent2,
        );
      case SubmissionFailure(failure: ValidationFailure()):
        AppSnackBar.error(messenger, l10n.newsTitleRequired);
      case SubmissionFailure():
        AppSnackBar.show(
          messenger,
          message: l10n.newsAddFailed,
          backgroundColor: AppColors.accent3,
        );
      case SubmissionIdle() || Submitting():
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final sidePadding = Responsive.percentOfWidth(context, 15);
    return BlocListener<NewsEditorCubit, NewsEditorState>(
      listenWhen: (a, b) => a.submission != b.submission,
      listener: (context, state) => _onSubmission(context, state.submission),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: sidePadding),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: NewsForm(
            title: context.l10n.newsAddTitle,
            titleController: _titleController,
            contentController: _contentController,
            imageEmptyBackground: AppColors.secondaryBackground,
            actions: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: BlocSelector<NewsEditorCubit, NewsEditorState, bool>(
                selector: (state) => state.submission is Submitting,
                builder: (context, isSubmitting) => AppButton.large(
                  label: context.l10n.newsAddSubmit,
                  width: 200,
                  isLoading: isSubmitting,
                  onPressed: () => context.read<NewsEditorCubit>().submit(
                        title: _titleController.text,
                        content: _contentController.text,
                      ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
