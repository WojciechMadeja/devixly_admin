import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/di/injection.dart';
import '../../../../app/router/app_routes.dart';
import '../../../../core/l10n/l10n.dart';
import '../../../../core/state/loadable.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/widgets/admin_page_scaffold.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/gold_divider.dart';
import '../../../../core/widgets/skeleton.dart';
import '../../../../core/widgets/dialogs/show_app_dialog.dart';
import '../../../../core/widgets/image_gallery.dart';
import '../../../../core/widgets/app_snack_bar.dart';
import '../../../../core/widgets/dialogs/confirm_dialog.dart';
import '../../../../core/widgets/dialogs/typed_confirmation_dialog.dart';
import '../../../units/domain/entities/project_unit.dart';
import '../../../units/presentation/widgets/shared/edit_unit_dialog.dart';
import '../../../units/presentation/widgets/shared/unit_preview_dialog.dart';
import '../../../units/presentation/widgets/shared/units_table.dart';
import '../view_model/project_details_cubit.dart';
import '../view_model/project_details_state.dart';
import '../../domain/entities/payment_plan_drafts.dart';
import '../../domain/entities/project_details.dart';
import '../widgets/project_details_view/payment_plan_dialogs.dart';
import '../widgets/project_details_view/payment_plans_section.dart';
import '../widgets/project_details_view/project_summary_card.dart';

/// Podgląd projektu: dane, plany płatności i jednostki.
class ProjectDetailsView extends StatelessWidget {
  const ProjectDetailsView({super.key, required this.projectId});

  final int projectId;

  static const pageTitle = 'ProjectPage';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ProjectDetailsCubit>()..load(projectId),
      child: const AdminPageScaffold(
        title: pageTitle,
        body: _ProjectDetailsBody(),
      ),
    );
  }
}

class _ProjectDetailsBody extends StatelessWidget {
  const _ProjectDetailsBody();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final sidePadding = Responsive.percentOfWidth(context, 15);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sidePadding),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: BlocBuilder<ProjectDetailsCubit, ProjectDetailsState>(
          builder: (context, state) => Column(
            spacing: 20,
            children: [
              switch (state.details) {
                Loading() => const SkeletonBox(width: 300, height: 28),
                LoadError() => Text(
                  l10n.loadError,
                  style: AppTextStyles.pageTitle,
                ),
                Loaded(:final value) => Text(
                  value.summary.name,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.pageTitle,
                ),
              },
              if (state.details case Loaded(:final value)) ...[
                ProjectSummaryCard(details: value),
                const GoldDivider(),
                _SectionTitle(l10n.projectDetailsImages),
                ImageGallery(
                  urls: value.imageUrls,
                  emptyLabel: l10n.projectDetailsNoImages,
                ),
                const GoldDivider(),
                _SectionTitle(l10n.projectDetailsPaymentPlans),
                PaymentPlansSection(
                  plans: value.paymentPlans,
                  onAddPlan: () => _addPaymentPlan(context, value.summary.id),
                  onDeletePlan: (plan) => _confirmDeletePlan(context, plan),
                  onAddItem: (plan) => _addPaymentItem(context, plan),
                  onDeleteItem: (plan, item) =>
                      _confirmDeleteItem(context, plan, item),
                ),
              ] else if (state.details is Loading<Object>) ...[
                const SkeletonBox(width: 600, height: 160),
              ],
              const GoldDivider(),
              _SectionTitle(l10n.projectDetailsUnits),
              const _Units(),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: AppButton.large(
                  label: l10n.projectDetailsAddUnit,
                  width: 200,
                  onPressed: () => context.push(AppRoutes.addUnit),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _addPaymentPlan(BuildContext context, int projectId) {
  final cubit = context.read<ProjectDetailsCubit>();
  final messenger = ScaffoldMessenger.of(context);
  final l10n = context.l10n;
  return showAppDialog<void>(
    context,
    builder: (_) => PaymentEntryDialog(
      title: l10n.paymentPlanAddTitle,
      nameHint: l10n.paymentPlanNameHint,
      descriptionHint: l10n.paymentPlanDescriptionHint,
      withPostHandover: true,
      onSave:
          ({
            required String name,
            required String description,
            required bool postHandover,
          }) async {
            final saved = await cubit.addPaymentPlan(
              PaymentPlanDraft(
                projectId: projectId,
                name: name,
                description: description,
                postHandover: postHandover,
              ),
            );
            if (saved) {
              AppSnackBar.success(messenger, l10n.paymentPlanSaved);
            } else {
              AppSnackBar.error(messenger, l10n.paymentPlanSaveFailed);
            }
            return saved;
          },
    ),
  );
}

Future<void> _addPaymentItem(BuildContext context, ProjectPaymentPlan plan) {
  final cubit = context.read<ProjectDetailsCubit>();
  final messenger = ScaffoldMessenger.of(context);
  final l10n = context.l10n;
  return showAppDialog<void>(
    context,
    builder: (_) => PaymentEntryDialog(
      title: l10n.paymentItemAddTitle,
      nameHint: l10n.paymentItemNameHint,
      descriptionHint: l10n.paymentItemDescriptionHint,
      onSave:
          ({
            required String name,
            required String description,
            required bool postHandover,
          }) async {
            final saved = await cubit.addPaymentItem(
              PaymentItemDraft(
                paymentPlanId: plan.id,
                name: name,
                description: description,
              ),
            );
            if (saved) {
              AppSnackBar.success(messenger, l10n.paymentItemSaved);
            } else {
              AppSnackBar.error(messenger, l10n.paymentItemSaveFailed);
            }
            return saved;
          },
    ),
  );
}

Future<void> _confirmDeletePlan(BuildContext context, ProjectPaymentPlan plan) {
  final cubit = context.read<ProjectDetailsCubit>();
  final messenger = ScaffoldMessenger.of(context);
  final l10n = context.l10n;
  return showAppDialog<void>(
    context,
    builder: (_) => ConfirmDialog(
      message: l10n.paymentPlanDeleteMessage,
      highlight: plan.name,
      hint: plan.isManual ? null : l10n.paymentPlanSyncedWarning,
      confirmLabel: l10n.commonDelete,
      onConfirm: () async {
        final removed = await cubit.deletePaymentPlan(plan.id);
        if (removed) {
          AppSnackBar.success(messenger, l10n.paymentPlanDeleted);
        } else {
          AppSnackBar.error(messenger, l10n.paymentPlanDeleteFailed);
        }
        return removed;
      },
    ),
  );
}

Future<void> _confirmDeleteItem(
  BuildContext context,
  ProjectPaymentPlan plan,
  ProjectPaymentItem item,
) {
  final cubit = context.read<ProjectDetailsCubit>();
  final messenger = ScaffoldMessenger.of(context);
  final l10n = context.l10n;
  return showAppDialog<void>(
    context,
    builder: (_) => ConfirmDialog(
      message: l10n.paymentItemDeleteMessage,
      highlight: item.name,
      hint: plan.isManual ? null : l10n.paymentPlanSyncedWarning,
      confirmLabel: l10n.commonDelete,
      onConfirm: () async {
        final removed = await cubit.deletePaymentItem(item.id);
        if (removed) {
          AppSnackBar.success(messenger, l10n.paymentItemDeleted);
        } else {
          AppSnackBar.error(messenger, l10n.paymentItemDeleteFailed);
        }
        return removed;
      },
    ),
  );
}

Future<void> _editUnit(BuildContext context, ProjectUnit unit) {
  final cubit = context.read<ProjectDetailsCubit>();
  final messenger = ScaffoldMessenger.of(context);
  final l10n = context.l10n;
  final projectId = switch (cubit.state.details) {
    Loaded(:final value) => value.summary.id,
    _ => null,
  };
  if (projectId == null) return Future.value();
  return showAppDialog<void>(
    context,
    builder: (_) => EditUnitDialog(
      unit: unit,
      projectId: projectId,
      unitTypes: cubit.state.unitTypes,
      layouts: cubit.state.layouts,
      onSave: (draft) async {
        final saved = await cubit.updateUnit(unit.id, draft);
        if (saved) {
          AppSnackBar.success(messenger, l10n.unitUpdated);
        } else {
          AppSnackBar.error(messenger, l10n.unitSaveFailed);
        }
        return saved;
      },
    ),
  );
}

/// Usunięcie jednostki potwierdzamy przepisaniem frazy, jak przy firmach
/// i użytkownikach.
Future<void> _confirmDeleteUnit(BuildContext context, ProjectUnit unit) {
  final cubit = context.read<ProjectDetailsCubit>();
  final messenger = ScaffoldMessenger.of(context);
  final l10n = context.l10n;
  return showAppDialog<void>(
    context,
    builder: (_) => TypedConfirmationDialog(
      messagePrefix: l10n.unitDeleteMessage,
      highlights: [unit.number],
      messageSuffix: l10n.userQuestionMark,
      hint: unit.isManual ? null : l10n.unitSyncedDeleteWarning,
      phrase: l10n.deletePhrase,
      mismatchMessage: l10n.deleteMismatch,
      confirmLabel: l10n.commonDelete,
      confirmColor: AppColors.accent3,
      onConfirm: () async {
        final removed = await cubit.deleteUnit(unit.id);
        if (removed) {
          AppSnackBar.success(messenger, l10n.unitDeleted);
        } else {
          AppSnackBar.error(messenger, l10n.unitDeleteFailed);
        }
        return removed;
      },
    ),
  );
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(label, style: AppTextStyles.bodyLargeSemiBold);
  }
}

class _Units extends StatelessWidget {
  const _Units();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<ProjectDetailsCubit, ProjectDetailsState>(
      buildWhen: (a, b) => a.units != b.units,
      builder: (context, state) => switch (state.units) {
        Loading() => const SkeletonBox(width: 600, height: 120),
        LoadError() => Text(
          l10n.loadError,
          style: AppTextStyles.bodySemiBold.copyWith(
            color: AppColors.secondaryText,
          ),
        ),
        Loaded(:final value) when value.isEmpty => Text(
          l10n.projectDetailsNoUnits,
          style: AppTextStyles.bodySemiBold.copyWith(
            color: AppColors.secondaryText,
          ),
        ),
        Loaded(:final value) => SizedBox(
          height: 420,
          child: UnitsTable(
            units: value,
            onPreview: (unit) => showAppDialog<void>(
              context,
              builder: (_) => UnitPreviewDialog(unit: unit),
            ),
            onEdit: (unit) => _editUnit(context, unit),
            onDelete: (unit) => _confirmDeleteUnit(context, unit),
          ),
        ),
      },
    );
  }
}
