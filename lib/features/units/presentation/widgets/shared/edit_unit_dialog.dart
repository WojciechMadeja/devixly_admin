import 'package:flutter/material.dart';

import '../../../../../core/l10n/l10n.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../../../core/widgets/dialogs/dialog_card.dart';
import '../../../../lookups/domain/entities/dictionary_item.dart';
import '../../../../lookups/presentation/widgets/shared/lookup_picker_field.dart';
import '../../../domain/entities/project_unit.dart';
import '../../../domain/entities/unit_draft.dart';

/// Edycja jednostki projektu. [onSave] zapisuje i zwraca, czy się udało —
/// dialog zamyka się tylko przy powodzeniu.
class EditUnitDialog extends StatefulWidget {
  const EditUnitDialog({
    super.key,
    required this.unit,
    required this.projectId,
    required this.unitTypes,
    required this.layouts,
    required this.onSave,
  });

  final ProjectUnit unit;
  final int projectId;
  final List<DictionaryItem> unitTypes;
  final List<DictionaryItem> layouts;
  final Future<bool> Function(UnitDraft draft) onSave;

  @override
  State<EditUnitDialog> createState() => _EditUnitDialogState();
}

class _EditUnitDialogState extends State<EditUnitDialog> {
  late final _number = TextEditingController(text: widget.unit.number);
  late final _price = TextEditingController(text: _text(widget.unit.price));
  late final _area = TextEditingController(text: _text(widget.unit.area));
  late final _floor = TextEditingController(text: widget.unit.floor);
  late final _status = TextEditingController(text: widget.unit.status);
  late final _height = TextEditingController(text: widget.unit.height);
  late final _typeOfSale = TextEditingController();
  late DictionaryItem? _unitType = _itemByName(
    widget.unitTypes,
    widget.unit.typeName,
  );
  late DictionaryItem? _layout = _itemByName(
    widget.layouts,
    widget.unit.layoutName,
  );
  bool _isSaving = false;

  List<TextEditingController> get _controllers => [
    _number,
    _price,
    _area,
    _floor,
    _status,
    _height,
    _typeOfSale,
  ];

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> _save() async {
    setState(() => _isSaving = true);
    final saved = await widget.onSave(
      UnitDraft(
        projectId: widget.projectId,
        number: _orNull(_number.text),
        price: int.tryParse(_price.text.trim()),
        area: double.tryParse(_area.text.trim().replaceAll(',', '.')),
        floor: _orNull(_floor.text),
        status: _orNull(_status.text),
        height: _orNull(_height.text),
        typeOfSale: _orNull(_typeOfSale.text),
        unitTypeId: _unitType?.id,
        layoutId: _layout?.id,
      ),
    );
    if (!mounted) return;
    if (saved) {
      Navigator.pop(context);
    } else {
      setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return DialogCard(
      constraints: const BoxConstraints(minWidth: 320, maxWidth: 420),
      spacing: 15,
      children: [
        Text(l10n.unitEditTitle, style: AppTextStyles.dialogTitle),
        if (!widget.unit.isManual)
          Text(
            l10n.unitSyncedWarning,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodySmall.copyWith(color: AppColors.accent1),
          ),
        _Field(controller: _number, hint: l10n.unitApartmentNumberHint),
        _Field(
          controller: _price,
          hint: l10n.unitPriceHint,
          keyboardType: TextInputType.number,
        ),
        _Field(
          controller: _area,
          hint: l10n.unitAreaHint,
          keyboardType: TextInputType.number,
        ),
        _Field(controller: _floor, hint: l10n.unitFloorHint),
        _Field(controller: _status, hint: l10n.unitStatusHint),
        _Field(controller: _height, hint: l10n.unitHeightHint),
        _Field(controller: _typeOfSale, hint: l10n.unitTypeOfSaleHint),
        LookupPickerField(
          items: widget.unitTypes,
          selected: _unitType,
          placeholder: l10n.unitTypePlaceholder,
          onSelected: (item) => setState(() => _unitType = item),
        ),
        LookupPickerField(
          items: widget.layouts,
          selected: _layout,
          placeholder: l10n.unitLayoutPlaceholder,
          onSelected: (item) => setState(() => _layout = item),
        ),
        DialogActions(
          children: [
            AppButton(
              label: l10n.commonCancel,
              color: AppColors.accent3,
              onPressed: () => Navigator.pop(context),
            ),
            AppButton(
              label: l10n.commonSave,
              color: AppColors.accent2,
              isLoading: _isSaving,
              onPressed: _save,
            ),
          ],
        ),
      ],
    );
  }

  static String? _orNull(String value) =>
      value.trim().isEmpty ? null : value.trim();

  static String _text(num? value) => switch (value) {
    null => '',
    final int value => '$value',
    final value when value == value.roundToDouble() => '${value.round()}',
    final value => value.toString(),
  };

  /// Lista jednostek podaje nazwy słowników, nie ich id.
  static DictionaryItem? _itemByName(List<DictionaryItem> items, String name) {
    if (name.isEmpty) return null;
    for (final item in items) {
      if (item.name == name) return item;
    }
    return null;
  }
}

class _Field extends StatelessWidget {
  const _Field({
    required this.controller,
    required this.hint,
    this.keyboardType,
  });

  final TextEditingController controller;
  final String hint;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: AppTextField(
        controller: controller,
        hintText: hint,
        keyboardType: keyboardType,
      ),
    );
  }
}
