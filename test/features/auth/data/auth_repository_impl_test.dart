import 'dart:async';

import 'package:devixly_admin/core/errors/exceptions.dart';
import 'package:devixly_admin/core/errors/failures.dart';
import 'package:devixly_admin/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:devixly_admin/features/auth/data/datasources/session_local_data_source.dart';
import 'package:devixly_admin/features/auth/data/models/admin_user_model.dart';
import 'package:devixly_admin/features/auth/data/models/auth_session_model.dart';
import 'package:devixly_admin/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockRemote extends Mock implements AuthRemoteDataSource {}

class _MockLocal extends Mock implements SessionLocalDataSource {}

void main() {
  final now = DateTime.utc(2026, 9, 22, 12);
  int millis(DateTime date) => date.millisecondsSinceEpoch;

  AuthSessionModel session({
    String token = 'token-1',
    DateTime? accessExpiresAt,
    DateTime? sessionExpiresAt,
  }) => AuthSessionModel(
    accessToken: token,
    refreshToken: 'refresh-$token',
    refreshTokenId: 7,
    accessTokenExpiresAt: millis(
      accessExpiresAt ?? now.add(const Duration(hours: 1)),
    ),
    sessionExpiresAt: millis(
      sessionExpiresAt ?? now.add(const Duration(days: 7)),
    ),
    user: const AdminUserModel(id: 1, email: 'admin@devixly.com'),
  );

  late _MockRemote remote;
  late _MockLocal local;
  late AuthRepositoryImpl repository;

  setUpAll(() => registerFallbackValue(session()));

  setUp(() {
    remote = _MockRemote();
    local = _MockLocal();
    when(() => local.write(any())).thenAnswer((_) async {});
    when(local.clear).thenAnswer((_) async {});
    when(() => remote.revoke(any())).thenAnswer((_) async {});
    repository = AuthRepositoryImpl(remote, local, clock: () => now);
  });

  group('restoreSession', () {
    test('zwraca zapisaną ważną sesję', () async {
      when(local.read).thenReturn(session());

      final restored = await repository.restoreSession();

      expect(restored?.accessToken, 'token-1');
      expect(repository.email, 'admin@devixly.com');
    });

    test('usuwa wygasłą sesję', () async {
      when(local.read).thenReturn(
        session(sessionExpiresAt: now.subtract(const Duration(minutes: 1))),
      );

      expect(await repository.restoreSession(), isNull);
      verify(local.clear).called(1);
      expect(() => repository.email, throwsA(isA<UnauthorizedException>()));
    });
  });

  group('login', () {
    test('zapisuje sesję i powiadamia o zmianie', () async {
      when(
        () => remote.login(email: 'a@b.pl', password: 'x'),
      ).thenAnswer((_) async => session());
      final changes = <Object?>[];
      repository.sessionChanges.listen(changes.add);

      final result = await repository.login(email: 'a@b.pl', password: 'x');
      await Future<void>.delayed(Duration.zero);

      expect(result.isRight(), isTrue);
      verify(() => local.write(session())).called(1);
      expect(changes, hasLength(1));
    });

    test('zwraca Failure, gdy backend odrzuci dane', () async {
      when(
        () => remote.login(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenThrow(const ServerException(403, 'Invalid credentials'));

      final result = await repository.login(email: 'a@b.pl', password: 'x');

      expect(
        result,
        const Left<Failure, Object>(
          ServerFailure(statusCode: 403, message: 'Invalid credentials'),
        ),
      );
    });
  });

  group('validAccessToken', () {
    setUp(() => when(local.read).thenReturn(null));

    test('zwraca aktualny token, gdy jeszcze ważny', () async {
      when(local.read).thenReturn(session());
      await repository.restoreSession();

      expect(await repository.validAccessToken(), 'token-1');
      verifyNever(() => remote.refresh(any()));
    });

    test(
      'odświeża wygasający token jednym żądaniem dla wielu wywołań',
      () async {
        when(local.read).thenReturn(
          session(accessExpiresAt: now.add(const Duration(seconds: 10))),
        );
        await repository.restoreSession();
        final completer = Completer<AuthSessionModel>();
        when(() => remote.refresh(any())).thenAnswer((_) => completer.future);

        final tokens = Future.wait([
          repository.validAccessToken(),
          repository.validAccessToken(),
          repository.refreshAfterUnauthorized(),
        ]);
        completer.complete(session(token: 'token-2'));

        expect(await tokens, ['token-2', 'token-2', 'token-2']);
        verify(() => remote.refresh(any())).called(1);
      },
    );

    test(
      'gdy backend odrzuci odświeżenie, kończy sesję i unieważnia token',
      () async {
        when(local.read).thenReturn(
          session(accessExpiresAt: now.subtract(const Duration(minutes: 1))),
        );
        await repository.restoreSession();
        when(
          () => remote.refresh(any()),
        ).thenThrow(const UnauthorizedException());

        expect(await repository.validAccessToken(), isNull);
        expect(repository.currentSession, isNull);
        verify(local.clear).called(1);
        verify(() => remote.revoke(7)).called(1);
      },
    );

    test('brak sieci przy odświeżaniu nie kończy sesji', () async {
      when(local.read).thenReturn(
        session(accessExpiresAt: now.subtract(const Duration(minutes: 1))),
      );
      await repository.restoreSession();
      when(() => remote.refresh(any())).thenThrow(const NetworkException());

      await expectLater(
        repository.validAccessToken(),
        throwsA(isA<NetworkException>()),
      );
      expect(repository.currentSession, isNotNull);
    });
  });

  test('logout czyści sesję i unieważnia refresh token', () async {
    when(local.read).thenReturn(session());
    await repository.restoreSession();

    await repository.logout();

    expect(repository.currentSession, isNull);
    verify(local.clear).called(1);
    verify(() => remote.revoke(7)).called(1);
  });
}
