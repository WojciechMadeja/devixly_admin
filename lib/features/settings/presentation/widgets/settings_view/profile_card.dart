import 'package:flutter/material.dart';

import '../../../../../core/l10n/l10n.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/text_utils.dart';
import '../../../../../core/widgets/skeleton.dart';
import '../../../domain/entities/admin_profile.dart';

/// Dane konta administratora: firma, e-mail, imię z nazwiskiem i telefon.
class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key, required this.profile});

  final AdminProfile profile;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return _ProfileCardFrame(
      children: [
        _ProfileRow(
          icon: Icons.factory,
          child: Text(
            profile.companyName.ifEmpty(l10n.settingsCompanyPlaceholder),
            style: _companyStyle,
          ),
        ),
        _ProfileRow(
          icon: Icons.email_outlined,
          child: Text(
            profile.email.ifEmpty(l10n.settingsEmailPlaceholder),
            style: _emailStyle,
          ),
        ),
        _ProfileRow(
          icon: Icons.person_rounded,
          child: Text(profile.fullName, style: _detailStyle),
        ),
        _ProfileRow(
          icon: Icons.phone_rounded,
          child: Text(
            profile.phoneNumber.ifEmpty(l10n.settingsPhonePlaceholder),
            style: _detailStyle,
          ),
        ),
      ],
    );
  }
}

/// Karta konta w trakcie pobierania danych.
class ProfileCardSkeleton extends StatelessWidget {
  const ProfileCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return const _ProfileCardFrame(
      children: [
        _ProfileRow(
          icon: Icons.factory,
          child: SkeletonBox(width: 150, height: 20),
        ),
        _ProfileRow(
          icon: Icons.email_outlined,
          child: SkeletonBox(
            width: 150,
            height: 18,
            duration: Duration(milliseconds: 400),
          ),
        ),
        _ProfileRow(
          icon: Icons.person_rounded,
          child: SkeletonBox(
            width: 150,
            height: 18,
            duration: Duration(milliseconds: 500),
            repeat: false,
          ),
        ),
        _ProfileRow(
          icon: Icons.phone_rounded,
          child: SkeletonBox(
            width: 150,
            height: 18,
            duration: Duration(milliseconds: 300),
          ),
        ),
      ],
    );
  }
}

const _companyStyle = TextStyle(
  fontFamily: 'Inter',
  fontSize: 20,
  fontWeight: FontWeight.w600,
  color: AppColors.primary,
  letterSpacing: 0,
);

final _emailStyle = AppTextStyles.bodyLargeSemiBold.copyWith(
  color: AppColors.secondaryText,
);

final _detailStyle = AppTextStyles.input.copyWith(
  color: AppColors.secondaryText,
);

class _ProfileCardFrame extends StatelessWidget {
  const _ProfileCardFrame({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 320, maxWidth: 350),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: children,
      ),
    );
  }
}

class _ProfileRow extends StatelessWidget {
  const _ProfileRow({required this.icon, required this.child});

  final IconData icon;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Icon(icon, color: AppColors.accent1, size: 32),
        child,
      ],
    );
  }
}
