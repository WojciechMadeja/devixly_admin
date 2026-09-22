import '../errors/exceptions.dart';

/// Rzutowanie zdekodowanej odpowiedzi API na oczekiwany kształt.
extension JsonBody on Object? {
  Map<String, dynamic> asJsonObject() {
    final value = this;
    if (value is Map<String, dynamic>) return value;
    throw const ParsingException('Oczekiwano obiektu JSON.');
  }

  List<Map<String, dynamic>> asJsonList() {
    final value = this;
    if (value is List) return value.whereType<Map<String, dynamic>>().toList();
    throw const ParsingException('Oczekiwano listy JSON.');
  }
}
