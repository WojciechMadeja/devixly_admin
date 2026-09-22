import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/list_card.dart';
import '../../../domain/entities/company.dart';

/// Pozycja listy wyboru firmy — podświetla się po najechaniu myszą.
class CompanySelectCard extends StatefulWidget {
  const CompanySelectCard({super.key, required this.company});

  final Company company;

  @override
  State<CompanySelectCard> createState() => _CompanySelectCardState();
}

class _CompanySelectCardState extends State<CompanySelectCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      opaque: false,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: ListCard(
        color: _hovered ? AppColors.tertiary : AppColors.primaryBackground,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                widget.company.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.bodySemiBold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
