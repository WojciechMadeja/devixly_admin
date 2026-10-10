import 'package:flutter/material.dart';

import '../../l10n/l10n.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../app_text_field.dart';
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
    borderRadius: BorderRadius.all(Radius.circular(20)),
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
      width: 360,
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
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: AppTextField(
                controller: _search,
                hintText: widget.searchHint ?? l10n.pickerSearchHint,
                onChanged: (value) => setState(() => _query = value),
              ),
            ),
            if (found.isEmpty)
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 25),
                child: Text(
                  widget.emptyLabel ?? l10n.pickerNoResults,
                  textAlign: TextAlign.center,
                  style: emptyStyle,
                ),
              )
            else
              Flexible(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 10,
                    children: [
                      for (final item in found)
                        TapArea(
                          // Nazwy bywają takie same (np. dwa etapy tej
                          // samej inwestycji), więc kluczem jest pozycja,
                          // a nie jej podpis.
                          key: ObjectKey(item),
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

  static const _shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
  );

  @override
  Widget build(BuildContext context) {
    final subtitle = widget.subtitle;
    return MouseRegion(
      opaque: false,
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: EdgeInsets.zero,
        color: _hovered ? AppColors.tertiary : AppColors.primaryBackground,
        elevation: 4,
        shape: _shape,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 2,
            children: [
              Text(
                widget.label,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: AppTextStyles.bodySemiBold,
              ),
              if (subtitle != null)
                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.secondaryText,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
