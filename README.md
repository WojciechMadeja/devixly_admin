# Devixly Admin

Panel administracyjny Devixly: aktualności, użytkownicy i administratorzy, firmy oraz kategorie. Aplikacja Flutter budowana przede wszystkim na web, w języku polskim. Backend to serwer Serverpod z repozytorium `../background_devixly` (panel używa jego wygenerowanego klienta jako zależności `path`, więc oba repozytoria muszą leżeć obok siebie).

## Uruchomienie

```bash
flutter pub get
flutter run -d chrome
```

Domyślnie panel łączy się z backendem produkcyjnym `https://api.devixly.com/`. Do pracy z lokalnym backendem adres podaje się przy uruchamianiu:

```bash
flutter run -d chrome --dart-define=SERVER_URL=http://localhost:8080/
flutter build web --release        # wersja na produkcję, bez dodatkowych parametrów
```

Do panelu logują się tylko konta z uprawnieniami administratora.

Wgrywamy zawartość `build/web` na hosting. Jest tam też `web/.htaccess`, który na
Apache/LiteSpeed przekierowuje nieistniejące ścieżki do `index.html` — bez niego
odświeżenie adresu w stylu `/newsListPage` kończy się błędem 404 serwera, bo
aplikacja używa ścieżek URL (`usePathUrlStrategy()`), a nie hasha.

## Codzienna praca

```bash
flutter analyze                                             # zero problemów
flutter test                                                # testy jednostkowe, cubitów, kontraktu API i wyglądu
GOLDEN_TOLERANCE=0 flutter test                             # wygląd co do piksela
dart run build_runner build --delete-conflicting-outputs    # po zmianie modeli/stanów (freezed)
flutter gen-l10n                                            # po zmianie lib/l10n/app_pl.arb
dart format . && dart fix --apply
```

## Struktura

```
lib/
├── app/        punkt startowy: MaterialApp.router, DI (get_it), router (go_router)
├── core/       motyw, wspólne widgety, sieć, błędy, stany, narzędzia, teksty
├── features/   po jednym folderze na obszar: auth, home, news, categories,
│               companies, users, admins, settings, units
└── l10n/       teksty interfejsu (ARB, tylko pl)
```

Każdy feature ma warstwy `data/` (HTTP, modele), `domain/` (encje, interfejsy repozytoriów) i `presentation/` (widoki, cubity, widgety). Widok tylko wyświetla stan i woła cubit; logika i wywołania API są w repozytoriach. Błędy wracają jako `Either<Failure, T>`.

## Wygląd

Aplikacja powstała z eksportu FlutterFlow i ma wyglądać dokładnie tak samo. W `test/goldens/baseline/` leżą zrzuty poprzedniej wersji — testy wyglądu porównują z nimi nowe widoki. Zmiana wyglądu to zmiana świadoma: trzeba wtedy zaktualizować wzorzec i opisać to w commicie.

Fonty (Inter, Inter Tight, Font Awesome 6 Solid) są dołączone w `assets/fonts/`, kolory i style w `lib/core/theme/`.

## Wskazówki dla nowych osób

- Teksty interfejsu dodawaj w `lib/l10n/app_pl.arb` i czytaj przez `context.l10n`.
- Nowy ekran: dodaj ścieżkę w `lib/app/router/app_routes.dart` i `app_router.dart`, a cubit zarejestruj w `lib/app/di/injection.dart` (`registerFactory`).
- Nowy endpoint: metoda w `*RemoteDataSource`, mapowanie w repozytorium i test kontraktu w `test/features/<feature>/data/`.
- Ekran „Dodaj jednostkę” (`lib/features/units/`) celowo nie ma trasy — backend nie ma jeszcze zapisu jednostek.
