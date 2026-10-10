import 'package:equatable/equatable.dart';

/// Projekt na liście wyboru (np. przy dodawaniu jednostki).
class ProjectOption extends Equatable {
  const ProjectOption({
    required this.id,
    required this.externalId,
    required this.name,
  });

  final int id;
  final int externalId;
  final String name;

  /// Czy nazwa pasuje do wpisanego tekstu — wyszukiwanie w liście.
  bool matches(String query) {
    final text = query.trim().toLowerCase();
    return text.isEmpty ||
        name.toLowerCase().contains(text) ||
        externalId.toString().contains(text);
  }

  @override
  List<Object?> get props => [id, externalId, name];
}
