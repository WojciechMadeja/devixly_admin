// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends BaseStruct {
  UserStruct({
    int? id,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? email,
    int? refreshTokenId,
    DateTime? expireAt,
    String? company,
  })  : _id = id,
        _firstName = firstName,
        _lastName = lastName,
        _phoneNumber = phoneNumber,
        _email = email,
        _refreshTokenId = refreshTokenId,
        _expireAt = expireAt,
        _company = company;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "firstName" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  set firstName(String? val) => _firstName = val;

  bool hasFirstName() => _firstName != null;

  // "lastName" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  set lastName(String? val) => _lastName = val;

  bool hasLastName() => _lastName != null;

  // "phoneNumber" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  set phoneNumber(String? val) => _phoneNumber = val;

  bool hasPhoneNumber() => _phoneNumber != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "refreshTokenId" field.
  int? _refreshTokenId;
  int get refreshTokenId => _refreshTokenId ?? 0;
  set refreshTokenId(int? val) => _refreshTokenId = val;

  void incrementRefreshTokenId(int amount) =>
      refreshTokenId = refreshTokenId + amount;

  bool hasRefreshTokenId() => _refreshTokenId != null;

  // "expireAt" field.
  DateTime? _expireAt;
  DateTime? get expireAt => _expireAt;
  set expireAt(DateTime? val) => _expireAt = val;

  bool hasExpireAt() => _expireAt != null;

  // "company" field.
  String? _company;
  String get company => _company ?? '';
  set company(String? val) => _company = val;

  bool hasCompany() => _company != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        id: castToType<int>(data['id']),
        firstName: data['firstName'] as String?,
        lastName: data['lastName'] as String?,
        phoneNumber: data['phoneNumber'] as String?,
        email: data['email'] as String?,
        refreshTokenId: castToType<int>(data['refreshTokenId']),
        expireAt: data['expireAt'] as DateTime?,
        company: data['company'] as String?,
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'firstName': _firstName,
        'lastName': _lastName,
        'phoneNumber': _phoneNumber,
        'email': _email,
        'refreshTokenId': _refreshTokenId,
        'expireAt': _expireAt,
        'company': _company,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'firstName': serializeParam(
          _firstName,
          ParamType.String,
        ),
        'lastName': serializeParam(
          _lastName,
          ParamType.String,
        ),
        'phoneNumber': serializeParam(
          _phoneNumber,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'refreshTokenId': serializeParam(
          _refreshTokenId,
          ParamType.int,
        ),
        'expireAt': serializeParam(
          _expireAt,
          ParamType.DateTime,
        ),
        'company': serializeParam(
          _company,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        firstName: deserializeParam(
          data['firstName'],
          ParamType.String,
          false,
        ),
        lastName: deserializeParam(
          data['lastName'],
          ParamType.String,
          false,
        ),
        phoneNumber: deserializeParam(
          data['phoneNumber'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        refreshTokenId: deserializeParam(
          data['refreshTokenId'],
          ParamType.int,
          false,
        ),
        expireAt: deserializeParam(
          data['expireAt'],
          ParamType.DateTime,
          false,
        ),
        company: deserializeParam(
          data['company'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserStruct &&
        id == other.id &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        phoneNumber == other.phoneNumber &&
        email == other.email &&
        refreshTokenId == other.refreshTokenId &&
        expireAt == other.expireAt &&
        company == other.company;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        firstName,
        lastName,
        phoneNumber,
        email,
        refreshTokenId,
        expireAt,
        company
      ]);
}

UserStruct createUserStruct({
  int? id,
  String? firstName,
  String? lastName,
  String? phoneNumber,
  String? email,
  int? refreshTokenId,
  DateTime? expireAt,
  String? company,
}) =>
    UserStruct(
      id: id,
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      email: email,
      refreshTokenId: refreshTokenId,
      expireAt: expireAt,
      company: company,
    );
