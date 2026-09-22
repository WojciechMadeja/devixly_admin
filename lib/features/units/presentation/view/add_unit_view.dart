import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/l10n/l10n.dart';
import '../../../../core/state/submission_status.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/widgets/admin_page_scaffold.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_snack_bar.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../domain/repositories/units_repository.dart';
import '../view_model/add_unit_cubit.dart';

/// Formularz dodawania jednostki (mieszkania).
///
/// Ekran nie jest podłączony do aplikacji: nie ma trasy w `app_routes.dart`
/// ani wpisu w `injection.dart`, bo backend nie udostępnia jeszcze zapisu
/// jednostek. Żeby go uruchomić, trzeba:
/// 1. dodać implementację [UnitsRepository] (źródło danych + repozytorium)
///    i zarejestrować ją razem z `AddUnitCubit` w `injection.dart`,
/// 2. dodać ścieżkę w `AppRoutes` i `createAppRouter`,
/// 3. podpiąć kafelek „Dodaj jednostki” na ekranie głównym.
///
/// Wersja FlutterFlow wysyłała ten formularz na `auth/admin/signup`, czyli
/// zakładała konto administratora zamiast zapisać jednostkę — dlatego
/// zapis prowadzi tu przez [UnitsRepository], a nie przez rejestrację.
class AddUnitView extends StatelessWidget {
  const AddUnitView({super.key, required this.repository});

  final UnitsRepository repository;

  static const pageTitle = 'AddUnityPage';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddUnitCubit(repository),
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
  final _apartmentNumber = TextEditingController();
  final _price = TextEditingController();
  final _ownerLastName = TextEditingController();
  final _phoneNumber = TextEditingController();

  List<TextEditingController> get _controllers => [
    _apartmentNumber,
    _price,
    _ownerLastName,
    _phoneNumber,
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
        AppSnackBar.error(messenger, l10n.formIncomplete);
      case SubmissionFailure():
        AppSnackBar.error(messenger, l10n.unitSaveFailed);
      case SubmissionIdle() || Submitting():
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final sidePadding = Responsive.percentOfWidth(context, 15);
    return BlocListener<AddUnitCubit, SubmissionStatus>(
      listener: _onSubmission,
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
              _Field(
                controller: _apartmentNumber,
                hint: l10n.unitApartmentNumberHint,
              ),
              _Field(controller: _price, hint: l10n.unitPriceHint),
              _Field(controller: _ownerLastName, hint: l10n.userLastNameHint),
              _Field(controller: _phoneNumber, hint: l10n.userPhoneHint),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: BlocSelector<AddUnitCubit, SubmissionStatus, bool>(
                  selector: (state) => state is Submitting,
                  builder: (context, isSubmitting) => AppButton.large(
                    label: l10n.commonSave,
                    width: 200,
                    isLoading: isSubmitting,
                    onPressed: () => context.read<AddUnitCubit>().submit(
                      apartmentNumber: _apartmentNumber.text,
                      price: _price.text,
                      ownerLastName: _ownerLastName.text,
                      phoneNumber: _phoneNumber.text,
                    ),
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

class _Field extends StatelessWidget {
  const _Field({required this.controller, required this.hint});

  final TextEditingController controller;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: AppTextField(controller: controller, hintText: hint),
    );
  }
}
