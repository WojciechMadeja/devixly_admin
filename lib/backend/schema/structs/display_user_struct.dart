// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DisplayUserStruct extends BaseStruct {
  DisplayUserStruct({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    bool? isAdministrator,
    CompanyStruct? company,
    String? phoneNumber,
    bool? isBlocked,
  })  : _id = id,
        _firstName = firstName,
        _lastName = lastName,
        _email = email,
        _isAdministrator = isAdministrator,
        _company = company,
        _phoneNumber = phoneNumber,
        _isBlocked = isBlocked;

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

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "isAdministrator" field.
  bool? _isAdministrator;
  bool get isAdministrator => _isAdministrator ?? false;
  set isAdministrator(bool? val) => _isAdministrator = val;

  bool hasIsAdministrator() => _isAdministrator != null;

  // "company" field.
  CompanyStruct? _company;
  CompanyStruct get company => _company ?? CompanyStruct();
  set company(CompanyStruct? val) => _company = val;

  void updateCompany(Function(CompanyStruct) updateFn) {
    updateFn(_company ??= CompanyStruct());
  }

  bool hasCompany() => _company != null;

  // "phoneNumber" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  set phoneNumber(String? val) => _phoneNumber = val;

  bool hasPhoneNumber() => _phoneNumber != null;

  // "isBlocked" field.
  bool? _isBlocked;
  bool get isBlocked => _isBlocked ?? false;
  set isBlocked(bool? val) => _isBlocked = val;

  bool hasIsBlocked() => _isBlocked != null;

  static DisplayUserStruct fromMap(Map<String, dynamic> data) =>
      DisplayUserStruct(
        id: castToType<int>(data['id']),
        firstName: data['firstName'] as String?,
        lastName: data['lastName'] as String?,
        email: data['email'] as String?,
        isAdministrator: data['isAdministrator'] as bool?,
        company: data['company'] is CompanyStruct
            ? data['company']
            : CompanyStruct.maybeFromMap(data['company']),
        phoneNumber: data['phoneNumber'] as String?,
        isBlocked: data['isBlocked'] as bool?,
      );

  static DisplayUserStruct? maybeFromMap(dynamic data) => data is Map
      ? DisplayUserStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'firstName': _firstName,
        'lastName': _lastName,
        'email': _email,
        'isAdministrator': _isAdministrator,
        'company': _company?.toMap(),
        'phoneNumber': _phoneNumber,
        'isBlocked': _isBlocked,
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
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'isAdministrator': serializeParam(
          _isAdministrator,
          ParamType.bool,
        ),
        'company': serializeParam(
          _company,
          ParamType.DataStruct,
        ),
        'phoneNumber': serializeParam(
          _phoneNumber,
          ParamType.String,
        ),
        'isBlocked': serializeParam(
          _isBlocked,
          ParamType.bool,
        ),
      }.withoutNulls;

  static DisplayUserStruct fromSerializableMap(Map<String, dynamic> data) =>
      DisplayUserStruct(
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
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        isAdministrator: deserializeParam(
          data['isAdministrator'],
          ParamType.bool,
          false,
        ),
        company: deserializeStructParam(
          data['company'],
          ParamType.DataStruct,
          false,
          structBuilder: CompanyStruct.fromSerializableMap,
        ),
        phoneNumber: deserializeParam(
          data['phoneNumber'],
          ParamType.String,
          false,
        ),
        isBlocked: deserializeParam(
          data['isBlocked'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'DisplayUserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DisplayUserStruct &&
        id == other.id &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        email == other.email &&
        isAdministrator == other.isAdministrator &&
        company == other.company &&
        phoneNumber == other.phoneNumber &&
        isBlocked == other.isBlocked;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        firstName,
        lastName,
        email,
        isAdministrator,
        company,
        phoneNumber,
        isBlocked
      ]);
}

DisplayUserStruct createDisplayUserStruct({
  int? id,
  String? firstName,
  String? lastName,
  String? email,
  bool? isAdministrator,
  CompanyStruct? company,
  String? phoneNumber,
  bool? isBlocked,
}) =>
    DisplayUserStruct(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      isAdministrator: isAdministrator,
      company: company ?? CompanyStruct(),
      phoneNumber: phoneNumber,
      isBlocked: isBlocked,
    );
