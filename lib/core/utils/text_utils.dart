/// Skraca tekst dłuższy niż [maxChars] i dopisuje wielokropek.
String truncateWithEllipsis(String text, int maxChars) =>
    text.length > maxChars ? '${text.substring(0, maxChars)}…' : text;

/// Zamiennik dla pustej wartości — odpowiednik `valueOrDefault` z wersji
/// FlutterFlow, używany tam, gdzie backend może nie mieć danych.
extension EmptyTextFallback on String {
  String ifEmpty(String fallback) => isEmpty ? fallback : this;
}
