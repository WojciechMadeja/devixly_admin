/// Xano zwraca niektóre pola raz jako tekst, raz jako liczbę albo obiekt
/// relacji (`{id, name}`). Te funkcje służą jako `@JsonKey(fromJson: ...)`.
String stringFromJson(Object? value) => switch (value) {
      null => '',
      String() => value,
      Map() => (value['name'] ?? '').toString(),
      _ => value.toString(),
    };
