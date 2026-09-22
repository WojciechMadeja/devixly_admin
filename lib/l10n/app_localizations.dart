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

  /// No description provided for @loadError.
  ///
  /// In pl, this message translates to:
  /// **'Nie udało się pobrać danych'**
  String get loadError;

  /// No description provided for @categoriesTitle.
  ///
  /// In pl, this message translates to:
  /// **'Zarządzaj kategoriami'**
  String get categoriesTitle;

  /// No description provided for @categoryNameHint.
  ///
  /// In pl, this message translates to:
  /// **'Nazwa kategorii'**
  String get categoryNameHint;

  /// No description provided for @categoryNameRequired.
  ///
  /// In pl, this message translates to:
  /// **'Wpisz nazwę kategorii'**
  String get categoryNameRequired;

  /// No description provided for @categoryNewsCount.
  ///
  /// In pl, this message translates to:
  /// **'Aktualności:  {count}'**
  String categoryNewsCount(int count);

  /// No description provided for @categoryRenameTitle.
  ///
  /// In pl, this message translates to:
  /// **'Edytuj nazwę kategorii'**
  String get categoryRenameTitle;

  /// No description provided for @categoryDeleteMessage.
  ///
  /// In pl, this message translates to:
  /// **'Czy na pewno chcesz usunąć kategorię '**
  String get categoryDeleteMessage;

  /// No description provided for @companiesTitle.
  ///
  /// In pl, this message translates to:
  /// **'Zarządzaj firmami'**
  String get companiesTitle;

  /// No description provided for @companyNameHint.
  ///
  /// In pl, this message translates to:
  /// **'Nazwa firmy'**
  String get companyNameHint;

  /// No description provided for @companyNameRequired.
  ///
  /// In pl, this message translates to:
  /// **'Wpisz nazwę firmy'**
  String get companyNameRequired;

  /// No description provided for @companyEmailHint.
  ///
  /// In pl, this message translates to:
  /// **'E-mail'**
  String get companyEmailHint;

  /// No description provided for @companyEditEmailHint.
  ///
  /// In pl, this message translates to:
  /// **'Email'**
  String get companyEditEmailHint;

  /// No description provided for @companyAddressHint.
  ///
  /// In pl, this message translates to:
  /// **'Adres'**
  String get companyAddressHint;

  /// No description provided for @companyPostCodeHint.
  ///
  /// In pl, this message translates to:
  /// **'Kod pocztowy'**
  String get companyPostCodeHint;

  /// No description provided for @companyCityHint.
  ///
  /// In pl, this message translates to:
  /// **'Miasto'**
  String get companyCityHint;

  /// No description provided for @companyRepresentativeHint.
  ///
  /// In pl, this message translates to:
  /// **'Przedstawiciel firmy'**
  String get companyRepresentativeHint;

  /// No description provided for @companyPhoneHint.
  ///
  /// In pl, this message translates to:
  /// **'Numer telefonu'**
  String get companyPhoneHint;

  /// No description provided for @companyAgentsCount.
  ///
  /// In pl, this message translates to:
  /// **'Agentów:  {count}'**
  String companyAgentsCount(int count);

  /// No description provided for @companyEditTitle.
  ///
  /// In pl, this message translates to:
  /// **'Edytuj nazwę firmy'**
  String get companyEditTitle;

  /// No description provided for @companyBlockMessage.
  ///
  /// In pl, this message translates to:
  /// **'Czy na pewno chcesz zablokować firmę '**
  String get companyBlockMessage;

  /// No description provided for @companyUnblockMessage.
  ///
  /// In pl, this message translates to:
  /// **'Czy na pewno chcesz odblokować firmę '**
  String get companyUnblockMessage;

  /// No description provided for @companyDeleteMessage.
  ///
  /// In pl, this message translates to:
  /// **'Czy na pewno chcesz usunąć firmę '**
  String get companyDeleteMessage;

  /// No description provided for @companyWithAgentsSuffix.
  ///
  /// In pl, this message translates to:
  /// **' ze wszystkim przypisanymi jej agentami?'**
  String get companyWithAgentsSuffix;

  /// No description provided for @blockPhrase.
  ///
  /// In pl, this message translates to:
  /// **'BLOCK'**
  String get blockPhrase;

  /// No description provided for @unblockPhrase.
  ///
  /// In pl, this message translates to:
  /// **'UNBLOCK'**
  String get unblockPhrase;

  /// No description provided for @deletePhrase.
  ///
  /// In pl, this message translates to:
  /// **'DELETE'**
  String get deletePhrase;

  /// No description provided for @blockMismatch.
  ///
  /// In pl, this message translates to:
  /// **'Wpisz BLOCK, aby zablokować'**
  String get blockMismatch;

  /// No description provided for @unblockMismatch.
  ///
  /// In pl, this message translates to:
  /// **'Wpisz UNBLOCK, aby odblokować'**
  String get unblockMismatch;

  /// No description provided for @deleteMismatch.
  ///
  /// In pl, this message translates to:
  /// **'Wpisz DELETE, aby usunąć'**
  String get deleteMismatch;

  /// No description provided for @commonBlock.
  ///
  /// In pl, this message translates to:
  /// **'Zablokuj'**
  String get commonBlock;

  /// No description provided for @commonUnblock.
  ///
  /// In pl, this message translates to:
  /// **'Odblokuj'**
  String get commonUnblock;

  /// No description provided for @companyPickerEmpty.
  ///
  /// In pl, this message translates to:
  /// **'Nie masz  jeszcze dodanych firm'**
  String get companyPickerEmpty;

  /// No description provided for @companyPickerAdd.
  ///
  /// In pl, this message translates to:
  /// **'Dodaj firmę'**
  String get companyPickerAdd;

  /// No description provided for @newsListTitle.
  ///
  /// In pl, this message translates to:
  /// **'Lista aktualizacji'**
  String get newsListTitle;

  /// No description provided for @newsCategories.
  ///
  /// In pl, this message translates to:
  /// **'Kategorie: {names}'**
  String newsCategories(String names);

  /// No description provided for @newsDeleteMessage.
  ///
  /// In pl, this message translates to:
  /// **'Czy na pewno chcesz usunąć aktualizację:'**
  String get newsDeleteMessage;

  /// No description provided for @newsDeleted.
  ///
  /// In pl, this message translates to:
  /// **'Udało się'**
  String get newsDeleted;

  /// No description provided for @newsAddTitle.
  ///
  /// In pl, this message translates to:
  /// **'Dodaj do aktualności'**
  String get newsAddTitle;

  /// No description provided for @newsEditTitle.
  ///
  /// In pl, this message translates to:
  /// **'Edytuj aktualność'**
  String get newsEditTitle;

  /// No description provided for @newsAddPhoto.
  ///
  /// In pl, this message translates to:
  /// **'Dodaj zdjęcie'**
  String get newsAddPhoto;

  /// No description provided for @newsTitleHint.
  ///
  /// In pl, this message translates to:
  /// **'Tytuł'**
  String get newsTitleHint;

  /// No description provided for @newsContentHint.
  ///
  /// In pl, this message translates to:
  /// **'Opis'**
  String get newsContentHint;

  /// No description provided for @newsPickDate.
  ///
  /// In pl, this message translates to:
  /// **'Wybierz datę'**
  String get newsPickDate;

  /// No description provided for @newsAddSubmit.
  ///
  /// In pl, this message translates to:
  /// **'Dodaj'**
  String get newsAddSubmit;

  /// No description provided for @newsEditSubmit.
  ///
  /// In pl, this message translates to:
  /// **'Edytuj'**
  String get newsEditSubmit;

  /// No description provided for @newsAdded.
  ///
  /// In pl, this message translates to:
  /// **'Udało się zapisać aktualność'**
  String get newsAdded;

  /// No description provided for @newsAddFailed.
  ///
  /// In pl, this message translates to:
  /// **'Nie udało się dodać aktualności'**
  String get newsAddFailed;

  /// No description provided for @newsEdited.
  ///
  /// In pl, this message translates to:
  /// **'Udało się edytować'**
  String get newsEdited;

  /// No description provided for @newsEditFailed.
  ///
  /// In pl, this message translates to:
  /// **'Nie udało się edytować aktualności'**
  String get newsEditFailed;

  /// No description provided for @newsTitleRequired.
  ///
  /// In pl, this message translates to:
  /// **'Wpisz tytuł aktualności'**
  String get newsTitleRequired;

  /// No description provided for @newsUnsupportedImage.
  ///
  /// In pl, this message translates to:
  /// **'Nieobsługiwany format pliku — wybierz obrazek PNG, JPG lub GIF'**
  String get newsUnsupportedImage;
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
