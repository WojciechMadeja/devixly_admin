import 'package:flutter/material.dart';

import '../../../../../core/l10n/l10n.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_data_table.dart';
import '../../../domain/entities/project_unit.dart';

/// Tabela jednostek projektu: numer, piętro, powierzchnia, cena, status,
/// typ i układ.
class UnitsTable extends StatelessWidget {
  const UnitsTable({super.key, required this.units});

  final List<ProjectUnit> units;

  static const _cellStyle = AppTextStyles.bodySmall;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    Widget header(String label) => Text(label, style: AppDataTable.headerStyle);
    return AppDataTable<ProjectUnit>(
      rows: units,
      height: 420,
      paginated: units.length > 10,
      columns: [
        DataColumn2(label: header(l10n.unitsColumnNumber), fixedWidth: 120),
        DataColumn2(label: header(l10n.unitsColumnFloor), fixedWidth: 90),
        DataColumn2(label: header(l10n.unitsColumnArea), fixedWidth: 130),
        DataColumn2(label: header(l10n.unitsColumnPrice)),
        DataColumn2(label: header(l10n.unitsColumnPricePer)),
        DataColumn2(label: header(l10n.unitsColumnStatus)),
        DataColumn2(label: header(l10n.unitsColumnType)),
        DataColumn2(label: header(l10n.unitsColumnLayout)),
      ],
      rowBuilder: (unit, index) => [
        Row(
          spacing: 5,
          children: [
            Flexible(
              child: Text(
                _text(context, unit.number),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.bodySemiBold,
              ),
            ),
            if (unit.isManual)
              Text(
                context.l10n.projectManualBadge,
                style: _cellStyle.copyWith(color: AppColors.secondaryText),
              ),
          ],
        ),
        _cell(context, unit.floor),
        _cell(context, _number(unit.area)),
        _cell(context, _number(unit.price)),
        _cell(context, _number(unit.pricePer)),
        _cell(context, unit.status),
        _cell(context, unit.typeName),
        _cell(context, unit.layoutName),
      ],
    );
  }

  static Widget _cell(BuildContext context, String value) => Text(
    _text(context, value),
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    style: _cellStyle,
  );

  static String _text(BuildContext context, String value) =>
      value.trim().isEmpty ? context.l10n.valueMissing : value;

  /// Liczby bez zbędnego ogona po przecinku (1000.0 → „1000”).
  static String _number(num? value) => switch (value) {
    null => '',
    final int value => '$value',
    final value when value == value.roundToDouble() => '${value.round()}',
    final value => value.toStringAsFixed(2),
  };
}
