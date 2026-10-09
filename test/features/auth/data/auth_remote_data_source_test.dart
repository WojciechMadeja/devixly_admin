import 'package:devixly_admin/app/di/injection.dart';
import 'package:devixly_admin/core/errors/exceptions.dart';
import 'package:devixly_admin/core/network/backend_client.dart';
import 'package:devixly_admin/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../helpers/fake_backend.dart';
import '../../../helpers/test_dependencies.dart';

/// Kontrakt z backendem (`EmailIdpEndpoint`, `AccountEndpoint`).
void main() {
  late FakeBackend api;
  late AuthRemoteDataSource dataSource;

  /// Panel bez zapisanej sesji.
  Future<void> setUpSignedOut({FakeBackend? backend}) async {
    api = backend ?? FakeBackend();
    SharedPreferences.setMockInitialValues({});
    await setupDependencies(httpClient: api.client, uploadFile: api.uploadFile);
    dataSource = getIt<AuthRemoteDataSource>();
    await dataSource.restore();
  }

  tearDown(getIt.reset);

  test(
    'login: loginAsAdministrator, a potem account.me już z tokenem',
    () async {
      await setUpSignedOut();

      final user = await dataSource.login(
        email: 'admin@devixly.com',
        password: 'tajne',
      );

      expect(api.calls.map((call) => call.route), [
        'emailIdp.loginAsAdministrator',
        'account.me',
      ]);
      expect(api.calls.first.arguments, {
        'email': 'admin@devixly.com',
        'password': 'tajne',
      });
      expect(api.calls.first.headers.containsKey('authorization'), isFalse);
      expect(api.calls.last.headers['authorization'], 'Bearer auth-token-1');
      expect(user, testAdmin);
      expect(dataSource.isSignedIn, isTrue);
      final preferences = await SharedPreferences.getInstance();
      expect(
        preferences.getString(PreferencesAuthStorage.key),
        contains('refresh-token-1'),
      );
    },
  );

  test('błędne hasło: osobny powód i brak sesji', () async {
    await setUpSignedOut(
      backend: FakeBackend(
        overrides: {
          'emailIdp.loginAsAdministrator': FakeResponse.exception(
            'serverpod_auth_idp.EmailAccountLoginException',
            {'reason': 'invalidCredentials'},
          ),
        },
      ),
    );

    await expectLater(
      dataSource.login(email: 'admin@devixly.com', password: 'zle'),
      throwsA(isA<InvalidCredentialsException>()),
    );
    expect(dataSource.isSignedIn, isFalse);
  });

  test(
    'konto bez uprawnień administratora: osobny powód i brak sesji',
    () async {
      await setUpSignedOut(
        backend: FakeBackend(
          overrides: {
            'emailIdp.loginAsAdministrator': FakeResponse.exception(
              'ForbiddenException',
              {'message': 'Brak uprawnień administratora.'},
            ),
          },
        ),
      );

      await expectLater(
        dataSource.login(email: 'agent@devixly.com', password: 'tajne'),
        throwsA(isA<NotAnAdministratorException>()),
      );
      expect(dataSource.isSignedIn, isFalse);
    },
  );

  test('bez danych administratora po logowaniu sesja nie zostaje', () async {
    await setUpSignedOut(
      backend: FakeBackend(
        overrides: {'account.me': const FakeResponse.empty(statusCode: 500)},
      ),
    );

    await expectLater(
      dataSource.login(email: 'admin@devixly.com', password: 'tajne'),
      throwsA(isA<ServerException>()),
    );
    expect(dataSource.isSignedIn, isFalse);
  });

  test('zapisana sesja jest przywracana i używana w żądaniach', () async {
    api = await setUpTestDependencies();
    dataSource = getIt<AuthRemoteDataSource>();

    expect(dataSource.isSignedIn, isTrue);
    expect(await dataSource.currentUser(), testAdmin);
    expect(api.calls.single.headers['authorization'], 'Bearer auth-token-1');
  });

  test('signOut kończy sesję na serwerze i w kliencie', () async {
    api = await setUpTestDependencies();
    dataSource = getIt<AuthRemoteDataSource>();

    await dataSource.signOut();

    expect(api.calls.single.route, 'serverpod_auth_core.status.signOutDevice');
    expect(dataSource.isSignedIn, isFalse);
    final preferences = await SharedPreferences.getInstance();
    expect(preferences.getString(PreferencesAuthStorage.key), isNull);
  });

  test('reset hasła: prośba o kod, potem kod i nowe hasło', () async {
    await setUpSignedOut();

    final requestId = await dataSource.startPasswordReset('admin@devixly.com');
    await dataSource.finishPasswordReset(
      requestId: requestId,
      code: '12345678',
      newPassword: 'noweHaslo1',
    );

    expect(requestId, '0199b1a2-0000-7000-8000-0000000000aa');
    expect(api.calls.map((call) => call.route), [
      'emailIdp.startPasswordReset',
      'emailIdp.verifyPasswordResetCode',
      'emailIdp.finishPasswordReset',
    ]);
    expect(api.calls[0].arguments, {'email': 'admin@devixly.com'});
    expect(api.calls[1].arguments, {
      'passwordResetRequestId': requestId,
      'verificationCode': '12345678',
    });
    expect(api.calls[2].arguments, {
      'finishPasswordResetToken': 'reset-token-1',
      'newPassword': 'noweHaslo1',
    });
  });

  test('błędny kod resetu wraca jako błąd 400', () async {
    await setUpSignedOut(
      backend: FakeBackend(
        overrides: {
          'emailIdp.verifyPasswordResetCode': FakeResponse.exception(
            'serverpod_auth_idp.EmailAccountPasswordResetException',
            {'reason': 'invalid'},
          ),
        },
      ),
    );

    await expectLater(
      dataSource.finishPasswordReset(
        requestId: '0199b1a2-0000-7000-8000-0000000000aa',
        code: '00000000',
        newPassword: 'noweHaslo1',
      ),
      throwsA(
        isA<ServerException>().having((e) => e.statusCode, 'statusCode', 400),
      ),
    );
    expect(api.callsOf('emailIdp.finishPasswordReset'), isEmpty);
  });
}
