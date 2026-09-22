import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

/// Odczyt plików z test/fixtures (testy uruchamiane są z katalogu projektu).
String readFixture(String relativePath) =>
    File('test/fixtures/$relativePath').readAsStringSync();

dynamic readJsonFixture(String relativePath) =>
    json.decode(readFixture(relativePath));

Uint8List readFixtureBytes(String relativePath) =>
    File('test/fixtures/$relativePath').readAsBytesSync();
