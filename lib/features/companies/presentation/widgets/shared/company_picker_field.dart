import 'package:flutter/material.dart';

import '../../../../../core/l10n/l10n.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/dialogs/show_app_dialog.dart';
import '../../../../../core/widgets/tap_area.dart';
import '../../../domain/entities/company.dart';
import 'company_picker_dialog.dart';

/// Pole wyboru firmy: pokazuje nazwę wybranej firmy albo „Wybierz firmę”,
/// a po kliknięciu otwiera listę firm.
class CompanyPickerField extends StatefulWidget {
  const CompanyPickerField({
    super.key,
    required this.companies,
    required this.selected,
    required this.onSelected,
    required this.onAddCompany,
    this.width = 250,
  });

  final List<Company> companies;
  final Company? selected;
  final ValueChanged<Company> onSelected;
  final VoidCallback onAddCompany;

  /// `null` oznacza szerokość rodzica (dialog edycji użytkownika).
  final double? width;

  @override
  State<CompanyPickerField> createState() => _CompanyPickerFieldState();
}

class _CompanyPickerFieldState extends State<CompanyPickerField> {
  bool _hovered = false;

  static final _labelStyle = AppTextStyles.bodySemiBold.copyWith(
    color: AppColors.secondaryText,
  );

  Future<void> _openPicker() async {
    final company = await showAppDialog<Company>(
      context,
      builder: (_) => CompanyPickerDialog(
        companies: widget.companies,
        onAddCompany: widget.onAddCompany,
      ),
    );
    if (company != null) widget.onSelected(company);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      opaque: false,
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: TapArea(
        onTap: _openPicker,
        child: Container(
          width: widget.width,
          height: 40,
          decoration: BoxDecoration(
            color: _hovered
                ? AppColors.primaryBackground
                : AppColors.secondaryBackground,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.secondary, width: 2),
          ),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            widget.selected?.name ?? context.l10n.companyPickerPlaceholder,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: _labelStyle,
          ),
        ),
      ),
    );
  }
}
