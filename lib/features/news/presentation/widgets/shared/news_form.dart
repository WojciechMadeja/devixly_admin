import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/l10n/l10n.dart';
import '../../../../../core/state/loadable.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/date_formatters.dart';
import '../../../../../core/widgets/app_date_picker.dart';
import '../../../../../core/widgets/app_snack_bar.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../domain/entities/news_ratio.dart';
import '../../view_model/news_editor_cubit.dart';
import '../../view_model/news_editor_state.dart';
import 'category_chips.dart';
import 'news_date_row.dart';
import 'news_image_area.dart';
import 'ratio_toggle.dart';

/// Pola formularza aktualności — wspólne dla dodawania i edycji.
class NewsForm extends StatelessWidget {
  const NewsForm({
    super.key,
    required this.title,
    required this.titleController,
    required this.contentController,
    required this.imageEmptyBackground,
    required this.actions,
  });

  final String title;
  final TextEditingController titleController;
  final TextEditingController contentController;
  final Color imageEmptyBackground;

  /// Przyciski pod formularzem.
  final Widget actions;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final cubit = context.read<NewsEditorCubit>();
    return Column(
      spacing: 25,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.pageTitle,
          ),
        ),
        BlocBuilder<NewsEditorCubit, NewsEditorState>(
          buildWhen: (a, b) =>
              a.ratio != b.ratio || a.image != b.image || a.mode != b.mode,
          builder: (context, state) => NewsImageArea(
            ratio: state.ratio,
            pickedImage: state.image,
            currentImageUrl: switch (state.mode) {
              EditingNews(:final original) => original.imageUrl,
              _ => '',
            },
            emptyBackground: imageEmptyBackground,
            onTap: () => _pickImage(context),
          ),
        ),
        BlocSelector<NewsEditorCubit, NewsEditorState, NewsRatio>(
          selector: (state) => state.ratio,
          builder: (context, ratio) =>
              RatioToggle(ratio: ratio, onChanged: cubit.setRatio),
        ),
        SizedBox(
          width: 320,
          child: AppTextField(
            controller: titleController,
            hintText: l10n.newsTitleHint,
            maxLines: 2,
            minLines: 1,
          ),
        ),
        BlocBuilder<NewsEditorCubit, NewsEditorState>(
          buildWhen: (a, b) => a.pickedDate != b.pickedDate || a.mode != b.mode,
          builder: (context, state) => NewsDateRow(
            label: _dateLabel(context, state),
            onPick: () => _pickDate(context),
          ),
        ),
        SizedBox(
          width: 320,
          child: AppTextField(
            controller: contentController,
            hintText: l10n.newsContentHint,
            maxLines: null,
            minLines: 10,
          ),
        ),
        BlocBuilder<NewsEditorCubit, NewsEditorState>(
          buildWhen: (a, b) =>
              a.categories != b.categories ||
              a.selectedCategoryIds != b.selectedCategoryIds,
          builder: (context, state) => switch (state.categories) {
            Loading() => const CategoryChipsSkeleton(),
            Loaded(:final value) => CategoryChips(
              categories: value,
              selectedIds: state.selectedCategoryIds,
              onToggle: cubit.toggleCategory,
            ),
            LoadError() => const SizedBox.shrink(),
          },
        ),
        actions,
      ],
    );
  }

  String _dateLabel(BuildContext context, NewsEditorState state) {
    final picked = state.pickedDate;
    if (picked != null) return DateFormatters.toPickerLabel(picked);
    final mode = state.mode;
    if (mode is EditingNews && mode.original.date.isNotEmpty) {
      return DateFormatters.fromApiDate(mode.original.date);
    }
    return context.l10n.newsPickDate;
  }

  Future<void> _pickImage(BuildContext context) async {
    final messenger = ScaffoldMessenger.of(context);
    final message = context.l10n.newsUnsupportedImage;
    final supported = await context.read<NewsEditorCubit>().pickImage();
    if (!supported) AppSnackBar.error(messenger, message);
  }

  Future<void> _pickDate(BuildContext context) async {
    final cubit = context.read<NewsEditorCubit>();
    final date = await showAppDatePicker(context, initialDate: DateTime.now());
    // Anulowanie kalendarza zostawia dotychczasową datę.
    if (date != null) cubit.setDate(date);
  }
}
