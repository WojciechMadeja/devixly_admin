import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injection.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/l10n/l10n.dart';
import '../../../../core/state/loadable.dart';
import '../../../../core/state/submission_status.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/widgets/admin_page_scaffold.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_snack_bar.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../lookups/domain/entities/dictionary_item.dart';
import '../../../lookups/presentation/widgets/shared/lookup_picker_field.dart';
import '../../../projects/domain/entities/project_option.dart';
import '../../../projects/presentation/widgets/shared/project_picker_field.dart';
import '../view_model/add_unit_cubit.dart';
import '../view_model/add_unit_state.dart';

/// Dodawanie jednostki (mieszkania) do wybranego projektu.
///
/// Jednostki z GenieMap wpisuje nocna synchronizacja; te dodane tutaj
/// dostają w backendzie ujemne `externalId`, więc synchronizacja ich nie
/// nadpisuje ani nie usuwa.
class AddUnitView extends StatelessWidget {
  const AddUnitView({super.key});

  static const pageTitle = 'AddUnityPage';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AddUnitCubit>()..load(),
      child: const AdminPageScaffold(title: pageTitle, body: _AddUnitBody()),
    );
  }
}

class _AddUnitBody extends StatefulWidget {
  const _AddUnitBody();

  @override
  State<_AddUnitBody> createState() => _AddUnitBodyState();
}

class _AddUnitBodyState extends State<_AddUnitBody> {
  final _number = TextEditingController();
  final _price = TextEditingController();
  final _area = TextEditingController();
  final _floor = TextEditingController();
  final _status = TextEditingController();
  final _height = TextEditingController();
  final _typeOfSale = TextEditingController();

  List<TextEditingController> get _controllers => [
    _number,
    _price,
    _area,
    _floor,
    _status,
    _height,
    _typeOfSale,
  ];

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onSubmission(BuildContext context, SubmissionStatus status) {
    final messenger = ScaffoldMessenger.of(context);
    final l10n = context.l10n;
    switch (status) {
      case SubmissionSuccess():
        for (final controller in _controllers) {
          controller.clear();
        }
        AppSnackBar.success(messenger, l10n.unitSaved);
      case SubmissionFailure(failure: ValidationFailure()):
        AppSnackBar.error(messenger, l10n.unitRequiredFields);
      case SubmissionFailure(:final failure):
        AppSnackBar.error(messenger, failure.message ?? l10n.unitSaveFailed);
      case SubmissionIdle() || Submitting():
        break;
    }
  }

  void _submit(BuildContext context) => context.read<AddUnitCubit>().submit(
    number: _number.text,
    price: _price.text,
    area: _area.text,
    floor: _floor.text,
    status: _status.text,
    height: _height.text,
    typeOfSale: _typeOfSale.text,
  );

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final sidePadding = Responsive.percentOfWidth(context, 15);
    return BlocListener<AddUnitCubit, AddUnitState>(
      listenWhen: (a, b) => a.submission != b.submission,
      listener: (context, state) => _onSubmission(context, state.submission),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: sidePadding),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            spacing: 20,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  l10n.unitAddTitle,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.pageTitle,
                ),
              ),
              const _ProjectSearch(),
              _Field(controller: _number, hint: l10n.unitApartmentNumberHint),
              _Field(
                controller: _price,
                hint: l10n.unitPriceHint,
                keyboardType: TextInputType.number,
              ),
              _Field(
                controller: _area,
                hint: l10n.unitAreaHint,
                keyboardType: TextInputType.number,
              ),
              _Field(controller: _floor, hint: l10n.unitFloorHint),
              _Field(controller: _status, hint: l10n.unitStatusHint),
              _Field(controller: _height, hint: l10n.unitHeightHint),
              _Field(controller: _typeOfSale, hint: l10n.unitTypeOfSaleHint),
              const _UnitTypePicker(),
              const _LayoutPicker(),
              SizedBox(
                width: 250,
                child: Text(
                  l10n.unitManualNote,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.secondaryText,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: BlocSelector<AddUnitCubit, AddUnitState, bool>(
                  selector: (state) => state.submission is Submitting,
                  builder: (context, isSubmitting) => AppButton.large(
                    label: l10n.commonSave,
                    width: 200,
                    isLoading: isSubmitting,
                    onPressed: () => _submit(context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProjectSearch extends StatelessWidget {
  const _ProjectSearch();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddUnitCubit, AddUnitState>(
      buildWhen: (a, b) => a.projects != b.projects || a.project != b.project,
      builder: (context, state) => ProjectPickerField(
        projects: switch (state.projects) {
          Loaded(:final value) => value,
          _ => const <ProjectOption>[],
        },
        selected: state.project,
        onSelected: context.read<AddUnitCubit>().selectProject,
      ),
    );
  }
}

class _UnitTypePicker extends StatelessWidget {
  const _UnitTypePicker();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddUnitCubit, AddUnitState>(
      buildWhen: (a, b) =>
          a.unitTypes != b.unitTypes || a.unitType != b.unitType,
      builder: (context, state) => LookupPickerField(
        items: switch (state.unitTypes) {
          Loaded(:final value) => value,
          _ => const <DictionaryItem>[],
        },
        selected: state.unitType,
        placeholder: context.l10n.unitTypePlaceholder,
        onSelected: context.read<AddUnitCubit>().selectUnitType,
      ),
    );
  }
}

class _LayoutPicker extends StatelessWidget {
  const _LayoutPicker();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddUnitCubit, AddUnitState>(
      buildWhen: (a, b) => a.layouts != b.layouts || a.layout != b.layout,
      builder: (context, state) => LookupPickerField(
        items: switch (state.layouts) {
          Loaded(:final value) => value,
          _ => const <DictionaryItem>[],
        },
        selected: state.layout,
        placeholder: context.l10n.unitLayoutPlaceholder,
        onSelected: context.read<AddUnitCubit>().selectLayout,
      ),
    );
  }
}

class _Field extends StatelessWidget {
  const _Field({
    required this.controller,
    required this.hint,
    this.keyboardType,
  });

  final TextEditingController controller;
  final String hint;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: AppTextField(
        controller: controller,
        hintText: hint,
        keyboardType: keyboardType,
      ),
    );
  }
}
