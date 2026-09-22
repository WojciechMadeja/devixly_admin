import 'dart:async';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import 'helpers/golden_helpers.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await loadAppFonts();

  final defaultComparator = goldenFileComparator;
  if (defaultComparator is LocalFileComparator) {
    // GOLDEN_TOLERANCE=0 pozwala sprawdzić zgodność co do piksela.
    final tolerance = double.tryParse(
      Platform.environment['GOLDEN_TOLERANCE'] ?? '',
    );
    goldenFileComparator = TolerantGoldenFileComparator(
      defaultComparator.basedir.resolve('flutter_test_config.dart'),
      tolerance: tolerance ?? 0.005,
    );
  }
  await testMain();
}
