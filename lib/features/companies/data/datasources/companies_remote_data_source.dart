import 'package:background_devixly_client/background_devixly_client.dart';

import '../../../../core/network/backend_call.dart';
import '../../domain/entities/company_draft.dart';

abstract interface class CompaniesRemoteDataSource {
  Future<List<Company>> getCompanies();

  Future<Company> addCompany(CompanyDraft draft);

  Future<void> updateCompany(int id, CompanyDraft draft);

  Future<void> setBlocked(int id, bool blocked);

  Future<void> deleteCompany(int id);
}

/// Firmy w backendzie (`CompanyEndpoint`).
class CompaniesRemoteDataSourceImpl implements CompaniesRemoteDataSource {
  CompaniesRemoteDataSourceImpl(this._client);

  final Client _client;

  @override
  Future<List<Company>> getCompanies() => backendCall(_client.company.list);

  @override
  Future<Company> addCompany(CompanyDraft draft) =>
      backendCall(() => _client.company.create(_input(draft)));

  /// Backend przy zapisie zastępuje wszystkie pola firmy, więc te, których
  /// formularz nie edytuje (administrator firmy, blokada), są najpierw
  /// odczytywane i odsyłane bez zmian.
  @override
  Future<void> updateCompany(int id, CompanyDraft draft) => backendCall(
    () async {
      final existing = await _client.company.getById(id);
      if (existing == null) throw CompanyNotFoundException(id: id);
      await _client.company.update(
        id,
        _input(draft, adminId: existing.adminId, isBlocked: existing.isBlocked),
      );
    },
  );

  @override
  Future<void> setBlocked(int id, bool blocked) =>
      backendCall(() => _client.company.setBlocked(id, blocked));

  @override
  Future<void> deleteCompany(int id) =>
      backendCall(() => _client.company.delete(id));

  /// Puste pola formularza zapisujemy jako brak wartości — e-mail firmy
  /// jest unikalny, więc dwa puste teksty by się wykluczały.
  static CompanyInput _input(
    CompanyDraft draft, {
    int? adminId,
    bool isBlocked = false,
  }) => CompanyInput(
    name: draft.name,
    email: _orNull(draft.email),
    address: _orNull(draft.address),
    postCode: _orNull(draft.postCode),
    city: _orNull(draft.city),
    phoneNumber: _orNull(draft.phoneNumber),
    companyRepresentative: _orNull(draft.representative),
    adminId: adminId,
    isBlocked: isBlocked,
  );

  static String? _orNull(String value) =>
      value.trim().isEmpty ? null : value.trim();
}
