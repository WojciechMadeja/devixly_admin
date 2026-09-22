# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

Devixly Admin — an admin panel (Flutter Web first) for the Devixly platform: news, users/admins, companies and categories. The only supported locale is Polish (`pl`); all UI strings live in `lib/l10n/app_pl.arb`.

The code started as a FlutterFlow export and was rewritten to clean Flutter (feature-first MVVM + Cubit). The FlutterFlow runtime, `FFAppState`, generated pages and `api_calls.dart` are gone; what remains from that era are the **golden baselines** in `test/goldens/baseline/` — screenshots of the old UI that the new widgets are still compared against. Treat them as the visual contract: a view that no longer matches its baseline is a regression, not an update, unless the change is deliberate and documented.

Related repos (separate directories): the Flutter mobile app `../devixly` and the Jaspr website `../devixly_webside`.

## Commands

```bash
flutter pub get
flutter run -d chrome                    # web is the main target (path URL strategy)
flutter analyze                          # must stay at zero issues
flutter test                             # unit + cubit + contract + golden tests
flutter test test/features/news          # one directory
flutter test --plain-name 'nazwa testu'  # one test
GOLDEN_TOLERANCE=0 flutter test          # goldens must match pixel for pixel
dart run build_runner build --delete-conflicting-outputs   # freezed + json_serializable
flutter gen-l10n                         # after editing lib/l10n/app_pl.arb
flutter build web --release
```

`dart format` and `dart fix --apply` before committing. `freezed` is pinned to 3.2.5 (4.x needs Dart 3.13, Flutter 3.44 ships 3.12) and `data_table_2` to 2.5.10 (2.7 lays out column widths differently and breaks the CSV table goldens).

## Architecture

Feature-first MVVM, one folder per feature under `lib/features/<feature>/`:

```
data/        datasources (HTTP), models (freezed + json_serializable), repositories (impl)
domain/      entities (Equatable), repositories (abstract interface), usecases (only where there is real logic)
presentation/view/, view_model/ (Cubit + freezed state), widgets/<view_name>/ and widgets/shared/
```

- **View is dumb**: it renders state and calls the cubit. `BlocBuilder`/`BlocSelector` for UI, `BlocListener` for one-off effects (SnackBar, dialog, navigation). No API calls or business rules in widgets — that was the main problem with the FlutterFlow code.
- **Sub-widgets are classes, not `_buildX()` methods.** A widget used by more than one view moves to `widgets/shared/`, one used by more than one feature to `lib/core/widgets/`.
- **Cubits are registered as factories** in `lib/app/di/injection.dart`; repositories and data sources as lazy singletons. `setupDependencies({http.Client? httpClient})` takes an injected client so tests can swap in a fake backend.
- **Errors never cross layers as exceptions**: data sources throw (`ServerException`, `NetworkException`, …), repositories wrap calls in `guard()` from `core/errors/guard.dart` and return `Either<Failure, T>` (fpdart), cubits map `Failure` to a state, views show a SnackBar or `InfoDialog`.
- Shared state between features goes through the other feature's **domain repository interface** (e.g. `UsersListCubit` uses `CompaniesRepository`), never through its cubits or data layer.
- Files stay around 500 lines; split a view into `widgets/<view_name>/` before it grows past that.

`lib/core/` holds everything feature-independent: `theme/` (`AppColors`, `AppTextStyles`, `AppTheme`), `widgets/` (page scaffold, header, buttons, text field, data table, skeletons, dialogs, snack bars), `network/`, `errors/`, `state/` (`Loadable`, `SubmissionStatus`), `utils/`, `config/`, `services/`.

`lib/app/` wires it together: `app.dart` (MaterialApp.router, `AdminShell` with the header actions, `SplashGate`), `di/injection.dart`, `router/`.

## Routing

`lib/app/router/app_routes.dart` keeps the **same URLs as the FlutterFlow version** (`/homePage`, `/newsListPage`, `/addCategoryPage`, `/settingsPage`, …) so existing links and bookmarks keep working. Do not rename them.

A single `redirect` in `app_router.dart` protects every route except `/` and `/loginPage`; without a session it redirects to `/loginPage?from=<uri>` and the login view returns there afterwards. `refreshListenable` is fed by `SessionCubit`'s stream. Unknown URLs land on Home or Login.

`EditNewsView` takes `?id=<int>` plus an optional `News` in `extra`; without `extra` (e.g. after F5) the cubit refetches the list and picks the entry by id.

## Backend (Xano)

Base URL and API groups are in `lib/core/config/api_config.dart` (`auth`, `news`, `users`, `companies`, `categories`). Two clients:

- `HttpJsonClient` — plain JSON/multipart over `http`, 30 s timeout, `utf8.decode(bodyBytes)` (the server's charset header cannot be trusted with Polish text), non-2xx → `ServerException`.
- `AuthorizedApiClient` — adds `Authorization: Bearer …` from `AuthTokenProvider`; on 401 it refreshes **once** and retries once.

Splitting the two breaks the DI cycle: `AuthRemoteDataSource` uses the plain client, every other data source the authorized one. `CurrentAdmin` (implemented by `AuthRepositoryImpl`) supplies the logged-in admin's id and e-mail — many Xano endpoints require `admin_email`.

Token refresh happens **only** when the access token is about to expire or after a 401, and it is single-flight; the FlutterFlow version refreshed before nearly every action and logged users out at random.

Endpoint quirks worth knowing (kept deliberately, verified against the fixtures, still to be confirmed against the live API):

- news without an image: `POST` sends an empty file part, `PATCH` sends the literal string `"null"` in `image_uploaded`;
- `PUT user/{id}` requires `companies` (the company id) — the old code hard-coded `1`, the profile screen now sends the id from `GET user/{id}`;
- login returns both `expiresAt` and `authTokenExpireAt`; the session stores both and the 401 retry is the safety net.

## Look and feel (keep it 1:1)

- Colors and text styles are `static const` in `core/theme/`. Material 2 (`useMaterial3: false`) with the default blue color scheme — the data table paginator and unstyled spinners depend on it.
- Fonts are bundled in `assets/fonts/` (Inter 400/500/600/700, Inter Tight 600) — exactly the files google_fonts used to download. Font Awesome icons come from a vendored FA **6** Free Solid font rendered by `core/widgets/font_awesome_icon.dart`; FA 7 has visibly different glyphs.
- Shared widgets reproduce the FlutterFlow originals exactly (`AppButton` 40/50 high with `AutoSizeText` and a 23×23 spinner, `AppTextField` decoration, `AdminHeader` 120 px with 15 %/5 % side padding, dialogs 320 wide with radius 24, snack bars 4 s).
- Layout percentages come from `core/utils/responsive.dart` (`(width * percent / 100).toInt()` — the truncation is intentional, it is what the old layout did).

## Localization

Every user-visible string goes into `lib/l10n/app_pl.arb` and is read through `context.l10n` (`core/l10n/l10n.dart`). Run `flutter gen-l10n` after editing the ARB; `lib/l10n/app_localizations*.dart` is generated and excluded from analysis.

## Tests

- `test/helpers/` is the harness: `test_dependencies.dart` (`setUpTestDependencies()` registers the real DI graph against `FakeXanoApi` with a restored session — remember `tearDown(getIt.reset)`), `fake_xano_api.dart` (route → fixture map, `responseDelay` for loading states, recorded requests with `.json` and `.multipartParts`), `app_harness.dart` (`testApp`, `pumpView`, `pumpComponent`, `baselineGolden`), `golden_helpers.dart`, `fake_media_picker.dart`, `fake_network_images.dart`. Fixtures live in `test/fixtures/`.
- Golden tests compare against `test/goldens/baseline/{pages,components}/*.png` at 0.5 % tolerance by default; `GOLDEN_TOLERANCE=0` proves pixel equality. `expectGoldenWithTolerance(..., tolerance: 0.01)` is used for the few dialogs where real Inter Bold differs from FlutterFlow's faux-bold `RichText`.
- Contract tests assert the exact method, URL, headers and body of every Xano call — treat them as the API contract.
- Cubit tests use `bloc_test` + `mocktail`. Note that bloc 9 emits the first state even when it equals the current one, so cubits guard resets with `if (state is! XInitial)`.

## Things that are deliberate

- `features/units` (`AddUnitView`) has **no route and no DI registration**: the backend has no unit endpoint yet. Its `UnitsRepository` is an interface without an implementation and the view's doc comment lists the steps to wire it up. It must never call `auth/admin/signup` again.
- The home tiles "Dodaj jednostki" and "Oferty" are visible but inactive on purpose.
- `kProtectedOwnerName` (`core/constants/business_rules.dart`) is the company that cannot be edited or deleted.
- Golden baselines for some mobile viewports show the old overflowing layout; those views are compared manually, desktop goldens are the automated check.
