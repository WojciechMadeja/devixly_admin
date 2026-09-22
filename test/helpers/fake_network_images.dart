import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

/// Podstawia pod `Image.network` stały obrazek, żeby goldeny z obrazkami
/// sieciowymi były deterministyczne (w testach HTTP zwraca inaczej 400).
class FakeNetworkImagesOverrides extends HttpOverrides {
  FakeNetworkImagesOverrides(this.imageBytes);

  final Uint8List imageBytes;

  @override
  HttpClient createHttpClient(SecurityContext? context) =>
      _createClient(imageBytes);
}

class _MockHttpClient extends Mock implements HttpClient {}

class _MockHttpClientRequest extends Mock implements HttpClientRequest {}

class _MockHttpClientResponse extends Mock implements HttpClientResponse {}

class _MockHttpHeaders extends Mock implements HttpHeaders {}

HttpClient _createClient(Uint8List imageBytes) {
  registerFallbackValue(Uri());
  final client = _MockHttpClient();
  final request = _MockHttpClientRequest();
  final response = _MockHttpClientResponse();
  final headers = _MockHttpHeaders();

  when(() => client.autoUncompress).thenReturn(false);
  when(() => client.getUrl(any())).thenAnswer((_) async => request);
  when(() => client.openUrl(any(), any())).thenAnswer((_) async => request);
  when(() => request.headers).thenReturn(headers);
  when(request.close).thenAnswer((_) async => response);
  when(
    () => response.compressionState,
  ).thenReturn(HttpClientResponseCompressionState.notCompressed);
  when(() => response.contentLength).thenReturn(imageBytes.length);
  when(() => response.statusCode).thenReturn(HttpStatus.ok);
  when(
    () => response.listen(
      any(),
      onError: any(named: 'onError'),
      onDone: any(named: 'onDone'),
      cancelOnError: any(named: 'cancelOnError'),
    ),
  ).thenAnswer((invocation) {
    final onData =
        invocation.positionalArguments.first as void Function(List<int>);
    final onDone = invocation.namedArguments[#onDone] as void Function()?;
    final onError = invocation.namedArguments[#onError] as Function?;
    final cancelOnError = invocation.namedArguments[#cancelOnError] as bool?;
    return Stream<List<int>>.value(imageBytes).listen(
      onData,
      onDone: onDone,
      onError: onError,
      cancelOnError: cancelOnError,
    );
  });
  return client;
}

/// Dekoduje wszystkie obrazy widoczne w drzewie (dekodowanie wymaga
/// prawdziwego czasu, więc wykonujemy je w `runAsync`).
Future<void> precacheImages(WidgetTester tester) async {
  await tester.runAsync(() async {
    for (final element in find.byType(Image).evaluate()) {
      final image = element.widget as Image;
      await precacheImage(image.image, element);
    }
  });
  await tester.pump();
}
