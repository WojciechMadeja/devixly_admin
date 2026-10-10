import 'package:flutter/material.dart';

import '../../../../../core/l10n/l10n.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/date_formatters.dart';
import '../../../../../core/widgets/app_data_table.dart';
import '../../../../../core/widgets/tap_area.dart';
import '../../../domain/entities/project_summary.dart';

/// Tabela projektów: nazwa z numerem, dzielnica, deweloper, status,
/// termin oddania i widełki cen. Kliknięcie wiersza otwiera podgląd.
class ProjectsTable extends StatelessWidget {
  const ProjectsTable({
    super.key,
    required this.projects,
    required this.onOpen,
    required this.onEdit,
    required this.onDelete,
  });

  final List<ProjectSummary> projects;
  final ValueChanged<ProjectSummary> onOpen;
  final ValueChanged<ProjectSummary> onEdit;
  final ValueChanged<ProjectSummary> onDelete;

  static const _cellStyle = AppTextStyles.bodySmall;
  static const _nameStyle = AppTextStyles.bodySemiBold;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    Widget header(String label) => Text(label, style: AppDataTable.headerStyle);
    return AppDataTable<ProjectSummary>(
      rows: projects,
      height: 500,
      paginated: projects.length > 10,
      columns: [
        DataColumn2(label: header(l10n.projectsColumnName)),
        DataColumn2(label: header(l10n.projectsColumnDistrict)),
        DataColumn2(label: header(l10n.projectsColumnDeveloper)),
        DataColumn2(label: header(l10n.projectsColumnStatus), fixedWidth: 120),
        DataColumn2(
          label: header(l10n.projectsColumnHandover),
          fixedWidth: 120,
        ),
        DataColumn2(label: header(l10n.projectsColumnPrice)),
        DataColumn2(label: header(l10n.usersColumnActions), fixedWidth: 150),
      ],
      rowBuilder: (project, index) => [
        TapArea(
          onTap: () => onOpen(project),
          child: Row(
            spacing: 5,
            children: [
              Flexible(
                child: Text(
                  project.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: _nameStyle,
                ),
              ),
              if (project.isManual)
                Text(
                  l10n.projectManualBadge,
                  style: _cellStyle.copyWith(color: AppColors.secondaryText),
                ),
            ],
          ),
        ),
        _Cell(project.districtName),
        _Cell(project.developerName),
        _Cell(project.status),
        _Cell(switch (project.handover) {
          final date? => DateFormatters.toApiDate(date),
          null => l10n.valueMissing,
        }),
        _Cell(_priceRange(context, project)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TapArea(
              onTap: () => onOpen(project),
              child: const Icon(
                Icons.info_outline,
                color: AppColors.primary,
                size: 30,
              ),
            ),
            TapArea(
              onTap: () => onEdit(project),
              child: const Icon(
                Icons.edit_outlined,
                color: AppColors.primary,
                size: 30,
              ),
            ),
            TapArea(
              onTap: () => onDelete(project),
              child: const Icon(
                Icons.delete_outline,
                color: AppColors.accent3,
                size: 30,
              ),
            ),
          ],
        ),
      ],
    );
  }

  String _priceRange(BuildContext context, ProjectSummary project) {
    final l10n = context.l10n;
    final from = project.priceFrom;
    final to = project.priceTo;
    if (from == null && to == null) return l10n.valueMissing;
    return l10n.valueRange(
      from?.toString() ?? l10n.valueMissing,
      to?.toString() ?? l10n.valueMissing,
    );
  }
}

class _Cell extends StatelessWidget {
  const _Cell(this.value);

  final String value;

  @override
  Widget build(BuildContext context) {
    final text = value.isEmpty ? context.l10n.valueMissing : value;
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: ProjectsTable._cellStyle,
    );
  }
}
