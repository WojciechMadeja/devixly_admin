import 'package:background_devixly_client/background_devixly_client.dart' as sp;

import '../../domain/entities/dictionary_item.dart';

/// Nazwy słowników: po polsku, jeśli backend ma tłumaczenie.
extension DistrictMapper on sp.District {
  DictionaryItem toItem() => DictionaryItem(id: id!, name: name);
}

extension DeveloperMapper on sp.Developer {
  DictionaryItem toItem() => DictionaryItem(id: id!, name: name);
}

extension UnitTypeMapper on sp.UnitType {
  DictionaryItem toItem() => DictionaryItem(id: id!, name: namePl ?? nameEn);
}

extension LayoutMapper on sp.Layout {
  DictionaryItem toItem() => DictionaryItem(id: id!, name: namePl ?? nameEn);
}
