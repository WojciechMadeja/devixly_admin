import 'package:flutter/material.dart';

import '../../../../../core/l10n/l10n.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/tap_area.dart';
import '../../../domain/entities/project_details.dart';

/// Plany płatności projektu — każdy jako karta z listą rat.
class PaymentPlansSection extends StatelessWidget {
  const PaymentPlansSection({
    super.key,
    required this.plans,
    required this.onAddPlan,
    required this.onDeletePlan,
    required this.onAddItem,
    required this.onDeleteItem,
  });

  final List<ProjectPaymentPlan> plans;
  final VoidCallback onAddPlan;
  final ValueChanged<ProjectPaymentPlan> onDeletePlan;
  final ValueChanged<ProjectPaymentPlan> onAddItem;
  final void Function(ProjectPaymentPlan plan, ProjectPaymentItem item)
  onDeleteItem;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Container(
      constraints: const BoxConstraints(maxWidth: 900),
      child: Column(
        spacing: 20,
        children: [
          if (plans.isEmpty)
            Text(
              l10n.projectDetailsNoPaymentPlans,
              style: AppTextStyles.bodySemiBold.copyWith(
                color: AppColors.secondaryText,
              ),
            )
          else
            Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: [
                for (final plan in plans)
                  _PlanCard(
                    key: ValueKey(plan.id),
                    plan: plan,
                    onDelete: () => onDeletePlan(plan),
                    onAddItem: () => onAddItem(plan),
                    onDeleteItem: (item) => onDeleteItem(plan, item),
                  ),
              ],
            ),
          AppButton(label: l10n.paymentPlanAdd, onPressed: onAddPlan),
        ],
      ),
    );
  }
}

class _PlanCard extends StatelessWidget {
  const _PlanCard({
    super.key,
    required this.plan,
    required this.onDelete,
    required this.onAddItem,
    required this.onDeleteItem,
  });

  final ProjectPaymentPlan plan;
  final VoidCallback onDelete;
  final VoidCallback onAddItem;
  final ValueChanged<ProjectPaymentItem> onDeleteItem;

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
              Row(
                spacing: 8,
                children: [
                  Expanded(
                    child: Text(
                      plan.name,
                      style: AppTextStyles.bodyLargeSemiBold,
                    ),
                  ),
                  TapArea(
                    onTap: onDelete,
                    child: const Icon(
                      Icons.delete_outline,
                      color: AppColors.accent3,
                      size: 24,
                    ),
                  ),
                ],
              ),
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
                _Item(
                  key: ValueKey(item.id),
                  item: item,
                  onDelete: () => onDeleteItem(item),
                ),
              TapArea(
                onTap: onAddItem,
                child: Row(
                  spacing: 6,
                  children: [
                    const Icon(
                      Icons.add_circle_outline,
                      color: AppColors.primary,
                      size: 20,
                    ),
                    Text(
                      l10n.paymentItemAdd,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({super.key, required this.item, required this.onDelete});

  final ProjectPaymentItem item;
  final VoidCallback onDelete;

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
        TapArea(
          onTap: onDelete,
          child: const Icon(
            Icons.close_rounded,
            color: AppColors.secondaryText,
            size: 16,
          ),
        ),
      ],
    );
  }
}
