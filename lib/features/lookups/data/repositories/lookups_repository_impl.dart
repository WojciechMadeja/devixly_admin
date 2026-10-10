import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/errors/guard.dart';
import '../../domain/entities/dictionary_item.dart';
import '../../domain/repositories/lookups_repository.dart';
import '../datasources/lookups_remote_data_source.dart';
import '../models/dictionary_item_mapper.dart';

class LookupsRepositoryImpl implements LookupsRepository {
  LookupsRepositoryImpl(this._remote);

  final LookupsRemoteDataSource _remote;

  @override
  Future<Either<Failure, List<DictionaryItem>>> getDistricts() => guard(
    () async => _sorted([
      for (final district in await _remote.getDistricts()) district.toItem(),
    ]),
  );

  @override
  Future<Either<Failure, List<DictionaryItem>>> getDevelopers() => guard(
    () async => _sorted([
      for (final developer in await _remote.getDevelopers()) developer.toItem(),
    ]),
  );

  @override
  Future<Either<Failure, List<DictionaryItem>>> getUnitTypes() => guard(
    () async => _sorted([
      for (final unitType in await _remote.getUnitTypes()) unitType.toItem(),
    ]),
  );

  @override
  Future<Either<Failure, List<DictionaryItem>>> getLayouts() => guard(
    () async => _sorted([
      for (final layout in await _remote.getLayouts()) layout.toItem(),
    ]),
  );

  /// Listy wyboru pokazujemy po nazwie — backend sortuje różnie.
  static List<DictionaryItem> _sorted(List<DictionaryItem> items) =>
      items..sort((a, b) => a.name.compareTo(b.name));
}
