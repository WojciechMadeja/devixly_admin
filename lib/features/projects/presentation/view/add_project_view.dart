import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injection.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/l10n/l10n.dart';
import '../../../../core/state/loadable.dart';
import '../../../../core/state/submission_status.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/widgets/admin_page_scaffold.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_snack_bar.dart';
import '../../../lookups/domain/entities/dictionary_item.dart';
import '../../../lookups/presentation/widgets/shared/lookup_picker_field.dart';
import '../view_model/project_form_cubit.dart';
import '../view_model/project_form_state.dart';
import '../widgets/add_project_view/project_form_fields.dart';

/// Dodawanie projektu inwestycyjnego.
class AddProjectView extends StatelessWidget {
  const AddProjectView({super.key});

  static const pageTitle = 'AddProjectPage';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ProjectFormCubit>()..loadLookups(),
      child: const AdminPageScaffold(title: pageTitle, body: _AddProjectBody()),
    );
  }
}

class _AddProjectBody extends StatefulWidget {
  const _AddProjectBody();

  @override
  State<_AddProjectBody> createState() => _AddProjectBodyState();
}

class _AddProjectBodyState extends State<_AddProjectBody> {
  final _fields = ProjectFieldControllers();

  @override
  void dispose() {
    _fields.dispose();
    super.dispose();
  }

  void _onSubmission(BuildContext context, SubmissionStatus status) {
    final messenger = ScaffoldMessenger.of(context);
    final l10n = context.l10n;
    switch (status) {
      case SubmissionSuccess():
        _fields.clear();
        AppSnackBar.success(messenger, l10n.projectSaved);
      case SubmissionFailure(failure: ValidationFailure()):
        AppSnackBar.error(messenger, l10n.projectRequiredFields);
      case SubmissionFailure(:final failure):
        AppSnackBar.error(messenger, failure.message ?? l10n.projectSaveFailed);
      case SubmissionIdle() || Submitting():
        break;
    }
  }

  void _submit(BuildContext context) => context.read<ProjectFormCubit>().submit(
    name: _fields.name.text,
    externalId: _fields.externalId.text,
    noc: _fields.noc.text,
    status: _fields.status.text,
    descriptionPl: _fields.descriptionPl.text,
    descriptionEn: _fields.descriptionEn.text,
    priceFrom: _fields.priceFrom.text,
    priceTo: _fields.priceTo.text,
    areaFrom: _fields.areaFrom.text,
    areaTo: _fields.areaTo.text,
  );

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final sidePadding = Responsive.percentOfWidth(context, 15);
    return BlocListener<ProjectFormCubit, ProjectFormState>(
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
                  l10n.projectAddTitle,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.pageTitle,
                ),
              ),
              ProjectField(
                controller: _fields.name,
                hint: l10n.projectNameHint,
              ),
              ProjectField(
                controller: _fields.externalId,
                hint: l10n.projectExternalIdHint,
                keyboardType: TextInputType.number,
              ),
              ProjectField(
                controller: _fields.noc,
                hint: l10n.projectNocHint,
                keyboardType: TextInputType.number,
              ),
              const _DistrictPicker(),
              const _DeveloperPicker(),
              ProjectField(
                controller: _fields.status,
                hint: l10n.projectStatusHint,
              ),
              ProjectRangeRow(
                from: ProjectField(
                  controller: _fields.priceFrom,
                  hint: l10n.projectPriceFromHint,
                  keyboardType: TextInputType.number,
                ),
                to: ProjectField(
                  controller: _fields.priceTo,
                  hint: l10n.projectPriceToHint,
                  keyboardType: TextInputType.number,
                ),
              ),
              ProjectRangeRow(
                from: ProjectField(
                  controller: _fields.areaFrom,
                  hint: l10n.projectAreaFromHint,
                  keyboardType: TextInputType.number,
                ),
                to: ProjectField(
                  controller: _fields.areaTo,
                  hint: l10n.projectAreaToHint,
                  keyboardType: TextInputType.number,
                ),
              ),
              ProjectField(
                controller: _fields.descriptionPl,
                hint: l10n.projectDescriptionPlHint,
                maxLines: 4,
              ),
              ProjectField(
                controller: _fields.descriptionEn,
                hint: l10n.projectDescriptionEnHint,
                maxLines: 4,
              ),
              const _Dates(),
              const _Ownership(),
              const _SaleTypes(),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: BlocSelector<ProjectFormCubit, ProjectFormState, bool>(
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

class _DistrictPicker extends StatelessWidget {
  const _DistrictPicker();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectFormCubit, ProjectFormState>(
      buildWhen: (a, b) =>
          a.districts != b.districts || a.district != b.district,
      builder: (context, state) => LookupPickerField(
        items: switch (state.districts) {
          Loaded(:final value) => value,
          _ => const <DictionaryItem>[],
        },
        selected: state.district,
        loading: state.districts is Loading<List<DictionaryItem>>,
        placeholder: context.l10n.projectDistrictPlaceholder,
        onSelected: context.read<ProjectFormCubit>().selectDistrict,
      ),
    );
  }
}

class _DeveloperPicker extends StatelessWidget {
  const _DeveloperPicker();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectFormCubit, ProjectFormState>(
      buildWhen: (a, b) =>
          a.developers != b.developers || a.developer != b.developer,
      builder: (context, state) => LookupPickerField(
        items: switch (state.developers) {
          Loaded(:final value) => value,
          _ => const <DictionaryItem>[],
        },
        selected: state.developer,
        loading: state.developers is Loading<List<DictionaryItem>>,
        placeholder: context.l10n.projectDeveloperPlaceholder,
        onSelected: context.read<ProjectFormCubit>().selectDeveloper,
      ),
    );
  }
}

class _Dates extends StatelessWidget {
  const _Dates();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final cubit = context.read<ProjectFormCubit>();
    return BlocBuilder<ProjectFormCubit, ProjectFormState>(
      buildWhen: (a, b) =>
          a.handover != b.handover || a.startOfSales != b.startOfSales,
      builder: (context, state) => Column(
        spacing: 20,
        children: [
          ProjectDateField(
            label: l10n.projectHandoverLabel,
            value: state.handover,
            onChanged: cubit.setHandover,
          ),
          ProjectDateField(
            label: l10n.projectStartOfSalesLabel,
            value: state.startOfSales,
            onChanged: cubit.setStartOfSales,
          ),
        ],
      ),
    );
  }
}

class _Ownership extends StatelessWidget {
  const _Ownership();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ProjectFormCubit, ProjectFormState, Object?>(
      selector: (state) => state.ownership,
      builder: (context, _) {
        final state = context.read<ProjectFormCubit>().state;
        return ProjectOwnershipChips(
          selected: state.ownership,
          onSelected: context.read<ProjectFormCubit>().setOwnership,
        );
      },
    );
  }
}

class _SaleTypes extends StatelessWidget {
  const _SaleTypes();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectFormCubit, ProjectFormState>(
      buildWhen: (a, b) =>
          a.saleTypesDeveloper != b.saleTypesDeveloper ||
          a.saleTypesResale != b.saleTypesResale,
      builder: (context, state) => ProjectSaleTypes(
        developer: state.saleTypesDeveloper,
        resale: state.saleTypesResale,
        onChanged: context.read<ProjectFormCubit>().setSaleTypes,
      ),
    );
  }
}
