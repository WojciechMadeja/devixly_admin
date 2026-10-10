import 'package:equatable/equatable.dart';

import 'project_draft.dart';
import 'project_summary.dart';

/// Szczegóły projektu pokazywane po wejściu z listy.
class ProjectDetails extends Equatable {
  const ProjectDetails({
    required this.summary,
    required this.paymentPlans,
    this.imageUrls = const [],
    this.noc,
    this.descriptionPl = '',
    this.descriptionEn = '',
    this.ownership,
    this.areaFrom,
    this.areaTo,
    this.startOfSales,
    this.saleTypesDeveloper = false,
    this.saleTypesResale = false,
  });

  final ProjectSummary summary;
  final List<ProjectPaymentPlan> paymentPlans;

  /// Zdjęcia projektu, w kolejności z backendu.
  final List<String> imageUrls;

  /// Opłata NOC — pole wymagane przy zapisie.
  final double? noc;
  final String descriptionPl;
  final String descriptionEn;
  final ProjectOwnership? ownership;
  final int? areaFrom;
  final int? areaTo;
  final DateTime? startOfSales;
  final bool saleTypesDeveloper;
  final bool saleTypesResale;

  @override
  List<Object?> get props => [
    summary,
    paymentPlans,
    imageUrls,
    noc,
    descriptionPl,
    descriptionEn,
    ownership,
    areaFrom,
    areaTo,
    startOfSales,
    saleTypesDeveloper,
    saleTypesResale,
  ];
}

/// Plan płatności projektu razem z jego ratami.
class ProjectPaymentPlan extends Equatable {
  const ProjectPaymentPlan({
    required this.id,
    required this.externalId,
    required this.name,
    required this.items,
    this.description = '',
    this.postHandover = false,
  });

  final int id;

  /// Numer z GenieMap; ujemny oznacza plan dodany ręcznie w panelu.
  final int externalId;
  final String name;
  final List<ProjectPaymentItem> items;
  final String description;

  /// Plan z płatnościami po odbiorze kluczy.
  final bool postHandover;

  /// Plan dodany ręcznie w panelu — synchronizacja go nie rusza.
  bool get isManual => externalId < 0;

  @override
  List<Object?> get props => [
    id,
    externalId,
    name,
    items,
    description,
    postHandover,
  ];
}

/// Pojedyncza rata planu płatności.
class ProjectPaymentItem extends Equatable {
  const ProjectPaymentItem({
    required this.id,
    required this.name,
    this.description = '',
  });

  final int id;
  final String name;
  final String description;

  @override
  List<Object?> get props => [id, name, description];
}
