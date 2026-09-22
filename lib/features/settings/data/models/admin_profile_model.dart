import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/json_readers.dart';
import '../../domain/entities/admin_profile.dart';

part 'admin_profile_model.freezed.dart';
part 'admin_profile_model.g.dart';

/// Odpowiedź `GET /user/{id}` i `PUT /user/{id}`.
@freezed
abstract class AdminProfileModel with _$AdminProfileModel {
  const AdminProfileModel._();

  const factory AdminProfileModel({
    required int id,
    @JsonKey(fromJson: stringFromJson) @Default('') String email,
    @JsonKey(name: 'first_name', fromJson: stringFromJson)
    @Default('')
    String firstName,
    @JsonKey(name: 'last_name', fromJson: stringFromJson)
    @Default('')
    String lastName,
    @JsonKey(name: 'phone_number', fromJson: stringFromJson)
    @Default('')
    String phoneNumber,
    ProfileCompanyModel? company,
  }) = _AdminProfileModel;

  factory AdminProfileModel.fromJson(Map<String, dynamic> json) =>
      _$AdminProfileModelFromJson(json);

  AdminProfile toEntity() => AdminProfile(
        id: id,
        email: email,
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        companyId: company?.id ?? 0,
        companyName: company?.name ?? '',
      );
}

/// Firma administratora w odpowiedzi o użytkowniku.
@freezed
abstract class ProfileCompanyModel with _$ProfileCompanyModel {
  const factory ProfileCompanyModel({
    required int id,
    @JsonKey(fromJson: stringFromJson) @Default('') String name,
  }) = _ProfileCompanyModel;

  factory ProfileCompanyModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileCompanyModelFromJson(json);
}
