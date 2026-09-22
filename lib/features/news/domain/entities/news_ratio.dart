/// Proporcje obrazka aktualności (wartość `ratio` w API).
enum NewsRatio {
  horizontal,
  vertical,
  square;

  /// Nieznana lub brakująca wartość oznacza obrazek poziomy.
  static NewsRatio fromApi(String? value) => NewsRatio.values.firstWhere(
        (ratio) => ratio.name == value,
        orElse: () => NewsRatio.horizontal,
      );
}
