import 'package:background_devixly_client/background_devixly_client.dart';
import 'package:devixly_admin/core/errors/exceptions.dart';
import 'package:devixly_admin/core/network/backend_call.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart';

/// Które wyjątki backendu mają własny powód, a które komunikat dla
/// użytkownika. Komunikat niesiemy dalej tylko wtedy, gdy backend podał coś
/// konkretnego — techniczne i angielskie opisy zostają w `null`.
void main() {
  Future<AppException> failureOf(Object exception) async {
    try {
      await backendCall<void>(() async => throw exception);
    } on AppException catch (e) {
      return e;
    }
    fail('Oczekiwano wyjątku warstwy danych.');
  }

  test('zajęty e-mail wraca z adresem w komunikacie', () async {
    final failure = await failureOf(
      UserCreationException(
        reason: UserCreationErrorReason.emailInUse,
        emails: ['marek@example.com'],
      ),
    );

    expect(failure, isA<ServerException>());
    expect(failure.message, contains('marek@example.com'));
  });

  test('zbyt słabe hasło to osobny powód, nie zwykły błąd serwera', () async {
    final failure = await failureOf(
      EmailAccountPasswordResetException(
        reason: EmailAccountPasswordResetExceptionReason.policyViolation,
      ),
    );

    expect(failure, isA<WeakPasswordException>());
  });

  test('błędne dane logowania to osobny powód', () async {
    final failure = await failureOf(
      EmailAccountLoginException(
        reason: EmailAccountLoginExceptionReason.invalidCredentials,
      ),
    );

    expect(failure, isA<InvalidCredentialsException>());
  });

  test('angielski opis braku uprawnień nie trafia do użytkownika', () async {
    final failure = await failureOf(
      ForbiddenException(message: 'Administrator rights required.'),
    );

    expect(failure, isA<ServerException>());
    expect(failure.message, isNull);
  });

  test(
    'wyjątek endpointu bez treści dla użytkownika nie ma komunikatu',
    () async {
      final failure = await failureOf(NewsNotFoundException(id: 11));

      expect(failure, isA<ServerException>());
      expect(failure.message, isNull);
    },
  );
}
