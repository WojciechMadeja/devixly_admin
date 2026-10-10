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

## Backend (Serverpod)

The panel talks to the Devixly Serverpod backend (`../background_devixly`) through its generated client, `background_devixly_client` — a **path dependency**, so that repo must sit next to this one and `serverpod generate` there changes the API here. The server URL is `ApiConfig.serverUrl` (default: production, `https://api.devixly.com/`; for a local backend pass `--dart-define=SERVER_URL=http://localhost:8080/`). The old Xano clients (`HttpJsonClient`, `AuthorizedApiClient`) and the freezed API models are gone; data sources return the protocol models and `data/models/*_mapper.dart` turn them into entities.

- `core/network/backend_client.dart` — `createBackendClient` builds the `Client` with a pure-Dart `ClientAuthSessionManager` that keeps the session (JWT + refresh token) in SharedPreferences (`PreferencesAuthStorage`, key `admin_auth`). The client refreshes the access token itself shortly before it expires, so a 401 on a normal call means the session is dead: `onUnauthorized` → `AuthRepositoryImpl.sessionRejected()` → the router goes to login. Do not add a refresh or retry on top of it.
- `core/network/backend_call.dart` — every data source call goes through `backendCall`, which maps Serverpod client and endpoint exceptions to `AppException`s (repositories turn those into `Failure`s via `guard`).
- `core/network/file_upload.dart` — `FileUploadFunction`, the upload of file bytes to the backend storage; injected so tests can replace it.

Identity comes only from the session: no request carries the admin's id or e-mail (Xano's `admin_email` is gone). `CurrentAdmin` (implemented by `AuthRepositoryImpl`) still tells the UI who is logged in; the admin's data is remembered under the `admin_user` preference so the panel knows it before the backend answers.

Things worth knowing:

- login is `emailIdp.loginAsAdministrator` (accounts without admin rights get no session) followed by `account.me`;
- password reset has two steps (the backend e-mails a code): `startPasswordReset` → the dialog asks for the code and a new password → `verifyPasswordResetCode` + `finishPasswordReset`. This second step is new UI, not in the FlutterFlow baselines. In development without Mailgun keys the server logs the code;
- `update` endpoints replace the whole record, so fields a form does not edit are read first and sent back (`company.update` keeps `adminId`/`isBlocked`, `news.update` keeps `imagePath`, the profile keeps e-mail and company);
- a news image is uploaded first (`news.createImageUpload` + `FileUploadFunction`), and the article points at its storage path;
- CSV import (`appUser.createUsers`) sends no passwords — the backend generates and e-mails them, and creates all accounts or none; the answer's `passwordEmailFailed` lists the addresses the password never reached;
- projects are created with `project.create` (admin only) and picked for a unit with `project.listOptionsForUnit`, a lightweight list the panel filters locally;
- `unit.create` was added to the backend for this panel — GenieMap stays the source of truth for everything it syncs.

## Look and feel (keep it 1:1)

- Colors and text styles are `static const` in `core/theme/`. Material 2 (`useMaterial3: false`) with the default blue color scheme — the data table paginator and unstyled spinners depend on it.
- Fonts are bundled in `assets/fonts/` (Inter 400/500/600/700, Inter Tight 600) — exactly the files google_fonts used to download. Font Awesome icons come from a vendored FA **6** Free Solid font rendered by `core/widgets/font_awesome_icon.dart`; FA 7 has visibly different glyphs.
- Shared widgets reproduce the FlutterFlow originals exactly (`AppButton` 40/50 high with `AutoSizeText` and a 23×23 spinner, `AppTextField` decoration, `AdminHeader` 120 px with 15 %/5 % side padding, dialogs 320 wide with radius 24, snack bars 4 s).
- Layout percentages come from `core/utils/responsive.dart` (`(width * percent / 100).toInt()` — the truncation is intentional, it is what the old layout did).

## Localization

Every user-visible string goes into `lib/l10n/app_pl.arb` and is read through `context.l10n` (`core/l10n/l10n.dart`). Run `flutter gen-l10n` after editing the ARB; `lib/l10n/app_localizations*.dart` is generated and excluded from analysis.

## Tests

- `test/helpers/` is the harness: `test_dependencies.dart` (`setUpTestDependencies()` registers the real DI graph against `FakeBackend` with a restored session — remember `tearDown(getIt.reset)`), `fake_backend.dart` (an `http.Client` answering Serverpod RPC calls: `endpoint.method` → fixture map with `overrides`, `FakeResponse.exception` for endpoint exceptions, `responseDelay` for loading states, recorded `calls` with decoded `arguments`, and a fake file upload), `app_harness.dart` (`testApp`, `pumpView`, `pumpComponent`, `baselineGolden`), `golden_helpers.dart`, `fake_media_picker.dart`, `fake_network_images.dart`. Fixtures live in `test/fixtures/` (`api/*.json` are protocol models as the server serializes them).
- Golden tests compare against `test/goldens/baseline/{pages,components}/*.png` at 0.5 % tolerance by default; `GOLDEN_TOLERANCE=0` proves pixel equality. `expectGoldenWithTolerance(..., tolerance: 0.01)` is used for the few dialogs where real Inter Bold differs from FlutterFlow's faux-bold `RichText`.
- Contract tests assert the endpoint, method and arguments of every backend call — treat them as the API contract.
- Cubit tests use `bloc_test` + `mocktail`. Note that bloc 9 emits the first state even when it equals the current one, so cubits guard resets with `if (state is! XInitial)`.

## Things that are deliberate

- Units added through `features/units` get a **negative `externalId`** on the server (`UnitEndpoint.create`). GenieMap numbers its units from 1 up, and the nightly sync deletes the units it no longer returns for a project, so the sign is what keeps hand-added units alive — `UnitSyncService` skips `externalId <= 0`. Keep both sides of that convention in mind before touching either.
- A project saved with resale-only sale types, or with status `sold_out`, is deleted by the nightly `removeInactiveProjects` step. The project form warns about it instead of blocking it.
- `features/lookups` is a thin shared feature: dictionaries (districts, developers, unit types, layouts) reduced to `DictionaryItem` for the pickers of other features.
- `ProjectsListView` searches server side (`project.list(nameContains:)`, debounced, capped at 200 rows), while the unit form's project picker filters a cached list from `project.listOptionsForUnit` locally — that call reads three columns, so it stays cheap. `ProjectsRepositoryImpl` keeps that list until a project is added.
- A project's units are read through `UnitsRepository.getUnits` (units feature) and shown on the project page next to its payment plans — `project.getById` already includes the plans with their items.
- Images come from the server's storage copies (`StoredFile.publicUrl` behind `Project.storedImages`, ordered by `position`, and `Unit.layoutFiles`); the GenieMap source URLs (`images`, `layoutFileUrls`) are the fallback until the nightly sync has downloaded them. `core/widgets/image_gallery.dart` renders both as thumbnails that open a full-size preview.
- The home tile "Oferty" is visible but inactive on purpose.
- `kProtectedOwnerName` (`core/constants/business_rules.dart`) is the company that cannot be edited or deleted.
- Golden baselines for some mobile viewports show the old overflowing layout; those views are compared manually, desktop goldens are the automated check.
- Screens without a FlutterFlow ancestor (`AddProjectView`, the rebuilt `AddUnitView`) and the home screen with its extra "Dodaj projekty" tile keep their own goldens under `test/features/<feature>/goldens/`; `test/goldens/baseline/` stays the record of the old UI.
