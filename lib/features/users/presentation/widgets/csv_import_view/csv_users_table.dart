import 'package:flutter/material.dart';

import '../../../../../core/l10n/l10n.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_icons.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_data_table.dart';
import '../../../../../core/widgets/font_awesome_icon.dart';
import '../../../../../core/widgets/tap_area.dart';
import '../../../domain/entities/user_drafts.dart';
import '../users_list_view/sortable_column_header.dart';

/// Podgląd użytkowników wczytanych z pliku CSV (z podziałem na strony).
class CsvUsersTable extends StatelessWidget {
  const CsvUsersTable({
    super.key,
    required this.users,
    required this.sortedAscending,
    required this.onSort,
    required this.onEdit,
    required this.onDelete,
  });

  final List<CsvUser> users;

  /// `null`, dopóki nikt nie kliknął nagłówka kolumny.
  final bool? sortedAscending;
  final void Function({required bool ascending}) onSort;
  final void Function(int index) onEdit;
  final void Function(int index) onDelete;

  static const _cellStyle = AppTextStyles.bodySmall;
  static const _nameStyle = AppTextStyles.bodySemiBold;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AppDataTable<CsvUser>(
      rows: users,
      height: 300,
      paginated: true,
      columnSpacing: 5,
      columns: [
        DataColumn2(
          label: Text(l10n.usersColumnNumber, style: AppDataTable.headerStyle),
          fixedWidth: 40,
        ),
        DataColumn2(
          label: SortableColumnHeader(
            label: l10n.usersColumnName,
            sorted: sortedAscending != null,
            ascending: sortedAscending ?? true,
            onSort: onSort,
          ),
        ),
        DataColumn2(
          label: Text(l10n.usersColumnEmail, style: AppDataTable.headerStyle),
          fixedWidth: 200,
        ),
        DataColumn2(
          label: Text(l10n.usersColumnPhone, style: AppDataTable.headerStyle),
        ),
        DataColumn2(
          label: Text(l10n.usersColumnActions, style: AppDataTable.headerStyle),
          fixedWidth: 80,
        ),
      ],
      rowBuilder: (user, index) => [
        Text('${index + 1}', style: _cellStyle),
        Text(user.displayName, style: _nameStyle),
        Text(user.email, style: _cellStyle),
        Text(user.phoneNumber, style: _cellStyle),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TapArea(
              onTap: () => onEdit(index),
              child: const FontAwesomeIcon(
                AppIcons.edit,
                color: AppColors.accent1,
                size: 28,
              ),
            ),
            TapArea(
              onTap: () => onDelete(index),
              child: const Icon(
                Icons.delete,
                color: AppColors.accent3,
                size: 30,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
