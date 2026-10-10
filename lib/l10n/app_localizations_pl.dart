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
  String get resetPasswordSentTitle => 'Twoje hasło zostało zmienione';

  @override
  String get resetPasswordSentDescription => 'Zaloguj się nowym hasłem';

  @override
  String get resetPasswordCodeTitle => 'Wpisz kod z e-maila i nowe hasło';

  @override
  String get resetPasswordCodeHint => 'Kod z e-maila';

  @override
  String get resetPasswordCodeRejectedTitle => 'Nie udało się zmienić hasła';

  @override
  String get resetPasswordCodeRejectedDescription =>
      'Sprawdź kod z e-maila. Hasło musi mieć co najmniej 8 znaków.';

  @override
  String get loginInvalidCredentialsTitle => 'Nie udało się zalogować';

  @override
  String get loginInvalidCredentialsDescription =>
      'Nieprawidłowy e-mail lub hasło. Po pięciu nieudanych próbach logowanie jest chwilowo wstrzymane.';

  @override
  String get loginNotAdminTitle => 'Brak uprawnień';

  @override
  String get loginNotAdminDescription =>
      'To konto nie ma uprawnień administratora, więc nie ma dostępu do panelu.';

  @override
  String get loginBlockedTitle => 'Konto zablokowane';

  @override
  String get loginBlockedDescription =>
      'To konto zostało zablokowane. Skontaktuj się z innym administratorem.';

  @override
  String get loginNoConnectionTitle => 'Brak połączenia';

  @override
  String get loginNoConnectionDescription =>
      'Nie udało się połączyć z serwerem. Sprawdź połączenie z internetem i spróbuj ponownie.';

  @override
  String get passwordTooShortTitle => 'Hasło jest za słabe';

  @override
  String get passwordTooShortDescription =>
      'Hasło musi mieć co najmniej 8 znaków i nie może zaczynać się ani kończyć spacją.';

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

  @override
  String get companyPickerPlaceholder => 'Wybierz firmę';

  @override
  String get userEmailHint => 'E-mail';

  @override
  String get userFirstNameHint => 'Imię';

  @override
  String get userLastNameHint => 'Nazwisko';

  @override
  String get userPhoneHint => 'Numer telefonu';

  @override
  String get userPasswordHint => 'Hasło';

  @override
  String get addUserTitle => 'Dodaj dane użytkownika';

  @override
  String get addAdminTitle => 'Dodaj admina';

  @override
  String get userSaved => 'Pomyślnie zapisano użytkownika';

  @override
  String get userSaveFailed => 'Nie udało się zapisać użytkownika';

  @override
  String get formIncomplete => 'Wszystkie pola powinny być wypełnione';

  @override
  String get usersListTitle => 'Lista użytkowników';

  @override
  String get usersColumnNumber => 'Lp.';

  @override
  String get usersColumnName => 'Nazwisko i imię';

  @override
  String get usersColumnCompany => 'Firma';

  @override
  String get usersColumnAdmin => 'Admin';

  @override
  String get usersColumnActions => 'Akcje';

  @override
  String get usersColumnEmail => 'E-mail';

  @override
  String get usersColumnPhone => 'Numer telefonu';

  @override
  String get yes => 'Tak';

  @override
  String get no => 'Nie';

  @override
  String get userPreviewName => 'Imię i nazwisko: ';

  @override
  String get userPreviewEmail => 'Adres e-mail: ';

  @override
  String get userPreviewPhone => 'Numer telefonu: ';

  @override
  String get userPreviewDeals => 'Deale';

  @override
  String get userEditTitle => 'Edytuj użytkownika';

  @override
  String get userBlockMessage => 'Czy na pewno chcesz zablokować użytkownika ';

  @override
  String get userUnblockMessage =>
      'Czy na pewno chcesz odblokować użytkownika ';

  @override
  String get userDeleteMessage => 'Czy na pewno chcesz usunąć użytkownika ';

  @override
  String get userDeleteAdminSuffix => ' z prawami administratora?';

  @override
  String get userQuestionMark => '?';

  @override
  String get deleteAdminPhrase => 'DELETE ADMIN';

  @override
  String get deleteAdminMismatch => 'Wpisz DELETE ADMIN, aby usunąć';

  @override
  String get userBlockedCompanyTitle => 'Nie możesz tego zrobić';

  @override
  String get userBlockedCompanyDescription =>
      'Nie możesz odblokować tego użytkownika, ponieważ jego firma jest zablokowana. Aby odblokować użytkownika, odblokuj firmę.';

  @override
  String get csvLoadFile => 'Załaduj plik';

  @override
  String get csvDeleteMessage => 'Czy na pewno chcesz usunąć użytkownika:';

  @override
  String get csvInvalidEmailsTitle => 'Błąd';

  @override
  String get csvInvalidEmailsDescription =>
      'Poniżej jest lista błędów zwiazanych z walidacją adresu e-mail:';

  @override
  String get csvNotRecognizedTitle => 'Błąd';

  @override
  String get csvNotRecognizedDescription => 'Wybrany plik nie jest plikiem CSV';

  @override
  String get csvMissingHeadersDescription =>
      'Plik CSV musi zawierać kolumny: firstName, lastName, email, phoneNumber';

  @override
  String get csvImported => 'Użytkownicy zostali dodani';

  @override
  String get csvImportFailed => 'Nie udało się dodać użytkowników';

  @override
  String get csvPasswordEmailFailedTitle => 'Konta utworzone, ale bez haseł';

  @override
  String get csvPasswordEmailFailedDescription =>
      'Nie udało się wysłać hasła na poniższe adresy. Poproś te osoby o użycie opcji „Zapomniałeś hasła”:';

  @override
  String get csvNothingToImport => 'Wczytaj plik CSV i wybierz firmę';

  @override
  String get settingsCompanyPlaceholder => 'Firma';

  @override
  String get settingsEmailPlaceholder => 'Email';

  @override
  String get settingsPhonePlaceholder => 'Numer Telefonu';

  @override
  String get settingsEditProfile => 'Edytuj dane osobowe';

  @override
  String get settingsChangePassword => 'Zmień hasło';

  @override
  String get editProfileTitle => 'Zmień swoje dane osobowe';

  @override
  String get profileSavedTitle => 'Zmiany zapisane';

  @override
  String get profileSavedDescription => 'Zapisano zmiany';

  @override
  String get emptyFieldsTitle => 'Pola nie mogą być puste';

  @override
  String get errorDialogTitle => 'Błąd';

  @override
  String get errorDialogDescription => 'Coś poszło nie tak.';

  @override
  String get updatePasswordTitle => 'Zmień swoje hasło';

  @override
  String get passwordCurrentHint => 'Aktualne hasło';

  @override
  String get passwordNewHint => 'Nowe hasło';

  @override
  String get passwordRepeatHint => 'Powtórz nowe hasło';

  @override
  String get passwordUpdatedDescription => 'Zaktualizowano hasło do konta.';

  @override
  String get passwordMismatchTitle => 'Wartości nie są identyczne';

  @override
  String get passwordMismatchDescription =>
      'W polach Nowe hasło i Powtórz hasło wartości muszą być identyczne.';

  @override
  String get unitAddTitle => 'Dodaj jednostkę';

  @override
  String get unitApartmentNumberHint => 'Numer mieszkania';

  @override
  String get unitPriceHint => 'Cena';

  @override
  String get unitSaved => 'Pomyślnie zapisano jednostkę';

  @override
  String get unitSaveFailed => 'Nie udało się zapisać jednostki';

  @override
  String get pickerSearchHint => 'Szukaj';

  @override
  String get pickerNoResults => 'Brak pasujących pozycji';

  @override
  String get homeAddProjects => 'Dodaj projekty';

  @override
  String get projectAddTitle => 'Dodaj projekt';

  @override
  String get projectNameHint => 'Nazwa projektu';

  @override
  String get projectExternalIdHint => 'Numer projektu (externalId)';

  @override
  String get projectNocHint => 'NOC';

  @override
  String get projectStatusHint => 'Status, np. available';

  @override
  String get projectDescriptionPlHint => 'Opis po polsku';

  @override
  String get projectDescriptionEnHint => 'Opis po angielsku';

  @override
  String get projectPriceFromHint => 'Cena od';

  @override
  String get projectPriceToHint => 'Cena do';

  @override
  String get projectAreaFromHint => 'Powierzchnia od';

  @override
  String get projectAreaToHint => 'Powierzchnia do';

  @override
  String get projectDistrictPlaceholder => 'Wybierz dzielnicę';

  @override
  String get projectDeveloperPlaceholder => 'Wybierz dewelopera';

  @override
  String get projectHandoverLabel => 'Termin oddania';

  @override
  String get projectStartOfSalesLabel => 'Start sprzedaży';

  @override
  String get projectOwnershipPlaceholder => 'Rodzaj własności';

  @override
  String get projectOwnershipFreehold => 'Freehold';

  @override
  String get projectOwnershipLeasehold => 'Leasehold';

  @override
  String get projectSaleDeveloper => 'Sprzedaż od dewelopera';

  @override
  String get projectSaleResale => 'Sprzedaż wtórna';

  @override
  String get projectSaleWarning =>
      'Projekt tylko z rynku wtórnego albo ze statusem „sold_out” jest usuwany przez nocną synchronizację.';

  @override
  String get projectSaved => 'Pomyślnie zapisano projekt';

  @override
  String get projectSaveFailed => 'Nie udało się zapisać projektu';

  @override
  String get projectRequiredFields => 'Uzupełnij nazwę, numer projektu i NOC';

  @override
  String get unitProjectPlaceholder => 'Wyszukaj projekt';

  @override
  String get unitProjectLoading => 'Wczytywanie projektów…';

  @override
  String get unitProjectSearchHint => 'Szukaj po nazwie lub numerze';

  @override
  String get unitProjectLabel => 'Projekt';

  @override
  String get projectExternalIdLabel => 'Nr';

  @override
  String get homeProjectsList => 'Lista projektów';

  @override
  String get projectsListTitle => 'Lista projektów';

  @override
  String get projectsSearchHint => 'Szukaj projektu po nazwie';

  @override
  String get projectsEmpty => 'Brak projektów do pokazania';

  @override
  String get projectsColumnName => 'Nazwa';

  @override
  String get projectsColumnDistrict => 'Dzielnica';

  @override
  String get projectsColumnDeveloper => 'Deweloper';

  @override
  String get projectsColumnStatus => 'Status';

  @override
  String get projectsColumnHandover => 'Oddanie';

  @override
  String get projectsColumnPrice => 'Ceny jednostek';

  @override
  String get projectManualBadge => 'ręczny';

  @override
  String get projectDetailsTitle => 'Projekt';

  @override
  String get projectDetailsPaymentPlans => 'Plany płatności';

  @override
  String get projectDetailsNoPaymentPlans =>
      'Ten projekt nie ma planów płatności';

  @override
  String get projectDetailsPostHandover => 'Płatności po odbiorze';

  @override
  String get projectDetailsUnits => 'Jednostki';

  @override
  String get projectDetailsNoUnits => 'Ten projekt nie ma jeszcze jednostek';

  @override
  String get projectDetailsAddUnit => 'Dodaj jednostkę';

  @override
  String get projectDetailsDeveloper => 'Deweloper';

  @override
  String get projectDetailsDistrict => 'Dzielnica';

  @override
  String get projectDetailsStatus => 'Status';

  @override
  String get projectDetailsHandover => 'Termin oddania';

  @override
  String get projectDetailsStartOfSales => 'Start sprzedaży';

  @override
  String get projectDetailsOwnership => 'Rodzaj własności';

  @override
  String get projectDetailsPrices => 'Ceny jednostek';

  @override
  String get projectDetailsAreas => 'Powierzchnie';

  @override
  String get projectDetailsSaleTypes => 'Typy sprzedaży';

  @override
  String get projectDetailsDescription => 'Opis';

  @override
  String get unitsColumnNumber => 'Numer';

  @override
  String get unitsColumnFloor => 'Piętro';

  @override
  String get unitsColumnArea => 'Powierzchnia';

  @override
  String get unitsColumnPrice => 'Cena';

  @override
  String get unitsColumnPricePer => 'Cena / ft²';

  @override
  String get unitsColumnStatus => 'Status';

  @override
  String get unitsColumnType => 'Typ';

  @override
  String get unitsColumnLayout => 'Układ';

  @override
  String valueRange(String from, String to) {
    return '$from – $to';
  }

  @override
  String get valueMissing => '—';

  @override
  String get unitNumberHint => 'Numer jednostki';

  @override
  String get unitAreaHint => 'Powierzchnia (ft²)';

  @override
  String get unitFloorHint => 'Piętro';

  @override
  String get unitStatusHint => 'Status, np. available';

  @override
  String get unitHeightHint => 'Forma, np. Simplex';

  @override
  String get unitTypeOfSaleHint => 'Typ sprzedaży, np. offPlan';

  @override
  String get unitTypePlaceholder => 'Typ jednostki';

  @override
  String get unitLayoutPlaceholder => 'Układ';

  @override
  String get unitRequiredFields => 'Wybierz projekt i podaj numer jednostki';

  @override
  String get unitManualNote =>
      'Jednostki dodane tutaj nie są nadpisywane przez nocną synchronizację z GenieMap.';
}
