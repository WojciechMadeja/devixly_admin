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
import '../../../../core/widgets/app_snack_bar.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/dialogs/show_app_dialog.dart';
import '../../../../core/widgets/dialogs/typed_confirmation_dialog.dart';
import '../../../../core/widgets/skeleton.dart';
import '../../domain/entities/project_summary.dart';
import '../view_model/projects_list_cubit.dart';
import '../view_model/projects_list_state.dart';
import '../widgets/projects_list_view/projects_table.dart';

/// Lista projektów z wyszukiwarką; wiersz otwiera podgląd projektu.
class ProjectsListView extends StatelessWidget {
  const ProjectsListView({super.key});

  static const pageTitle = 'ProjectsListPage';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ProjectsListCubit>()..load(),
      child: BlocListener<ProjectsListCubit, ProjectsListState>(
        listenWhen: (_, state) =>
            state.projects is LoadError<List<ProjectSummary>>,
        listener: (context, _) => AppSnackBar.error(
          ScaffoldMessenger.of(context),
          context.l10n.loadError,
        ),
        child: const AdminPageScaffold(
          title: pageTitle,
          body: _ProjectsListBody(),
        ),
      ),
    );
  }
}

class _ProjectsListBody extends StatefulWidget {
  const _ProjectsListBody();

  @override
  State<_ProjectsListBody> createState() => _ProjectsListBodyState();
}

class _ProjectsListBodyState extends State<_ProjectsListBody> {
  final _search = TextEditingController();

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final sidePadding = Responsive.percentOfWidth(context, 15);
    return Padding(
      padding: EdgeInsets.fromLTRB(sidePadding, 30, sidePadding, 30),
      child: Column(
        spacing: 20,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              l10n.projectsListTitle,
              textAlign: TextAlign.center,
              style: AppTextStyles.pageTitle,
            ),
          ),
          SizedBox(
            width: 320,
            child: AppTextField(
              controller: _search,
              hintText: l10n.projectsSearchHint,
              onChanged: context.read<ProjectsListCubit>().search,
            ),
          ),
          const Expanded(child: _ProjectsResult()),
        ],
      ),
    );
  }
}

class _ProjectsResult extends StatelessWidget {
  const _ProjectsResult();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<ProjectsListCubit, ProjectsListState>(
      buildWhen: (a, b) => a.projects != b.projects,
      builder: (context, state) => switch (state.projects) {
        Loading() => const _TableSkeleton(),
        LoadError() => const SizedBox.shrink(),
        Loaded(:final value) when value.isEmpty => Text(
          l10n.projectsEmpty,
          style: AppTextStyles.bodySemiBold.copyWith(
            color: AppColors.secondaryText,
          ),
        ),
        Loaded(:final value) => ProjectsTable(
          projects: value,
          onOpen: (project) =>
              context.push('${AppRoutes.projectDetails}?id=${project.id}'),
          onEdit: (project) =>
              context.push('${AppRoutes.editProject}?id=${project.id}'),
          onDelete: (project) => _confirmDelete(context, project),
        ),
      },
    );
  }
}

/// Usunięcie projektu potwierdzamy przepisaniem frazy — kasuje też jego
/// jednostki i plany płatności.
Future<void> _confirmDelete(BuildContext context, ProjectSummary project) {
  final cubit = context.read<ProjectsListCubit>();
  final messenger = ScaffoldMessenger.of(context);
  final l10n = context.l10n;
  return showAppDialog<void>(
    context,
    builder: (_) => TypedConfirmationDialog(
      messagePrefix: l10n.projectDeleteMessage,
      highlights: [project.name],
      messageSuffix: project.isManual ? l10n.userQuestionMark : '',
      // Projekt z GenieMap wróci przy najbliższej synchronizacji.
      hint: project.isManual ? null : l10n.projectSyncedWarning,
      phrase: l10n.deletePhrase,
      mismatchMessage: l10n.deleteMismatch,
      confirmLabel: l10n.commonDelete,
      confirmColor: AppColors.accent3,
      onConfirm: () async {
        final removed = await cubit.delete(project.id);
        if (removed) {
          AppSnackBar.success(messenger, l10n.projectDeleted);
        } else {
          AppSnackBar.error(messenger, l10n.projectDeleteFailed);
        }
        return removed;
      },
    ),
  );
}

class _TableSkeleton extends StatelessWidget {
  const _TableSkeleton();

  @override
  Widget build(BuildContext context) {
    return const Column(
      spacing: 10,
      children: [
        SkeletonBox(width: 900, height: 56),
        SkeletonBox(width: 900, height: 48, duration: Duration(seconds: 1)),
        SkeletonBox(
          width: 900,
          height: 48,
          duration: Duration(milliseconds: 800),
        ),
      ],
    );
  }
}
