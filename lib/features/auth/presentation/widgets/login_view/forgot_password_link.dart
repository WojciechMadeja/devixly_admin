import 'package:flutter/material.dart';

import '../../../../../core/l10n/l10n.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/dialogs/info_dialog.dart';
import '../../../../../core/widgets/dialogs/show_app_dialog.dart';
import '../../../../../core/widgets/tap_area.dart';
import 'reset_password_dialog.dart';

/// Link „Zapomniałeś hasła? Kliknij” — złoty po najechaniu myszą.
class ForgotPasswordLink extends StatefulWidget {
  const ForgotPasswordLink({super.key});

  @override
  State<ForgotPasswordLink> createState() => _ForgotPasswordLinkState();
}

class _ForgotPasswordLinkState extends State<ForgotPasswordLink> {
  bool _hovered = false;

  Future<void> _openResetDialog() async {
    final result = await showAppDialog<ResetPasswordResult>(
      context,
      builder: (_) => const ResetPasswordDialog(),
    );
    if (!mounted || result == null) return;
    final l10n = context.l10n;
    await showInfoDialog(
      context,
      title: result == ResetPasswordResult.sent
          ? l10n.resetPasswordSentTitle
          : l10n.resetPasswordFailedTitle,
      description: result == ResetPasswordResult.sent
          ? l10n.resetPasswordSentDescription
          : l10n.resetPasswordFailedTitle,
      isError: result == ResetPasswordResult.failed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      opaque: false,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: TapArea(
        onTap: _openResetDialog,
        child: Text(
          context.l10n.loginForgotPassword,
          style: AppTextStyles.bodySemiBold.copyWith(
            color: _hovered ? AppColors.accent1 : AppColors.primary,
          ),
        ),
      ),
    );
  }
}
