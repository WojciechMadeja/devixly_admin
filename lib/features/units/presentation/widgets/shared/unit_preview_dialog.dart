import 'package:flutter/material.dart';

import '../../../../../core/l10n/l10n.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/dialogs/dialog_card.dart';
import '../../../../../core/widgets/image_gallery.dart';
import '../../../domain/entities/project_unit.dart';

/// Podgląd jednostki: dane z tabeli w czytelnej formie i rzuty.
class UnitPreviewDialog extends StatelessWidget {
  const UnitPreviewDialog({super.key, required this.unit});

  final ProjectUnit unit;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return DialogCard(
      constraints: const BoxConstraints(minWidth: 320, maxWidth: 560),
      spacing: 15,
      children: [
        Text(
          unit.number.isEmpty ? l10n.projectDetailsUnits : unit.number,
          style: AppTextStyles.dialogTitle,
        ),
        _Row(label: l10n.unitsColumnFloor, value: unit.floor),
        _Row(label: l10n.unitsColumnArea, value: _number(unit.area)),
        _Row(label: l10n.unitsColumnPrice, value: _number(unit.price)),
        _Row(label: l10n.unitsColumnPricePer, value: _number(unit.pricePer)),
        _Row(label: l10n.unitsColumnStatus, value: unit.status),
        _Row(label: l10n.unitsColumnType, value: unit.typeName),
        _Row(label: l10n.unitsColumnLayout, value: unit.layoutName),
        ImageGallery(urls: unit.layoutUrls, emptyLabel: l10n.unitNoLayouts),
        DialogActions(
          children: [
            AppButton(
              label: l10n.commonClose,
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ],
    );
  }

  /// Liczby bez zbędnego ogona po przecinku (1000.0 → „1000”).
  static String _number(num? value) => switch (value) {
    null => '',
    final int value => '$value',
    final value when value == value.roundToDouble() => '${value.round()}',
    final value => value.toStringAsFixed(2),
  };
}

class _Row extends StatelessWidget {
  const _Row({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final text = value.trim().isEmpty ? context.l10n.valueMissing : value;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        SizedBox(
          width: 150,
          child: Text(label, style: AppTextStyles.bodySemiBold),
        ),
        Expanded(
          child: Text(
            text,
            style: AppTextStyles.input.copyWith(color: AppColors.secondaryText),
          ),
        ),
      ],
    );
  }
}
