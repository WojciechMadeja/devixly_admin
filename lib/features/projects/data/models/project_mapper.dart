import 'package:background_devixly_client/background_devixly_client.dart' as sp;

import '../../domain/entities/project_details.dart';
import '../../domain/entities/project_draft.dart';
import '../../domain/entities/project_summary.dart';

extension ProjectSummaryMapper on sp.Project {
  ProjectSummary toSummary() => ProjectSummary(
    id: id!,
    externalId: externalId,
    name: name,
    districtName: district?.name ?? '',
    developerName: developer?.name ?? '',
    status: status ?? '',
    handover: handover,
    priceFrom: unitPriceRangeFrom,
    priceTo: unitPriceRangeTo,
  );

  ProjectDetails toDetails() => ProjectDetails(
    summary: toSummary(),
    imageUrls: _imageUrls(this),
    paymentPlans: [
      for (final plan in paymentPlans ?? const <sp.PaymentPlan>[])
        plan.toEntity(),
    ],
    descriptionPl: descriptionPl ?? '',
    descriptionEn: descriptionEn ?? '',
    ownership: switch (ownershipType) {
      sp.OwnershipType.freehold => ProjectOwnership.freehold,
      sp.OwnershipType.leasehold => ProjectOwnership.leasehold,
      null => null,
    },
    areaFrom: unitAreaRangeFrom,
    areaTo: unitAreaRangeTo,
    startOfSales: startOfSales,
    saleTypesDeveloper: saleTypesDeveloper,
    saleTypesResale: saleTypesResale,
  );
}

/// Zdjęcia bierzemy z kopii w storage backendu; dopóki nocna
/// synchronizacja ich nie pobierze, zostają adresy źródłowe.
List<String> _imageUrls(sp.Project project) {
  final stored = project.storedImages ?? const <sp.ProjectImage>[];
  if (stored.isNotEmpty) {
    final ordered = [...stored]
      ..sort((a, b) => a.position.compareTo(b.position));
    return [for (final image in ordered) ?image.file?.publicUrl];
  }
  return project.images ?? const [];
}

extension PaymentPlanMapper on sp.PaymentPlan {
  /// Nazwy i opisy pokazujemy po polsku, gdy backend ma tłumaczenie.
  ProjectPaymentPlan toEntity() => ProjectPaymentPlan(
    name: namePl ?? name,
    description: descriptionPl ?? description,
    postHandover: postHandover,
    items: [
      for (final item in items ?? const <sp.Item>[])
        ProjectPaymentItem(
          name: item.namePl ?? item.name,
          description: item.descriptionPl ?? item.description,
        ),
    ],
  );
}
