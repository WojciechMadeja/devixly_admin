import 'package:bloc_test/bloc_test.dart';
import 'package:devixly_admin/core/errors/failures.dart';
import 'package:devixly_admin/features/settings/domain/entities/profile_drafts.dart';
import 'package:devixly_admin/features/settings/domain/repositories/profile_repository.dart';
import 'package:devixly_admin/features/settings/presentation/view_model/update_password_cubit.dart';
import 'package:devixly_admin/features/settings/presentation/view_model/update_password_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class _MockRepository extends Mock implements ProfileRepository {}

void main() {
  const change = PasswordChange(oldPassword: 'stare', newPassword: 'nowe');

  late _MockRepository repository;

  setUpAll(() => registerFallbackValue(change));
  setUp(() => repository = _MockRepository());

  Future<void> submit(UpdatePasswordCubit cubit) => cubit.submit(
        oldPassword: 'stare',
        newPassword: 'nowe',
        repeatedPassword: 'nowe',
      );

  blocTest<UpdatePasswordCubit, UpdatePasswordState>(
    'zapisuje nowe hasło',
    build: () => UpdatePasswordCubit(repository),
    setUp: () => when(() => repository.updatePassword(any()))
        .thenAnswer((_) async => const Right(unit)),
    act: submit,
    expect: () => const [
      UpdatePasswordState.submitting(),
      UpdatePasswordState.success(),
      UpdatePasswordState.initial(),
    ],
    verify: (_) => verify(() => repository.updatePassword(change)).called(1),
  );

  blocTest<UpdatePasswordCubit, UpdatePasswordState>(
    'puste pole przerywa zapis',
    build: () => UpdatePasswordCubit(repository),
    act: (cubit) => cubit.submit(
      oldPassword: '',
      newPassword: 'nowe',
      repeatedPassword: 'nowe',
    ),
    expect: () => const [
      UpdatePasswordState.emptyFields(),
      UpdatePasswordState.initial(),
    ],
    verify: (_) => verifyNever(() => repository.updatePassword(any())),
  );

  blocTest<UpdatePasswordCubit, UpdatePasswordState>(
    'różne hasła przerywają zapis',
    build: () => UpdatePasswordCubit(repository),
    act: (cubit) => cubit.submit(
      oldPassword: 'stare',
      newPassword: 'nowe',
      repeatedPassword: 'inne',
    ),
    expect: () => const [
      UpdatePasswordState.mismatch(),
      UpdatePasswordState.initial(),
    ],
    verify: (_) => verifyNever(() => repository.updatePassword(any())),
  );

  blocTest<UpdatePasswordCubit, UpdatePasswordState>(
    'błąd backendu trafia do stanu',
    build: () => UpdatePasswordCubit(repository),
    setUp: () => when(() => repository.updatePassword(any())).thenAnswer(
      (_) async => const Left(ServerFailure(statusCode: 403)),
    ),
    act: submit,
    expect: () => const [
      UpdatePasswordState.submitting(),
      UpdatePasswordState.failure(ServerFailure(statusCode: 403)),
      UpdatePasswordState.initial(),
    ],
  );
}
