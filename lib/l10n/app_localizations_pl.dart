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
}
