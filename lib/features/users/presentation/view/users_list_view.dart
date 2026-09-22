import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/di/injection.dart';
import '../../../../app/router/app_routes.dart';
import '../../../../core/l10n/l10n.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/widgets/admin_page_scaffold.dart';
import '../../../../core/widgets/app_snack_bar.dart';
import '../../../../core/widgets/dialogs/info_dialog.dart';
import '../../../../core/widgets/dialogs/show_app_dialog.dart';
import '../../../../core/widgets/dialogs/typed_confirmation_dialog.dart';
import '../../domain/entities/managed_user.dart';
import '../view_model/users_list_cubit.dart';
import '../view_model/users_list_state.dart';
import '../widgets/users_list_view/edit_user_dialog.dart';
import '../widgets/users_list_view/user_preview_dialog.dart';
import '../widgets/users_list_view/users_table.dart';

/// Lista użytkowników z podglądem, edycją, blokowaniem i usuwaniem.
class UsersListView extends StatelessWidget {
  const UsersListView({super.key});

  static const pageTitle = 'UsersListPage';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<UsersListCubit>()..load(),
      child: BlocListener<UsersListCubit, UsersListState>(
        listenWhen: (_, state) => state is UsersListError,
        listener: (context, _) => AppSnackBar.error(
          ScaffoldMessenger.of(context),
          context.l10n.loadError,
        ),
        child: const AdminPageScaffold(
          title: pageTitle,
          headerGap: 0,
          body: _UsersListBody(),
        ),
      ),
    );
  }
}

class _UsersListBody extends StatelessWidget {
  const _UsersListBody();

  @override
  Widget build(BuildContext context) {
    final sidePadding = Responsive.percentOfWidth(context, 15);
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(sidePadding, 30, sidePadding, 30),
      child: Column(
        spacing: 20,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              context.l10n.usersListTitle,
              textAlign: TextAlign.center,
              style: AppTextStyles.pageTitle,
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: BlocBuilder<UsersListCubit, UsersListState>(
              builder: (context, state) => switch (state) {
                UsersListLoaded() => _UsersTableSection(state: state),
                UsersListLoading() ||
                UsersListError() =>
                  const SizedBox.shrink(),
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _UsersTableSection extends StatelessWidget {
  const _UsersTableSection({required this.state});

  final UsersListLoaded state;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UsersListCubit>();
    return UsersTable(
      users: state.users,
      sortKey: state.sortKey,
      ascending: state.ascending,
      onSort: cubit.sort,
      onShowDetails: (user) => showAppDialog<void>(
        context,
        builder: (_) => UserPreviewDialog(user: user),
      ),
      onEdit: (user) => _edit(context, user),
      onToggleBlocked: (user) => _toggleBlocked(context, user),
      onDelete: (user) => _delete(context, user),
    );
  }

  Future<void> _edit(BuildContext context, ManagedUser user) {
    final cubit = context.read<UsersListCubit>();
    return showAppDialog<void>(
      context,
      builder: (_) => EditUserDialog(
        user: user,
        companies: state.companies,
        onAddCompany: () => context.push(AppRoutes.companies),
        onSave: (update) => _reportFailure(context, cubit.update(user, update)),
      ),
    );
  }

  Future<void> _toggleBlocked(BuildContext context, ManagedUser user) {
    final cubit = context.read<UsersListCubit>();
    final l10n = context.l10n;
    final block = !user.isBlocked;
    // Użytkownika z zablokowanej firmy odblokowuje się razem z firmą.
    if (!block && user.company.isBlocked) {
      return showInfoDialog(
        context,
        title: l10n.userBlockedCompanyTitle,
        description: l10n.userBlockedCompanyDescription,
        isError: true,
      );
    }
    return showAppDialog<void>(
      context,
      builder: (_) => TypedConfirmationDialog(
        messagePrefix: block ? l10n.userBlockMessage : l10n.userUnblockMessage,
        highlights: [user.lastName, user.firstName],
        messageSuffix: l10n.userQuestionMark,
        phrase: block ? l10n.blockPhrase : l10n.unblockPhrase,
        mismatchMessage: block ? l10n.blockMismatch : l10n.unblockMismatch,
        confirmLabel: block ? l10n.commonBlock : l10n.commonUnblock,
        confirmColor: block ? AppColors.accent1 : AppColors.accent2,
        onConfirm: () => _reportFailure(context, cubit.setBlocked(user, block)),
      ),
    );
  }

  Future<void> _delete(BuildContext context, ManagedUser user) {
    final cubit = context.read<UsersListCubit>();
    final l10n = context.l10n;
    final isAdmin = user.isAdministrator;
    return showAppDialog<void>(
      context,
      builder: (_) => TypedConfirmationDialog(
        messagePrefix: l10n.userDeleteMessage,
        highlights: [user.lastName, user.firstName],
        messageSuffix:
            isAdmin ? l10n.userDeleteAdminSuffix : l10n.userQuestionMark,
        phrase: isAdmin ? l10n.deleteAdminPhrase : l10n.deletePhrase,
        mismatchMessage:
            isAdmin ? l10n.deleteAdminMismatch : l10n.deleteMismatch,
        confirmLabel: l10n.commonDelete,
        confirmColor: AppColors.accent3,
        onConfirm: () => _reportFailure(context, cubit.delete(user)),
      ),
    );
  }

  /// Pokazuje komunikat, gdy operacja się nie udała (dialog zostaje otwarty).
  Future<bool> _reportFailure(BuildContext context, Future<bool> action) async {
    final messenger = ScaffoldMessenger.of(context);
    final message = context.l10n.errorGeneric;
    final succeeded = await action;
    if (!succeeded) AppSnackBar.error(messenger, message);
    return succeeded;
  }
}
