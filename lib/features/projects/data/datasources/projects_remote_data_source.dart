import 'package:background_devixly_client/background_devixly_client.dart' as sp;
import 'package:background_devixly_client/background_devixly_client.dart'
    show Client;

import '../../../../core/network/backend_call.dart';
import '../../domain/entities/project_draft.dart';

abstract interface class ProjectsRemoteDataSource {
  Future<sp.Project> addProject(ProjectDraft draft);

  Future<List<sp.ProjectOption>> getProjectOptions();
}

/// Projekty w backendzie (`ProjectEndpoint`). Zapis wymaga uprawnień
/// administratora, lista wyboru — tylko zalogowania.
class ProjectsRemoteDataSourceImpl implements ProjectsRemoteDataSource {
  ProjectsRemoteDataSourceImpl(this._client);

  final Client _client;

  @override
  Future<sp.Project> addProject(ProjectDraft draft) => backendCall(
    () => _client.project.create(
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
      ),
    ),
  );

  @override
  Future<List<sp.ProjectOption>> getProjectOptions() =>
      backendCall(_client.project.listOptionsForUnit);
}
