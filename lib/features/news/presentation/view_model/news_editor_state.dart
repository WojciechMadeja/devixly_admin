import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/services/media_picker.dart';
import '../../../../core/state/loadable.dart';
import '../../../../core/state/submission_status.dart';
import '../../../categories/domain/entities/category.dart';
import '../../domain/entities/news.dart';
import '../../domain/entities/news_ratio.dart';

part 'news_editor_state.freezed.dart';

/// Czy formularz dodaje nową aktualność, czy edytuje istniejącą.
@freezed
sealed class NewsEditorMode with _$NewsEditorMode {
  const factory NewsEditorMode.adding() = AddingNews;

  /// Edytowana aktualność jest dopiero pobierana (wejście z adresu URL).
  const factory NewsEditorMode.loading() = LoadingNews;

  const factory NewsEditorMode.editing(News original) = EditingNews;

  const factory NewsEditorMode.notFound() = NewsNotFound;
}

@freezed
abstract class NewsEditorState with _$NewsEditorState {
  const factory NewsEditorState({
    required NewsEditorMode mode,
    @Default(Loadable<List<Category>>.loading())
    Loadable<List<Category>> categories,
    @Default(NewsRatio.horizontal) NewsRatio ratio,
    @Default(<int>{}) Set<int> selectedCategoryIds,

    /// Data wybrana w kalendarzu (przy edycji `null` = bez zmiany).
    DateTime? pickedDate,

    /// Nowo wybrany obrazek (przy edycji `null` = bez zmiany).
    PickedFile? image,
    @Default(SubmissionStatus.idle()) SubmissionStatus submission,
  }) = _NewsEditorState;
}
