import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

import 'fixtures.dart';

/// Atrapa backendu Devixly (Serverpod) oparta na plikach z
/// test/fixtures/api. Odpowiada jak serwer na wywołania RPC klienta
/// (`POST <endpoint>/<metoda>` z argumentami w JSON-ie) i zapisuje je, żeby
/// testy mogły sprawdzić kontrakt. Zastępuje też wysyłkę plików do storage.
class FakeBackend {
  FakeBackend({Map<String, FakeResponse>? overrides, this.responseDelay})
    : _routes = {..._defaultRoutes, ...?overrides};

  /// Opóźnienie odpowiedzi — pozwala uchwycić stany ładowania (szkielety).
  final Duration? responseDelay;

  static const _defaultRoutes = <String, FakeResponse>{
    'emailIdp.loginAsAdministrator': FakeResponse('auth_success.json'),
    'emailIdp.startPasswordReset': FakeResponse.value(
      '0199b1a2-0000-7000-8000-0000000000aa',
    ),
    'emailIdp.verifyPasswordResetCode': FakeResponse.value('reset-token-1'),
    'emailIdp.finishPasswordReset': FakeResponse.empty(),
    'serverpod_auth_core.status.signOutDevice': FakeResponse.empty(),
    'account.me': FakeResponse('user.json'),
    'account.changePassword': FakeResponse.empty(),
    'news.list': FakeResponse('news.json'),
    'news.getById': FakeResponse('news_item.json'),
    'news.createImageUpload': FakeResponse('file_upload.json'),
    'news.create': FakeResponse('news_item.json'),
    'news.update': FakeResponse('news_item.json'),
    'news.delete': FakeResponse.empty(),
    'category.list': FakeResponse('categories.json'),
    'category.create': FakeResponse('category.json'),
    'category.update': FakeResponse('category.json'),
    'category.delete': FakeResponse.empty(),
    'company.list': FakeResponse('companies.json'),
    'company.getById': FakeResponse('company_existing.json'),
    'company.create': FakeResponse('company.json'),
    'company.update': FakeResponse('company_existing.json'),
    'company.setBlocked': FakeResponse('company_existing.json'),
    'company.delete': FakeResponse.empty(),
    'appUser.list': FakeResponse('users.json'),
    'appUser.getById': FakeResponse('user.json'),
    'appUser.createUser': FakeResponse('created_users.json'),
    'appUser.createUsers': FakeResponse('created_users.json'),
    'appUser.createAdministrator': FakeResponse('created_users.json'),
    'appUser.update': FakeResponse('user.json'),
    'appUser.setBlocked': FakeResponse('user.json'),
    'appUser.delete': FakeResponse.empty(),
    'project.listOptionsForUnit': FakeResponse('project_options.json'),
    'project.list': FakeResponse('projects.json'),
    'project.getById': FakeResponse('project_details.json'),
    'unit.getByProject': FakeResponse('units.json'),
    'project.create': FakeResponse('project.json'),
    'unit.create': FakeResponse('unit.json'),
    'district.list': FakeResponse('districts.json'),
    'developer.list': FakeResponse('developers.json'),
    'unitType.list': FakeResponse('unit_types.json'),
    'layout.list': FakeResponse('layouts.json'),
  };

  final Map<String, FakeResponse> _routes;

  /// Wywołania endpointów, w kolejności.
  final List<RecordedCall> calls = [];

  /// Pliki „wysłane” do storage: opis wgrania i zawartość.
  final List<({String uploadDescription, Uint8List bytes})> uploads = [];

  /// Czy wysyłka plików ma się udawać.
  bool uploadSucceeds = true;

  http.Client get client => MockClient(_handle);

  /// Podstawiana w miejsce prawdziwej wysyłki plików.
  Future<bool> uploadFile(String uploadDescription, Uint8List bytes) async {
    uploads.add((uploadDescription: uploadDescription, bytes: bytes));
    return uploadSucceeds;
  }

  /// Wywołania jednej metody, np. `callsOf('news.create')`.
  List<RecordedCall> callsOf(String route) => [
    for (final call in calls)
      if (call.route == route) call,
  ];

  Future<http.Response> _handle(http.Request request) async {
    final segments = request.url.pathSegments;
    final call = RecordedCall(
      endpoint: segments[segments.length - 2],
      method: segments.last,
      arguments:
          _withoutClassNames(
                request.body.isEmpty
                    ? const <String, dynamic>{}
                    : jsonDecode(request.body),
              )
              as Map<String, dynamic>,
      headers: request.headers,
    );
    calls.add(call);
    if (responseDelay != null) await Future<void>.delayed(responseDelay!);

    final stub = _routes[call.route];
    if (stub == null) {
      return _response(404, 'Brak odpowiedzi atrapy dla ${call.route}');
    }
    return _response(stub.statusCode, stub.body);
  }

  static http.Response _response(int statusCode, Object? body) => http.Response(
    json.encode(body),
    statusCode,
    headers: {'content-type': 'application/json; charset=utf-8'},
  );

  /// Klient dopisuje do modeli `__className__`; w asercjach tylko
  /// przeszkadza.
  static Object? _withoutClassNames(Object? value) => switch (value) {
    final Map<String, dynamic> map => {
      for (final MapEntry(:key, :value) in map.entries)
        if (key != '__className__') key: _withoutClassNames(value),
    },
    final List<dynamic> list => [
      for (final item in list) _withoutClassNames(item),
    ],
    _ => value,
  };
}

/// Odpowiedź metody endpointu: plik fixture, wartość albo nic, oraz kod
/// statusu. Testy mogą nadpisać odpowiedź przez
/// `FakeBackend(overrides: {...})`.
class FakeResponse {
  /// Zawartość pliku z test/fixtures/api.
  const FakeResponse(String this.fixture, {this.statusCode = 200})
    : value = null;

  /// Prosta wartość (tekst, liczba, `true`).
  const FakeResponse.value(Object this.value, {this.statusCode = 200})
    : fixture = null;

  /// Metoda bez wyniku albo wynik `null`.
  const FakeResponse.empty({this.statusCode = 200})
    : fixture = null,
      value = null;

  /// Wyjątek endpointu, tak jak serializuje go serwer, np.
  /// `FakeResponse.exception('ForbiddenException', {'message': '...'})`.
  FakeResponse.exception(String className, Map<String, Object?> data)
    : fixture = null,
      statusCode = 400,
      value = {
        'className': className,
        'data': {'__className__': className, ...data},
      };

  final String? fixture;
  final Object? value;
  final int statusCode;

  Object? get body => fixture == null ? value : readJsonFixture('api/$fixture');
}

/// Wywołanie endpointu zapisane przez `FakeBackend`.
class RecordedCall {
  const RecordedCall({
    required this.endpoint,
    required this.method,
    required this.arguments,
    required this.headers,
  });

  final String endpoint;
  final String method;

  /// Argumenty metody (bez `__className__` modeli).
  final Map<String, dynamic> arguments;
  final Map<String, String> headers;

  /// `endpoint.metoda`, np. `news.create`.
  String get route => '$endpoint.$method';

  @override
  String toString() => '$route $arguments';
}
