import 'package:background_devixly_client/background_devixly_client.dart' as sp;

import '../../domain/entities/project_unit.dart';

extension UnitMapper on sp.Unit {
  /// Nazwy typu i układu pokazujemy po polsku, gdy backend ma tłumaczenie.
  ProjectUnit toEntity() => ProjectUnit(
    id: id!,
    externalId: externalId,
    number: number ?? '',
    floor: floor ?? '',
    status: status ?? '',
    typeName: switch (unitType) {
      final type? => type.namePl ?? type.nameEn,
      null => '',
    },
    layoutName: switch (layout) {
      final layout? => layout.namePl ?? layout.nameEn,
      null => '',
    },
    price: price,
    pricePer: pricePer,
    area: area,
  );
}
