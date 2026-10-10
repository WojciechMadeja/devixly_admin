import 'package:flutter/material.dart';

import '../../../../../core/widgets/dialogs/searchable_picker_dialog.dart';
import '../../../../../core/widgets/dialogs/show_app_dialog.dart';
import '../../../../../core/widgets/picker_field.dart';
import '../../../domain/entities/dictionary_item.dart';

/// Pole wyboru pozycji słownika (dzielnica, deweloper, typ jednostki,
/// układ) z wyszukiwaniem po nazwie.
class LookupPickerField extends StatelessWidget {
  const LookupPickerField({
    super.key,
    required this.items,
    required this.selected,
    required this.placeholder,
    required this.onSelected,
    this.loading = false,
    this.width = 250,
  });

  final List<DictionaryItem> items;
  final DictionaryItem? selected;
  final String placeholder;
  final ValueChanged<DictionaryItem> onSelected;

  /// Słownik jeszcze się pobiera.
  final bool loading;
  final double? width;

  Future<void> _openPicker(BuildContext context) async {
    final item = await showAppDialog<DictionaryItem>(
      context,
      builder: (_) => SearchablePickerDialog<DictionaryItem>(
        items: items,
        labelOf: (item) => item.name,
        matches: (item, query) =>
            item.name.toLowerCase().contains(query.trim().toLowerCase()),
      ),
    );
    if (item != null) onSelected(item);
  }

  @override
  Widget build(BuildContext context) {
    return PickerField(
      value: selected?.name,
      placeholder: placeholder,
      loading: loading,
      width: width,
      onTap: () => _openPicker(context),
    );
  }
}
