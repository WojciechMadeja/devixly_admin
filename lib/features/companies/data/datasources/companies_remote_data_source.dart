import '../../../../core/config/api_config.dart';
import '../../../../core/network/authorized_api_client.dart';
import '../../../../core/network/current_admin.dart';
import '../../../../core/network/json_body.dart';
import '../../domain/entities/company_draft.dart';
import '../models/company_model.dart';

abstract interface class CompaniesRemoteDataSource {
  Future<List<CompanyModel>> getCompanies();

  Future<CompanyModel> addCompany(CompanyDraft draft);

  Future<void> updateCompany(int id, CompanyDraft draft);

  Future<void> setBlocked(int id, bool blocked);

  Future<void> deleteCompany(int id);
}

class CompaniesRemoteDataSourceImpl implements CompaniesRemoteDataSource {
  CompaniesRemoteDataSourceImpl(this._client, this._admin);

  final AuthorizedApiClient _client;
  final CurrentAdmin _admin;

  static const _companies = '${XanoApiGroup.companies}/companies';

  @override
  Future<List<CompanyModel>> getCompanies() async {
    final json = await _client.get(_companies);
    return json.asJsonList().map(CompanyModel.fromJson).toList();
  }

  @override
  Future<CompanyModel> addCompany(CompanyDraft draft) async {
    final json = await _client.post(
      _companies,
      body: CompanyModel.draftToJson(draft),
    );
    return CompanyModel.fromJson(json.asJsonObject());
  }

  @override
  Future<void> updateCompany(int id, CompanyDraft draft) => _client.patch(
    '$_companies/$id',
    body: {'companies_id': id, ...CompanyModel.draftToJson(draft)},
  );

  @override
  Future<void> setBlocked(int id, bool blocked) => _client.patch(
    '$_companies/block/$id',
    body: {
      'companies_id': id,
      'admin_email': _admin.email,
      'is_blocked': blocked,
    },
  );

  @override
  Future<void> deleteCompany(int id) => _client.delete('$_companies/$id');
}
