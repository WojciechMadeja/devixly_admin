import 'package:flutter/material.dart';

import '../../../../../core/l10n/l10n.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/tap_area.dart';
import '../../../domain/entities/company.dart';
import 'company_select_card.dart';

/// Dialog wyboru firmy (formularze użytkowników). Pokazuje niezablokowane
/// firmy posortowane po nazwie i zamyka się z wybraną firmą. „Dodaj firmę”
/// zamyka dialog i wywołuje [onAddCompany].
class CompanyPickerDialog extends StatelessWidget {
  const CompanyPickerDialog({
    super.key,
    required this.companies,
    required this.onAddCompany,
  });

  final List<Company> companies;
  final VoidCallback onAddCompany;

  static const _shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );
  static final _emptyStyle = AppTextStyles.bodySemiBold.copyWith(
    color: AppColors.secondaryText,
  );

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final available = [
      for (final company in companies)
        if (!company.isBlocked) company,
    ]..sort((a, b) => a.name.compareTo(b.name));
    return Container(
      width: 320,
      constraints: const BoxConstraints(maxHeight: 700),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: AppColors.secondaryBackground,
        elevation: 4,
        shape: _shape,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 15,
            children: [
              if (available.isEmpty)
                Text(l10n.companyPickerEmpty, style: _emptyStyle)
              else
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 5,
                    children: [
                      for (final company in available)
                        TapArea(
                          key: ValueKey(company.id),
                          onTap: () => Navigator.pop(context, company),
                          child: CompanySelectCard(company: company),
                        ),
                    ],
                  ),
                ),
              AppButton(
                label: l10n.companyPickerAdd,
                onPressed: () {
                  Navigator.pop(context);
                  onAddCompany();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
