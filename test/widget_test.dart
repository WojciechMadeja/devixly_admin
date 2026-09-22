import 'package:devixly_admin/app/app.dart';
import 'package:devixly_admin/app/di/injection.dart';
import 'package:devixly_admin/features/auth/presentation/view_model/session_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers/golden_helpers.dart';
import 'helpers/test_dependencies.dart';

/// Test dymny całej aplikacji: zależności, router i ekran główny startują
/// na atrapie backendu.
void main() {
  tearDown(getIt.reset);

  testWidgets('aplikacja startuje na ekranie głównym zalogowanego admina', (
    tester,
  ) async {
    await setUpTestDependencies();
    setViewport(tester, GoldenViewport.desktop);
    final session = getIt<SessionCubit>();
    await session.restore();

    await tester.pumpWidget(App(session: session));
    await tester.pump(const Duration(seconds: 2));

    expect(find.text('Lista aktualności'), findsOneWidget);
    expect(find.text('Ustawienia'), findsOneWidget);
  });
}
