import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/admin_user.dart';

part 'admin_user_model.freezed.dart';
part 'admin_user_model.g.dart';

/// Dane administratora zapisane w sesji.
@freezed
abstract class AdminUserModel with _$AdminUserModel {
  const AdminUserModel._();

  const factory AdminUserModel({
    required int id,
    @Default('') String email,
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String phoneNumber,
    @Default('') String company,
  }) = _AdminUserModel;

  factory AdminUserModel.fromJson(Map<String, dynamic> json) =>
      _$AdminUserModelFromJson(json);

  factory AdminUserModel.fromEntity(AdminUser user) => AdminUserModel(
    id: user.id,
    email: user.email,
    firstName: user.firstName,
    lastName: user.lastName,
    phoneNumber: user.phoneNumber,
    company: user.company,
  );

  AdminUser toEntity() => AdminUser(
    id: id,
    email: email,
    firstName: firstName,
    lastName: lastName,
    phoneNumber: phoneNumber,
    company: company,
  );
}
