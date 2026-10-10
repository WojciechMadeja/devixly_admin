import 'package:background_devixly_client/background_devixly_client.dart' as sp;

import '../../domain/entities/project_option.dart';

extension ProjectOptionMapper on sp.ProjectOption {
  ProjectOption toEntity() =>
      ProjectOption(id: id, externalId: externalId, name: name);
}
