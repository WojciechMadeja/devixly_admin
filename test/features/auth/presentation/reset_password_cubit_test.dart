import 'package:bloc_test/bloc_test.dart';
import 'package:devixly_admin/core/errors/failures.dart';
import 'package:devixly_admin/features/auth/domain/repositories/auth_repository.dart';
import 'package:devixly_admin/features/auth/presentation/view_model/reset_password_cubit.dart';
import 'package:devixly_admin/features/auth/presentation/view_model/reset_password_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class _MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  const failure = ServerFailure(statusCode: 400, message: 'błąd');
  const awaitingCode = ResetPasswordState.awaitingCode(requestId: 'request-1');
  late _MockAuthRepository auth;

  setUp(() => auth = _MockAuthRepository());

  blocTest<ResetPasswordCubit, ResetPasswordState>(
    'niepoprawny e-mail nie wysyła prośby',
    build: () => ResetPasswordCubit(auth),
    act: (cubit) => cubit.submit('to-nie-email'),
    expect: () => [const ResetPasswordState.invalidEmail()],
    verify: (_) => verifyNever(() => auth.requestPasswordReset(any())),
  );

  blocTest<ResetPasswordCubit, ResetPasswordState>(
    'po wysłaniu kodu przechodzi do kroku z kodem',
    setUp: () => when(
      () => auth.requestPasswordReset('a@b.pl'),
    ).thenAnswer((_) async => const Right('request-1')),
    build: () => ResetPasswordCubit(auth),
    act: (cubit) => cubit.submit(' a@b.pl '),
    expect: () => [const ResetPasswordState.submitting(), awaitingCode],
  );

  blocTest<ResetPasswordCubit, ResetPasswordState>(
    'nieudane wysłanie kodu kończy się błędem',
    setUp: () => when(
      () => auth.requestPasswordReset(any()),
    ).thenAnswer((_) async => const Left(failure)),
    build: () => ResetPasswordCubit(auth),
    act: (cubit) => cubit.submit('a@b.pl'),
    expect: () => [
      const ResetPasswordState.submitting(),
      const ResetPasswordState.failed(),
    ],
  );

  blocTest<ResetPasswordCubit, ResetPasswordState>(
    'krok 2: puste pola i różne hasła nie wołają backendu',
    build: () => ResetPasswordCubit(auth),
    seed: () => awaitingCode,
    act: (cubit) async {
      await cubit.finish(code: ' ', newPassword: 'a', repeatedPassword: 'a');
      await cubit.finish(code: '1', newPassword: 'a', repeatedPassword: 'b');
    },
    expect: () => [
      const ResetPasswordState.awaitingCode(
        requestId: 'request-1',
        error: ResetCodeError.emptyFields,
      ),
      awaitingCode,
      const ResetPasswordState.awaitingCode(
        requestId: 'request-1',
        error: ResetCodeError.mismatch,
      ),
    ],
    verify: (_) => verifyNever(
      () => auth.finishPasswordReset(
        requestId: any(named: 'requestId'),
        code: any(named: 'code'),
        newPassword: any(named: 'newPassword'),
      ),
    ),
  );

  blocTest<ResetPasswordCubit, ResetPasswordState>(
    'krok 2: poprawny kod zmienia hasło',
    setUp: () => when(
      () => auth.finishPasswordReset(
        requestId: 'request-1',
        code: '12345678',
        newPassword: 'noweHaslo1',
      ),
    ).thenAnswer((_) async => const Right(unit)),
    build: () => ResetPasswordCubit(auth),
    seed: () => awaitingCode,
    act: (cubit) => cubit.finish(
      code: ' 12345678 ',
      newPassword: 'noweHaslo1',
      repeatedPassword: 'noweHaslo1',
    ),
    expect: () => [
      const ResetPasswordState.awaitingCode(
        requestId: 'request-1',
        submitting: true,
      ),
      const ResetPasswordState.sent(),
    ],
  );

  blocTest<ResetPasswordCubit, ResetPasswordState>(
    'krok 2: odrzucony kod zostawia formularz z błędem',
    setUp: () => when(
      () => auth.finishPasswordReset(
        requestId: any(named: 'requestId'),
        code: any(named: 'code'),
        newPassword: any(named: 'newPassword'),
      ),
    ).thenAnswer((_) async => const Left(failure)),
    build: () => ResetPasswordCubit(auth),
    seed: () => awaitingCode,
    act: (cubit) =>
        cubit.finish(code: '0', newPassword: 'x', repeatedPassword: 'x'),
    expect: () => [
      const ResetPasswordState.awaitingCode(
        requestId: 'request-1',
        submitting: true,
      ),
      const ResetPasswordState.awaitingCode(
        requestId: 'request-1',
        error: ResetCodeError.rejected,
      ),
    ],
  );
}
