import 'package:devixly_admin/app/di/injection.dart';
import 'package:devixly_admin/core/errors/exceptions.dart';
import 'package:devixly_admin/core/errors/failures.dart';
import 'package:devixly_admin/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:devixly_admin/features/auth/data/datasources/session_local_data_source.dart';
import 'package:devixly_admin/features/auth/data/models/admin_user_model.dart';
import 'package:devixly_admin/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:devixly_admin/features/auth/domain/entities/auth_session.dart';
import 'package:devixly_admin/features/categories/domain/repositories/categories_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/fake_backend.dart';
import '../../../helpers/test_dependencies.dart';

class _MockRemote extends Mock implements AuthRemoteDataSource {}

class _MockLocal extends Mock implements SessionLocalDataSource {}

void main() {
  const user = AdminUserModel(id: 1, email: 'admin@devixly.com');

  late _MockRemote remote;
  late _MockLocal local;
  late AuthRepositoryImpl repository;

  setUpAll(() => registerFallbackValue(user));

  setUp(() {
    remote = _MockRemote();
    local = _MockLocal();
    when(remote.restore).thenAnswer((_) async {});
    when(() => remote.isSignedIn).thenReturn(true);
    when(remote.signOut).thenAnswer((_) async {});
    when(remote.dropSession).thenAnswer((_) async {});
    when(() => local.write(any())).thenAnswer((_) async {});
    when(local.clear).thenAnswer((_) async {});
    repository = AuthRepositoryImpl(remote, local);
  });

  group('restoreSession', () {
    test('zwraca zapamiętanego administratora bez pytania backendu', () async {
      when(local.read).thenReturn(user);

      final restored = await repository.restoreSession();

      expect(restored?.user.email, 'admin@devixly.com');
      expect(repository.email, 'admin@devixly.com');
      expect(repository.id, 1);
      verifyNever(remote.currentUser);
    });

    test('bez sesji klienta czyści zapamiętane dane', () async {
      when(() => remote.isSignedIn).thenReturn(false);
      when(local.read).thenReturn(user);

      expect(await repository.restoreSession(), isNull);
      verify(local.clear).called(1);
      expect(() => repository.email, throwsA(isA<UnauthorizedException>()));
    });

    test('bez zapamiętanych danych pyta backend', () async {
      when(local.read).thenReturn(null);
      when(remote.currentUser).thenAnswer((_) async => user);

      final restored = await repository.restoreSession();

      expect(restored?.user.id, 1);
      verify(() => local.write(user)).called(1);
    });

    test('gdy backend nie odda danych, porzuca sesję', () async {
      when(local.read).thenReturn(null);
      when(remote.currentUser).thenThrow(const UnauthorizedException());

      expect(await repository.restoreSession(), isNull);
      verify(remote.dropSession).called(1);
      verify(local.clear).called(1);
    });
  });

  group('login', () {
    test('zapamiętuje administratora i powiadamia o zmianie', () async {
      when(
        () => remote.login(email: 'a@b.pl', password: 'x'),
      ).thenAnswer((_) async => user);
      final changes = <AuthSession?>[];
      repository.sessionChanges.listen(changes.add);

      final result = await repository.login(email: 'a@b.pl', password: 'x');
      await Future<void>.delayed(Duration.zero);

      expect(result.isRight(), isTrue);
      verify(() => local.write(user)).called(1);
      expect(changes.single?.user.email, 'admin@devixly.com');
    });

    test('zwraca Failure, gdy backend odrzuci dane', () async {
      when(
        () => remote.login(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenThrow(
        const ServerException(401, 'Nieprawidłowy e-mail lub hasło.'),
      );

      final result = await repository.login(email: 'a@b.pl', password: 'x');

      expect(
        result,
        const Left<Failure, Object>(
          ServerFailure(
            statusCode: 401,
            message: 'Nieprawidłowy e-mail lub hasło.',
          ),
        ),
      );
      expect(repository.currentSession, isNull);
    });
  });

  group('logout', () {
    setUp(() async {
      when(local.read).thenReturn(user);
      await repository.restoreSession();
      clearInteractions(local);
    });

    test('czyści dane i kończy sesję na serwerze', () async {
      await repository.logout();

      expect(repository.currentSession, isNull);
      verify(local.clear).called(1);
      verify(remote.signOut).called(1);
    });

    test('bez sieci i tak usuwa sesję z klienta', () async {
      when(
        remote.signOut,
      ).thenAnswer((_) async => throw const NetworkException());

      await repository.logout();
      await Future<void>.delayed(Duration.zero);

      expect(repository.currentSession, isNull);
      verify(remote.dropSession).called(1);
    });
  });

  test('sessionRejected kończy sesję lokalnie, bez pytania serwera', () async {
    when(local.read).thenReturn(user);
    await repository.restoreSession();
    final changes = <AuthSession?>[];
    repository.sessionChanges.listen(changes.add);

    await repository.sessionRejected();
    await Future<void>.delayed(Duration.zero);

    expect(repository.currentSession, isNull);
    expect(changes, [null]);
    verify(remote.dropSession).called(1);
    verifyNever(remote.signOut);
  });

  group('reset hasła', () {
    test('zwraca identyfikator prośby', () async {
      when(
        () => remote.startPasswordReset('a@b.pl'),
      ).thenAnswer((_) async => 'request-1');

      expect(
        await repository.requestPasswordReset('a@b.pl'),
        const Right<Failure, String>('request-1'),
      );
    });

    test('odrzucony kod wraca jako Failure', () async {
      when(
        () => remote.finishPasswordReset(
          requestId: any(named: 'requestId'),
          code: any(named: 'code'),
          newPassword: any(named: 'newPassword'),
        ),
      ).thenThrow(const ServerException(400, 'Reset hasła: invalid.'));

      final result = await repository.finishPasswordReset(
        requestId: 'request-1',
        code: '0',
        newPassword: 'noweHaslo1',
      );

      expect(result.isLeft(), isTrue);
    });
  });

  group('z backendem', () {
    tearDown(getIt.reset);

    test('odrzucone żądanie (401) kończy sesję w panelu', () async {
      await setUpTestDependencies(
        api: FakeBackend(
          overrides: {
            'category.list': const FakeResponse.empty(statusCode: 401),
          },
        ),
      );
      final auth = getIt<AuthRepositoryImpl>();
      expect(auth.currentSession, isNotNull);

      final result = await getIt<CategoriesRepository>().getCategories();
      await Future<void>.delayed(Duration.zero);

      expect(result.isLeft(), isTrue);
      expect(auth.currentSession, isNull);
      expect(getIt<AuthRemoteDataSource>().isSignedIn, isFalse);
    });
  });
}
