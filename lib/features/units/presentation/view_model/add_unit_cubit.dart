import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/state/submission_status.dart';
import '../../domain/entities/unit_draft.dart';
import '../../domain/repositories/units_repository.dart';

/// Formularz „Dodaj jednostkę”. Stanem jest sam status zapisu — ekran nie
/// pobiera żadnych danych.
class AddUnitCubit extends Cubit<SubmissionStatus> {
  AddUnitCubit(this._units) : super(const SubmissionStatus.idle());

  final UnitsRepository _units;

  Future<void> submit({
    required String apartmentNumber,
    required String price,
    required String ownerLastName,
    required String phoneNumber,
  }) async {
    if (state is Submitting) return;
    if (apartmentNumber.trim().isEmpty ||
        price.trim().isEmpty ||
        ownerLastName.trim().isEmpty ||
        phoneNumber.trim().isEmpty) {
      _finish(const SubmissionStatus.failure(ValidationFailure()));
      return;
    }
    emit(const SubmissionStatus.submitting());
    final result = await _units.addUnit(
      UnitDraft(
        apartmentNumber: apartmentNumber.trim(),
        price: price.trim(),
        ownerLastName: ownerLastName.trim(),
        phoneNumber: phoneNumber.trim(),
      ),
    );
    if (isClosed) return;
    _finish(
      result.match(
        SubmissionStatus.failure,
        (_) => const SubmissionStatus.success(),
      ),
    );
  }

  /// Zgłasza wynik zapisu i wraca do stanu `idle`, żeby ten sam komunikat
  /// mógł pojawić się przy kolejnej próbie.
  void _finish(SubmissionStatus result) {
    emit(result);
    emit(const SubmissionStatus.idle());
  }
}
