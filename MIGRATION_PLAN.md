# Migracja Devixly Admin: FlutterFlow → czysty Flutter

## Status

- **Faza 0 — przygotowanie i wzorce wyglądu: zrobiona.**
  - Tag `flutterflow-baseline` (commit `518327f`), praca na gałęzi `refactor/clean-flutter`.
  - **Łatka zgodności starego kodu z Flutterem 3.44.** Wersja FlutterFlow nie kompilowała się: `font_awesome_flutter 10.7.0` rozszerza `IconData`, które jest teraz klasą final, a `page_transition 2.1.0` ma błąd w konstruktorze.
    - `page_transition` podbity do 2.2.2.
    - `font_awesome_flutter` usunięty. Stary kod importuje `lib/flutter_flow/font_awesome_compat.dart`, czyli kopię `FaIcon` z wersji 10.7 z tymi samymi 6 ikonami.
    - Ikony rysuje dołączony font Font Awesome 6 Free Solid (`assets/fonts/fa-solid-900.ttf`, SIL OFL 1.1). Font Awesome 7 z nowszych wersji pakietu ma inne glify (tags, city, strzałki).
  - **Fonty dołączone lokalnie** w `assets/fonts/`: Inter 400/500/600/700 i Inter Tight 600. To dokładnie te pliki (zgodne sumy SHA-256), które google_fonts 6.3.3 pobierało z sieci. Rodziny są zadeklarowane w `pubspec.yaml`.
  - **Harness goldenów:**
    - `test/flutter_test_config.dart` ładuje fonty z FontManifest i Roboto z cache SDK, a porównuje z tolerancją 0,5%.
    - `test/helpers/` zawiera `FakeXanoApi` (fixture'y z `test/fixtures/api`), atrapę obrazków sieciowych i `setViewport`.
  - **Wzorce wyglądu starej wersji** w `test/goldens/baseline/`:
    - `pages/`: 37 plików, czyli 15 ekranów × desktop 1440×900 i mobile 390×844, 5 stanów ładowania i tabela CSV;
    - `components/`: 36 plików (komponenty i dialogi).
    - Generują je `test/goldens/baseline_capture/*_capture_test.dart` z `--update-goldens`. Te testy znikają w Fazie 7, a pliki PNG zostają.
  - **Znane przepełnienia starego układu.** Są zapisane jako referencja; w nowej wersji je naprawiamy, a te widoki porównujemy ręcznie:
    - widoki mobilne: `add_category`, `add_company`, `edit_news`, `edit_person_data`, `news_list`, `update_password`, `users_list`;
    - komponent `display_news_horizontal`.
  - **Uwaga do goldenów:** flutter_test rysuje cienie jako czarny obrys (`debugDisableShadows`), tak samo dla starej i nowej wersji.

- **Fazy 1–5 — fundament, logowanie i sesja, kategorie, firmy, aktualności, użytkownicy: zrobione.** Szczegóły w commitach `b0492ea`, `0cce66d`, `de18ca4`, `8167e77`, `6c20407`.

- **Faza 6 — ustawienia i jednostki: zrobiona.**
  - `features/settings` z własną warstwą danych (`ProfileRepository`: `GET`/`PUT user/{id}`, `PATCH user/update_password/{id}`), cubitami `ProfileCubit`, `EditProfileCubit`, `UpdatePasswordCubit` i widokami `SettingsView`, `EditProfileView`, `UpdatePasswordView`. Trasy `/settingsPage`, `/editPersonDataPage`, `/updatePasswordPage` bez zmian.
  - Poprawki: zapis danych wysyła prawdziwe id firmy zamiast `companies: 1`, po zapisie aktualizuje się sesja (nagłówek i formularze nie pokazują starych danych), bez id firmy zapis nie rusza, literówki „Zmiany zapisanme” i „Noe hasło” poprawione, błąd pobrania danych pokazuje SnackBar zamiast szkieletu w nieskończoność.
  - `features/units`: `AddUnitView` wygląda 1:1, ale **nie ma trasy ani wpisu w `injection.dart`** i nie woła `auth/admin/signup` (stary ekran zakładał konto administratora zamiast zapisywać jednostkę). Zapis prowadzi przez `UnitsRepository`, który celowo nie ma implementacji — sposób podłączenia opisuje doc-comment w widoku.
  - `PasswordVisibilityToggle` przeniesiony do `core/widgets` (używają go logowanie i zmiana hasła). `SkeletonBox` ma flagę `repeat`, bo jeden ze szkieletów ustawień w wersji FlutterFlow nie jest zapętlony.
  - Goldeny `settings`, `settings_loading`, `edit_person_data`, `update_password` i `add_unity` (desktop) zgodne co do piksela (`GOLDEN_TOLERANCE=0`).

- **Do weryfikacji na żywym API (nie blokuje Fazy 7):**
  - `expiresAt` vs `authTokenExpireAt` w odpowiedzi logowania;
  - aktualność bez obrazka: pusty plik przy `POST`, tekst `"null"` przy `PATCH`;
  - odpowiedź `PUT user/{id}` — nowa wersja czyta z niej zapisany profil (fixture zwraca pełnego użytkownika);
  - `companies` przy administratorze bez firmy (wysyłamy id z `GET user/{id}`, dotąd zawsze `1`).

---


## Kontekst
Devixly Admin to eksport FlutterFlow: ok. 34 tys. linii kodu, 15 ekranów, 28 komponentów, runtime `lib/flutter_flow/` i globalny `FFAppState`. Backend to Xano REST z własnym logowaniem. Kod jest trudny do utrzymania przez programistę Fluttera:
- logika i wywołania API siedzą w widgetach, także w dialogach;
- nagłówek jest skopiowany 14 razy;
- mapowanie JSON jest powielone, a logika odświeżania tokena istnieje w dwóch różnych kopiach;
- pliki mają 800–1500 linii;
- 46 z 69 zależności w `pubspec.yaml` nie jest nigdzie importowanych (używane są tylko 23);
- są realne błędy, m.in. losowe wylogowania i ciche błędy.

**Cel:** czysty, przejrzysty Flutter zgodny ze skillem `flutter-dart-best-practices`, **z identycznym wyglądem**, naprawionymi błędami logiki i nieużywanym ekranem przepisanym bez trasy.

## Ustalenia z użytkownikiem
- **Architektura ściśle według skilla:** feature-first MVVM, warstwy `data/domain/presentation`, `Either<Failure,T>` (fpdart), Cubit jako ViewModel, `get_it`, foldery `view/`, `view_model/`, `widgets/<ekran>/` i `widgets/shared/`, pliki do ok. 500 linii.
- **Wygląd 1:1.** Zmieniamy strukturę kodu, nie wartości: kolory, fonty, rozmiary, odstępy, cienie, promienie i Material 2 zostają.
- **AddUnityPage:** jedyny ekran nieosiągalny z UI. Przepisujemy go jako osobny feature `units`, **bez trasy w routerze**.
- **Kafelki „Dodaj jednostki” i „Oferty”:** zostają widoczne, ale bez akcji. Usuwamy kod czyszczący sesję w „Oferty”.
- **Teksty UI:** ARB + gen-l10n (`lib/l10n/app_pl.arb`, `context.l10n`), tylko język pl.
- **Błędy logiki:** naprawiamy wszystkie (lista niżej). Błędy pokazujemy w istniejącym stylu SnackBarów i dialogów.

## Zasady prowadzenia migracji
1. **Nowa aplikacja rośnie obok starej.** Tymczasowy punkt wejścia `lib/main_next.dart` odpala nowy kod. `lib/main.dart` (FlutterFlow) działa bez zmian do dnia przełączenia, więc oba warianty można porównywać obok siebie.
2. **Nowy kod nie importuje starego.** Bramka `grep` w każdej fazie.
3. **Kontrakt API się nie zmienia:** te same metody, ścieżki i nazwy pól. Wyjątkiem są jawnie wymienione poprawki. Kształt odpowiedzi weryfikujemy na realnych odpowiedziach, bo ścieżki JSONPath w starym `api_calls.dart` bywają nieaktualne (lekcja z `../devixly/MIGRATION_PLAN.md`).
4. **Ścieżki URL zostają identyczne:** `/homePage`, `/newsListPage` itd. Znika tylko `/addUnityPage`.
5. **Ekranów wyglądających podobnie nie scalamy.** Przykład: AddUnit zostaje osobnym bytem, nie wariantem AddAdmin.
6. **Każda faza kończy się zielonymi bramkami:** analyze, test, build web, smoke test i porównanie wyglądu. Commit na gałęzi `refactor/clean-flutter`.

## Docelowa struktura
```
lib/
├── main.dart                      # (po przełączeniu) ensureInitialized, usePathUrlStrategy,
│                                  # optionURLReflectsImperativeAPIs, setupDependencies, runApp(App)
├── app/
│   ├── app.dart                   # MaterialApp.router: AppTheme, l10n pl, AppScrollBehavior, SplashGate
│   ├── di/injection.dart          # get_it: _registerCore/_registerAuth/_registerNews/… (cubity = factory)
│   └── router/{app_router.dart, app_routes.dart}   # płaski GoRouter, guard, te same ścieżki
├── core/
│   ├── config/api_config.dart     # host Xano + grupy API (auth/news/user/companies/categories)
│   ├── network/                   # http_json_client.dart (bez auth), authorized_api_client.dart,
│   │                              # auth_token_provider.dart (interfejs), current_admin.dart (interfejs)
│   ├── errors/                    # exceptions.dart, failures.dart (sealed Failure)
│   ├── l10n/l10n.dart             # extension BuildContext.l10n
│   ├── theme/                     # app_colors.dart, app_text_styles.dart, app_theme.dart, app_dimens.dart
│   ├── utils/                     # responsive.dart, date_formatters.dart, validators.dart
│   └── widgets/                   # AdminPageScaffold, AdminHeader, AppButton, AppIconButton, AppTextField,
│                                  # TapArea, OptionCard, AppDataTable, SkeletonBox, ListCardSkeleton,
│                                  # dialogs/ (showAppDialog, DialogCard, ConfirmDialog,
│                                  #   TypedConfirmationDialog, InfoDialog), app_snack_bar.dart
├── features/
│   ├── auth/       # logowanie, reset hasła, sesja, odświeżanie tokena, wylogowanie, splash
│   ├── home/       # kafelki
│   ├── news/       # lista, podgląd, dodawanie, edycja, usuwanie
│   ├── categories/ # zarządzanie kategoriami
│   ├── companies/  # zarządzanie firmami + widgets/shared/company_picker_dialog.dart (używany też przez users)
│   ├── users/      # lista (tabela), dodawanie, import CSV, edycja/blokada/usuwanie (także adminów)
│   ├── admins/     # dodawanie administratora
│   ├── settings/   # ustawienia, edycja danych, zmiana hasła
│   └── units/      # AddUnitView — BEZ trasy (patrz niżej)
└── l10n/app_pl.arb                # + l10n.yaml, build.yaml (explicit_to_json: true)
```
Każdy feature ma układ `data/{datasources,models,repositories}`, `domain/{entities,repositories[,usecases]}` i `presentation/{view,view_model,widgets/<ekran>|shared}`.
- **Modele i stany:** `freezed` (+`json_serializable` dla modeli).
- **Encje domenowe:** `Equatable`.
- **Use case'y:** tylko tam, gdzie jest realna logika. Przykład: `ParseUsersCsv`.

## Kluczowe rozwiązania

**Sieć i błędy**
- `HttpJsonClient` przyjmuje wstrzyknięty `http.Client`. Body kodujemy przez `jsonEncode`, a nie szablon stringa. Odpowiedź dekodujemy przez `utf8.decode(bodyBytes)`, co naprawia polskie znaki zależne od charsetu serwera.
- Timeout wynosi 30 s. Gołe tablice zwracane są jako `List`.
- Kody inne niż 2xx rzucają `ServerException(status, message)`, a błędy transportu `NetworkException`.
- `AuthorizedApiClient` pobiera token z `AuthTokenProvider`. Na 401 robi jeden refresh (single-flight) i jedno ponowienie.
- Dwa klienty usuwają cykl w DI: `AuthRemoteDataSource` używa klienta bez autoryzacji, a pozostałe datasource'y klienta z autoryzacją.
- `admin_email` i id bieżącego admina dostarcza `CurrentAdmin`, interfejs w `core` implementowany przez feature `auth`. Cubity o tym nie wiedzą.
- Repozytoria mapują wyjątki na `Failure` i zwracają `Either`. Cubity mapują `Failure` na stan błędu, który View pokazuje SnackBarem lub `InfoDialog` w obecnym stylu.

**Sesja, auth i routing**
- `SessionLocalDataSource` zapisuje `AuthSession` jako JSON w SharedPreferences. Na webie to wystarcza, bo secure storage i tak trzyma klucz w localStorage.
- Po wdrożeniu użytkownicy zalogują się jednorazowo ponownie, bo zmienia się format zapisanej sesji.
- `AuthRepository` odpowiada za:
  - `login`, `restoreSession`, `logout` (zawsze revoke + wyczyszczenie sesji, także z nagłówka),
  - `requestPasswordReset`, `updateCurrentUser`,
  - strumień `sessionChanges`.
- Token jest odświeżany **tylko** gdy access token wygasa (`authTokenExpireAt` z 30 s zapasu) albo po 401. Odświeżanie jest single-flight. To usuwa ok. 33 wywołania `refreshTokenAction` i wyścig w UsersList.
- Semantykę `expiresAt` vs `authTokenExpireAt` potwierdzamy na realnej odpowiedzi w Fazie 2.
- `SessionCubit` (lazySingleton, poziom aplikacji) ma stany `restoring`, `authenticated(user)` i `unauthenticated`.
  - `SplashGate` pokazuje splash tak jak dziś: `splashscreen_-_admin.png`, 70%×50%, białe tło, minimum 1 s.
- `GoRouter` używa `refreshListenable` opartego o strumień `SessionCubit` i jednego `redirect`: chronione trasy przy braku sesji przekierowują na `/loginPage?from=<uri>`.
  - Po zalogowaniu następuje powrót do `from` albo do `/homePage`.
  - Nieznany URL (także `/addUnityPage`) prowadzi na Home albo Login, jak dziś.
  - `debugLogDiagnostics` tylko w trybie debug.
  - Przejścia bez zmian: domyślna `MaterialPage`.
- EditNews przyjmuje `/editNewsPage?id=<id>` + `extra: News`. Bez `extra`, np. po F5, cubit dociąga listę i wybiera wpis po id. Znika cały struct w URL.
- Nawigacja idzie wyłącznie przez go_router. `ScaffoldMessenger` i `GoRouter` przechwytujemy przed `await`.

**Stan zamiast FFAppState**
- Każdy ekran ma własny Cubit (registerFactory). Stan to niemutowalny freezed:
  - listy: sealed `loading` / `loaded(items, pendingAction)` / `error`;
  - formularze: stan + sealed `SubmissionStatus`.
- Dane współdzielone są pobierane przez interfejsy repozytoriów innych feature'ów. Przykład: `UsersListCubit` używa `CompaniesRepository`, a `NewsEditorCubit` używa `CategoriesRepository`.
- Po mutacji firmy lub użytkownika lista jest przeładowywana bez migania szkieletów. Naprawia to utratę pól po edycji.
- Kontrolery tekstu zostają w `State` widoku. Walidacja idzie przez `Form` i `validators.dart`. Dziś 59 walidatorów jest martwych, a sprawdzenia robione są ręcznie.

**Wygląd 1:1 (runtime FlutterFlow → core)**
| FlutterFlow | Zastępstwo (te same wartości) |
|---|---|
| `FlutterFlowTheme` (16 tokenów, 1904 odwołania) | `AppColors` jako `static const`: primary #1A2E5A, secondary #D9CAB3, tertiary #8A9BA8, primaryText #14181B, secondaryText #57636C, primaryBackground #F1F4F8, secondaryBackground #FFF, accent1 #C6A15B, accent2 #6B8E23, accent3 #800020, error #FF5963, info #FFF, cień 0x33000000, tło kart #DDE1E3 |
| 346× `.override(...)` z GoogleFonts | ok. 10 nazwanych stylów w `AppTextStyles` (const) na **zbundlowanych** fontach Inter (400/500/600/700) i Inter Tight (600). Pliki muszą być dokładnie te, których używa google_fonts 6.3.3 (URL-e w pub cache) |
| `ThemeData(useMaterial3:false)` | Bez zmian: domyślny niebieski schemat M2, bo paginator DataTable2 i spinnery bez koloru wyglądają dziś tak; niewidoczny scrollbar (`Color(0)`); `AppScrollBehavior` z dragiem mysz/touch/trackpad |
| `FFButtonWidget` (48) | `AppButton`: ElevatedButton, elevation 0, radius 8, poziomy padding 16, AutoSizeText, spinner 23×23 przy `isLoading` z zachowaniem szerokości. Rozmiary: regular (40, szerokość auto, Inter Tight 16) i large (50, szerokość 200/150/140, 20) |
| `FlutterFlowIconButton` (22) | `AppIconButton` (SizedBox + IconButton, radius, fill, hover); 4 warianty: wstecz 50/34 tylko gdy `!kIsWeb`, ratio 60, kalendarz 40, zamknij 35 |
| 59× dekoracja `TextFormField` | `AppTextField` z jedną dekoracją 1:1: dense, fill #FFF, hover #F1F4F8, obramowanie 2 px secondary, focus accent1, radius 8 |
| Nagłówek skopiowany 14× | `AdminHeader` + `AdminPageScaffold`: `Title` z tymi samymi tytułami kart przeglądarki, unfocus, `SafeArea`, 120 px, padding 15%/5% (`(w*p/100).toInt()`), logo 200/140, wyloguj FA signOutAlt 45/34, treść z paddingiem 15% |
| `showDialog(Dialog(transparent…))` ×37 | `showAppDialog` + `DialogCard` (320, radius 24, elevation 4). Jeden `ConfirmDialog`, jeden `TypedConfirmationDialog` (BLOCK / UNBLOCK / DELETE / DELETE ADMIN) i `InfoDialog` (zamiast `informationon_component`). Dialogi **zwracają wynik**, a API woła cubit strony |
| SnackBary (17) | `AppSnackBar.success/error/neutral`: accent2 / accent3 / secondary, 4000 ms |
| `flutter_animate` w szkieletach | `SkeletonBox` (ta sama pętla fade 0→1 i te same czasy) |
| `FlutterFlowDataTable` | `AppDataTable` na `PaginatedDataTable2`: nagłówek navy, wiersze zebra, te same wysokości i szerokości kolumn |
| `FlutterFlowChoiceChips` | `CategoryChips` z tym samym stylem (zaznaczony tertiary + biały tekst, niezaznaczony biały + secondaryText, elevation 4, radius 8, odstęp 15/8) |
| `.divide/.addToStart/.addToEnd`, `valueOrDefault`, `wrapWithModel/createModel` | `Column(spacing:)` + `Padding`, `??`, zwykłe widgety i BlocBuilder |
| `upload_data.selectMedia/selectFiles` | image_picker (galeria, 450×450, walidacja MIME) i file_picker (`allowedExtensions: ['csv']`); komunikaty po polsku w ARB |
| ikony FontAwesome (6) | Zostają: font_awesome_flutter, bo odpowiedniki Material wyglądają inaczej |

**AddUnit (bez trasy)**
- Pliki `features/units/presentation/view/add_unit_view.dart`, `widgets/add_unit_view/*` i `AddUnitCubit` z walidacją formularza. Wygląd i pola 1:1, m.in. „Numer mieszkania” i „Cena”.
- `domain/repositories/units_repository.dart` to interfejs bez implementacji, bo w Xano nie ma endpointu. Brak rejestracji w DI i brak trasy.
- Doc-comment w widoku mówi, co trzeba zrobić przy podłączaniu. Formularz **nie** wywołuje endpointu `admin/signup`, co dziś jest błędem.

## Mapowanie ekranów i komponentów
| Dziś | Nowe miejsce |
|---|---|
| LoginPage + `send_email_for_reset_password` | `auth`: `LoginView`/`LoginCubit`, `ResetPasswordDialog`/`ResetPasswordCubit` |
| HomePage (2 zduplikowane siatki) | `home`: `HomeView` z jedną listą `HomeTile` (ikona, etykieta, trasa?) i układem responsywnym odtwarzającym oba warianty (>600 / ≤600) |
| NewsListPage, `news_card`, `display_news`, `news_card_placeholder`, `delete_news_confirm` | `news`: `NewsListView`/`NewsListCubit`, `widgets/news_list_view/{news_card, news_preview_dialog, news_card_skeleton}`, usuwanie przez `ConfirmDialog` |
| AddNewsPage, EditNewsPage, `category_chip_placeholder` | `news`: `AddNewsView`, `EditNewsView` + wspólny `NewsEditorCubit`, `widgets/shared/{news_form, ratio_toggle, image_preview, category_chips}` |
| AddCategoryPage, `category_card`, `update_category_name`, `delete_category_confirm` | `categories`: `CategoriesView`, `CategoriesCubit` (lista + mutacje), `CategoryFormCubit`, `RenameCategoryDialog` |
| AddCompanyPage, `company_card`, `update_company_name`, `block/unblock/delete_company_confirm`, `placeholder_company_card` | `companies`: `CompaniesView`, `CompaniesCubit`, `CompanyFormCubit`, `EditCompanyDialog`, `TypedConfirmationDialog`; `ListCardSkeleton` trafia do core, bo korzystają też kategorie |
| `companies_list_for_select`, `company_select_card` | `companies/presentation/widgets/shared/company_picker_dialog.dart` (zwraca `Company`) |
| UsersListPage, `display_user`, `update_user`, `block/unblock_user`, `delete_user`, `delete_admin_user` | `users`: `UsersListView`, `UsersListCubit` (sortowanie w stanie), `widgets/users_list_view/{users_table, user_preview_dialog, edit_user_dialog}` |
| AddUserPage | `users`: `AddUserView`/`AddUserCubit` |
| AddListOfUsersPage, `update_csv_user`, `delete_csv_user`, `error_valid_email` + custom actions CSV | `users`: `CsvImportView`/`CsvImportCubit`, use case `ParseUsersCsv` (logika 1:1 z `parse_display_user_csv.dart`, `find_invalid_emails_in_csv.dart`, `isCsvLoaded`, `buildUsersPayload`) |
| AddAdminPage | `admins`: `AddAdminView`/`AddAdminCubit` |
| SettingsPage, EditPersonDataPage, UpdatePasswordPage | `settings`: `SettingsView`/`ProfileCubit`, `EditProfileView`/`EditProfileCubit`, `UpdatePasswordView`/`UpdatePasswordCubit` |
| AddUnityPage | `units`: `AddUnitView` (bez trasy) |
| `option_card` | `core/widgets/option_card.dart` (Home + Settings) |
| `custom_functions.dart` | Czyste funkcje przeniesione 1:1: `sortMyData` → sortowanie w `UsersListCubit`, `convertDateFromString` / format „y-MM-d” → `date_formatters`, `isValidEmail` → `validators`, `returnRatio` → `Ratio.fromApi`, mapowanie nazwa↔id kategorii w cubicie. Nieużywane (`responsiveSize`, `imageToBase64`, `base64ToImage`) znikają |

## Poprawki błędów (wygląd bez zmian)
- **Tokeny:** refresh single-flight tylko przy wygaśnięciu lub 401. Wylogowanie zawsze robi revoke. Kod czyszczący sesję w „Oferty” jest usunięty. Po refreshu nie giną telefon ani firma.
- **Reset hasła:** poprawne body `{"email": ...}`, a walidacja e-maila **przed** wywołaniem API.
- **Edycja danych:** wysyła prawdziwe id firmy z `GET /user/{id}` zamiast `companies: 1` i aktualizuje sesję po zapisie.
- **EditNews:** czyta `author` zamiast `auth`. Nie ma crasha na `choiceChipsValues!` ani przy wejściu bez parametru.
- **Firmy:** po edycji, blokadzie i odblokowaniu lista jest przeładowywana, więc pola nie giną. Znika ukryty (`visible:false`) selektor „Wybierz opiekuna firmy”. Regułę „Crowd Empire” (nazwa chroniona przed edycją i usunięciem) zapisujemy jako nazwaną stałą.
- **CSV:** walidacja wybranej firmy i niepustej listy. Brak nagłówków daje czytelny błąd zamiast wyjątku. Sortowanie nie przywraca usuniętych wierszy. Komunikat o sukcesie zamiast „gut”. Komunikaty uploadu po polsku.
- **Ciche błędy:** błędy ładowania list i akcji w dialogach pokazujemy SnackBarem lub `InfoDialog` w obecnym stylu. Stan `error` zastępuje szkielety pokazywane w nieskończoność.
- **Treści:** poprawki literówek („Zmiany zapisanme”, „Noe hasło”, „Wpis poprawnie”, „usunać”, „Nie udało sie dodac”). Etykieta „Numer telefonu:” w podglądzie użytkownika pokazuje dziś imię i nazwisko. Placeholder „Nazwa firmy” w dialogu kategorii. Nie ma już zaszytych domyślnych autorów („Wojciech Madeja”).
- **Web:** `web/index.html` bez metadanych FlutterFlow, dodany brakujący `manifest.json`.
- **Do weryfikacji na żywym API przed zmianą:** edycja newsa bez obrazka wysyła dziś tekst `"null"` w `image_uploaded`, a dodanie bez obrazka wysyła pusty plik. Do potwierdzenia zachowujemy dokładnie ten format.

## Fazy
**Faza 0 – Przygotowanie i wzorzec wyglądu**
- Tag `flutterflow-baseline` na commicie `518327f`. Gałąź `refactor/clean-flutter`. `MIGRATION_PLAN.md` w repo (ten plan + sekcja Status aktualizowana po każdej fazie).
- Fonty: pobranie dokładnych plików Inter i Inter Tight używanych przez google_fonts 6.3.3 do `assets/fonts/`, z nazwami rozpoznawanymi przez google_fonts.
- Harness goldenów w `test/flutter_test_config.dart`:
  - `loadAppFonts()` z FontManifest (w tym MaterialIcons i FontAwesome);
  - `GoogleFonts.config.allowRuntimeFetching = false`;
  - komparator z tolerancją ok. 0,5%.
- **Goldeny bazowe ze starego kodu** w `test/goldens/baseline/*.png`, rozmiary 1440×900 i 390×844:
  - wszystkie komponenty i dialogi z danymi-fixture;
  - ekrany renderowane z `http.runWithClient(MockClient)` + `SharedPreferences.setMockInitialValues` + `authManager.signIn` (z nasłuchem `devixlyAdminAuthUserStream`) + `ChangeNotifierProvider<FFAppState>`;
  - animacje szkieletów zatrzymane na stałej klatce (`pump(Duration)` zamiast `pumpAndSettle`);
  - ekran, którego nie da się wyrenderować w teście, dostaje ręczny zrzut z Chrome.
- Fixture'y API w `test/fixtures/api/*.json`: odtworzone z kontraktu i uzupełnione realnymi odpowiedziami. Użytkownik dostarczy konto testowe albo zrzuty z DevTools → Network.
- *Wyjście:* goldeny bazowe zacommitowane, stara aplikacja nietknięta.

**Faza 1 – Fundament**
- `pubspec`: dodać flutter_bloc, get_it, fpdart, equatable, freezed_annotation, json_annotation; dev: build_runner, freezed, json_serializable, bloc_test, mocktail.
- `analysis_options.yaml` z regułami ze skilla (`prefer_const_constructors`, `prefer_final_locals`, `unawaited_futures`, `avoid_dynamic_calls`, `always_declare_return_types`, `avoid_print`). Do czasu przełączenia wykluczyć stary kod i pliki `*.g.dart`/`*.freezed.dart`.
- `build.yaml` z `explicit_to_json: true`.
- `l10n.yaml` + `app_pl.arb` (ok. 140 tekstów), `flutter: generate: true`.
- `core/*` w całości (theme, network z testami, errors, utils, widgets).
- `app/*` (szkielet DI i routera), `lib/main_next.dart`.
- *Wyjście:* goldeny widgetów core = baseline; testy klientów HTTP zielone.

**Faza 2 – Auth, sesja, router, Home**
- Feature `auth` (datasources, repo, `SessionCubit`, `LoginCubit`, `ResetPasswordCubit`), `SplashGate`, guard z powrotem do `from`, `AdminHeader` z wylogowaniem, `HomeView`.
- Weryfikacja semantyki `expiresAt` na realnym loginie.
- Testy:
  - kontrakt: dokładna metoda, URL, nagłówki i body jak w `api_calls.dart`;
  - single-flight refresh, 401 → refresh → ponowienie, wygaśnięcie sesji → login;
  - goldeny Login, Home i dialogu resetu.

**Faza 3 – Kategorie i firmy**
- Features `categories` i `companies` wraz z `CompanyPickerDialog`, `TypedConfirmationDialog`, `ListCardSkeleton`.

**Faza 4 – Aktualności**
- Lista, podgląd, dodawanie i edycja: obrazek multipart, trzy proporcje, chipy, polski date picker. Usuwanie.
- Weryfikacja wariantu „bez obrazka” na żywym API.

**Faza 5 – Użytkownicy i administratorzy**
- Tabela z sortowaniem, dialogi podglądu, edycji, blokady i usuwania.
- AddUser, import CSV (use case + testy portowane z `../devixly/.../csv_user_parser` i nowe przypadki brzegowe), AddAdmin.

**Faza 6 – Ustawienia i Units**
- Settings, edycja danych, zmiana hasła.
- `AddUnitView` bez trasy.

**Faza 7 – Przełączenie i sprzątanie**
- `main_next.dart` staje się `main.dart`.
- Usunięcie `lib/flutter_flow`, `lib/backend`, `lib/auth`, `lib/pages`, `lib/components`, `lib/custom_code`, `lib/actions`, `lib/app_state.dart`, `lib/index.dart` oraz testów przechwytujących baseline. PNG zostają jako wzorce regresji.
- Przegląd `pubspec` (poniżej) i aktualizacja go_router oraz flutter_lints do bieżących wersji. Zdjęcie wykluczeń z analizatora. `dart fix --apply`, `dart format`.
- Assety: z 7 folderów z placeholderami zostaje tylko `assets/images` + `assets/fonts`.
- Platformy: ścieżka `MainActivity.kt` zgodna z pakietem, usunięcie martwego `ios/ImageNotification`, `.gitignore` dla `ios/Flutter/ephemeral`.
- Nowy `test/widget_test.dart` (smoke z mockami). Aktualizacja `CLAUDE.md` i `README.md`; najważniejsze wnioski z `MIGRATION_PLAN.md` przenosimy do `CLAUDE.md`, a sam plik usuwamy.

Kolejność faz 3→5 wynika z zależności: aktualności korzystają z kategorii, a użytkownicy z firm.

## Docelowy pubspec
- **Zostają / dochodzą:** flutter_localizations, flutter_web_plugins, flutter_bloc, get_it, fpdart, equatable, freezed_annotation, json_annotation, go_router (aktualny), http, shared_preferences, intl, csv, file_picker, image_picker, mime, data_table_2, flutter_animate, font_awesome_flutter, auto_size_text (parytet AppButton), collection.
- **Dev:** flutter_test, flutter_lints (aktualny), build_runner, freezed, json_serializable, bloc_test, mocktail, flutter_launcher_icons.
- **Usunięte:**
  - `provider` (przychodzi przechodnio przez flutter_bloc), `google_fonts` (fonty są zbundlowane);
  - page_transition, json_path, from_css_color, timeago, url_launcher*, video_player*, cached_network_image*, flutter_cache_manager, sqflite*, path_provider*, cross_file, csslib, html, xml, universal_io, mime_type, plugin_platform_interface, flutter_plugin_android_lifecycle, cupertino_icons;
  - wszystkie przypięcia platformowe `*_android/_ios/_web/_platform_interface`;
  - `dependency_overrides`;
  - flutter_native_splash (konfiguracja nigdy nie została wygenerowana).

## Weryfikacja
**Bramki w każdej fazie:**
```bash
dart run build_runner build --delete-conflicting-outputs
flutter analyze                       # 0 problemów w nowym kodzie
flutter test                          # unit + cubit (bloc_test) + kontrakt repo + goldeny vs baseline
flutter build web --release
grep -rnE "flutter_flow|/backend/|custom_auth|app_state.dart|/pages/|/components/|custom_code" lib/app lib/core lib/features   # pusto
flutter run -d chrome -t lib/main_next.dart   # smoke + porównanie obok: flutter run -d chrome (stara wersja)
```
Smoke test ręcznie w Chrome, desktop 1440 i tryb urządzenia 390:
- logowanie, błędne dane, reset hasła;
- odświeżenie sesji: sztucznie przeterminowany token w localStorage;
- wylogowanie (revoke w zakładce Network);
- deep link do chronionego URL bez sesji → login → powrót;
- każdy kafelek, w tym dwa nieaktywne;
- pełny CRUD kategorii, firm, aktualności (każda proporcja obrazka, data) i użytkowników (blokady, usuwanie admina);
- import CSV: poprawny plik, złe e-maile, brak nagłówków;
- ustawienia, edycja danych, zmiana hasła;
- `/addUnityPage` → Home albo Login.

**Wygląd:** goldeny nowych widoków muszą przechodzić na tych samych plikach co baseline. Dodatkowo porównanie obok siebie ze starą wersją (tag `flutterflow-baseline`). Widok, który wygląda inaczej, nie jest gotowy, nawet jeśli testy przechodzą.

## Ryzyka
| Ryzyko | Jak ograniczamy |
|---|---|
| Kształt odpowiedzi API ≠ JSONPath w starym kodzie | fixture'y z realnych odpowiedzi; tolerancyjne `fromJson` (kategorie jako `int` lub `{id,name}`, relacje jako string lub mapa) — rozwiązania z `../devixly` |
| `expiresAt` vs `authTokenExpireAt` | weryfikacja w Fazie 2 na realnym loginie; refresh reaktywny na 401 jako siatka bezpieczeństwa |
| Multipart `"null"` i pusty plik | bez zmian formatu do czasu testu na żywym API |
| Niestabilne goldeny | zbundlowane fonty, stałe rozmiary okna, zamrożona klatka animacji, tolerancja komparatora |
| Zmiana wyglądu przez domyślne M2 i motywy komponentów | bazowy `ThemeData` jak dziś, style jawnie we wspólnych widgetach, goldeny |
| Ostrzejsze linty na starym kodzie | wykluczenia w `analysis_options` do Fazy 7 |
| Upgrade go_router łamie stary `nav.dart` | upgrade dopiero w Fazie 7 |

## Pliki referencyjne do wykorzystania
- Kontrakt API: `lib/backend/api_requests/api_calls.dart`; zachowanie klienta: `lib/backend/api_requests/api_manager.dart`.
- Logika do przeniesienia 1:1: `lib/custom_code/actions/parse_display_user_csv.dart`, `find_invalid_emails_in_csv.dart`, `lib/flutter_flow/custom_functions.dart` (`isCsvLoaded`, `buildUsersPayload`, `sortMyData`, `isValidEmail`, `convertDateFromString`, `returnIdCategoriesList`, `getCategoryNamesByIds`, `responsiveSizePerPrecent`).
- Wartości wyglądu: `lib/flutter_flow/flutter_flow_theme.dart`, `flutter_flow_widgets.dart`, `flutter_flow_icon_button.dart`, `flutter_flow_choice_chips.dart`, `flutter_flow_data_table.dart`, nagłówek w `lib/pages/news_list_page/news_list_page_widget.dart`.
- Wzorce z aplikacji mobilnej:
  - `../devixly/lib/core/network/api_client.dart` (single-flight na 401);
  - `../devixly/lib/core/di/injection.dart`;
  - `../devixly/lib/features/users_admin/data/csv/csv_user_parser.dart`;
  - testy w `../devixly/test/features`;
  - lekcje w `../devixly/MIGRATION_PLAN.md` i `CLAUDE.md`.
- Skill: `flutter-dart-best-practices` (`references/architecture.md`, `bloc_patterns.md`, `testing_and_lint.md`, `widget_performance.md`).
