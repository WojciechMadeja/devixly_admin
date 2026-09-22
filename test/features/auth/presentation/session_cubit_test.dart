import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:devixly_admin/features/auth/domain/entities/admin_user.dart';
import 'package:devixly_admin/features/auth/domain/entities/auth_session.dart';
import 'package:devixly_admin/features/auth/domain/repositories/auth_repository.dart';
import 'package:devixly_admin/features/auth/presentation/view_model/session_cubit.dart';
import 'package:devixly_admin/features/auth/presentation/view_model/session_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  const user =
      AdminUser(id: 1, email: 'a@b.pl', firstName: 'Jan', lastName: 'K');
  const session = AuthSession(
    accessToken: 't',
    refreshToken: 'r',
    refreshTokenId: 1,
    user: user,
  );

  late _MockAuthRepository auth;
  late StreamController<AuthSession?> changes;

  setUp(() {
    auth = _MockAuthRepository();
    changes = StreamController<AuthSession?>.broadcast();
    when(() => auth.sessionChanges).thenAnswer((_) => changes.stream);
  });

  tearDown(() => changes.close());

  blocTest<SessionCubit, SessionState>(
    'po wczytaniu zapisanej sesji jest zalogowany',
    build: () => SessionCubit(auth),
    setUp: () => when(auth.restoreSession).thenAnswer((_) async => session),
    act: (cubit) => cubit.restore(),
    expect: () => [const SessionState.authenticated(user)],
  );

  blocTest<SessionCubit, SessionState>(
    'bez zapisanej sesji jest wylogowany',
    build: () => SessionCubit(auth),
    setUp: () => when(auth.restoreSession).thenAnswer((_) async => null),
    act: (cubit) => cubit.restore(),
    expect: () => [const SessionState.unauthenticated()],
  );

  blocTest<SessionCubit, SessionState>(
    'reaguje na wygaśnięcie sesji w repozytorium',
    build: () => SessionCubit(auth),
    act: (cubit) async {
      changes.add(session);
      await Future<void>.delayed(Duration.zero);
      changes.add(null);
    },
    expect: () => [
      const SessionState.authenticated(user),
      const SessionState.unauthenticated(),
    ],
  );
}
