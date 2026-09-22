import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';
import '../entities/admin_profile.dart';
import '../entities/profile_drafts.dart';

abstract interface class ProfileRepository {
  /// Dane konta zalogowanego administratora.
  Future<Either<Failure, AdminProfile>> getProfile();

  /// Zapisuje dane osobowe i zwraca zaktualizowany profil.
  Future<Either<Failure, AdminProfile>> updateProfile(
    AdminProfile profile,
    ProfileUpdate update,
  );

  Future<Either<Failure, Unit>> updatePassword(PasswordChange change);
}
