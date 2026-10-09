import 'package:background_devixly_client/background_devixly_client.dart' as sp;

import '../../domain/entities/company.dart';

extension CompanyMapper on sp.Company {
  Company toEntity() => Company(
    id: id!,
    name: name,
    email: email ?? '',
    address: address ?? '',
    postCode: postCode ?? '',
    city: city ?? '',
    phoneNumber: phoneNumber ?? '',
    representative: companyRepresentative ?? '',
    agentsCount: numberOfUsers ?? 0,
    isBlocked: isBlocked,
  );
}
