import 'package:devixly_admin/app/di/injection.dart';
import 'package:devixly_admin/features/auth/domain/repositories/auth_repository.dart';
import 'package:devixly_admin/features/auth/presentation/view/login_view.dart';
import 'package:devixly_admin/features/auth/presentation/view_model/login_cubit.dart';
import 'package:devixly_admin/features/auth/presentation/view_model/reset_password_cubit.dart';
import 'package:devixly_admin/features/auth/presentation/widgets/login_view/reset_password_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/app_harness.dart';
import '../../helpers/golden_helpers.dart';

class _MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  setUp(() {
    final auth = _MockAuthRepository();
    getIt
      ..registerFactory(() => LoginCubit(auth))
      ..registerFactory(() => ResetPasswordCubit(auth));
  });
  tearDown(getIt.reset);

  for (final (name, viewport) in [
    ('desktop', GoldenViewport.desktop),
    ('mobile', GoldenViewport.mobile),
  ]) {
    testWidgets('LoginView ($name) wygląda jak w FlutterFlow', (tester) async {
      await pumpView(tester, const LoginView(), viewport: viewport);
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(baselineGolden('pages/login_$name', depth: 2)),
      );
    });
  }

  testWidgets('ResetPasswordDialog wygląda jak w FlutterFlow', (tester) async {
    await pumpComponent(tester, const ResetPasswordDialog());
    await expectLater(
      find.byType(MaterialApp),
      matchesGoldenFile(
        baselineGolden('components/send_email_for_reset_password', depth: 2),
      ),
    );
  });
}
