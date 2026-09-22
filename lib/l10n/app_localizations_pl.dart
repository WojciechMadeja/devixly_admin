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
}
