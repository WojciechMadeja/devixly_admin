import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/state/loadable.dart';
import '../../../../core/state/submission_status.dart';
import '../../../auth/domain/repositories/auth_repository.dart';
import '../../domain/entities/admin_profile.dart';
import '../../domain/entities/profile_drafts.dart';
import '../../domain/repositories/profile_repository.dart';
import 'edit_profile_state.dart';

/// Zapis danych osobowych administratora.
class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(this._profiles, AuthRepository auth)
      : super(EditProfileState(user: auth.currentSession?.user));

  final ProfileRepository _profiles;

  AdminProfile? get _profile => switch (state.profile) {
        Loaded(:final value) => value,
        _ => null,
      };

  Future<void> load() async {
    final result = await _profiles.getProfile();
    if (isClosed) return;
    emit(
      state.copyWith(profile: result.match(Loadable.error, Loadable.loaded)),
    );
  }

  Future<void> submit({
    required String email,
    required String firstName,
    required String lastName,
    required String phoneNumber,
  }) async {
    if (state.submission is Submitting) return;
    if (email.trim().isEmpty ||
        firstName.trim().isEmpty ||
        lastName.trim().isEmpty ||
        phoneNumber.trim().isEmpty) {
      _finish(const SubmissionStatus.failure(ValidationFailure()));
      return;
    }
    // Bez danych konta nie znamy firmy administratora, a zapis bez niej
    // przepisałby go do innej firmy.
    final profile = _profile;
    if (profile == null) {
      _finish(const SubmissionStatus.failure(ServerFailure()));
      return;
    }
    emit(state.copyWith(submission: const SubmissionStatus.submitting()));
    final result = await _profiles.updateProfile(
      profile,
      ProfileUpdate(
        firstName: firstName.trim(),
        lastName: lastName.trim(),
        phoneNumber: phoneNumber.trim(),
      ),
    );
    if (isClosed) return;
    result.match(
      (failure) => _finish(SubmissionStatus.failure(failure)),
      (saved) {
        emit(
          state.copyWith(
            profile: Loadable.loaded(saved),
            submission: const SubmissionStatus.success(),
          ),
        );
        emit(state.copyWith(submission: const SubmissionStatus.idle()));
      },
    );
  }

  /// Zgłasza wynik zapisu i wraca do stanu `idle`, żeby ten sam komunikat
  /// mógł pojawić się przy kolejnej próbie.
  void _finish(SubmissionStatus result) {
    emit(state.copyWith(submission: result));
    emit(state.copyWith(submission: const SubmissionStatus.idle()));
  }
}
