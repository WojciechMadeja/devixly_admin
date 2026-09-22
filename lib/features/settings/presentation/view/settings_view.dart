import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injection.dart';
import '../../../../core/l10n/l10n.dart';
import '../../../../core/state/loadable.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/widgets/admin_page_scaffold.dart';
import '../../../../core/widgets/app_snack_bar.dart';
import '../../domain/entities/admin_profile.dart';
import '../view_model/profile_cubit.dart';
import '../widgets/settings_view/profile_card.dart';
import '../widgets/settings_view/settings_options.dart';

/// Ustawienia konta: dane zalogowanego administratora i kafelki zmiany
/// danych osobowych oraz hasła.
class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  static const pageTitle = 'SettingsPage';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ProfileCubit>()..load(),
      child: const AdminPageScaffold(
        title: pageTitle,
        showBackButton: false,
        headerGap: 30,
        body: _SettingsBody(),
      ),
    );
  }
}

class _SettingsBody extends StatelessWidget {
  const _SettingsBody();

  @override
  Widget build(BuildContext context) {
    final sidePadding = Responsive.percentOfWidth(context, 15);
    return BlocListener<ProfileCubit, Loadable<AdminProfile>>(
      listenWhen: (_, state) => state is LoadError<AdminProfile>,
      listener: (context, _) => AppSnackBar.error(
        ScaffoldMessenger.of(context),
        context.l10n.loadError,
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(sidePadding, 20, sidePadding, 0),
        child: const Column(
          spacing: 40,
          children: [_ProfileSection(), SettingsOptions()],
        ),
      ),
    );
  }
}

class _ProfileSection extends StatelessWidget {
  const _ProfileSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, Loadable<AdminProfile>>(
      builder: (context, state) => switch (state) {
        Loading<AdminProfile>() => const ProfileCardSkeleton(),
        Loaded<AdminProfile>(:final value) => ProfileCard(profile: value),
        LoadError<AdminProfile>() => const SizedBox.shrink(),
      },
    );
  }
}
