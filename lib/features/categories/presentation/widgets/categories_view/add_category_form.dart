import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/l10n/l10n.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../view_model/category_form_cubit.dart';
import '../../view_model/category_form_state.dart';

/// Pole nazwy nowej kategorii i przycisk „Zapisz” (pole czyści się po
/// dodaniu kategorii).
class AddCategoryForm extends StatefulWidget {
  const AddCategoryForm({super.key});

  @override
  State<AddCategoryForm> createState() => _AddCategoryFormState();
}

class _AddCategoryFormState extends State<AddCategoryForm> {
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocListener<CategoryFormCubit, CategoryFormState>(
      listenWhen: (_, state) => state is CategoryFormSuccess,
      listener: (_, __) => _nameController.clear(),
      child: Column(
        spacing: 20,
        children: [
          SizedBox(
            width: 250,
            child: AppTextField(
              controller: _nameController,
              hintText: l10n.categoryNameHint,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: BlocSelector<CategoryFormCubit, CategoryFormState, bool>(
              selector: (state) => state is CategoryFormSubmitting,
              builder: (context, isSubmitting) => AppButton.large(
                label: l10n.commonSave,
                width: 200,
                isLoading: isSubmitting,
                onPressed: () => context
                    .read<CategoryFormCubit>()
                    .submit(_nameController.text),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
