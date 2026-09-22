import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/l10n/l10n.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../view_model/company_form_cubit.dart';
import '../../view_model/company_form_state.dart';
import 'company_fields.dart';
import 'company_text_field.dart';

/// Formularz nowej firmy: siedem pól w rzędach po dwa (na wąskim ekranie
/// pola zawijają się pod siebie) i przycisk „Zapisz”.
class AddCompanyForm extends StatefulWidget {
  const AddCompanyForm({super.key});

  @override
  State<AddCompanyForm> createState() => _AddCompanyFormState();
}

class _AddCompanyFormState extends State<AddCompanyForm> {
  final _fields = CompanyFieldControllers();

  @override
  void dispose() {
    _fields.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocListener<CompanyFormCubit, CompanyFormState>(
      listenWhen: (_, state) => state is CompanyFormSuccess,
      listener: (_, __) => _fields.clear(),
      child: Column(
        spacing: 20,
        children: [
          CompanyTextField(
              controller: _fields.name, hint: l10n.companyNameHint),
          _FieldPair(
            first: CompanyTextField(
                controller: _fields.email, hint: l10n.companyEmailHint),
            second: CompanyTextField(
                controller: _fields.address, hint: l10n.companyAddressHint),
          ),
          _FieldPair(
            first: CompanyTextField(
              controller: _fields.postCode,
              hint: l10n.companyPostCodeHint,
            ),
            second: CompanyTextField(
                controller: _fields.city, hint: l10n.companyCityHint),
          ),
          _FieldPair(
            first: CompanyTextField(
              controller: _fields.representative,
              hint: l10n.companyRepresentativeHint,
            ),
            second: CompanyTextField(
              controller: _fields.phoneNumber,
              hint: l10n.companyPhoneHint,
            ),
          ),
          Padding(
            // Odstęp 40 nad przyciskiem jak w dotychczasowym układzie.
            padding: const EdgeInsets.only(top: 20),
            child: BlocSelector<CompanyFormCubit, CompanyFormState, bool>(
              selector: (state) => state is CompanyFormSubmitting,
              builder: (context, isSubmitting) => AppButton.large(
                label: l10n.commonSave,
                width: 200,
                isLoading: isSubmitting,
                onPressed: () =>
                    context.read<CompanyFormCubit>().submit(_fields.toDraft()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FieldPair extends StatelessWidget {
  const _FieldPair({required this.first, required this.second});

  final Widget first;
  final Widget second;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      alignment: WrapAlignment.center,
      children: [first, second],
    );
  }
}
