import 'package:equatable/equatable.dart';

/// Jednostka projektu pokazywana w tabeli.
class ProjectUnit extends Equatable {
  const ProjectUnit({
    required this.id,
    required this.externalId,
    this.number = '',
    this.floor = '',
    this.status = '',
    this.height = '',
    this.typeName = '',
    this.layoutName = '',
    this.price,
    this.pricePer,
    this.area,
    this.layoutUrls = const [],
  });

  final int id;
  final int externalId;
  final String number;
  final String floor;
  final String status;

  /// Forma jednostki, np. „Simplex” (tak jak w backendzie).
  final String height;
  final String typeName;
  final String layoutName;
  final int? price;
  final double? pricePer;
  final double? area;

  /// Rzuty jednostki, w kolejności z backendu.
  final List<String> layoutUrls;

  /// Jednostka dodana ręcznie w panelu (ujemne `externalId` w backendzie).
  bool get isManual => externalId < 0;

  @override
  List<Object?> get props => [
    id,
    externalId,
    number,
    floor,
    status,
    height,
    typeName,
    layoutName,
    price,
    pricePer,
    area,
    layoutUrls,
  ];
}
