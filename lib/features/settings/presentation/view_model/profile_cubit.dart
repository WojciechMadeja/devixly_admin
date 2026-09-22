import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/state/loadable.dart';
import '../../domain/entities/admin_profile.dart';
import '../../domain/repositories/profile_repository.dart';

/// Dane konta pokazywane na ekranie „Ustawienia”.
class ProfileCubit extends Cubit<Loadable<AdminProfile>> {
  ProfileCubit(this._profiles) : super(const Loadable.loading());

  final ProfileRepository _profiles;

  Future<void> load() async {
    if (state is! Loading<AdminProfile>) emit(const Loadable.loading());
    final result = await _profiles.getProfile();
    if (isClosed) return;
    emit(result.match(Loadable.error, Loadable.loaded));
  }
}
