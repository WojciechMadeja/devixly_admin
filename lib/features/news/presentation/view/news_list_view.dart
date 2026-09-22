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
import '../../../../core/widgets/dialogs/confirm_dialog.dart';
import '../../../../core/widgets/dialogs/show_app_dialog.dart';
import '../../../../core/widgets/tap_area.dart';
import '../../domain/entities/news.dart';
import '../view_model/news_list_cubit.dart';
import '../view_model/news_list_state.dart';
import '../widgets/news_list_view/news_card.dart';
import '../widgets/news_list_view/news_card_skeleton.dart';
import '../widgets/news_list_view/news_preview_dialog.dart';

/// Lista aktualności: podgląd, przejście do edycji i usuwanie.
class NewsListView extends StatelessWidget {
  const NewsListView({super.key});

  static const pageTitle = 'NewsListPage';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<NewsListCubit>()..load(),
      child: BlocListener<NewsListCubit, NewsListState>(
        listenWhen: (_, state) => state is NewsListError,
        listener: (context, _) => AppSnackBar.error(
          ScaffoldMessenger.of(context),
          context.l10n.loadError,
        ),
        child: const AdminPageScaffold(
          title: pageTitle,
          headerGap: 0,
          body: _NewsListBody(),
        ),
      ),
    );
  }
}

class _NewsListBody extends StatelessWidget {
  const _NewsListBody();

  @override
  Widget build(BuildContext context) {
    // Na wąskim ekranie mniejszy margines, żeby karty miały miejsce na tekst.
    final sidePadding = Responsive.percentOfWidth(
      context,
      Responsive.isWide(context) ? 15 : 5,
    );
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(sidePadding, 30, sidePadding, 30),
      child: Column(
        spacing: 20,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              context.l10n.newsListTitle,
              textAlign: TextAlign.center,
              style: AppTextStyles.pageTitle,
            ),
          ),
          BlocBuilder<NewsListCubit, NewsListState>(
            builder: (context, state) => switch (state) {
              NewsListLoading() => const NewsCardSkeletonGroup(),
              NewsListLoaded() => _NewsCards(state: state),
              NewsListError() => const SizedBox.shrink(),
            },
          ),
        ],
      ),
    );
  }
}

class _NewsCards extends StatelessWidget {
  const _NewsCards({required this.state});

  final NewsListLoaded state;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        for (final item in state.news)
          TapArea(
            key: ValueKey(item.id),
            onTap: () => showAppDialog<void>(
              context,
              builder: (_) => NewsPreviewDialog(
                news: item,
                categoryNames: state.categoryNamesOf(item),
              ),
            ),
            child: NewsCard(
              news: item,
              onEdit: () => context.push(
                Uri(
                  path: AppRoutes.editNews,
                  queryParameters: {'id': '${item.id}'},
                ).toString(),
                extra: item,
              ),
              onDelete: () => _delete(context, item),
            ),
          ),
      ],
    );
  }

  Future<void> _delete(BuildContext context, News item) {
    final cubit = context.read<NewsListCubit>();
    final messenger = ScaffoldMessenger.of(context);
    final l10n = context.l10n;
    return showAppDialog<void>(
      context,
      builder: (_) => ConfirmDialog(
        message: l10n.newsDeleteMessage,
        highlight: item.title,
        confirmLabel: l10n.commonDelete,
        onConfirm: () async {
          final deleted = await cubit.delete(item);
          if (deleted) {
            AppSnackBar.show(
              messenger,
              message: l10n.newsDeleted,
              backgroundColor: AppColors.secondary,
            );
          } else {
            AppSnackBar.error(messenger, l10n.errorGeneric);
          }
          return deleted;
        },
      ),
    );
  }
}
