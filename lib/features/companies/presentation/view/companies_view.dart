import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injection.dart';
import '../../../../core/l10n/l10n.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/widgets/admin_page_scaffold.dart';
import '../../../../core/widgets/app_snack_bar.dart';
import '../../../../core/widgets/list_card.dart';
import '../view_model/companies_cubit.dart';
import '../view_model/companies_state.dart';
import '../view_model/company_form_cubit.dart';
import '../view_model/company_form_state.dart';
import '../widgets/companies_view/add_company_form.dart';
import '../widgets/companies_view/companies_list.dart';

/// Zarządzanie firmami: dodawanie, edycja, blokowanie i usuwanie.
class CompaniesView extends StatelessWidget {
  const CompaniesView({super.key});

  static const pageTitle = 'AddCompanyPage';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<CompaniesCubit>()..load()),
        BlocProvider(create: (_) => getIt<CompanyFormCubit>()),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<CompaniesCubit, CompaniesState>(
            listenWhen: (_, state) => state is CompaniesError,
            listener: (context, _) => AppSnackBar.error(
              ScaffoldMessenger.of(context),
              context.l10n.loadError,
            ),
          ),
          BlocListener<CompanyFormCubit, CompanyFormState>(
            listener: _onFormStateChanged,
          ),
        ],
        child: const AdminPageScaffold(
          title: pageTitle,
          body: _CompaniesBody(),
        ),
      ),
    );
  }

  void _onFormStateChanged(BuildContext context, CompanyFormState state) {
    final messenger = ScaffoldMessenger.of(context);
    switch (state) {
      case CompanyFormSuccess(:final company):
        context.read<CompaniesCubit>().add(company);
      case CompanyFormEmptyName():
        AppSnackBar.error(messenger, context.l10n.companyNameRequired);
      case CompanyFormFailure():
        AppSnackBar.error(messenger, context.l10n.errorGeneric);
      case CompanyFormInitial() || CompanyFormSubmitting():
        break;
    }
  }
}

/// Na desktopie formularz stoi, a lista przewija się pod nim. Na wąskim
/// ekranie formularz zajmuje większość wysokości, więc przewija się cała
/// strona.
class _CompaniesBody extends StatelessWidget {
  const _CompaniesBody();

  @override
  Widget build(BuildContext context) {
    final isWide = Responsive.isWide(context);
    final sidePadding = Responsive.percentOfWidth(context, 15);
    final content = Column(
      spacing: 20,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            context.l10n.companiesTitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.pageTitle,
          ),
        ),
        const AddCompanyForm(),
        BlocBuilder<CompaniesCubit, CompaniesState>(
          builder: (context, state) => switch (state) {
            CompaniesLoading() => const ListCardSkeletonGroup(),
            CompaniesLoaded(:final companies, :final selectedId) => isWide
                ? Expanded(
                    child: CompaniesList(
                      companies: companies,
                      selectedId: selectedId,
                    ),
                  )
                : CompaniesList(
                    companies: companies,
                    selectedId: selectedId,
                    scrollable: false,
                  ),
            CompaniesError() => const SizedBox.shrink(),
          },
        ),
      ],
    );
    final padding = EdgeInsets.fromLTRB(sidePadding, 30, sidePadding, 30);
    return isWide
        ? Padding(padding: padding, child: content)
        : SingleChildScrollView(padding: padding, child: content);
  }
}
