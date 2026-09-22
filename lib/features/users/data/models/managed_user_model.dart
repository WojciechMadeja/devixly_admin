import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/json_readers.dart';
import '../../domain/entities/managed_user.dart';
import '../../domain/entities/user_company.dart';

part 'managed_user_model.freezed.dart';
part 'managed_user_model.g.dart';

@freezed
abstract class ManagedUserModel with _$ManagedUserModel {
  const ManagedUserModel._();

  const factory ManagedUserModel({
    required int id,
    @JsonKey(name: 'first_name', fromJson: stringFromJson)
    @Default('')
    String firstName,
    @JsonKey(name: 'last_name', fromJson: stringFromJson)
    @Default('')
    String lastName,
    @JsonKey(fromJson: stringFromJson) @Default('') String email,
    @JsonKey(name: 'phone_number', fromJson: stringFromJson)
    @Default('')
    String phoneNumber,
    @JsonKey(name: 'is_administrator') @Default(false) bool isAdministrator,
    @JsonKey(name: 'is_blocked') @Default(false) bool isBlocked,
    UserCompanyModel? company,
  }) = _ManagedUserModel;

  factory ManagedUserModel.fromJson(Map<String, dynamic> json) =>
      _$ManagedUserModelFromJson(json);

  ManagedUser toEntity() => ManagedUser(
        id: id,
        firstName: firstName,
        lastName: lastName,
        email: email,
        phoneNumber: phoneNumber,
        isAdministrator: isAdministrator,
        isBlocked: isBlocked,
        company: company?.toEntity() ?? const UserCompany(id: 0, name: ''),
      );
}

@freezed
abstract class UserCompanyModel with _$UserCompanyModel {
  const UserCompanyModel._();

  const factory UserCompanyModel({
    required int id,
    @JsonKey(fromJson: stringFromJson) @Default('') String name,
    @JsonKey(name: 'is_blocked') @Default(false) bool isBlocked,
  }) = _UserCompanyModel;

  factory UserCompanyModel.fromJson(Map<String, dynamic> json) =>
      _$UserCompanyModelFromJson(json);

  UserCompany toEntity() =>
      UserCompany(id: id, name: name, isBlocked: isBlocked);
}
