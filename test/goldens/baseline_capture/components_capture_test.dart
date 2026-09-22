// Wzorce wyglądu komponentów i dialogów wersji FlutterFlow (Faza 0).
import 'package:devixly_admin/app_state.dart';
import 'package:devixly_admin/components/category_card_component_widget.dart';
import 'package:devixly_admin/components/category_chip_placeholder_component_widget.dart';
import 'package:devixly_admin/components/company_card_component_widget.dart';
import 'package:devixly_admin/components/company_select_card_component_widget.dart';
import 'package:devixly_admin/components/confirm_components/block_company_confirm_component/block_company_confirm_component_widget.dart';
import 'package:devixly_admin/components/confirm_components/block_user_confirm_component/block_user_confirm_component_widget.dart';
import 'package:devixly_admin/components/confirm_components/delete_admin_user_confirm_component/delete_admin_user_confirm_component_widget.dart';
import 'package:devixly_admin/components/confirm_components/delete_category_confirm_component/delete_category_confirm_component_widget.dart';
import 'package:devixly_admin/components/confirm_components/delete_company_confirm_component/delete_company_confirm_component_widget.dart';
import 'package:devixly_admin/components/confirm_components/delete_csv_user_confirm_component/delete_csv_user_confirm_component_widget.dart';
import 'package:devixly_admin/components/confirm_components/delete_news_confirm_component/delete_news_confirm_component_widget.dart';
import 'package:devixly_admin/components/confirm_components/delete_user_confirm_component/delete_user_confirm_component_widget.dart';
import 'package:devixly_admin/components/confirm_components/send_email_for_reset_password_component/send_email_for_reset_password_component_widget.dart';
import 'package:devixly_admin/components/confirm_components/unblock_company_confirm_component/unblock_company_confirm_component_widget.dart';
import 'package:devixly_admin/components/confirm_components/unblock_user_confirm_component/unblock_user_confirm_component_widget.dart';
import 'package:devixly_admin/components/confirm_components/update_category_name_component/update_category_name_component_widget.dart';
import 'package:devixly_admin/components/confirm_components/update_company_name_component/update_company_name_component_widget.dart';
import 'package:devixly_admin/components/confirm_components/update_csv_user_component/update_csv_user_component_widget.dart';
import 'package:devixly_admin/components/confirm_components/update_user_component/update_user_component_widget.dart';
import 'package:devixly_admin/components/display_news_component/display_news_component_widget.dart';
import 'package:devixly_admin/components/display_user_component/display_user_component_widget.dart';
import 'package:devixly_admin/components/news_card_component/news_card_component_widget.dart';
import 'package:devixly_admin/components/option_card_component/option_card_component_widget.dart';
import 'package:devixly_admin/components/placeholder_components/news_card_placeholder_component/news_card_placeholder_component_widget.dart';
import 'package:devixly_admin/components/placeholder_components/placeholder_company_card_componet/placeholder_company_card_componet_widget.dart';
import 'package:devixly_admin/components/ui_popup_components/companies_list_for_select_component/companies_list_for_select_component_widget.dart';
import 'package:devixly_admin/components/ui_popup_components/error_valid_email_component/error_valid_email_component_widget.dart';
import 'package:devixly_admin/components/ui_popup_components/informationon_component/informationon_component_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'legacy_fixtures.dart';
import 'legacy_harness.dart';

/// Rozmiary powierzchni dla komponentów — nowe testy używają tych samych.
abstract final class ComponentViewport {
  static const dialog = Size(480, 720);
  static const card = Size(800, 240);
  static const tall = Size(800, 1100);
  static const desktop = Size(1440, 900);
}

class _Capture {
  const _Capture(this.build,
      {this.viewport = ComponentViewport.dialog, this.setUp});

  final Widget Function() build;
  final Size viewport;
  final void Function()? setUp;
}

final _components = <String, _Capture>{
  'option_card': _Capture(
    () => const OptionCardComponentWidget(
      optionIcon: Icon(Icons.note_add, color: Color(0xFF1A2E5A), size: 55),
      optionText: 'Dodaj do aktualności',
    ),
  ),
  'news_card': _Capture(
    () => NewsCardComponentWidget(
      news: legacyNews,
      categoriesName: const ['Inwestycje', 'Rynek nieruchomości'],
    ),
    viewport: ComponentViewport.card,
  ),
  'news_card_placeholder': _Capture(
    () => const NewsCardPlaceholderComponentWidget(),
    viewport: ComponentViewport.card,
  ),
  'display_news_horizontal': _Capture(
    () => DisplayNewsComponentWidget(
      news: legacyNews,
      categoriesName: const ['Inwestycje', 'Rynek nieruchomości'],
    ),
    viewport: ComponentViewport.desktop,
  ),
  'display_news_vertical': _Capture(
    () => DisplayNewsComponentWidget(
      news: legacyVerticalNews,
      categoriesName: const ['Wydarzenia'],
    ),
    viewport: ComponentViewport.desktop,
  ),
  'delete_news_confirm': _Capture(
    () => DeleteNewsConfirmComponentWidget(news: legacyNews),
  ),
  'category_card': _Capture(
    () => CategoryCardComponentWidget(
      category: legacyCategories[1],
      isSelected: false,
      index: 1,
    ),
    viewport: ComponentViewport.card,
  ),
  'category_card_selected': _Capture(
    () => CategoryCardComponentWidget(
      category: legacyCategories[1],
      isSelected: true,
      index: 1,
    ),
    viewport: ComponentViewport.card,
  ),
  'category_card_protected_selected': _Capture(
    () => CategoryCardComponentWidget(
      category: legacyCategories[0],
      isSelected: true,
      index: 0,
    ),
    viewport: ComponentViewport.card,
  ),
  'category_chip_placeholder': _Capture(
    () => const CategoryChipPlaceholderComponentWidget(),
  ),
  'update_category_name': _Capture(
    () => UpdateCategoryNameComponentWidget(
      category: legacyCategories[1],
      index: 1,
    ),
  ),
  'delete_category_confirm': _Capture(
    () => DeleteCategoryConfirmComponentWidget(category: legacyCategories[1]),
  ),
  'placeholder_company_card': _Capture(
    () => const PlaceholderCompanyCardComponetWidget(),
    viewport: ComponentViewport.card,
  ),
  'company_card': _Capture(
    () => CompanyCardComponentWidget(
      company: legacyCompanies[1],
      isSelected: false,
      index: 1,
    ),
    viewport: ComponentViewport.card,
  ),
  'company_card_selected': _Capture(
    () => CompanyCardComponentWidget(
      company: legacyCompanies[1],
      isSelected: true,
      index: 1,
    ),
    viewport: ComponentViewport.card,
  ),
  'company_card_blocked_selected': _Capture(
    () => CompanyCardComponentWidget(
      company: legacyCompanies[2],
      isSelected: true,
      index: 2,
    ),
    viewport: ComponentViewport.card,
  ),
  'company_card_protected_selected': _Capture(
    () => CompanyCardComponentWidget(
      company: legacyCompanies[0],
      isSelected: true,
      index: 0,
    ),
    viewport: ComponentViewport.card,
  ),
  'update_company_name': _Capture(
    () => UpdateCompanyNameComponentWidget(
      company: legacyCompanies[1],
      index: 1,
    ),
    viewport: ComponentViewport.tall,
  ),
  'block_company_confirm': _Capture(
    () => BlockCompanyConfirmComponentWidget(company: legacyCompanies[1]),
  ),
  'unblock_company_confirm': _Capture(
    () => UnblockCompanyConfirmComponentWidget(company: legacyCompanies[2]),
  ),
  'delete_company_confirm': _Capture(
    () => DeleteCompanyConfirmComponentWidget(company: legacyCompanies[1]),
  ),
  'companies_list_for_select': _Capture(
    () => const CompaniesListForSelectComponentWidget(),
    viewport: ComponentViewport.tall,
    setUp: () => FFAppState().companyList = [...legacyCompanies],
  ),
  'companies_list_for_select_empty': _Capture(
    () => const CompaniesListForSelectComponentWidget(),
  ),
  'company_select_card': _Capture(
    () => CompanySelectCardComponentWidget(company: legacyCompanies[1]),
    viewport: ComponentViewport.card,
  ),
  'display_user': _Capture(
    () => DisplayUserComponentWidget(user: legacyUser),
    viewport: ComponentViewport.tall,
  ),
  'update_user': _Capture(
    () => UpdateUserComponentWidget(user: legacyUser, index: 1),
    viewport: ComponentViewport.tall,
    setUp: () => FFAppState().companyList = [...legacyCompanies],
  ),
  'block_user_confirm': _Capture(
    () => BlockUserConfirmComponentWidget(displayUser: legacyUser),
  ),
  'unblock_user_confirm': _Capture(
    () => UnblockUserConfirmComponentWidget(displayUser: legacyBlockedUser),
  ),
  'delete_user_confirm': _Capture(
    () => DeleteUserConfirmComponentWidget(displayUser: legacyUser),
  ),
  'delete_admin_user_confirm': _Capture(
    () => DeleteAdminUserConfirmComponentWidget(displayUser: legacyAdmin),
  ),
  'update_csv_user': _Capture(
    () => UpdateCsvUserComponentWidget(csvUser: legacyCsvUsers[0], index: 0),
    viewport: ComponentViewport.tall,
  ),
  'delete_csv_user_confirm': _Capture(
    () => DeleteCsvUserConfirmComponentWidget(csvUser: legacyCsvUsers[0]),
  ),
  'error_valid_email': _Capture(
    () => const ErrorValidEmailComponentWidget(
      title: 'Błąd',
      description:
          'Poniżej jest lista błędów zwiazanych z walidacją adresu e-mail:',
      isError: true,
      errorList: ['linia 3: "jan.kowalski@"', 'linia 7: "zofia@@example.com"'],
    ),
  ),
  'information_error': _Capture(
    () => const InformationonComponentWidget(
      title: 'Coś poszło nie tak',
      description: 'Coś poszło nie tak',
      isError: true,
    ),
  ),
  'information_success': _Capture(
    () => const InformationonComponentWidget(
      title: 'Zmiany zapisanme',
      description: 'Zaktualizowano hasło do konta.',
      isError: false,
    ),
  ),
  'send_email_for_reset_password': _Capture(
    () => const SendEmailForResetPasswordComponentWidget(),
  ),
};

/// Komponenty, których stary układ wylewa się poza dostępne miejsce.
final _overflowing = <String>{};

void main() {
  setUpAll(installFakeNetworkImages);
  setUp(setUpLegacySession);
  tearDownAll(() {
    // ignore: avoid_print
    print(
        'Komponenty z przepełnieniem układu: ${_overflowing.toList()..sort()}');
  });

  for (final entry in _components.entries) {
    testWidgets(entry.key, (tester) async {
      final originalOnError = FlutterError.onError;
      FlutterError.onError = (details) {
        if (details.exceptionAsString().contains('overflowed')) {
          _overflowing.add(entry.key);
          return;
        }
        originalOnError?.call(details);
      };
      try {
        entry.value.setUp?.call();
        await pumpLegacyComponent(
          tester,
          entry.value.build(),
          viewport: entry.value.viewport,
        );
        await expectLater(
          find.byType(MaterialApp),
          matchesGoldenFile('../baseline/components/${entry.key}.png'),
        );
      } finally {
        FlutterError.onError = originalOnError;
      }
    });
  }
}
