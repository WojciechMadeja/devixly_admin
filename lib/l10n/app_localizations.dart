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
  /// **'Twoje hasło zostało zmienione'**
  String get resetPasswordSentTitle;

  /// No description provided for @resetPasswordSentDescription.
  ///
  /// In pl, this message translates to:
  /// **'Zaloguj się nowym hasłem'**
  String get resetPasswordSentDescription;

  /// No description provided for @resetPasswordCodeTitle.
  ///
  /// In pl, this message translates to:
  /// **'Wpisz kod z e-maila i nowe hasło'**
  String get resetPasswordCodeTitle;

  /// No description provided for @resetPasswordCodeHint.
  ///
  /// In pl, this message translates to:
  /// **'Kod z e-maila'**
  String get resetPasswordCodeHint;

  /// No description provided for @resetPasswordCodeRejectedTitle.
  ///
  /// In pl, this message translates to:
  /// **'Nie udało się zmienić hasła'**
  String get resetPasswordCodeRejectedTitle;

  /// No description provided for @resetPasswordCodeRejectedDescription.
  ///
  /// In pl, this message translates to:
  /// **'Sprawdź kod z e-maila. Hasło musi mieć co najmniej 8 znaków.'**
  String get resetPasswordCodeRejectedDescription;

  /// No description provided for @loginInvalidCredentialsTitle.
  ///
  /// In pl, this message translates to:
  /// **'Nie udało się zalogować'**
  String get loginInvalidCredentialsTitle;

  /// No description provided for @loginInvalidCredentialsDescription.
  ///
  /// In pl, this message translates to:
  /// **'Nieprawidłowy e-mail lub hasło. Po pięciu nieudanych próbach logowanie jest chwilowo wstrzymane.'**
  String get loginInvalidCredentialsDescription;

  /// No description provided for @loginNotAdminTitle.
  ///
  /// In pl, this message translates to:
  /// **'Brak uprawnień'**
  String get loginNotAdminTitle;

  /// No description provided for @loginNotAdminDescription.
  ///
  /// In pl, this message translates to:
  /// **'To konto nie ma uprawnień administratora, więc nie ma dostępu do panelu.'**
  String get loginNotAdminDescription;

  /// No description provided for @loginBlockedTitle.
  ///
  /// In pl, this message translates to:
  /// **'Konto zablokowane'**
  String get loginBlockedTitle;

  /// No description provided for @loginBlockedDescription.
  ///
  /// In pl, this message translates to:
  /// **'To konto zostało zablokowane. Skontaktuj się z innym administratorem.'**
  String get loginBlockedDescription;

  /// No description provided for @loginNoConnectionTitle.
  ///
  /// In pl, this message translates to:
  /// **'Brak połączenia'**
  String get loginNoConnectionTitle;

  /// No description provided for @loginNoConnectionDescription.
  ///
  /// In pl, this message translates to:
  /// **'Nie udało się połączyć z serwerem. Sprawdź połączenie z internetem i spróbuj ponownie.'**
  String get loginNoConnectionDescription;

  /// No description provided for @passwordTooShortTitle.
  ///
  /// In pl, this message translates to:
  /// **'Hasło jest za słabe'**
  String get passwordTooShortTitle;

  /// No description provided for @passwordTooShortDescription.
  ///
  /// In pl, this message translates to:
  /// **'Hasło musi mieć co najmniej 8 znaków i nie może zaczynać się ani kończyć spacją.'**
  String get passwordTooShortDescription;

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

  /// No description provided for @companyPickerPlaceholder.
  ///
  /// In pl, this message translates to:
  /// **'Wybierz firmę'**
  String get companyPickerPlaceholder;

  /// No description provided for @userEmailHint.
  ///
  /// In pl, this message translates to:
  /// **'E-mail'**
  String get userEmailHint;

  /// No description provided for @userFirstNameHint.
  ///
  /// In pl, this message translates to:
  /// **'Imię'**
  String get userFirstNameHint;

  /// No description provided for @userLastNameHint.
  ///
  /// In pl, this message translates to:
  /// **'Nazwisko'**
  String get userLastNameHint;

  /// No description provided for @userPhoneHint.
  ///
  /// In pl, this message translates to:
  /// **'Numer telefonu'**
  String get userPhoneHint;

  /// No description provided for @userPasswordHint.
  ///
  /// In pl, this message translates to:
  /// **'Hasło'**
  String get userPasswordHint;

  /// No description provided for @addUserTitle.
  ///
  /// In pl, this message translates to:
  /// **'Dodaj dane użytkownika'**
  String get addUserTitle;

  /// No description provided for @addAdminTitle.
  ///
  /// In pl, this message translates to:
  /// **'Dodaj admina'**
  String get addAdminTitle;

  /// No description provided for @userSaved.
  ///
  /// In pl, this message translates to:
  /// **'Pomyślnie zapisano użytkownika'**
  String get userSaved;

  /// No description provided for @userSaveFailed.
  ///
  /// In pl, this message translates to:
  /// **'Nie udało się zapisać użytkownika'**
  String get userSaveFailed;

  /// No description provided for @formIncomplete.
  ///
  /// In pl, this message translates to:
  /// **'Wszystkie pola powinny być wypełnione'**
  String get formIncomplete;

  /// No description provided for @usersListTitle.
  ///
  /// In pl, this message translates to:
  /// **'Lista użytkowników'**
  String get usersListTitle;

  /// No description provided for @usersColumnNumber.
  ///
  /// In pl, this message translates to:
  /// **'Lp.'**
  String get usersColumnNumber;

  /// No description provided for @usersColumnName.
  ///
  /// In pl, this message translates to:
  /// **'Nazwisko i imię'**
  String get usersColumnName;

  /// No description provided for @usersColumnCompany.
  ///
  /// In pl, this message translates to:
  /// **'Firma'**
  String get usersColumnCompany;

  /// No description provided for @usersColumnAdmin.
  ///
  /// In pl, this message translates to:
  /// **'Admin'**
  String get usersColumnAdmin;

  /// No description provided for @usersColumnActions.
  ///
  /// In pl, this message translates to:
  /// **'Akcje'**
  String get usersColumnActions;

  /// No description provided for @usersColumnEmail.
  ///
  /// In pl, this message translates to:
  /// **'E-mail'**
  String get usersColumnEmail;

  /// No description provided for @usersColumnPhone.
  ///
  /// In pl, this message translates to:
  /// **'Numer telefonu'**
  String get usersColumnPhone;

  /// No description provided for @yes.
  ///
  /// In pl, this message translates to:
  /// **'Tak'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In pl, this message translates to:
  /// **'Nie'**
  String get no;

  /// No description provided for @userPreviewName.
  ///
  /// In pl, this message translates to:
  /// **'Imię i nazwisko: '**
  String get userPreviewName;

  /// No description provided for @userPreviewEmail.
  ///
  /// In pl, this message translates to:
  /// **'Adres e-mail: '**
  String get userPreviewEmail;

  /// No description provided for @userPreviewPhone.
  ///
  /// In pl, this message translates to:
  /// **'Numer telefonu: '**
  String get userPreviewPhone;

  /// No description provided for @userPreviewDeals.
  ///
  /// In pl, this message translates to:
  /// **'Deale'**
  String get userPreviewDeals;

  /// No description provided for @userEditTitle.
  ///
  /// In pl, this message translates to:
  /// **'Edytuj użytkownika'**
  String get userEditTitle;

  /// No description provided for @userBlockMessage.
  ///
  /// In pl, this message translates to:
  /// **'Czy na pewno chcesz zablokować użytkownika '**
  String get userBlockMessage;

  /// No description provided for @userUnblockMessage.
  ///
  /// In pl, this message translates to:
  /// **'Czy na pewno chcesz odblokować użytkownika '**
  String get userUnblockMessage;

  /// No description provided for @userDeleteMessage.
  ///
  /// In pl, this message translates to:
  /// **'Czy na pewno chcesz usunąć użytkownika '**
  String get userDeleteMessage;

  /// No description provided for @userDeleteAdminSuffix.
  ///
  /// In pl, this message translates to:
  /// **' z prawami administratora?'**
  String get userDeleteAdminSuffix;

  /// No description provided for @userQuestionMark.
  ///
  /// In pl, this message translates to:
  /// **'?'**
  String get userQuestionMark;

  /// No description provided for @deleteAdminPhrase.
  ///
  /// In pl, this message translates to:
  /// **'DELETE ADMIN'**
  String get deleteAdminPhrase;

  /// No description provided for @deleteAdminMismatch.
  ///
  /// In pl, this message translates to:
  /// **'Wpisz DELETE ADMIN, aby usunąć'**
  String get deleteAdminMismatch;

  /// No description provided for @userBlockedCompanyTitle.
  ///
  /// In pl, this message translates to:
  /// **'Nie możesz tego zrobić'**
  String get userBlockedCompanyTitle;

  /// No description provided for @userBlockedCompanyDescription.
  ///
  /// In pl, this message translates to:
  /// **'Nie możesz odblokować tego użytkownika, ponieważ jego firma jest zablokowana. Aby odblokować użytkownika, odblokuj firmę.'**
  String get userBlockedCompanyDescription;

  /// No description provided for @csvLoadFile.
  ///
  /// In pl, this message translates to:
  /// **'Załaduj plik'**
  String get csvLoadFile;

  /// No description provided for @csvDeleteMessage.
  ///
  /// In pl, this message translates to:
  /// **'Czy na pewno chcesz usunąć użytkownika:'**
  String get csvDeleteMessage;

  /// No description provided for @csvInvalidEmailsTitle.
  ///
  /// In pl, this message translates to:
  /// **'Błąd'**
  String get csvInvalidEmailsTitle;

  /// No description provided for @csvInvalidEmailsDescription.
  ///
  /// In pl, this message translates to:
  /// **'Poniżej jest lista błędów zwiazanych z walidacją adresu e-mail:'**
  String get csvInvalidEmailsDescription;

  /// No description provided for @csvNotRecognizedTitle.
  ///
  /// In pl, this message translates to:
  /// **'Błąd'**
  String get csvNotRecognizedTitle;

  /// No description provided for @csvNotRecognizedDescription.
  ///
  /// In pl, this message translates to:
  /// **'Wybrany plik nie jest plikiem CSV'**
  String get csvNotRecognizedDescription;

  /// No description provided for @csvMissingHeadersDescription.
  ///
  /// In pl, this message translates to:
  /// **'Plik CSV musi zawierać kolumny: firstName, lastName, email, phoneNumber'**
  String get csvMissingHeadersDescription;

  /// No description provided for @csvImported.
  ///
  /// In pl, this message translates to:
  /// **'Użytkownicy zostali dodani'**
  String get csvImported;

  /// No description provided for @csvImportFailed.
  ///
  /// In pl, this message translates to:
  /// **'Nie udało się dodać użytkowników'**
  String get csvImportFailed;

  /// No description provided for @csvPasswordEmailFailedTitle.
  ///
  /// In pl, this message translates to:
  /// **'Konta utworzone, ale bez haseł'**
  String get csvPasswordEmailFailedTitle;

  /// No description provided for @csvPasswordEmailFailedDescription.
  ///
  /// In pl, this message translates to:
  /// **'Nie udało się wysłać hasła na poniższe adresy. Poproś te osoby o użycie opcji „Zapomniałeś hasła”:'**
  String get csvPasswordEmailFailedDescription;

  /// No description provided for @csvNothingToImport.
  ///
  /// In pl, this message translates to:
  /// **'Wczytaj plik CSV i wybierz firmę'**
  String get csvNothingToImport;

  /// No description provided for @settingsCompanyPlaceholder.
  ///
  /// In pl, this message translates to:
  /// **'Firma'**
  String get settingsCompanyPlaceholder;

  /// No description provided for @settingsEmailPlaceholder.
  ///
  /// In pl, this message translates to:
  /// **'Email'**
  String get settingsEmailPlaceholder;

  /// No description provided for @settingsPhonePlaceholder.
  ///
  /// In pl, this message translates to:
  /// **'Numer Telefonu'**
  String get settingsPhonePlaceholder;

  /// No description provided for @settingsEditProfile.
  ///
  /// In pl, this message translates to:
  /// **'Edytuj dane osobowe'**
  String get settingsEditProfile;

  /// No description provided for @settingsChangePassword.
  ///
  /// In pl, this message translates to:
  /// **'Zmień hasło'**
  String get settingsChangePassword;

  /// No description provided for @editProfileTitle.
  ///
  /// In pl, this message translates to:
  /// **'Zmień swoje dane osobowe'**
  String get editProfileTitle;

  /// No description provided for @profileSavedTitle.
  ///
  /// In pl, this message translates to:
  /// **'Zmiany zapisane'**
  String get profileSavedTitle;

  /// No description provided for @profileSavedDescription.
  ///
  /// In pl, this message translates to:
  /// **'Zapisano zmiany'**
  String get profileSavedDescription;

  /// No description provided for @emptyFieldsTitle.
  ///
  /// In pl, this message translates to:
  /// **'Pola nie mogą być puste'**
  String get emptyFieldsTitle;

  /// No description provided for @errorDialogTitle.
  ///
  /// In pl, this message translates to:
  /// **'Błąd'**
  String get errorDialogTitle;

  /// No description provided for @errorDialogDescription.
  ///
  /// In pl, this message translates to:
  /// **'Coś poszło nie tak.'**
  String get errorDialogDescription;

  /// No description provided for @updatePasswordTitle.
  ///
  /// In pl, this message translates to:
  /// **'Zmień swoje hasło'**
  String get updatePasswordTitle;

  /// No description provided for @passwordCurrentHint.
  ///
  /// In pl, this message translates to:
  /// **'Aktualne hasło'**
  String get passwordCurrentHint;

  /// No description provided for @passwordNewHint.
  ///
  /// In pl, this message translates to:
  /// **'Nowe hasło'**
  String get passwordNewHint;

  /// No description provided for @passwordRepeatHint.
  ///
  /// In pl, this message translates to:
  /// **'Powtórz nowe hasło'**
  String get passwordRepeatHint;

  /// No description provided for @passwordUpdatedDescription.
  ///
  /// In pl, this message translates to:
  /// **'Zaktualizowano hasło do konta.'**
  String get passwordUpdatedDescription;

  /// No description provided for @passwordMismatchTitle.
  ///
  /// In pl, this message translates to:
  /// **'Wartości nie są identyczne'**
  String get passwordMismatchTitle;

  /// No description provided for @passwordMismatchDescription.
  ///
  /// In pl, this message translates to:
  /// **'W polach Nowe hasło i Powtórz hasło wartości muszą być identyczne.'**
  String get passwordMismatchDescription;

  /// No description provided for @unitAddTitle.
  ///
  /// In pl, this message translates to:
  /// **'Dodaj jednostkę'**
  String get unitAddTitle;

  /// No description provided for @unitApartmentNumberHint.
  ///
  /// In pl, this message translates to:
  /// **'Numer mieszkania'**
  String get unitApartmentNumberHint;

  /// No description provided for @unitPriceHint.
  ///
  /// In pl, this message translates to:
  /// **'Cena'**
  String get unitPriceHint;

  /// No description provided for @unitSaved.
  ///
  /// In pl, this message translates to:
  /// **'Pomyślnie zapisano jednostkę'**
  String get unitSaved;

  /// No description provided for @unitSaveFailed.
  ///
  /// In pl, this message translates to:
  /// **'Nie udało się zapisać jednostki'**
  String get unitSaveFailed;

  /// No description provided for @pickerSearchHint.
  ///
  /// In pl, this message translates to:
  /// **'Szukaj'**
  String get pickerSearchHint;

  /// No description provided for @pickerNoResults.
  ///
  /// In pl, this message translates to:
  /// **'Brak pasujących pozycji'**
  String get pickerNoResults;

  /// No description provided for @homeAddProjects.
  ///
  /// In pl, this message translates to:
  /// **'Dodaj projekty'**
  String get homeAddProjects;

  /// No description provided for @projectAddTitle.
  ///
  /// In pl, this message translates to:
  /// **'Dodaj projekt'**
  String get projectAddTitle;

  /// No description provided for @projectNameHint.
  ///
  /// In pl, this message translates to:
  /// **'Nazwa projektu'**
  String get projectNameHint;

  /// No description provided for @projectExternalIdHint.
  ///
  /// In pl, this message translates to:
  /// **'Numer projektu (externalId)'**
  String get projectExternalIdHint;

  /// No description provided for @projectNocHint.
  ///
  /// In pl, this message translates to:
  /// **'NOC'**
  String get projectNocHint;

  /// No description provided for @projectStatusHint.
  ///
  /// In pl, this message translates to:
  /// **'Status, np. available'**
  String get projectStatusHint;

  /// No description provided for @projectDescriptionPlHint.
  ///
  /// In pl, this message translates to:
  /// **'Opis po polsku'**
  String get projectDescriptionPlHint;

  /// No description provided for @projectDescriptionEnHint.
  ///
  /// In pl, this message translates to:
  /// **'Opis po angielsku'**
  String get projectDescriptionEnHint;

  /// No description provided for @projectPriceFromHint.
  ///
  /// In pl, this message translates to:
  /// **'Cena od'**
  String get projectPriceFromHint;

  /// No description provided for @projectPriceToHint.
  ///
  /// In pl, this message translates to:
  /// **'Cena do'**
  String get projectPriceToHint;

  /// No description provided for @projectAreaFromHint.
  ///
  /// In pl, this message translates to:
  /// **'Powierzchnia od'**
  String get projectAreaFromHint;

  /// No description provided for @projectAreaToHint.
  ///
  /// In pl, this message translates to:
  /// **'Powierzchnia do'**
  String get projectAreaToHint;

  /// No description provided for @projectDistrictPlaceholder.
  ///
  /// In pl, this message translates to:
  /// **'Wybierz dzielnicę'**
  String get projectDistrictPlaceholder;

  /// No description provided for @projectDeveloperPlaceholder.
  ///
  /// In pl, this message translates to:
  /// **'Wybierz dewelopera'**
  String get projectDeveloperPlaceholder;

  /// No description provided for @projectHandoverLabel.
  ///
  /// In pl, this message translates to:
  /// **'Termin oddania'**
  String get projectHandoverLabel;

  /// No description provided for @projectStartOfSalesLabel.
  ///
  /// In pl, this message translates to:
  /// **'Start sprzedaży'**
  String get projectStartOfSalesLabel;

  /// No description provided for @projectOwnershipPlaceholder.
  ///
  /// In pl, this message translates to:
  /// **'Rodzaj własności'**
  String get projectOwnershipPlaceholder;

  /// No description provided for @projectOwnershipFreehold.
  ///
  /// In pl, this message translates to:
  /// **'Freehold'**
  String get projectOwnershipFreehold;

  /// No description provided for @projectOwnershipLeasehold.
  ///
  /// In pl, this message translates to:
  /// **'Leasehold'**
  String get projectOwnershipLeasehold;

  /// No description provided for @projectSaleDeveloper.
  ///
  /// In pl, this message translates to:
  /// **'Sprzedaż od dewelopera'**
  String get projectSaleDeveloper;

  /// No description provided for @projectSaleResale.
  ///
  /// In pl, this message translates to:
  /// **'Sprzedaż wtórna'**
  String get projectSaleResale;

  /// No description provided for @projectSaleWarning.
  ///
  /// In pl, this message translates to:
  /// **'Projekt tylko z rynku wtórnego albo ze statusem „sold_out” jest usuwany przez nocną synchronizację.'**
  String get projectSaleWarning;

  /// No description provided for @projectSaved.
  ///
  /// In pl, this message translates to:
  /// **'Pomyślnie zapisano projekt'**
  String get projectSaved;

  /// No description provided for @projectSaveFailed.
  ///
  /// In pl, this message translates to:
  /// **'Nie udało się zapisać projektu'**
  String get projectSaveFailed;

  /// No description provided for @projectRequiredFields.
  ///
  /// In pl, this message translates to:
  /// **'Uzupełnij nazwę, numer projektu i NOC'**
  String get projectRequiredFields;

  /// No description provided for @unitProjectPlaceholder.
  ///
  /// In pl, this message translates to:
  /// **'Wyszukaj projekt'**
  String get unitProjectPlaceholder;

  /// No description provided for @unitProjectLoading.
  ///
  /// In pl, this message translates to:
  /// **'Wczytywanie projektów…'**
  String get unitProjectLoading;

  /// No description provided for @unitProjectSearchHint.
  ///
  /// In pl, this message translates to:
  /// **'Szukaj po nazwie lub numerze'**
  String get unitProjectSearchHint;

  /// No description provided for @unitProjectLabel.
  ///
  /// In pl, this message translates to:
  /// **'Projekt'**
  String get unitProjectLabel;

  /// No description provided for @projectExternalIdLabel.
  ///
  /// In pl, this message translates to:
  /// **'Nr'**
  String get projectExternalIdLabel;

  /// No description provided for @homeProjectsList.
  ///
  /// In pl, this message translates to:
  /// **'Lista projektów'**
  String get homeProjectsList;

  /// No description provided for @projectsListTitle.
  ///
  /// In pl, this message translates to:
  /// **'Lista projektów'**
  String get projectsListTitle;

  /// No description provided for @projectsSearchHint.
  ///
  /// In pl, this message translates to:
  /// **'Szukaj projektu po nazwie'**
  String get projectsSearchHint;

  /// No description provided for @projectsEmpty.
  ///
  /// In pl, this message translates to:
  /// **'Brak projektów do pokazania'**
  String get projectsEmpty;

  /// No description provided for @projectsColumnName.
  ///
  /// In pl, this message translates to:
  /// **'Nazwa'**
  String get projectsColumnName;

  /// No description provided for @projectsColumnDistrict.
  ///
  /// In pl, this message translates to:
  /// **'Dzielnica'**
  String get projectsColumnDistrict;

  /// No description provided for @projectsColumnDeveloper.
  ///
  /// In pl, this message translates to:
  /// **'Deweloper'**
  String get projectsColumnDeveloper;

  /// No description provided for @projectsColumnStatus.
  ///
  /// In pl, this message translates to:
  /// **'Status'**
  String get projectsColumnStatus;

  /// No description provided for @projectsColumnHandover.
  ///
  /// In pl, this message translates to:
  /// **'Oddanie'**
  String get projectsColumnHandover;

  /// No description provided for @projectsColumnPrice.
  ///
  /// In pl, this message translates to:
  /// **'Ceny jednostek'**
  String get projectsColumnPrice;

  /// No description provided for @projectManualBadge.
  ///
  /// In pl, this message translates to:
  /// **'ręczny'**
  String get projectManualBadge;

  /// No description provided for @projectDetailsTitle.
  ///
  /// In pl, this message translates to:
  /// **'Projekt'**
  String get projectDetailsTitle;

  /// No description provided for @projectDetailsPaymentPlans.
  ///
  /// In pl, this message translates to:
  /// **'Plany płatności'**
  String get projectDetailsPaymentPlans;

  /// No description provided for @projectDetailsNoPaymentPlans.
  ///
  /// In pl, this message translates to:
  /// **'Ten projekt nie ma planów płatności'**
  String get projectDetailsNoPaymentPlans;

  /// No description provided for @projectDetailsPostHandover.
  ///
  /// In pl, this message translates to:
  /// **'Płatności po odbiorze'**
  String get projectDetailsPostHandover;

  /// No description provided for @projectDetailsUnits.
  ///
  /// In pl, this message translates to:
  /// **'Jednostki'**
  String get projectDetailsUnits;

  /// No description provided for @projectDetailsImages.
  ///
  /// In pl, this message translates to:
  /// **'Zdjęcia'**
  String get projectDetailsImages;

  /// No description provided for @projectDetailsNoImages.
  ///
  /// In pl, this message translates to:
  /// **'Ten projekt nie ma zdjęć'**
  String get projectDetailsNoImages;

  /// No description provided for @unitNoLayouts.
  ///
  /// In pl, this message translates to:
  /// **'Ta jednostka nie ma rzutów'**
  String get unitNoLayouts;

  /// No description provided for @unitsColumnActions.
  ///
  /// In pl, this message translates to:
  /// **'Podgląd'**
  String get unitsColumnActions;

  /// No description provided for @projectDetailsNoUnits.
  ///
  /// In pl, this message translates to:
  /// **'Ten projekt nie ma jeszcze jednostek'**
  String get projectDetailsNoUnits;

  /// No description provided for @projectDetailsAddUnit.
  ///
  /// In pl, this message translates to:
  /// **'Dodaj jednostkę'**
  String get projectDetailsAddUnit;

  /// No description provided for @projectDetailsDeveloper.
  ///
  /// In pl, this message translates to:
  /// **'Deweloper'**
  String get projectDetailsDeveloper;

  /// No description provided for @projectDetailsDistrict.
  ///
  /// In pl, this message translates to:
  /// **'Dzielnica'**
  String get projectDetailsDistrict;

  /// No description provided for @projectDetailsStatus.
  ///
  /// In pl, this message translates to:
  /// **'Status'**
  String get projectDetailsStatus;

  /// No description provided for @projectDetailsHandover.
  ///
  /// In pl, this message translates to:
  /// **'Termin oddania'**
  String get projectDetailsHandover;

  /// No description provided for @projectDetailsStartOfSales.
  ///
  /// In pl, this message translates to:
  /// **'Start sprzedaży'**
  String get projectDetailsStartOfSales;

  /// No description provided for @projectDetailsOwnership.
  ///
  /// In pl, this message translates to:
  /// **'Rodzaj własności'**
  String get projectDetailsOwnership;

  /// No description provided for @projectDetailsPrices.
  ///
  /// In pl, this message translates to:
  /// **'Ceny jednostek'**
  String get projectDetailsPrices;

  /// No description provided for @projectDetailsAreas.
  ///
  /// In pl, this message translates to:
  /// **'Powierzchnie'**
  String get projectDetailsAreas;

  /// No description provided for @projectDetailsSaleTypes.
  ///
  /// In pl, this message translates to:
  /// **'Typy sprzedaży'**
  String get projectDetailsSaleTypes;

  /// No description provided for @projectDetailsDescription.
  ///
  /// In pl, this message translates to:
  /// **'Opis'**
  String get projectDetailsDescription;

  /// No description provided for @unitsColumnNumber.
  ///
  /// In pl, this message translates to:
  /// **'Numer'**
  String get unitsColumnNumber;

  /// No description provided for @unitsColumnFloor.
  ///
  /// In pl, this message translates to:
  /// **'Piętro'**
  String get unitsColumnFloor;

  /// No description provided for @unitsColumnArea.
  ///
  /// In pl, this message translates to:
  /// **'Powierzchnia'**
  String get unitsColumnArea;

  /// No description provided for @unitsColumnPrice.
  ///
  /// In pl, this message translates to:
  /// **'Cena'**
  String get unitsColumnPrice;

  /// No description provided for @unitsColumnPricePer.
  ///
  /// In pl, this message translates to:
  /// **'Cena / ft²'**
  String get unitsColumnPricePer;

  /// No description provided for @unitsColumnStatus.
  ///
  /// In pl, this message translates to:
  /// **'Status'**
  String get unitsColumnStatus;

  /// No description provided for @unitsColumnType.
  ///
  /// In pl, this message translates to:
  /// **'Typ'**
  String get unitsColumnType;

  /// No description provided for @unitsColumnLayout.
  ///
  /// In pl, this message translates to:
  /// **'Układ'**
  String get unitsColumnLayout;

  /// No description provided for @valueRange.
  ///
  /// In pl, this message translates to:
  /// **'{from} – {to}'**
  String valueRange(String from, String to);

  /// No description provided for @valueMissing.
  ///
  /// In pl, this message translates to:
  /// **'—'**
  String get valueMissing;

  /// No description provided for @unitNumberHint.
  ///
  /// In pl, this message translates to:
  /// **'Numer jednostki'**
  String get unitNumberHint;

  /// No description provided for @unitAreaHint.
  ///
  /// In pl, this message translates to:
  /// **'Powierzchnia (ft²)'**
  String get unitAreaHint;

  /// No description provided for @unitFloorHint.
  ///
  /// In pl, this message translates to:
  /// **'Piętro'**
  String get unitFloorHint;

  /// No description provided for @unitStatusHint.
  ///
  /// In pl, this message translates to:
  /// **'Status, np. available'**
  String get unitStatusHint;

  /// No description provided for @unitHeightHint.
  ///
  /// In pl, this message translates to:
  /// **'Forma, np. Simplex'**
  String get unitHeightHint;

  /// No description provided for @unitTypeOfSaleHint.
  ///
  /// In pl, this message translates to:
  /// **'Typ sprzedaży, np. offPlan'**
  String get unitTypeOfSaleHint;

  /// No description provided for @unitTypePlaceholder.
  ///
  /// In pl, this message translates to:
  /// **'Typ jednostki'**
  String get unitTypePlaceholder;

  /// No description provided for @unitLayoutPlaceholder.
  ///
  /// In pl, this message translates to:
  /// **'Układ'**
  String get unitLayoutPlaceholder;

  /// No description provided for @unitRequiredFields.
  ///
  /// In pl, this message translates to:
  /// **'Wybierz projekt i podaj numer jednostki'**
  String get unitRequiredFields;

  /// No description provided for @unitManualNote.
  ///
  /// In pl, this message translates to:
  /// **'Jednostki dodane tutaj nie są nadpisywane przez nocną synchronizację z GenieMap.'**
  String get unitManualNote;
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
    'that was used.',
  );
}
