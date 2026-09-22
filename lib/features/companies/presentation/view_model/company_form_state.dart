import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/company.dart';

part 'company_form_state.freezed.dart';

@freezed
sealed class CompanyFormState with _$CompanyFormState {
  const factory CompanyFormState.initial() = CompanyFormInitial;

  const factory CompanyFormState.emptyName() = CompanyFormEmptyName;

  const factory CompanyFormState.submitting() = CompanyFormSubmitting;

  const factory CompanyFormState.success(Company company) = CompanyFormSuccess;

  const factory CompanyFormState.failure(Failure failure) = CompanyFormFailure;
}
