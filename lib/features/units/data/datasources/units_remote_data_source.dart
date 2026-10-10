import 'package:background_devixly_client/background_devixly_client.dart';

import '../../../../core/network/backend_call.dart';
import '../../domain/entities/unit_draft.dart' as domain;

abstract interface class UnitsRemoteDataSource {
  Future<Unit> addUnit(domain.UnitDraft draft);

  Future<Unit> updateUnit(int id, domain.UnitDraft draft);

  Future<void> deleteUnit(int id);

  Future<List<Unit>> getUnits(int projectId);
}

/// Jednostki w backendzie (`UnitEndpoint`). Dodana tu jednostka dostaje
/// ujemne `externalId`, dzięki czemu nocna synchronizacja z GenieMap jej
/// nie nadpisze ani nie usunie.
class UnitsRemoteDataSourceImpl implements UnitsRemoteDataSource {
  UnitsRemoteDataSourceImpl(this._client);

  final Client _client;

  @override
  Future<List<Unit>> getUnits(int projectId) =>
      backendCall(() => _client.unit.getByProject(projectId));

  @override
  Future<Unit> addUnit(domain.UnitDraft draft) =>
      backendCall(() => _client.unit.create(_input(draft)));

  /// Backend zostawia przy zapisie pola spoza `UnitInput` — numer
  /// biznesowy i rzuty jednostki.
  @override
  Future<Unit> updateUnit(int id, domain.UnitDraft draft) =>
      backendCall(() => _client.unit.update(id, _input(draft)));

  @override
  Future<void> deleteUnit(int id) => backendCall(() => _client.unit.delete(id));

  static UnitInput _input(domain.UnitDraft draft) => UnitInput(
    projectId: draft.projectId,
    number: draft.number,
    price: draft.price,
    area: draft.area,
    floor: draft.floor,
    status: draft.status,
    height: draft.height,
    typeOfSale: draft.typeOfSale,
    unitTypeId: draft.unitTypeId,
    layoutId: draft.layoutId,
  );
}
