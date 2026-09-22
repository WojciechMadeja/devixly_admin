import 'package:flutter/material.dart';

import '../../../../../core/l10n/l10n.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_icons.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_data_table.dart';
import '../../../../../core/widgets/font_awesome_icon.dart';
import '../../../../../core/widgets/tap_area.dart';
import '../../../domain/entities/managed_user.dart';
import '../../../domain/entities/user_sort.dart';
import 'sortable_column_header.dart';

/// Tabela użytkowników: numer, nazwisko i imię, firma, uprawnienia i akcje.
class UsersTable extends StatelessWidget {
  const UsersTable({
    super.key,
    required this.users,
    required this.sortKey,
    required this.ascending,
    required this.onSort,
    required this.onShowDetails,
    required this.onEdit,
    required this.onToggleBlocked,
    required this.onDelete,
  });

  final List<ManagedUser> users;
  final UserSortKey? sortKey;
  final bool ascending;
  final void Function(UserSortKey key, {required bool ascending}) onSort;
  final ValueChanged<ManagedUser> onShowDetails;
  final ValueChanged<ManagedUser> onEdit;
  final ValueChanged<ManagedUser> onToggleBlocked;
  final ValueChanged<ManagedUser> onDelete;

  static const _cellStyle = AppTextStyles.bodySmall;
  static const _nameStyle = AppTextStyles.bodySemiBold;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    Widget header(String label, UserSortKey key) => SortableColumnHeader(
      label: label,
      sorted: sortKey == key,
      ascending: ascending,
      onSort: ({required bool ascending}) => onSort(key, ascending: ascending),
    );
    return AppDataTable<ManagedUser>(
      rows: users,
      height: 500,
      columns: [
        DataColumn2(
          label: Text(l10n.usersColumnNumber, style: AppDataTable.headerStyle),
          fixedWidth: 60,
        ),
        DataColumn2(label: header(l10n.usersColumnName, UserSortKey.name)),
        DataColumn2(
          label: header(l10n.usersColumnCompany, UserSortKey.company),
        ),
        DataColumn2(
          label: header(l10n.usersColumnAdmin, UserSortKey.admin),
          fixedWidth: 120,
        ),
        DataColumn2(
          label: header(l10n.usersColumnActions, UserSortKey.blocked),
        ),
      ],
      rowBuilder: (user, index) => [
        Align(child: Text('${index + 1}', style: _cellStyle)),
        Row(
          spacing: 5,
          children: [
            Flexible(
              child: Text(
                user.displayName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: _nameStyle,
              ),
            ),
            if (user.isBlocked)
              const Icon(
                Icons.block_sharp,
                color: AppColors.secondary,
                size: 24,
              ),
          ],
        ),
        Text(
          user.company.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: _cellStyle,
        ),
        Text(user.isAdministrator ? l10n.yes : l10n.no, style: _cellStyle),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TapArea(
              onTap: () => onShowDetails(user),
              child: const Icon(
                Icons.info_outline,
                color: AppColors.primary,
                size: 30,
              ),
            ),
            TapArea(
              onTap: () => onEdit(user),
              child: const FontAwesomeIcon(
                AppIcons.edit,
                color: AppColors.accent1,
                size: 28,
              ),
            ),
            TapArea(
              onTap: () => onToggleBlocked(user),
              child: const Icon(
                Icons.block_sharp,
                color: AppColors.tertiary,
                size: 30,
              ),
            ),
            TapArea(
              onTap: () => onDelete(user),
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
