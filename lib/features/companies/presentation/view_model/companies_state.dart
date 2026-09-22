import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/company.dart';

part 'companies_state.freezed.dart';

@freezed
sealed class CompaniesState with _$CompaniesState {
  const factory CompaniesState.loading() = CompaniesLoading;

  /// Firmy w kolejności z API; [selectedId] to zaznaczona karta.
  const factory CompaniesState.loaded({
    required List<Company> companies,
    int? selectedId,
  }) = CompaniesLoaded;

  const factory CompaniesState.error(Failure failure) = CompaniesError;
}
