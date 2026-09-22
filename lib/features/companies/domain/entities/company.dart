import 'package:equatable/equatable.dart';

import '../../../../core/constants/business_rules.dart';
import 'company_draft.dart';

/// Firma (agencja) korzystająca z platformy.
class Company extends Equatable {
  const Company({
    required this.id,
    required this.name,
    this.email = '',
    this.address = '',
    this.postCode = '',
    this.city = '',
    this.phoneNumber = '',
    this.representative = '',
    this.agentsCount = 0,
    this.isBlocked = false,
  });

  final int id;
  final String name;
  final String email;
  final String address;
  final String postCode;
  final String city;
  final String phoneNumber;

  /// Przedstawiciel firmy.
  final String representative;

  /// Liczba agentów (użytkowników) firmy.
  final int agentsCount;
  final bool isBlocked;

  /// Firmy właściciela platformy nie można edytować, blokować ani usuwać.
  bool get isProtected => name == kProtectedOwnerName;

  CompanyDraft toDraft() => CompanyDraft(
    name: name,
    email: email,
    address: address,
    postCode: postCode,
    city: city,
    phoneNumber: phoneNumber,
    representative: representative,
  );

  Company copyWith({CompanyDraft? draft, bool? isBlocked}) => Company(
    id: id,
    name: draft?.name ?? name,
    email: draft?.email ?? email,
    address: draft?.address ?? address,
    postCode: draft?.postCode ?? postCode,
    city: draft?.city ?? city,
    phoneNumber: draft?.phoneNumber ?? phoneNumber,
    representative: draft?.representative ?? representative,
    agentsCount: agentsCount,
    isBlocked: isBlocked ?? this.isBlocked,
  );

  @override
  List<Object?> get props => [
    id,
    name,
    email,
    address,
    postCode,
    city,
    phoneNumber,
    representative,
    agentsCount,
    isBlocked,
  ];
}
