import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/app_data_table.dart';

/// Nagłówek kolumny, po którym można sortować: kliknięcie sortuje rosnąco,
/// podwójne kliknięcie malejąco (jak w wersji FlutterFlow).
class SortableColumnHeader extends StatelessWidget {
  const SortableColumnHeader({
    super.key,
    required this.label,
    required this.sorted,
    required this.ascending,
    required this.onSort,
  });

  final String label;
  final bool sorted;
  final bool ascending;
  final void Function({required bool ascending}) onSort;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: () => onSort(ascending: true),
      onDoubleTap: () => onSort(ascending: false),
      child: Row(
        children: [
          Text(label, style: AppDataTable.headerStyle),
          if (sorted)
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Icon(
                ascending
                    ? Icons.keyboard_arrow_down_rounded
                    : Icons.keyboard_arrow_up_rounded,
                color: AppColors.secondaryBackground,
                size: 24,
              ),
            ),
        ],
      ),
    );
  }
}
