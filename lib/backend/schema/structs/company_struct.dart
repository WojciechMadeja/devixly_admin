// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompanyStruct extends BaseStruct {
  CompanyStruct({
    int? id,
    String? name,
    String? email,
    String? address,
    String? postCode,
    String? city,
    String? phoneNumber,
    String? companyRepresentative,
    int? numberOfMembers,
    bool? isBlocked,
    int? admin,
  })  : _id = id,
        _name = name,
        _email = email,
        _address = address,
        _postCode = postCode,
        _city = city,
        _phoneNumber = phoneNumber,
        _companyRepresentative = companyRepresentative,
        _numberOfMembers = numberOfMembers,
        _isBlocked = isBlocked,
        _admin = admin;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;

  bool hasAddress() => _address != null;

  // "postCode" field.
  String? _postCode;
  String get postCode => _postCode ?? '';
  set postCode(String? val) => _postCode = val;

  bool hasPostCode() => _postCode != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;

  bool hasCity() => _city != null;

  // "phoneNumber" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  set phoneNumber(String? val) => _phoneNumber = val;

  bool hasPhoneNumber() => _phoneNumber != null;

  // "companyRepresentative" field.
  String? _companyRepresentative;
  String get companyRepresentative => _companyRepresentative ?? '';
  set companyRepresentative(String? val) => _companyRepresentative = val;

  bool hasCompanyRepresentative() => _companyRepresentative != null;

  // "numberOfMembers" field.
  int? _numberOfMembers;
  int get numberOfMembers => _numberOfMembers ?? 0;
  set numberOfMembers(int? val) => _numberOfMembers = val;

  void incrementNumberOfMembers(int amount) =>
      numberOfMembers = numberOfMembers + amount;

  bool hasNumberOfMembers() => _numberOfMembers != null;

  // "isBlocked" field.
  bool? _isBlocked;
  bool get isBlocked => _isBlocked ?? false;
  set isBlocked(bool? val) => _isBlocked = val;

  bool hasIsBlocked() => _isBlocked != null;

  // "admin" field.
  int? _admin;
  int get admin => _admin ?? 0;
  set admin(int? val) => _admin = val;

  void incrementAdmin(int amount) => admin = admin + amount;

  bool hasAdmin() => _admin != null;

  static CompanyStruct fromMap(Map<String, dynamic> data) => CompanyStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        email: data['email'] as String?,
        address: data['address'] as String?,
        postCode: data['postCode'] as String?,
        city: data['city'] as String?,
        phoneNumber: data['phoneNumber'] as String?,
        companyRepresentative: data['companyRepresentative'] as String?,
        numberOfMembers: castToType<int>(data['numberOfMembers']),
        isBlocked: data['isBlocked'] as bool?,
        admin: castToType<int>(data['admin']),
      );

  static CompanyStruct? maybeFromMap(dynamic data) =>
      data is Map ? CompanyStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'email': _email,
        'address': _address,
        'postCode': _postCode,
        'city': _city,
        'phoneNumber': _phoneNumber,
        'companyRepresentative': _companyRepresentative,
        'numberOfMembers': _numberOfMembers,
        'isBlocked': _isBlocked,
        'admin': _admin,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
        'postCode': serializeParam(
          _postCode,
          ParamType.String,
        ),
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
        'phoneNumber': serializeParam(
          _phoneNumber,
          ParamType.String,
        ),
        'companyRepresentative': serializeParam(
          _companyRepresentative,
          ParamType.String,
        ),
        'numberOfMembers': serializeParam(
          _numberOfMembers,
          ParamType.int,
        ),
        'isBlocked': serializeParam(
          _isBlocked,
          ParamType.bool,
        ),
        'admin': serializeParam(
          _admin,
          ParamType.int,
        ),
      }.withoutNulls;

  static CompanyStruct fromSerializableMap(Map<String, dynamic> data) =>
      CompanyStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
        postCode: deserializeParam(
          data['postCode'],
          ParamType.String,
          false,
        ),
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
        phoneNumber: deserializeParam(
          data['phoneNumber'],
          ParamType.String,
          false,
        ),
        companyRepresentative: deserializeParam(
          data['companyRepresentative'],
          ParamType.String,
          false,
        ),
        numberOfMembers: deserializeParam(
          data['numberOfMembers'],
          ParamType.int,
          false,
        ),
        isBlocked: deserializeParam(
          data['isBlocked'],
          ParamType.bool,
          false,
        ),
        admin: deserializeParam(
          data['admin'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'CompanyStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CompanyStruct &&
        id == other.id &&
        name == other.name &&
        email == other.email &&
        address == other.address &&
        postCode == other.postCode &&
        city == other.city &&
        phoneNumber == other.phoneNumber &&
        companyRepresentative == other.companyRepresentative &&
        numberOfMembers == other.numberOfMembers &&
        isBlocked == other.isBlocked &&
        admin == other.admin;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        name,
        email,
        address,
        postCode,
        city,
        phoneNumber,
        companyRepresentative,
        numberOfMembers,
        isBlocked,
        admin
      ]);
}

CompanyStruct createCompanyStruct({
  int? id,
  String? name,
  String? email,
  String? address,
  String? postCode,
  String? city,
  String? phoneNumber,
  String? companyRepresentative,
  int? numberOfMembers,
  bool? isBlocked,
  int? admin,
}) =>
    CompanyStruct(
      id: id,
      name: name,
      email: email,
      address: address,
      postCode: postCode,
      city: city,
      phoneNumber: phoneNumber,
      companyRepresentative: companyRepresentative,
      numberOfMembers: numberOfMembers,
      isBlocked: isBlocked,
      admin: admin,
    );
