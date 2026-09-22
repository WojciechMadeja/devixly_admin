import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/json_readers.dart';
import '../../domain/entities/company.dart';
import '../../domain/entities/company_draft.dart';

part 'company_model.freezed.dart';
part 'company_model.g.dart';

@freezed
abstract class CompanyModel with _$CompanyModel {
  const CompanyModel._();

  const factory CompanyModel({
    required int id,
    @Default('') String name,
    @JsonKey(fromJson: stringFromJson) @Default('') String email,
    @JsonKey(fromJson: stringFromJson) @Default('') String address,
    @JsonKey(name: 'post_code', fromJson: stringFromJson)
    @Default('')
    String postCode,
    @JsonKey(fromJson: stringFromJson) @Default('') String city,
    @JsonKey(name: 'phone_number', fromJson: stringFromJson)
    @Default('')
    String phoneNumber,
    @JsonKey(name: 'company_representative', fromJson: stringFromJson)
    @Default('')
    String representative,
    @JsonKey(name: 'number_of_agents') @Default(0) int agentsCount,
    @JsonKey(name: 'is_blocked') @Default(false) bool isBlocked,
  }) = _CompanyModel;

  factory CompanyModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyModelFromJson(json);

  Company toEntity() => Company(
        id: id,
        name: name,
        email: email,
        address: address,
        postCode: postCode,
        city: city,
        phoneNumber: phoneNumber,
        representative: representative,
        agentsCount: agentsCount,
        isBlocked: isBlocked,
      );

  /// Pola formularza w formacie API (wspólne dla dodawania i edycji).
  static Map<String, Object?> draftToJson(CompanyDraft draft) => {
        'name': draft.name,
        'email': draft.email,
        'address': draft.address,
        'post_code': draft.postCode,
        'city': draft.city,
        'phone_number': draft.phoneNumber,
        'company_representative': draft.representative,
      };
}
