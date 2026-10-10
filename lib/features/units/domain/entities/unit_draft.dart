import 'package:equatable/equatable.dart';

/// Dane nowej jednostki (mieszkania) z formularza. Jednostka zawsze
/// należy do projektu; reszta pól jest opcjonalna, bo backend też ich
/// nie wymaga.
class UnitDraft extends Equatable {
  const UnitDraft({
    required this.projectId,
    this.number,
    this.price,
    this.area,
    this.floor,
    this.status,
    this.height,
    this.typeOfSale,
    this.unitTypeId,
    this.layoutId,
  });

  final int projectId;
  final String? number;
  final int? price;
  final double? area;

  /// Piętro jako tekst — dane źródłowe miewają wartości nieliczbowe.
  final String? floor;
  final String? status;

  /// Forma jednostki, np. „Simplex”, „Duplex” (tak jak w backendzie).
  final String? height;
  final String? typeOfSale;
  final int? unitTypeId;
  final int? layoutId;

  @override
  List<Object?> get props => [
    projectId,
    number,
    price,
    area,
    floor,
    status,
    height,
    typeOfSale,
    unitTypeId,
    layoutId,
  ];
}
