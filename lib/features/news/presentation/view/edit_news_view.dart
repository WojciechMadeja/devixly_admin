import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/di/injection.dart';
import '../../../../app/router/app_routes.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/l10n/l10n.dart';
import '../../../../core/state/submission_status.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/widgets/admin_page_scaffold.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_snack_bar.dart';
import '../../domain/entities/news.dart';
import '../view_model/news_editor_cubit.dart';
import '../view_model/news_editor_state.dart';
import '../widgets/shared/news_form.dart';

/// Edycja aktualności. [news] przychodzi z listy; bez niego (np. po
/// odświeżeniu strony) aktualność jest pobierana po [newsId].
class EditNewsView extends StatelessWidget {
  const EditNewsView({super.key, required this.newsId, this.news});

  final int newsId;
  final News? news;

  static const pageTitle = 'EditNewsPage';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<NewsEditorCubit>()..startEditing(newsId, news: news),
      child: AdminPageScaffold(
        title: pageTitle,
        body: BlocConsumer<NewsEditorCubit, NewsEditorState>(
          listenWhen: (a, b) => a.mode != b.mode,
          listener: (context, state) {
            if (state.mode is NewsNotFound) context.go(AppRoutes.newsList);
          },
          buildWhen: (a, b) => a.mode.runtimeType != b.mode.runtimeType,
          builder: (context, state) => switch (state.mode) {
            EditingNews(:final original) => _EditNewsBody(original: original),
            _ => const Center(child: CircularProgressIndicator()),
          },
        ),
      ),
    );
  }
}

class _EditNewsBody extends StatefulWidget {
  const _EditNewsBody({required this.original});

  final News original;

  @override
  State<_EditNewsBody> createState() => _EditNewsBodyState();
}

class _EditNewsBodyState extends State<_EditNewsBody> {
  late final _titleController = TextEditingController(
    text: widget.original.title,
  );
  late final _contentController = TextEditingController(
    text: widget.original.content,
  );

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _onSubmission(BuildContext context, SubmissionStatus status) {
    final messenger = ScaffoldMessenger.of(context);
    final router = GoRouter.of(context);
    final l10n = context.l10n;
    switch (status) {
      case SubmissionSuccess():
        AppSnackBar.show(
          messenger,
          message: l10n.newsEdited,
          backgroundColor: AppColors.accent2,
        );
        router.go(AppRoutes.newsList);
      case SubmissionFailure(failure: ValidationFailure()):
        AppSnackBar.error(messenger, l10n.newsTitleRequired);
      case SubmissionFailure():
        AppSnackBar.show(
          messenger,
          message: l10n.newsEditFailed,
          backgroundColor: AppColors.accent3,
        );
      case SubmissionIdle() || Submitting():
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final sidePadding = Responsive.percentOfWidth(context, 15);
    return BlocListener<NewsEditorCubit, NewsEditorState>(
      listenWhen: (a, b) => a.submission != b.submission,
      listener: (context, state) => _onSubmission(context, state.submission),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: sidePadding),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: NewsForm(
            title: l10n.newsEditTitle,
            titleController: _titleController,
            contentController: _contentController,
            imageEmptyBackground: Colors.transparent,
            // Na wąskim ekranie przyciski zawijają się pod siebie.
            actions: Wrap(
              alignment: WrapAlignment.center,
              spacing: 40,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: AppButton.large(
                    label: l10n.commonCancel,
                    width: 140,
                    onPressed: () => context.go(AppRoutes.newsList),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: BlocSelector<NewsEditorCubit, NewsEditorState, bool>(
                    selector: (state) => state.submission is Submitting,
                    builder: (context, isSubmitting) => AppButton.large(
                      label: l10n.newsEditSubmit,
                      width: 140,
                      color: AppColors.accent1,
                      isLoading: isSubmitting,
                      onPressed: () => context.read<NewsEditorCubit>().submit(
                        title: _titleController.text,
                        content: _contentController.text,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
