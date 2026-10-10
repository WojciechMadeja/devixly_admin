import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';
import '../entities/dictionary_item.dart';

/// Słowniki backendu używane w formularzach projektu i jednostki.
abstract interface class LookupsRepository {
  Future<Either<Failure, List<DictionaryItem>>> getDistricts();

  Future<Either<Failure, List<DictionaryItem>>> getDevelopers();

  Future<Either<Failure, List<DictionaryItem>>> getUnitTypes();

  Future<Either<Failure, List<DictionaryItem>>> getLayouts();
}
