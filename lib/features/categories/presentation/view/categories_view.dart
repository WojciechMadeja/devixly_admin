import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injection.dart';
import '../../../../core/l10n/l10n.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/widgets/admin_page_scaffold.dart';
import '../../../../core/widgets/app_snack_bar.dart';
import '../../../../core/widgets/list_card.dart';
import '../view_model/categories_cubit.dart';
import '../view_model/categories_state.dart';
import '../view_model/category_form_cubit.dart';
import '../view_model/category_form_state.dart';
import '../widgets/categories_view/add_category_form.dart';
import '../widgets/categories_view/categories_list.dart';

/// Zarządzanie kategoriami aktualności: dodawanie, zmiana nazwy, usuwanie.
class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  static const pageTitle = 'AddCategoryPage';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<CategoriesCubit>()..load()),
        BlocProvider(create: (_) => getIt<CategoryFormCubit>()),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<CategoriesCubit, CategoriesState>(
            listenWhen: (_, state) => state is CategoriesError,
            listener: (context, _) => AppSnackBar.error(
              ScaffoldMessenger.of(context),
              context.l10n.loadError,
            ),
          ),
          BlocListener<CategoryFormCubit, CategoryFormState>(
            listener: _onFormStateChanged,
          ),
        ],
        child: const AdminPageScaffold(
          title: pageTitle,
          body: _CategoriesBody(),
        ),
      ),
    );
  }

  void _onFormStateChanged(BuildContext context, CategoryFormState state) {
    final messenger = ScaffoldMessenger.of(context);
    switch (state) {
      case CategoryFormSuccess(:final category):
        context.read<CategoriesCubit>().upsert(category);
      case CategoryFormEmptyName():
        AppSnackBar.error(messenger, context.l10n.categoryNameRequired);
      case CategoryFormFailure():
        AppSnackBar.error(messenger, context.l10n.errorGeneric);
      case CategoryFormInitial() || CategoryFormSubmitting():
        break;
    }
  }
}

class _CategoriesBody extends StatelessWidget {
  const _CategoriesBody();

  @override
  Widget build(BuildContext context) {
    final sidePadding = Responsive.percentOfWidth(context, 15);
    return Padding(
      padding: EdgeInsets.fromLTRB(sidePadding, 30, sidePadding, 30),
      child: Column(
        spacing: 20,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              context.l10n.categoriesTitle,
              textAlign: TextAlign.center,
              style: AppTextStyles.pageTitle,
            ),
          ),
          const AddCategoryForm(),
          BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (context, state) => switch (state) {
              CategoriesLoading() => const ListCardSkeletonGroup(),
              CategoriesLoaded(:final categories, :final selectedId) =>
                Expanded(
                  child: CategoriesList(
                    categories: categories,
                    selectedId: selectedId,
                  ),
                ),
              CategoriesError() => const SizedBox.shrink(),
            },
          ),
        ],
      ),
    );
  }
}
