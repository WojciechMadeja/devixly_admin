import 'package:background_devixly_client/background_devixly_client.dart';

import '../../../../core/network/backend_call.dart';

abstract interface class LookupsRemoteDataSource {
  Future<List<District>> getDistricts();

  Future<List<Developer>> getDevelopers();

  Future<List<UnitType>> getUnitTypes();

  Future<List<Layout>> getLayouts();
}

/// Słowniki backendu (`DistrictEndpoint`, `DeveloperEndpoint`,
/// `UnitTypeEndpoint`, `LayoutEndpoint`). Odczyt wymaga tylko zalogowania.
class LookupsRemoteDataSourceImpl implements LookupsRemoteDataSource {
  LookupsRemoteDataSourceImpl(this._client);

  final Client _client;

  @override
  Future<List<District>> getDistricts() => backendCall(_client.district.list);

  @override
  Future<List<Developer>> getDevelopers() =>
      backendCall(_client.developer.list);

  @override
  Future<List<UnitType>> getUnitTypes() => backendCall(_client.unitType.list);

  @override
  Future<List<Layout>> getLayouts() => backendCall(_client.layout.list);
}
