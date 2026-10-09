import 'package:background_devixly_client/background_devixly_client.dart' as sp;

import '../../domain/entities/managed_user.dart';
import '../../domain/entities/user_company.dart';

extension ManagedUserMapper on sp.AppUser {
  ManagedUser toEntity() => ManagedUser(
    id: id!,
    firstName: firstName,
    lastName: lastName,
    email: email ?? '',
    phoneNumber: phoneNumber,
    isAdministrator: isAdministrator,
    isBlocked: isBlocked,
    company: switch (company) {
      final company? => UserCompany(
        id: company.id!,
        name: company.name,
        isBlocked: company.isBlocked,
      ),
      null => const UserCompany(id: 0, name: ''),
    },
  );
}
