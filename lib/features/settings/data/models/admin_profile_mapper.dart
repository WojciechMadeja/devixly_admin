import 'package:background_devixly_client/background_devixly_client.dart' as sp;

import '../../domain/entities/admin_profile.dart';

extension AdminProfileMapper on sp.AppUser {
  AdminProfile toProfile() => AdminProfile(
    id: id!,
    email: email ?? '',
    firstName: firstName,
    lastName: lastName,
    phoneNumber: phoneNumber,
    companyId: company?.id ?? companyId ?? 0,
    companyName: company?.name ?? '',
  );
}
