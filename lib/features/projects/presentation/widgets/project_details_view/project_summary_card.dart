import 'package:flutter/material.dart';

import '../../../../../core/l10n/l10n.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/date_formatters.dart';
import '../../../domain/entities/project_details.dart';
import '../../../domain/entities/project_draft.dart';

/// Dane projektu: deweloper, dzielnica, terminy, widełki i opis.
class ProjectSummaryCard extends StatelessWidget {
  const ProjectSummaryCard({super.key, required this.details});

  final ProjectDetails details;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final summary = details.summary;
    final saleTypes = [
      if (details.saleTypesDeveloper) l10n.projectSaleDeveloper,
      if (details.saleTypesResale) l10n.projectSaleResale,
    ].join(', ');
    return Container(
      constraints: const BoxConstraints(maxWidth: 900),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          _Row(
            label: l10n.projectDetailsDeveloper,
            value: summary.developerName,
          ),
          _Row(label: l10n.projectDetailsDistrict, value: summary.districtName),
          _Row(label: l10n.projectDetailsStatus, value: summary.status),
          _Row(
            label: l10n.projectDetailsHandover,
            value: _date(context, summary.handover),
          ),
          _Row(
            label: l10n.projectDetailsStartOfSales,
            value: _date(context, details.startOfSales),
          ),
          _Row(
            label: l10n.projectDetailsPrices,
            value: _range(context, summary.priceFrom, summary.priceTo),
          ),
          _Row(
            label: l10n.projectDetailsAreas,
            value: _range(context, details.areaFrom, details.areaTo),
          ),
          _Row(
            label: l10n.projectDetailsOwnership,
            value: switch (details.ownership) {
              ProjectOwnership.freehold => l10n.projectOwnershipFreehold,
              ProjectOwnership.leasehold => l10n.projectOwnershipLeasehold,
              null => '',
            },
          ),
          _Row(label: l10n.projectDetailsSaleTypes, value: saleTypes),
          if (details.descriptionPl.isNotEmpty ||
              details.descriptionEn.isNotEmpty)
            _Row(
              label: l10n.projectDetailsDescription,
              value: details.descriptionPl.isNotEmpty
                  ? details.descriptionPl
                  : details.descriptionEn,
              multiline: true,
            ),
        ],
      ),
    );
  }

  static String _date(BuildContext context, DateTime? date) => switch (date) {
    final date? => DateFormatters.toApiDate(date),
    null => '',
  };

  static String _range(BuildContext context, int? from, int? to) {
    final l10n = context.l10n;
    if (from == null && to == null) return '';
    return l10n.valueRange(
      from?.toString() ?? l10n.valueMissing,
      to?.toString() ?? l10n.valueMissing,
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({
    required this.label,
    required this.value,
    this.multiline = false,
  });

  final String label;
  final String value;
  final bool multiline;

  @override
  Widget build(BuildContext context) {
    final text = value.trim().isEmpty ? context.l10n.valueMissing : value;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        SizedBox(
          width: 180,
          child: Text(label, style: AppTextStyles.bodySemiBold),
        ),
        Expanded(
          child: Text(
            text,
            maxLines: multiline ? 10 : 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.input.copyWith(color: AppColors.secondaryText),
          ),
        ),
      ],
    );
  }
}
