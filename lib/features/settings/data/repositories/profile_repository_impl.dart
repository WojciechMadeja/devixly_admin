import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/errors/guard.dart';
import '../../../auth/domain/repositories/auth_repository.dart';
import '../../domain/entities/admin_profile.dart';
import '../../domain/entities/profile_drafts.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_remote_data_source.dart';
import '../models/admin_profile_mapper.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl(this._remote, this._auth);

  final ProfileRemoteDataSource _remote;
  final AuthRepository _auth;

  @override
  Future<Either<Failure, AdminProfile>> getProfile() =>
      guard(() async => (await _remote.getProfile()).toProfile());

  @override
  Future<Either<Failure, AdminProfile>> updateProfile(
    AdminProfile profile,
    ProfileUpdate update,
  ) => guard(() async {
    final saved = (await _remote.updateProfile(profile, update)).toProfile();
    await _syncSession(saved);
    return saved;
  });

  @override
  Future<Either<Failure, Unit>> updatePassword(PasswordChange change) =>
      guard(() async {
        await _remote.updatePassword(change);
        return unit;
      });

  /// Po zapisie danych sesja musi znać nowe imię, nazwisko i telefon —
  /// inaczej nagłówek i formularze pokazywałyby stare wartości aż do
  /// ponownego zalogowania.
  Future<void> _syncSession(AdminProfile profile) async {
    final user = _auth.currentSession?.user;
    if (user == null || user.id != profile.id) return;
    await _auth.updateCurrentUser(
      user.copyWith(
        firstName: profile.firstName,
        lastName: profile.lastName,
        phoneNumber: profile.phoneNumber,
      ),
    );
  }
}
