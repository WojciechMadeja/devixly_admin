import 'package:equatable/equatable.dart';

/// Projekt na liście: tyle, ile mieści się w tabeli.
class ProjectSummary extends Equatable {
  const ProjectSummary({
    required this.id,
    required this.externalId,
    required this.name,
    this.districtId,
    this.districtName = '',
    this.developerId,
    this.developerName = '',
    this.status = '',
    this.handover,
    this.priceFrom,
    this.priceTo,
  });

  final int id;
  final int externalId;
  final String name;
  final int? districtId;
  final String districtName;
  final int? developerId;
  final String developerName;
  final String status;
  final DateTime? handover;
  final int? priceFrom;
  final int? priceTo;

  /// Projekt dodany ręcznie w panelu — synchronizacja GenieMap go nie zna.
  bool get isManual => externalId < 0;

  @override
  List<Object?> get props => [
    id,
    externalId,
    name,
    districtId,
    districtName,
    developerId,
    developerName,
    status,
    handover,
    priceFrom,
    priceTo,
  ];
}
