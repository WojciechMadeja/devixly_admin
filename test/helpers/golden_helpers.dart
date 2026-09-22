import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

/// Rozmiary okna, w których porównujemy wygląd (desktop i telefon).
abstract final class GoldenViewport {
  static const desktop = Size(1440, 900);
  static const mobile = Size(390, 844);
}

/// Ładuje wszystkie fonty aplikacji (FontManifest.json) oraz Roboto z cache
/// Flutter SDK, żeby goldeny renderowały prawdziwe glify zamiast czcionki
/// testowej.
Future<void> loadAppFonts() async {
  final manifest =
      json.decode(await rootBundle.loadString('FontManifest.json')) as List;
  for (final family in manifest.cast<Map<String, dynamic>>()) {
    final loader = FontLoader(family['family'] as String);
    final fonts = (family['fonts'] as List).cast<Map<String, dynamic>>();
    for (final font in fonts) {
      loader.addFont(rootBundle.load(font['asset'] as String));
    }
    await loader.load();
  }
  await _loadRobotoFromSdk();
}

Future<void> _loadRobotoFromSdk() async {
  final fontsDir = _materialFontsDirectory();
  if (fontsDir == null) return;
  final loader = FontLoader('Roboto');
  for (final file in fontsDir.listSync().whereType<File>()) {
    final name = file.uri.pathSegments.last;
    if (name.startsWith('Roboto-') && name.endsWith('.ttf')) {
      final bytes = file.readAsBytesSync();
      loader.addFont(Future.value(ByteData.sublistView(bytes)));
    }
  }
  await loader.load();
}

Directory? _materialFontsDirectory() {
  final flutterRoot = Platform.environment['FLUTTER_ROOT'];
  final candidates = <String>[
    if (flutterRoot != null)
      '$flutterRoot/bin/cache/artifacts/material_fonts',
    // flutter_tester leży w <FLUTTER_ROOT>/bin/cache/artifacts/engine/<platforma>/
    File(Platform.resolvedExecutable).parent.parent.parent.uri
        .resolve('material_fonts')
        .toFilePath(),
  ];
  for (final path in candidates) {
    final dir = Directory(path);
    if (dir.existsSync()) return dir;
  }
  return null;
}

/// Porównuje goldeny z tolerancją, żeby drobne różnice antyaliasingu między
/// starą (FlutterFlow) a nową implementacją nie blokowały porównania.
class TolerantGoldenFileComparator extends LocalFileComparator {
  TolerantGoldenFileComparator(super.testFile, {this.tolerance = 0.005});

  /// Maksymalny odsetek różniących się pikseli (0.005 = 0,5%).
  final double tolerance;

  @override
  Future<bool> compare(Uint8List imageBytes, Uri golden) async {
    final result = await GoldenFileComparator.compareLists(
      imageBytes,
      await getGoldenBytes(golden),
    );
    if (result.passed || result.diffPercent <= tolerance) {
      result.dispose();
      return true;
    }
    final error = await generateFailureOutput(result, golden, basedir);
    result.dispose();
    throw FlutterError(error);
  }
}

/// Ustawia rozmiar powierzchni testu (logiczne piksele, DPR 1).
void setViewport(WidgetTester tester, Size size) {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
}
