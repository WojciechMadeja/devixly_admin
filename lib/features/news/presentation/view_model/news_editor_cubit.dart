import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/services/media_picker.dart';
import '../../../../core/state/loadable.dart';
import '../../../../core/state/submission_status.dart';
import '../../../../core/utils/date_formatters.dart';
import '../../../auth/domain/repositories/auth_repository.dart';
import '../../../categories/domain/repositories/categories_repository.dart';
import '../../domain/entities/news.dart';
import '../../domain/entities/news_draft.dart';
import '../../domain/entities/news_ratio.dart';
import '../../domain/repositories/news_repository.dart';
import 'news_editor_state.dart';

/// Formularz aktualności — wspólny dla dodawania i edycji.
class NewsEditorCubit extends Cubit<NewsEditorState> {
  NewsEditorCubit(this._news, this._categories, this._auth, this._mediaPicker)
      : super(const NewsEditorState(mode: NewsEditorMode.adding()));

  final NewsRepository _news;
  final CategoriesRepository _categories;
  final AuthRepository _auth;
  final MediaPicker _mediaPicker;

  Future<void> startAdding() => _loadCategories();

  /// [news] przekazany z listy pozwala pominąć pobieranie; bez niego (np. po
  /// odświeżeniu strony) aktualność jest szukana po [id].
  Future<void> startEditing(int id, {News? news}) async {
    if (news != null) {
      _prefill(news);
    } else {
      emit(state.copyWith(mode: const NewsEditorMode.loading()));
      final result = await _news.getNews();
      if (isClosed) return;
      final found = result
          .map((items) => items.where((item) => item.id == id).firstOrNull)
          .getOrElse((_) => null);
      if (found == null) {
        emit(state.copyWith(mode: const NewsEditorMode.notFound()));
        return;
      }
      _prefill(found);
    }
    await _loadCategories();
  }

  void setRatio(NewsRatio ratio) => emit(state.copyWith(ratio: ratio));

  void setDate(DateTime date) => emit(state.copyWith(pickedDate: date));

  /// Otwiera galerię. Zwraca `false`, gdy wybrany plik nie jest obsługiwanym
  /// obrazkiem.
  Future<bool> pickImage() async {
    final result = await _mediaPicker.pickImage();
    if (isClosed) return true;
    switch (result) {
      case ImagePicked(:final file):
        emit(state.copyWith(image: file));
      case ImagePickUnsupported():
        return false;
      case ImagePickCancelled():
        break;
    }
    return true;
  }

  void toggleCategory(int id) {
    final selected = {...state.selectedCategoryIds};
    if (!selected.remove(id)) selected.add(id);
    emit(state.copyWith(selectedCategoryIds: selected));
  }

  Future<void> submit({required String title, required String content}) async {
    if (state.submission is Submitting) return;
    if (title.trim().isEmpty) {
      _finish(const SubmissionStatus.failure(ValidationFailure()));
      return;
    }
    final mode = state.mode;
    final original = mode is EditingNews ? mode.original : null;
    final pickedDate = state.pickedDate;
    final draft = NewsDraft(
      title: title.trim(),
      content: content,
      author: original?.author ?? _auth.currentSession?.user.fullName ?? '',
      ratio: state.ratio,
      categoryIds: state.selectedCategoryIds.toList(),
      date: pickedDate != null
          ? DateFormatters.toApiDate(pickedDate)
          : original?.date ?? '',
      image: state.image,
    );
    emit(state.copyWith(submission: const SubmissionStatus.submitting()));
    final result = original == null
        ? await _news.addNews(draft)
        : await _news.editNews(original.id, draft);
    if (isClosed) return;
    result.match(
      (failure) => _finish(SubmissionStatus.failure(failure)),
      (_) {
        if (original == null) {
          // Po dodaniu formularz jest czyszczony (proporcje i data zostają).
          emit(state.copyWith(image: null, selectedCategoryIds: const {}));
        }
        _finish(const SubmissionStatus.success());
      },
    );
  }

  /// Zgłasza wynik wysyłki (dla listenera widoku) i wraca do stanu `idle`,
  /// żeby kolejna próba mogła zgłosić ten sam wynik ponownie.
  void _finish(SubmissionStatus result) {
    emit(state.copyWith(submission: result));
    emit(state.copyWith(submission: const SubmissionStatus.idle()));
  }

  void _prefill(News news) => emit(
        state.copyWith(
          mode: NewsEditorMode.editing(news),
          ratio: news.ratio,
          selectedCategoryIds: news.categoryIds.toSet(),
        ),
      );

  Future<void> _loadCategories() async {
    final result = await _categories.getCategories();
    if (isClosed) return;
    emit(
      state.copyWith(
        categories: result.match(
          Loadable.error,
          (categories) => Loadable.loaded(categories),
        ),
      ),
    );
  }
}
