import 'package:background_devixly_client/background_devixly_client.dart' as sp;

import '../../domain/entities/category.dart';

extension CategoryMapper on sp.Category {
  Category toEntity() =>
      Category(id: id!, name: name, newsCount: numberOfNews ?? 0);
}
