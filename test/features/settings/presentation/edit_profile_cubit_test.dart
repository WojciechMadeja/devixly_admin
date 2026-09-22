import 'package:bloc_test/bloc_test.dart';
import 'package:devixly_admin/core/errors/failures.dart';
import 'package:devixly_admin/core/state/loadable.dart';
import 'package:devixly_admin/core/state/submission_status.dart';
import 'package:devixly_admin/features/auth/domain/entities/admin_user.dart';
import 'package:devixly_admin/features/auth/domain/entities/auth_session.dart';
import 'package:devixly_admin/features/auth/domain/repositories/auth_repository.dart';
import 'package:devixly_admin/features/settings/domain/entities/admin_profile.dart';
import 'package:devixly_admin/features/settings/domain/entities/profile_drafts.dart';
import 'package:devixly_admin/features/settings/domain/repositories/profile_repository.dart';
import 'package:devixly_admin/features/settings/presentation/view_model/edit_profile_cubit.dart';
import 'package:devixly_admin/features/settings/presentation/view_model/edit_profile_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class _MockRepository extends Mock implements ProfileRepository {}

class _MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  const profile = AdminProfile(
    id: 1,
    email: 'admin@devixly.com',
    firstName: 'Jan',
    lastName: 'Kowalski',
    phoneNumber: '+48 600 100 200',
    companyId: 4,
    companyName: 'Devixly Sp. z o.o.',
  );
  const update = ProfileUpdate(
    firstName: 'Janusz',
    lastName: 'Kowalik',
    phoneNumber: '+48 600 100 300',
  );
  final saved = profile.copyWith(
    firstName: update.firstName,
    lastName: update.lastName,
    phoneNumber: update.phoneNumber,
  );

  const account = AdminUser(
    id: 1,
    email: 'admin@devixly.com',
    firstName: 'Jan',
    lastName: 'Kowalski',
    phoneNumber: '+48 600 100 200',
    company: 'Crowd Empire',
  );

  late _MockRepository repository;
  late _MockAuthRepository auth;

  setUpAll(() {
    registerFallbackValue(profile);
    registerFallbackValue(update);
  });
  setUp(() {
    repository = _MockRepository();
    auth = _MockAuthRepository();
    when(() => auth.currentSession).thenReturn(
      const AuthSession(
        accessToken: 'auth-token-1',
        refreshToken: 'refresh-token-1',
        refreshTokenId: 7,
        user: account,
      ),
    );
  });

  Future<void> submit(EditProfileCubit cubit) => cubit.submit(
        email: profile.email,
        firstName: update.firstName,
        lastName: update.lastName,
        phoneNumber: update.phoneNumber,
      );

  EditProfileCubit loadedCubit() => EditProfileCubit(repository, auth)
    ..emit(
      const EditProfileState(user: account, profile: Loadable.loaded(profile)),
    );

  blocTest<EditProfileCubit, EditProfileState>(
    'load pobiera dane konta',
    build: () => EditProfileCubit(repository, auth),
    setUp: () => when(repository.getProfile)
        .thenAnswer((_) async => const Right(profile)),
    act: (cubit) => cubit.load(),
    expect: () => const [
      EditProfileState(user: account, profile: Loadable.loaded(profile)),
    ],
  );

  blocTest<EditProfileCubit, EditProfileState>(
    'zapis wysyła zmienione dane i zapamiętuje zwrócony profil',
    build: loadedCubit,
    setUp: () => when(() => repository.updateProfile(any(), any()))
        .thenAnswer((_) async => Right(saved)),
    act: submit,
    expect: () => [
      const EditProfileState(
        user: account,
        profile: Loadable.loaded(profile),
        submission: SubmissionStatus.submitting(),
      ),
      EditProfileState(
        user: account,
        profile: Loadable.loaded(saved),
        submission: const SubmissionStatus.success(),
      ),
      EditProfileState(user: account, profile: Loadable.loaded(saved)),
    ],
    verify: (_) =>
        verify(() => repository.updateProfile(profile, update)).called(1),
  );

  blocTest<EditProfileCubit, EditProfileState>(
    'puste pole przerywa zapis',
    build: loadedCubit,
    act: (cubit) => cubit.submit(
      email: profile.email,
      firstName: '',
      lastName: update.lastName,
      phoneNumber: update.phoneNumber,
    ),
    expect: () => const [
      EditProfileState(
        user: account,
        profile: Loadable.loaded(profile),
        submission: SubmissionStatus.failure(ValidationFailure()),
      ),
      EditProfileState(user: account, profile: Loadable.loaded(profile)),
    ],
    verify: (_) => verifyNever(() => repository.updateProfile(any(), any())),
  );

  blocTest<EditProfileCubit, EditProfileState>(
    'bez pobranych danych konta nie zapisujemy — nie znamy firmy',
    build: () => EditProfileCubit(repository, auth),
    act: submit,
    expect: () => const [
      EditProfileState(
        user: account,
        submission: SubmissionStatus.failure(ServerFailure()),
      ),
      EditProfileState(user: account),
    ],
    verify: (_) => verifyNever(() => repository.updateProfile(any(), any())),
  );

  blocTest<EditProfileCubit, EditProfileState>(
    'błąd zapisu trafia do stanu',
    build: loadedCubit,
    setUp: () => when(() => repository.updateProfile(any(), any()))
        .thenAnswer((_) async => const Left(NetworkFailure())),
    act: submit,
    expect: () => const [
      EditProfileState(
        user: account,
        profile: Loadable.loaded(profile),
        submission: SubmissionStatus.submitting(),
      ),
      EditProfileState(
        user: account,
        profile: Loadable.loaded(profile),
        submission: SubmissionStatus.failure(NetworkFailure()),
      ),
      EditProfileState(user: account, profile: Loadable.loaded(profile)),
    ],
  );
}
