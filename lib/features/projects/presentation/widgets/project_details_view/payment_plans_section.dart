import 'package:flutter/material.dart';

import '../../../../../core/l10n/l10n.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../domain/entities/project_details.dart';

/// Plany płatności projektu — każdy jako karta z listą rat.
class PaymentPlansSection extends StatelessWidget {
  const PaymentPlansSection({super.key, required this.plans});

  final List<ProjectPaymentPlan> plans;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    if (plans.isEmpty) {
      return Text(
        l10n.projectDetailsNoPaymentPlans,
        style: AppTextStyles.bodySemiBold.copyWith(
          color: AppColors.secondaryText,
        ),
      );
    }
    return Container(
      constraints: const BoxConstraints(maxWidth: 900),
      child: Wrap(
        spacing: 20,
        runSpacing: 20,
        alignment: WrapAlignment.center,
        children: [
          for (final plan in plans) _PlanCard(key: ValueKey(plan), plan: plan),
        ],
      ),
    );
  }
}

class _PlanCard extends StatelessWidget {
  const _PlanCard({super.key, required this.plan});

  final ProjectPaymentPlan plan;

  static const _shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
  );

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SizedBox(
      width: 280,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: EdgeInsets.zero,
        color: AppColors.secondaryBackground,
        elevation: 4,
        shape: _shape,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Text(plan.name, style: AppTextStyles.bodyLargeSemiBold),
              if (plan.postHandover)
                Text(
                  l10n.projectDetailsPostHandover,
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.accent1,
                  ),
                ),
              if (plan.description.trim().isNotEmpty)
                Text(
                  plan.description,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.secondaryText,
                  ),
                ),
              for (final item in plan.items)
                _Item(key: ValueKey(item), item: item),
            ],
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({super.key, required this.item});

  final ProjectPaymentItem item;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        const Icon(Icons.circle, size: 6, color: AppColors.secondaryText),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.name, style: AppTextStyles.bodySmall),
              if (item.description.trim().isNotEmpty)
                Text(
                  item.description,
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.secondaryText,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
