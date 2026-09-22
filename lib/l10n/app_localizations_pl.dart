// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get commonCancel => 'Anuluj';

  @override
  String get commonClose => 'Zamknij';

  @override
  String get commonDelete => 'Usuń';

  @override
  String get commonSave => 'Zapisz';

  @override
  String get commonBack => 'Cofnij';

  @override
  String get confirmChoiceTitle => 'Potwierdź swój wybór';

  @override
  String typedConfirmationHint(String phrase) {
    return 'Wpisz $phrase';
  }

  @override
  String get errorGeneric => 'Coś poszło nie tak';

  @override
  String get loginEmailHint => 'E-mail';

  @override
  String get loginPasswordHint => 'Hasło';

  @override
  String get loginForgotPassword => 'Zapomniałeś hasła? Kliknij';

  @override
  String get loginSubmit => 'Zaloguj';

  @override
  String get loginEmptyFieldsTitle => 'Pola nie mogą być puste!';

  @override
  String get loginEmptyFieldsDescription =>
      'Uzupełnij pola o adres e-mail i hasło';

  @override
  String get invalidEmailTitle => 'Zły format e-mail';

  @override
  String get invalidEmailDescription => 'Wpisz poprawny adres e-mail';

  @override
  String get resetPasswordTitle => 'Wpisz e-mail, aby zresetować hasło';

  @override
  String get resetPasswordSubmit => 'Wyślij';

  @override
  String get resetPasswordSentTitle => 'Twoje hasło zostało zresetowane';

  @override
  String get resetPasswordSentDescription => 'Sprawdź swoją skrzynkę e-mailową';

  @override
  String get resetPasswordFailedTitle => 'Poszło coś nie tak';

  @override
  String get homeAddNews => 'Dodaj do aktualności';

  @override
  String get homeNewsList => 'Lista aktualności';

  @override
  String get homeCategories => 'Zarządzaj kategoriami';

  @override
  String get homeCompanies => 'Zarządzaj firmami';

  @override
  String get homeAddUnits => 'Dodaj jednostki';

  @override
  String get homeAddUser => 'Dodaj użytkownika';

  @override
  String get homeImportUsers => 'Dodaj użytkowników z CSV';

  @override
  String get homeUsersList => 'Lista użytkowników';

  @override
  String get homeAddAdmin => 'Dodaj administratora';

  @override
  String get homeOffers => 'Oferty';

  @override
  String get homeSettings => 'Ustawienia';

  @override
  String get loadError => 'Nie udało się pobrać danych';

  @override
  String get categoriesTitle => 'Zarządzaj kategoriami';

  @override
  String get categoryNameHint => 'Nazwa kategorii';

  @override
  String get categoryNameRequired => 'Wpisz nazwę kategorii';

  @override
  String categoryNewsCount(int count) {
    return 'Aktualności:  $count';
  }

  @override
  String get categoryRenameTitle => 'Edytuj nazwę kategorii';

  @override
  String get categoryDeleteMessage => 'Czy na pewno chcesz usunąć kategorię ';

  @override
  String get companiesTitle => 'Zarządzaj firmami';

  @override
  String get companyNameHint => 'Nazwa firmy';

  @override
  String get companyNameRequired => 'Wpisz nazwę firmy';

  @override
  String get companyEmailHint => 'E-mail';

  @override
  String get companyEditEmailHint => 'Email';

  @override
  String get companyAddressHint => 'Adres';

  @override
  String get companyPostCodeHint => 'Kod pocztowy';

  @override
  String get companyCityHint => 'Miasto';

  @override
  String get companyRepresentativeHint => 'Przedstawiciel firmy';

  @override
  String get companyPhoneHint => 'Numer telefonu';

  @override
  String companyAgentsCount(int count) {
    return 'Agentów:  $count';
  }

  @override
  String get companyEditTitle => 'Edytuj nazwę firmy';

  @override
  String get companyBlockMessage => 'Czy na pewno chcesz zablokować firmę ';

  @override
  String get companyUnblockMessage => 'Czy na pewno chcesz odblokować firmę ';

  @override
  String get companyDeleteMessage => 'Czy na pewno chcesz usunąć firmę ';

  @override
  String get companyWithAgentsSuffix =>
      ' ze wszystkim przypisanymi jej agentami?';

  @override
  String get blockPhrase => 'BLOCK';

  @override
  String get unblockPhrase => 'UNBLOCK';

  @override
  String get deletePhrase => 'DELETE';

  @override
  String get blockMismatch => 'Wpisz BLOCK, aby zablokować';

  @override
  String get unblockMismatch => 'Wpisz UNBLOCK, aby odblokować';

  @override
  String get deleteMismatch => 'Wpisz DELETE, aby usunąć';

  @override
  String get commonBlock => 'Zablokuj';

  @override
  String get commonUnblock => 'Odblokuj';

  @override
  String get companyPickerEmpty => 'Nie masz  jeszcze dodanych firm';

  @override
  String get companyPickerAdd => 'Dodaj firmę';

  @override
  String get newsListTitle => 'Lista aktualizacji';

  @override
  String newsCategories(String names) {
    return 'Kategorie: $names';
  }

  @override
  String get newsDeleteMessage => 'Czy na pewno chcesz usunąć aktualizację:';

  @override
  String get newsDeleted => 'Udało się';

  @override
  String get newsAddTitle => 'Dodaj do aktualności';

  @override
  String get newsEditTitle => 'Edytuj aktualność';

  @override
  String get newsAddPhoto => 'Dodaj zdjęcie';

  @override
  String get newsTitleHint => 'Tytuł';

  @override
  String get newsContentHint => 'Opis';

  @override
  String get newsPickDate => 'Wybierz datę';

  @override
  String get newsAddSubmit => 'Dodaj';

  @override
  String get newsEditSubmit => 'Edytuj';

  @override
  String get newsAdded => 'Udało się zapisać aktualność';

  @override
  String get newsAddFailed => 'Nie udało się dodać aktualności';

  @override
  String get newsEdited => 'Udało się edytować';

  @override
  String get newsEditFailed => 'Nie udało się edytować aktualności';

  @override
  String get newsTitleRequired => 'Wpisz tytuł aktualności';

  @override
  String get newsUnsupportedImage =>
      'Nieobsługiwany format pliku — wybierz obrazek PNG, JPG lub GIF';
}
