import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'helpers/golden_helpers.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  TestWidgetsFlutterBinding.ensureInitialized();
  // Stary kod (FlutterFlow) bierze fonty z google_fonts — w testach wyłącznie
  // z dołączonych plików w assets/fonts, bez pobierania z sieci.
  GoogleFonts.config.allowRuntimeFetching = false;
  await loadAppFonts();

  final defaultComparator = goldenFileComparator;
  if (defaultComparator is LocalFileComparator) {
    goldenFileComparator = TolerantGoldenFileComparator(
      defaultComparator.basedir.resolve('flutter_test_config.dart'),
    );
  }
  await testMain();
}
