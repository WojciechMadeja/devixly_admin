import 'package:equatable/equatable.dart';

/// Jednostka projektu pokazywana w tabeli.
class ProjectUnit extends Equatable {
  const ProjectUnit({
    required this.id,
    required this.externalId,
    this.number = '',
    this.floor = '',
    this.status = '',
    this.typeName = '',
    this.layoutName = '',
    this.price,
    this.pricePer,
    this.area,
  });

  final int id;
  final int externalId;
  final String number;
  final String floor;
  final String status;
  final String typeName;
  final String layoutName;
  final int? price;
  final double? pricePer;
  final double? area;

  /// Jednostka dodana ręcznie w panelu (ujemne `externalId` w backendzie).
  bool get isManual => externalId < 0;

  @override
  List<Object?> get props => [
    id,
    externalId,
    number,
    floor,
    status,
    typeName,
    layoutName,
    price,
    pricePer,
    area,
  ];
}
