import 'package:flutter/material.dart';

import '../../../../../core/l10n/l10n.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/date_formatters.dart';
import '../../../../../core/widgets/app_choice_chip.dart';
import '../../../../../core/widgets/app_date_picker.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../../../core/widgets/tap_area.dart';
import '../../../domain/entities/project_draft.dart';

/// Kontrolery pól tekstowych formularza projektu.
class ProjectFieldControllers {
  final name = TextEditingController();
  final externalId = TextEditingController();
  final noc = TextEditingController();
  final status = TextEditingController();
  final descriptionPl = TextEditingController();
  final descriptionEn = TextEditingController();
  final priceFrom = TextEditingController();
  final priceTo = TextEditingController();
  final areaFrom = TextEditingController();
  final areaTo = TextEditingController();

  List<TextEditingController> get _all => [
    name,
    externalId,
    noc,
    status,
    descriptionPl,
    descriptionEn,
    priceFrom,
    priceTo,
    areaFrom,
    areaTo,
  ];

  void clear() {
    for (final controller in _all) {
      controller.clear();
    }
  }

  void dispose() {
    for (final controller in _all) {
      controller.dispose();
    }
  }
}

/// Pole formularza o szerokości pozostałych pól panelu.
class ProjectField extends StatelessWidget {
  const ProjectField({
    super.key,
    required this.controller,
    required this.hint,
    this.keyboardType,
    this.maxLines = 1,
  });

  final TextEditingController controller;
  final String hint;
  final TextInputType? keyboardType;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: AppTextField(
        controller: controller,
        hintText: hint,
        keyboardType: keyboardType,
        maxLines: maxLines,
      ),
    );
  }
}

/// Dwa pola obok siebie (zakresy cen i powierzchni).
class ProjectRangeRow extends StatelessWidget {
  const ProjectRangeRow({super.key, required this.from, required this.to});

  final Widget from;
  final Widget to;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      alignment: WrapAlignment.center,
      children: [from, to],
    );
  }
}

/// Wybór daty: etykieta z wybraną datą albo samo zaproszenie do wyboru.
class ProjectDateField extends StatelessWidget {
  const ProjectDateField({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final DateTime? value;
  final ValueChanged<DateTime?> onChanged;

  @override
  Widget build(BuildContext context) {
    final date = value;
    return TapArea(
      onTap: () async {
        final picked = await showAppDatePicker(
          context,
          initialDate: date ?? DateTime.now(),
        );
        if (picked != null) onChanged(picked);
      },
      child: SizedBox(
        width: 250,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: AppTextStyles.bodySemiBold),
            Text(
              date == null
                  ? context.l10n.newsPickDate
                  : DateFormatters.toApiDate(date),
              style: AppTextStyles.input.copyWith(
                color: AppColors.secondaryText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Rodzaj własności — albo nic, albo jedna z dwóch wartości.
class ProjectOwnershipChips extends StatelessWidget {
  const ProjectOwnershipChips({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  final ProjectOwnership? selected;
  final ValueChanged<ProjectOwnership?> onSelected;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Wrap(
      spacing: 15,
      runSpacing: 8,
      alignment: WrapAlignment.center,
      children: [
        for (final (ownership, label) in [
          (ProjectOwnership.freehold, l10n.projectOwnershipFreehold),
          (ProjectOwnership.leasehold, l10n.projectOwnershipLeasehold),
        ])
          AppChoiceChip(
            key: ValueKey(ownership),
            label: label,
            selected: selected == ownership,
            // Ponowne kliknięcie czyści wybór — pole jest opcjonalne.
            onSelected: () =>
                onSelected(selected == ownership ? null : ownership),
          ),
      ],
    );
  }
}

/// Typy sprzedaży projektu wraz z ostrzeżeniem o nocnej synchronizacji.
class ProjectSaleTypes extends StatelessWidget {
  const ProjectSaleTypes({
    super.key,
    required this.developer,
    required this.resale,
    required this.onChanged,
  });

  final bool developer;
  final bool resale;
  final void Function({bool? developer, bool? resale}) onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final removedBySync = !developer && resale;
    return SizedBox(
      width: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SaleTypeRow(
            label: l10n.projectSaleDeveloper,
            value: developer,
            onChanged: (value) => onChanged(developer: value),
          ),
          _SaleTypeRow(
            label: l10n.projectSaleResale,
            value: resale,
            onChanged: (value) => onChanged(resale: value),
          ),
          if (removedBySync)
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                l10n.projectSaleWarning,
                style: AppTextStyles.fieldError,
              ),
            ),
        ],
      ),
    );
  }
}

class _SaleTypeRow extends StatelessWidget {
  const _SaleTypeRow({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          activeColor: AppColors.primary,
          onChanged: (checked) => onChanged(checked ?? false),
        ),
        Flexible(child: Text(label, style: AppTextStyles.bodySemiBold)),
      ],
    );
  }
}
