# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

Devixly Admin — an admin panel (primarily Flutter Web) for the Devixly platform: managing news, users/admins, companies and categories. The code is a **FlutterFlow export**, so most files follow FlutterFlow's generated conventions. The only supported locale is Polish (`pl`); UI strings are in Polish.

Related repos (separate directories): the Flutter mobile app `../devixly` and the Jaspr website `../devixly_webside`.

## Commands

```bash
flutter pub get
flutter run -d chrome          # main target is web (path URL strategy)
flutter analyze                # lints: package:flutter_lints/flutter.yaml
flutter test                   # only a trivial smoke test in test/widget_test.dart
flutter test test/widget_test.dart
flutter build web
```

Must build on Flutter **stable**. Dependency versions in `pubspec.yaml` are pinned exactly (FlutterFlow style) — don't bump them casually.

## Architecture

**Backend is Xano (REST), no Firebase.** Every endpoint is a static class in `lib/backend/api_requests/api_calls.dart` (`XxxCall.call(...)` + static JSONPath getters like `XxxCall.authToken(jsonBody)`). Base URLs are hard-coded per Xano API group (`https://xxiz-mxuj-zpyz.n7e.xano.io/api:<group>/...`). Request bodies are built as string-templated JSON with `escapeStringForJson`. All calls go through `ApiManager.instance.makeApiCall` in `api_manager.dart`; authenticated calls take `authToken` and send `Authorization: Bearer ...`.

**Auth** (`lib/auth/custom_auth/`): FlutterFlow "custom auth". `CustomAuthManager` holds auth/refresh tokens, expiration, uid and a `UserStruct`, persisted in `SharedPreferences`; changes are pushed into the `devixlyAdminAuthUserSubject` (rxdart `BehaviorSubject`). Use the getters in `auth_util.dart` (`authManager`, `currentAuthenticationToken`, `currentUserData`, ...). Token refresh lives in `lib/actions/actions.dart` → `refreshTokenAction(context)`, which calls `RefreshTokenCall`, and on failure revokes the token, signs out and navigates to `LoginPageWidget`. Pages call it in their on-page-load callback and before API-triggering actions.

**Navigation** (`lib/flutter_flow/nav/nav.dart`): go_router wrapped in `FFRoute`. `AppStateNotifier` (singleton) listens to the auth stream and drives redirects; routes with `requireAuth: true` redirect to login. `/` resolves to Home or Login depending on auth. Each page widget exposes static `routeName`/`routePath`; navigate with `context.pushNamed(...)` / `context.goNamedAuth(...)`. Struct params are serialized via `serialization_util.dart` (e.g. `EditNewsPage` takes a `NewsStruct`). New pages must be registered in `nav.dart` and exported from `lib/index.dart`.

**State**: `FFAppState` (`lib/app_state.dart`) is a global `ChangeNotifier` singleton provided at the root; it holds in-memory lists (`newsList`, `companyList`, `categoryList`, `displayUserList`, `adminList`, `csvListOfUser`, `selectedCompany`, ...), nothing persisted. Typical page flow: on load, clear the list in `FFAppState`, call a `...Call`, map the JSON into structs and `addTo...List`, then `safeSetState`.

**Pages/components**: each lives in its own folder as a `*_widget.dart` + `*_model.dart` pair (`FlutterFlowModel` holds controllers/focus nodes/local state; widget does `createModel` in `initState`). `lib/components/` includes reusable cards, `confirm_components/` (confirmation dialogs for delete/block/update actions), `placeholder_components/` (loading placeholders) and `ui_popup_components/`.

**Data models**: `lib/backend/schema/structs/*_struct.dart` extend `BaseStruct` (nullable backing fields, non-null getters with defaults, `fromMap`/`maybeFromMap`, `toSerializableMap`). Enums in `lib/backend/schema/enums/enums.dart`.

**Custom code**:
- `lib/flutter_flow/custom_functions.dart` — pure helpers (time conversion from Xano ints, image ↔ base64, ratio parsing, CSV payload building, category id/name mapping). Imported as `functions`.
- `lib/custom_code/actions/` — custom actions (CSV import: `parseDisplayUserCsv`, `findInvalidEmailsInCsv`), exported via `index.dart`. Keep the auto-generated "DO NOT REMOVE OR MODIFY" import header intact and write code only below the marker.
- `lib/flutter_flow/` otherwise is FlutterFlow runtime (theme `FlutterFlowTheme`, widgets, util, i18n) — avoid editing unless necessary.
