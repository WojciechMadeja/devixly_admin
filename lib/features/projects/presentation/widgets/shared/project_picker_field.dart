import 'package:flutter/material.dart';

import '../../../../../core/l10n/l10n.dart';
import '../../../../../core/widgets/dialogs/searchable_picker_dialog.dart';
import '../../../../../core/widgets/dialogs/show_app_dialog.dart';
import '../../../../../core/widgets/picker_field.dart';
import '../../../domain/entities/project_option.dart';

/// Wyszukiwarka projektu: pokazuje wybrany projekt, a po kliknięciu
/// otwiera listę z polem szukania (po nazwie albo numerze projektu).
class ProjectPickerField extends StatelessWidget {
  const ProjectPickerField({
    super.key,
    required this.projects,
    required this.selected,
    required this.onSelected,
    this.loading = false,
    this.width = 250,
  });

  final List<ProjectOption> projects;
  final ProjectOption? selected;
  final ValueChanged<ProjectOption> onSelected;

  /// Lista jeszcze się pobiera — pole mówi o tym zamiast otwierać pustą
  /// wyszukiwarkę.
  final bool loading;
  final double? width;

  Future<void> _openPicker(BuildContext context) async {
    final l10n = context.l10n;
    final project = await showAppDialog<ProjectOption>(
      context,
      builder: (_) => SearchablePickerDialog<ProjectOption>(
        items: projects,
        labelOf: (project) => project.name,
        subtitleOf: (project) =>
            '${l10n.projectExternalIdLabel} '
            '${project.externalId}',
        matches: (project, query) => project.matches(query),
        searchHint: l10n.unitProjectSearchHint,
      ),
    );
    if (project != null) onSelected(project);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return PickerField(
      value: selected?.name,
      placeholder: loading
          ? l10n.unitProjectLoading
          : l10n.unitProjectPlaceholder,
      loading: loading,
      width: width,
      onTap: () => _openPicker(context),
    );
  }
}
