import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/l10n/l10n.dart';
import '../../../../../core/widgets/app_snack_bar.dart';
import '../../../../../core/widgets/dialogs/confirm_dialog.dart';
import '../../../../../core/widgets/dialogs/show_app_dialog.dart';
import '../../../../../core/widgets/tap_area.dart';
import '../../../domain/entities/category.dart';
import '../../view_model/categories_cubit.dart';
import 'category_card.dart';
import 'rename_category_dialog.dart';

/// Przewijana lista kart kategorii. Kliknięcie zaznacza kartę, podwójne
/// kliknięcie odznacza.
class CategoriesList extends StatelessWidget {
  const CategoriesList({
    super.key,
    required this.categories,
    required this.selectedId,
  });

  final List<Category> categories;
  final int? selectedId;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CategoriesCubit>();
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        spacing: 5,
        children: [
          for (final category in categories)
            TapArea(
              key: ValueKey(category.id),
              onTap: () => cubit.select(category.id),
              onDoubleTap: cubit.clearSelection,
              child: CategoryCard(
                category: category,
                selected: category.id == selectedId,
                onEdit: () => _rename(context, category),
                onDelete: () => _delete(context, category),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _rename(BuildContext context, Category category) {
    final cubit = context.read<CategoriesCubit>();
    return showAppDialog<void>(
      context,
      builder: (_) => RenameCategoryDialog(
        category: category,
        onRename: (name) =>
            _reportFailure(context, cubit.rename(category, name)),
      ),
    );
  }

  Future<void> _delete(BuildContext context, Category category) {
    final cubit = context.read<CategoriesCubit>();
    return showAppDialog<void>(
      context,
      builder: (_) => ConfirmDialog(
        message: context.l10n.categoryDeleteMessage,
        highlight: category.name,
        confirmLabel: context.l10n.commonDelete,
        onConfirm: () => _reportFailure(context, cubit.delete(category)),
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
