import 'package:flutter/material.dart';

import '../../l10n/l10n.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../app_text_field.dart';
import '../list_card.dart';
import '../tap_area.dart';

/// Lista wyboru z wyszukiwarką — dla słowników i projektów, których bywa
/// za dużo, by przewijać je wzrokiem. Zamyka się z wybraną pozycją.
class SearchablePickerDialog<T> extends StatefulWidget {
  const SearchablePickerDialog({
    super.key,
    required this.items,
    required this.labelOf,
    required this.matches,
    this.subtitleOf,
    this.searchHint,
    this.emptyLabel,
  });

  final List<T> items;
  final String Function(T item) labelOf;

  /// Czy pozycja pasuje do wpisanego tekstu.
  final bool Function(T item, String query) matches;

  /// Drugi wiersz pozycji, np. numer projektu.
  final String Function(T item)? subtitleOf;
  final String? searchHint;
  final String? emptyLabel;

  @override
  State<SearchablePickerDialog<T>> createState() =>
      _SearchablePickerDialogState<T>();
}

class _SearchablePickerDialogState<T> extends State<SearchablePickerDialog<T>> {
  final _search = TextEditingController();
  String _query = '';

  static const _shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final emptyStyle = AppTextStyles.bodySemiBold.copyWith(
      color: AppColors.secondaryText,
    );
    final found = [
      for (final item in widget.items)
        if (widget.matches(item, _query)) item,
    ];
    return Container(
      width: 320,
      constraints: const BoxConstraints(maxHeight: 700),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: AppColors.secondaryBackground,
        elevation: 4,
        shape: _shape,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: AppTextField(
                controller: _search,
                hintText: widget.searchHint ?? l10n.pickerSearchHint,
                onChanged: (value) => setState(() => _query = value),
              ),
            ),
            if (found.isEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Text(
                  widget.emptyLabel ?? l10n.pickerNoResults,
                  style: emptyStyle,
                ),
              )
            else
              Flexible(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 5,
                    children: [
                      for (final item in found)
                        TapArea(
                          key: ValueKey(widget.labelOf(item)),
                          onTap: () => Navigator.pop(context, item),
                          child: _PickerCard(
                            label: widget.labelOf(item),
                            subtitle: widget.subtitleOf?.call(item),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _PickerCard extends StatefulWidget {
  const _PickerCard({required this.label, this.subtitle});

  final String label;
  final String? subtitle;

  @override
  State<_PickerCard> createState() => _PickerCardState();
}

class _PickerCardState extends State<_PickerCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final subtitle = widget.subtitle;
    return MouseRegion(
      opaque: false,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: ListCard(
        color: _hovered ? AppColors.tertiary : AppColors.primaryBackground,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodySemiBold,
            ),
            if (subtitle != null)
              Text(
                subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.bodySmall,
              ),
          ],
        ),
      ),
    );
  }
}
