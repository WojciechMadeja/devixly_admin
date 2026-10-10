import 'package:equatable/equatable.dart';

/// Pozycja słownika z backendu (dzielnica, deweloper, typ jednostki,
/// układ) sprowadzona do tego, czego potrzebuje formularz: id i nazwa.
class DictionaryItem extends Equatable {
  const DictionaryItem({required this.id, required this.name});

  final int id;
  final String name;

  @override
  List<Object?> get props => [id, name];
}
