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
import '../../../units/presentation/widgets/shared/unit_preview_dialog.dart';
import '../../../units/presentation/widgets/shared/units_table.dart';
import '../view_model/project_details_cubit.dart';
import '../view_model/project_details_state.dart';
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
                PaymentPlansSection(plans: value.paymentPlans),
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
          ),
        ),
      },
    );
  }
}
