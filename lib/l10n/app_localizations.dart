import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_pl.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('pl')];

  /// No description provided for @commonCancel.
  ///
  /// In pl, this message translates to:
  /// **'Anuluj'**
  String get commonCancel;

  /// No description provided for @commonClose.
  ///
  /// In pl, this message translates to:
  /// **'Zamknij'**
  String get commonClose;

  /// No description provided for @commonDelete.
  ///
  /// In pl, this message translates to:
  /// **'Usuń'**
  String get commonDelete;

  /// No description provided for @commonSave.
  ///
  /// In pl, this message translates to:
  /// **'Zapisz'**
  String get commonSave;

  /// No description provided for @commonBack.
  ///
  /// In pl, this message translates to:
  /// **'Cofnij'**
  String get commonBack;

  /// No description provided for @confirmChoiceTitle.
  ///
  /// In pl, this message translates to:
  /// **'Potwierdź swój wybór'**
  String get confirmChoiceTitle;

  /// No description provided for @typedConfirmationHint.
  ///
  /// In pl, this message translates to:
  /// **'Wpisz {phrase}'**
  String typedConfirmationHint(String phrase);

  /// No description provided for @errorGeneric.
  ///
  /// In pl, this message translates to:
  /// **'Coś poszło nie tak'**
  String get errorGeneric;

  /// No description provided for @loginEmailHint.
  ///
  /// In pl, this message translates to:
  /// **'E-mail'**
  String get loginEmailHint;

  /// No description provided for @loginPasswordHint.
  ///
  /// In pl, this message translates to:
  /// **'Hasło'**
  String get loginPasswordHint;

  /// No description provided for @loginForgotPassword.
  ///
  /// In pl, this message translates to:
  /// **'Zapomniałeś hasła? Kliknij'**
  String get loginForgotPassword;

  /// No description provided for @loginSubmit.
  ///
  /// In pl, this message translates to:
  /// **'Zaloguj'**
  String get loginSubmit;

  /// No description provided for @loginEmptyFieldsTitle.
  ///
  /// In pl, this message translates to:
  /// **'Pola nie mogą być puste!'**
  String get loginEmptyFieldsTitle;

  /// No description provided for @loginEmptyFieldsDescription.
  ///
  /// In pl, this message translates to:
  /// **'Uzupełnij pola o adres e-mail i hasło'**
  String get loginEmptyFieldsDescription;

  /// No description provided for @invalidEmailTitle.
  ///
  /// In pl, this message translates to:
  /// **'Zły format e-mail'**
  String get invalidEmailTitle;

  /// No description provided for @invalidEmailDescription.
  ///
  /// In pl, this message translates to:
  /// **'Wpisz poprawny adres e-mail'**
  String get invalidEmailDescription;

  /// No description provided for @resetPasswordTitle.
  ///
  /// In pl, this message translates to:
  /// **'Wpisz e-mail, aby zresetować hasło'**
  String get resetPasswordTitle;

  /// No description provided for @resetPasswordSubmit.
  ///
  /// In pl, this message translates to:
  /// **'Wyślij'**
  String get resetPasswordSubmit;

  /// No description provided for @resetPasswordSentTitle.
  ///
  /// In pl, this message translates to:
  /// **'Twoje hasło zostało zresetowane'**
  String get resetPasswordSentTitle;

  /// No description provided for @resetPasswordSentDescription.
  ///
  /// In pl, this message translates to:
  /// **'Sprawdź swoją skrzynkę e-mailową'**
  String get resetPasswordSentDescription;

  /// No description provided for @resetPasswordFailedTitle.
  ///
  /// In pl, this message translates to:
  /// **'Poszło coś nie tak'**
  String get resetPasswordFailedTitle;

  /// No description provided for @homeAddNews.
  ///
  /// In pl, this message translates to:
  /// **'Dodaj do aktualności'**
  String get homeAddNews;

  /// No description provided for @homeNewsList.
  ///
  /// In pl, this message translates to:
  /// **'Lista aktualności'**
  String get homeNewsList;

  /// No description provided for @homeCategories.
  ///
  /// In pl, this message translates to:
  /// **'Zarządzaj kategoriami'**
  String get homeCategories;

  /// No description provided for @homeCompanies.
  ///
  /// In pl, this message translates to:
  /// **'Zarządzaj firmami'**
  String get homeCompanies;

  /// No description provided for @homeAddUnits.
  ///
  /// In pl, this message translates to:
  /// **'Dodaj jednostki'**
  String get homeAddUnits;

  /// No description provided for @homeAddUser.
  ///
  /// In pl, this message translates to:
  /// **'Dodaj użytkownika'**
  String get homeAddUser;

  /// No description provided for @homeImportUsers.
  ///
  /// In pl, this message translates to:
  /// **'Dodaj użytkowników z CSV'**
  String get homeImportUsers;

  /// No description provided for @homeUsersList.
  ///
  /// In pl, this message translates to:
  /// **'Lista użytkowników'**
  String get homeUsersList;

  /// No description provided for @homeAddAdmin.
  ///
  /// In pl, this message translates to:
  /// **'Dodaj administratora'**
  String get homeAddAdmin;

  /// No description provided for @homeOffers.
  ///
  /// In pl, this message translates to:
  /// **'Oferty'**
  String get homeOffers;

  /// No description provided for @homeSettings.
  ///
  /// In pl, this message translates to:
  /// **'Ustawienia'**
  String get homeSettings;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['pl'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'pl':
      return AppLocalizationsPl();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
