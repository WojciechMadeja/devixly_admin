import 'package:bloc_test/bloc_test.dart';
import 'package:devixly_admin/core/errors/failures.dart';
import 'package:devixly_admin/features/auth/domain/entities/admin_user.dart';
import 'package:devixly_admin/features/auth/domain/entities/auth_session.dart';
import 'package:devixly_admin/features/auth/domain/repositories/auth_repository.dart';
import 'package:devixly_admin/features/auth/presentation/view_model/login_cubit.dart';
import 'package:devixly_admin/features/auth/presentation/view_model/login_state.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late _MockAuthRepository auth;

  const session = AuthSession(
    user: AdminUser(id: 1, email: 'a@b.pl', firstName: 'A', lastName: 'B'),
  );

  setUp(() => auth = _MockAuthRepository());

  blocTest<LoginCubit, LoginState>(
    'emituje emptyFields, gdy brakuje e-maila lub hasła',
    build: () => LoginCubit(auth),
    act: (cubit) => cubit.submit(email: '', password: 'x'),
    expect: () => [const LoginState.emptyFields()],
  );

  blocTest<LoginCubit, LoginState>(
    'emituje invalidEmail dla złego adresu i nie woła API',
    build: () => LoginCubit(auth),
    act: (cubit) => cubit.submit(email: 'jan@', password: 'x'),
    expect: () => [const LoginState.invalidEmail()],
    verify: (_) => verifyZeroInteractions(auth),
  );

  blocTest<LoginCubit, LoginState>(
    'pokazuje ten sam komunikat przy kolejnym kliknięciu',
    build: () => LoginCubit(auth),
    act: (cubit) async {
      await cubit.submit(email: '', password: '');
      await cubit.submit(email: '', password: '');
    },
    expect: () => [
      const LoginState.emptyFields(),
      const LoginState.initial(),
      const LoginState.emptyFields(),
    ],
  );

  blocTest<LoginCubit, LoginState>(
    'emituje [submitting, success] po udanym logowaniu (e-mail bez spacji)',
    build: () => LoginCubit(auth),
    setUp: () => when(
      () => auth.login(email: 'a@b.pl', password: 'x'),
    ).thenAnswer((_) async => const Right(session)),
    act: (cubit) => cubit.submit(email: ' a@b.pl ', password: 'x'),
    expect: () => [const LoginState.submitting(), const LoginState.success()],
  );

  blocTest<LoginCubit, LoginState>(
    'emituje [submitting, failure] po odrzuceniu logowania',
    build: () => LoginCubit(auth),
    setUp: () => when(
      () => auth.login(
        email: any(named: 'email'),
        password: any(named: 'password'),
      ),
    ).thenAnswer((_) async => const Left(ServerFailure(statusCode: 403))),
    act: (cubit) => cubit.submit(email: 'a@b.pl', password: 'x'),
    expect: () => [
      const LoginState.submitting(),
      const LoginState.failure(ServerFailure(statusCode: 403)),
    ],
  );
}
