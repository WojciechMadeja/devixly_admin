import 'package:equatable/equatable.dart';

/// Rodzaj własności nieruchomości (enum backendu `OwnershipType`).
enum ProjectOwnership { freehold, leasehold }

/// Dane nowego projektu z formularza. Pola wymagane przez backend to
/// nazwa, `externalId`, NOC i dwa typy sprzedaży; reszta jest opcjonalna.
class ProjectDraft extends Equatable {
  const ProjectDraft({
    required this.externalId,
    required this.name,
    required this.noc,
    required this.saleTypesDeveloper,
    required this.saleTypesResale,
    this.districtId,
    this.developerId,
    this.status,
    this.descriptionPl,
    this.descriptionEn,
    this.priceFrom,
    this.priceTo,
    this.areaFrom,
    this.areaTo,
    this.handover,
    this.startOfSales,
    this.ownership,
  });

  /// Biznesowe id projektu. Dla rekordów dodawanych ręcznie nie może
  /// kolidować z id z GenieMap — backend ma na tym unikalny indeks.
  final int externalId;
  final String name;
  final double noc;
  final bool saleTypesDeveloper;
  final bool saleTypesResale;
  final int? districtId;
  final int? developerId;
  final String? status;
  final String? descriptionPl;
  final String? descriptionEn;
  final int? priceFrom;
  final int? priceTo;
  final int? areaFrom;
  final int? areaTo;
  final DateTime? handover;
  final DateTime? startOfSales;
  final ProjectOwnership? ownership;

  @override
  List<Object?> get props => [
    externalId,
    name,
    noc,
    saleTypesDeveloper,
    saleTypesResale,
    districtId,
    developerId,
    status,
    descriptionPl,
    descriptionEn,
    priceFrom,
    priceTo,
    areaFrom,
    areaTo,
    handover,
    startOfSales,
    ownership,
  ];
}
