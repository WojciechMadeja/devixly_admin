import 'package:background_devixly_client/background_devixly_client.dart' as sp;
import 'package:background_devixly_client/background_devixly_client.dart'
    show Client;

import '../../../../core/network/backend_call.dart';
import '../../domain/entities/payment_plan_drafts.dart';
import '../../domain/entities/project_draft.dart';

abstract interface class ProjectsRemoteDataSource {
  Future<sp.Project> addProject(ProjectDraft draft);

  Future<sp.Project> updateProject(int id, ProjectDraft draft);

  Future<void> deleteProject(int id);

  Future<List<sp.ProjectOption>> getProjectOptions();

  Future<List<sp.Project>> getProjects({String? search});

  Future<sp.Project?> getProject(int id);

  Future<sp.PaymentPlan> addPaymentPlan(PaymentPlanDraft draft);

  Future<void> deletePaymentPlan(int id);

  Future<sp.Item> addPaymentItem(PaymentItemDraft draft);

  Future<void> deletePaymentItem(int id);
}

/// Projekty w backendzie (`ProjectEndpoint`). Zapis wymaga uprawnień
/// administratora, lista wyboru — tylko zalogowania.
class ProjectsRemoteDataSourceImpl implements ProjectsRemoteDataSource {
  ProjectsRemoteDataSourceImpl(this._client);

  final Client _client;

  @override
  Future<sp.Project> addProject(ProjectDraft draft) =>
      backendCall(() => _client.project.create(_input(draft)));

  /// Zapis zastępuje w backendzie wszystkie pola projektu, więc najpierw
  /// czytamy obecny rekord i podmieniamy tylko to, co jest w formularzu —
  /// inaczej zniknęłyby zdjęcia, dokumenty i powiązania słownikowe.
  @override
  Future<sp.Project> updateProject(int id, ProjectDraft draft) =>
      backendCall(() async {
        final existing = await _client.project.getById(id);
        if (existing == null) throw sp.ProjectNotFoundException(id: id);
        return _client.project.update(id, _input(draft, existing: existing));
      });

  @override
  Future<void> deleteProject(int id) =>
      backendCall(() => _client.project.delete(id));

  /// Bez numeru backend nada ujemny — taki, jakiego GenieMap nie używa.
  @override
  Future<sp.PaymentPlan> addPaymentPlan(PaymentPlanDraft draft) => backendCall(
    () => _client.paymentPlan.create(
      sp.PaymentPlanInput(
        projectId: draft.projectId,
        name: draft.name,
        namePl: draft.name,
        description: draft.description,
        descriptionPl: draft.description,
        postHandover: draft.postHandover,
      ),
    ),
  );

  @override
  Future<void> deletePaymentPlan(int id) =>
      backendCall(() => _client.paymentPlan.delete(id));

  @override
  Future<sp.Item> addPaymentItem(PaymentItemDraft draft) => backendCall(
    () => _client.item.create(
      sp.ItemInput(
        paymentPlanId: draft.paymentPlanId,
        name: draft.name,
        namePl: draft.name,
        description: draft.description,
        descriptionPl: draft.description,
      ),
    ),
  );

  @override
  Future<void> deletePaymentItem(int id) =>
      backendCall(() => _client.item.delete(id));

  static sp.ProjectInput _input(ProjectDraft draft, {sp.Project? existing}) =>
      sp.ProjectInput(
        externalId: draft.externalId,
        name: draft.name,
        noc: draft.noc,
        saleTypesDeveloper: draft.saleTypesDeveloper,
        saleTypesResale: draft.saleTypesResale,
        districtId: draft.districtId,
        developerId: draft.developerId,
        status: draft.status,
        descriptionPl: draft.descriptionPl,
        descriptionEn: draft.descriptionEn,
        unitPriceRangeFrom: draft.priceFrom,
        unitPriceRangeTo: draft.priceTo,
        unitAreaRangeFrom: draft.areaFrom,
        unitAreaRangeTo: draft.areaTo,
        handover: draft.handover,
        startOfSales: draft.startOfSales,
        ownershipType: switch (draft.ownership) {
          ProjectOwnership.freehold => sp.OwnershipType.freehold,
          ProjectOwnership.leasehold => sp.OwnershipType.leasehold,
          null => null,
        },
        // Pola spoza formularza przepisujemy z obecnego rekordu; przy
        // nowym projekcie po prostu ich nie ma.
        sellerId: existing?.sellerId,
        sellerName: existing?.sellerName,
        pointLat: existing?.pointLat,
        pointLon: existing?.pointLon,
        serviceCharge: existing?.serviceCharge,
        eoi: existing?.eoi,
        images: existing?.images,
        documents: existing?.documents,
        amenityIds: switch (existing?.amenities) {
          final rows? => [for (final row in rows) row.amenityId],
          null => null,
        },
        finishIds: switch (existing?.finishes) {
          final rows? => [for (final row in rows) row.finishId],
          null => null,
        },
        layoutIds: switch (existing?.layouts) {
          final rows? => [for (final row in rows) row.layoutId],
          null => null,
        },
        unitTypeIds: switch (existing?.unitTypes) {
          final rows? => [for (final row in rows) row.unitTypeId],
          null => null,
        },
      );

  @override
  Future<List<sp.ProjectOption>> getProjectOptions() =>
      backendCall(_client.project.listOptionsForUnit);

  /// Lista z danymi do tabeli; backend dokłada dzielnicę i dewelopera.
  /// Szukamy po nazwie projektu — backend łączy filtry przez AND, więc ten
  /// sam tekst w nazwie i deweloperze musiałby pasować do obu naraz.
  @override
  Future<List<sp.Project>> getProjects({String? search}) => backendCall(
    () => _client.project.list(nameContains: _orNull(search), limit: 200),
  );

  @override
  Future<sp.Project?> getProject(int id) =>
      backendCall(() => _client.project.getById(id));

  static String? _orNull(String? value) {
    final text = value?.trim();
    return text == null || text.isEmpty ? null : text;
  }
}
