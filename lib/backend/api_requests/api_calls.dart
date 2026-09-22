import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class AdminLogInCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}",
  "password": "${escapeStringForJson(password)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Admin Log in',
      apiUrl:
          'https://xxiz-mxuj-zpyz.n7e.xano.io/api:Q_aNNNvL/auth/admin/login',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.user.id''',
      ));
  static String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.email''',
      ));
  static String? firstName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.firstName''',
      ));
  static String? lastName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.lastName''',
      ));
  static String? authToken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.authToken''',
      ));
  static String? refreshToken(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.user.refreshToken''',
      ));
  static int? expiresAt(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.user.expiresAt''',
      ));
  static int? refreshTokenId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.user.refreshTokenId''',
      ));
  static dynamic authTokenExpireAt(dynamic response) => getJsonField(
        response,
        r'''$.user.authTokenExpireAt''',
      );
  static dynamic phoneNumber(dynamic response) => getJsonField(
        response,
        r'''$.user.phoneNumber''',
      );
  static dynamic company(dynamic response) => getJsonField(
        response,
        r'''$.user.company''',
      );
}

class SignUpCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    String? email = '',
    String? firstName = '',
    String? lastName = '',
    int? companyId,
    String? phoneNumber = '',
    String? adminEmail = '',
    String? password = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}",
  "first_name": "${escapeStringForJson(firstName)}",
  "last_name": "${escapeStringForJson(lastName)}",
  "company_id": ${companyId},
  "phone_number": "${escapeStringForJson(phoneNumber)}",
  "admin_email": "${escapeStringForJson(adminEmail)}",
  "password": "${escapeStringForJson(password)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Sign Up',
      apiUrl: 'https://xxiz-mxuj-zpyz.n7e.xano.io/api:Q_aNNNvL/auth/signup',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AdminSignUpCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    String? email = '',
    String? firstName = '',
    String? lastName = '',
    String? adminEmail = '',
    String? phoneNumber = '',
    String? password = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}",
  "first_name": "${escapeStringForJson(firstName)}",
  "last_name": "${escapeStringForJson(lastName)}",
  "admin_email": "${escapeStringForJson(adminEmail)}",
  "phone_number": "${escapeStringForJson(phoneNumber)}",
  "password": "${escapeStringForJson(password)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Admin Sign Up',
      apiUrl:
          'https://xxiz-mxuj-zpyz.n7e.xano.io/api:Q_aNNNvL/auth/admin/signup',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RefreshTokenCall {
  static Future<ApiCallResponse> call({
    String? refreshToken = '',
    int? refreshTokenId,
    int? userId,
  }) async {
    final ffApiRequestBody = '''
{
  "refreshToken": "${escapeStringForJson(refreshToken)}",
  "refreshTokenId": ${refreshTokenId},
  "userId": ${userId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Refresh Token',
      apiUrl: 'https://xxiz-mxuj-zpyz.n7e.xano.io/api:Q_aNNNvL/auth/refresh',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? refreshToken(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.refreshToken''',
      ));
  static String? authToken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.authToken''',
      ));
  static int? refreshTokenId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.refreshTokenId''',
      ));
  static int? userId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.userId''',
      ));
  static int? authTokenExpireAt(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$.authTokenExpireAt''',
      ));
  static int? expiresAt(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.expiresAt''',
      ));
  static String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.email''',
      ));
  static String? firstName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.firstName''',
      ));
  static String? lastName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.lastName''',
      ));
  static dynamic phoneNumber(dynamic response) => getJsonField(
        response,
        r'''$.phoneNumber''',
      );
  static dynamic company(dynamic response) => getJsonField(
        response,
        r'''$.company''',
      );
}

class RevokeTokenCall {
  static Future<ApiCallResponse> call({
    int? refreshTokenId,
  }) async {
    final ffApiRequestBody = '''
{
  "refreshTokenId": ${refreshTokenId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Revoke Token',
      apiUrl:
          'https://xxiz-mxuj-zpyz.n7e.xano.io/api:Q_aNNNvL/auth/revoke_token',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddNewsCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    String? title = '',
    String? content = '',
    FFUploadedFile? image,
    String? author = '',
    String? ratio = '',
    List<int>? categoriesList,
    String? date = '',
  }) async {
    final categories = _serializeList(categoriesList);

    return ApiManager.instance.makeApiCall(
      callName: 'Add News',
      apiUrl: 'https://xxiz-mxuj-zpyz.n7e.xano.io/api:iiXsTPtO/news',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'title': title,
        'content': content,
        'image_uploaded': image,
        'author': author,
        'ratio': ratio,
        'categories': categories,
        'date': date,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetNewsCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get News',
      apiUrl: 'https://xxiz-mxuj-zpyz.n7e.xano.io/api:iiXsTPtO/news',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? news(dynamic response) => getJsonField(
        response,
        r'''$.news''',
        true,
      ) as List?;
  static List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$.news[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? createdAt(dynamic response) => (getJsonField(
        response,
        r'''$.news[:].created_at''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$.news[:].title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? content(dynamic response) => (getJsonField(
        response,
        r'''$.news[:].content''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? image(dynamic response) => (getJsonField(
        response,
        r'''$.news[:].image''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? author(dynamic response) => (getJsonField(
        response,
        r'''$.news[:].author''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? ratio(dynamic response) => (getJsonField(
        response,
        r'''$.news[:].ratio''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class EditNewsCall {
  static Future<ApiCallResponse> call({
    String? title = '',
    String? content = '',
    String? author = '',
    int? newsId,
    FFUploadedFile? image,
    String? ratio = '',
    String? authToken = '',
    List<int>? categoriesList,
    String? date = '',
  }) async {
    final categories = _serializeList(categoriesList);

    return ApiManager.instance.makeApiCall(
      callName: 'Edit News',
      apiUrl: 'https://xxiz-mxuj-zpyz.n7e.xano.io/api:iiXsTPtO/news/${newsId}',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'title': title,
        'content': content,
        'author': author,
        'image_uploaded': image,
        'ratio': ratio,
        'categories': categories,
        'date': date,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteNewsCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    String? newsId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Delete News',
      apiUrl: 'https://xxiz-mxuj-zpyz.n7e.xano.io/api:iiXsTPtO/news/${newsId}',
      callType: ApiCallType.DELETE,
      headers: {
        'Content-Type': 'aplication/json',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetUsersCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    String? email = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Users',
      apiUrl: 'https://xxiz-mxuj-zpyz.n7e.xano.io/api:om78GTVu/user',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'email': email,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? email(dynamic response) => (getJsonField(
        response,
        r'''$[:].email''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? company(dynamic response) => (getJsonField(
        response,
        r'''$[:].company''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? firstName(dynamic response) => (getJsonField(
        response,
        r'''$[:].first_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? lastName(dynamic response) => (getJsonField(
        response,
        r'''$[:].last_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<bool>? isAdministrator(dynamic response) => (getJsonField(
        response,
        r'''$[:].is_administrator''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  static dynamic user(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class SeriesSignUpCall {
  static Future<ApiCallResponse> call({
    dynamic? usersJson,
    String? authToken = '',
  }) async {
    final users = _serializeJson(usersJson);
    final ffApiRequestBody = '''
${users}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Series Sign Up',
      apiUrl:
          'https://xxiz-mxuj-zpyz.n7e.xano.io/api:Q_aNNNvL/auth/series/signup',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetCompaniesCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Companies',
      apiUrl: 'https://xxiz-mxuj-zpyz.n7e.xano.io/api:lUs0VlvB/companies',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? numberOfAgents(dynamic response) => (getJsonField(
        response,
        r'''$[:].number_of_agents''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class DeleteCompanyCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    int? companyId,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Delete Company',
      apiUrl:
          'https://xxiz-mxuj-zpyz.n7e.xano.io/api:lUs0VlvB/companies/${companyId}',
      callType: ApiCallType.DELETE,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddCompanyCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    String? name = '',
    String? email = '',
    String? address = '',
    String? postCode = '',
    String? city = '',
    String? phoneNumber = '',
    String? companyRepresentative = '',
  }) async {
    final ffApiRequestBody = '''
{
  "name": "${escapeStringForJson(name)}",
  "email": "${escapeStringForJson(email)}",
  "address": "${escapeStringForJson(address)}",
  "post_code": "${escapeStringForJson(postCode)}",
  "city": "${escapeStringForJson(city)}",
  "phone_number": "${escapeStringForJson(phoneNumber)}",
  "company_representative": "${escapeStringForJson(companyRepresentative)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Company',
      apiUrl: 'https://xxiz-mxuj-zpyz.n7e.xano.io/api:lUs0VlvB/companies',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EditCompanyCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    int? companyId,
    String? name = '',
    String? address = '',
    String? postCode = '',
    String? city = '',
    String? email = '',
    String? phoneNumber = '',
    String? companyRepresentative = '',
  }) async {
    final ffApiRequestBody = '''
{
  "companies_id": ${companyId},
  "name": "${escapeStringForJson(name)}",
  "email": "${escapeStringForJson(email)}",
  "address": "${escapeStringForJson(address)}",
  "post_code": "${escapeStringForJson(postCode)}",
  "city": "${escapeStringForJson(city)}",
  "phone_number": "${escapeStringForJson(phoneNumber)}",
  "company_representative": "${escapeStringForJson(companyRepresentative)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Edit Company',
      apiUrl:
          'https://xxiz-mxuj-zpyz.n7e.xano.io/api:lUs0VlvB/companies/${companyId}',
      callType: ApiCallType.PATCH,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class BlockCompanyCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    int? companiesId,
    bool? isBlocked,
    String? adminEmail = '',
  }) async {
    final ffApiRequestBody = '''
{
  "companies_id": ${companiesId},
  "admin_email": "${escapeStringForJson(adminEmail)}",
  "is_blocked": ${isBlocked}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Block Company',
      apiUrl:
          'https://xxiz-mxuj-zpyz.n7e.xano.io/api:lUs0VlvB/companies/block/${companiesId}',
      callType: ApiCallType.PATCH,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetCategoriesCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Categories',
      apiUrl: 'https://xxiz-mxuj-zpyz.n7e.xano.io/api:Qct1TYOV/categories',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddCategoriesCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    String? name = '',
    String? adminEmail = '',
  }) async {
    final ffApiRequestBody = '''
{
  "name": "${escapeStringForJson(name)}",
  "admin_email": "${escapeStringForJson(adminEmail)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Categories',
      apiUrl: 'https://xxiz-mxuj-zpyz.n7e.xano.io/api:Qct1TYOV/categories',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteCategoriesCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    int? categoriesId,
    String? adminEmail = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Delete Categories',
      apiUrl:
          'https://xxiz-mxuj-zpyz.n7e.xano.io/api:Qct1TYOV/categories/${categoriesId}',
      callType: ApiCallType.DELETE,
      headers: {
        'Content-Type': 'application/jason',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'admin_email': adminEmail,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EditCategoriesCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    String? name = '',
    String? adminEmail = '',
    int? categoriesId,
  }) async {
    final ffApiRequestBody = '''
{
  "name": "${escapeStringForJson(name)}",
  "admin_email": "${escapeStringForJson(adminEmail)}"

}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Edit Categories',
      apiUrl:
          'https://xxiz-mxuj-zpyz.n7e.xano.io/api:Qct1TYOV/categories/${categoriesId}',
      callType: ApiCallType.PATCH,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ResetPasswordCall {
  static Future<ApiCallResponse> call({
    String? email = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": 
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Reset Password',
      apiUrl:
          'https://xxiz-mxuj-zpyz.n7e.xano.io/api:Q_aNNNvL/auth/reset_password',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EditUserCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    String? userId = '',
    String? email = '',
    int? companies,
    String? lastName = '',
    String? firstName = '',
    String? phoneNumber = '',
    String? adminEmail = '',
  }) async {
    final ffApiRequestBody = '''
{
  "admin_email": "${escapeStringForJson(adminEmail)}",
  "email": "${escapeStringForJson(email)}",
  "companies": ${companies},
  "last_name": "${escapeStringForJson(lastName)}",
  "first_name": "${escapeStringForJson(firstName)}",
  "phone_number": "${escapeStringForJson(phoneNumber)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Edit User',
      apiUrl: 'https://xxiz-mxuj-zpyz.n7e.xano.io/api:om78GTVu/user/${userId}',
      callType: ApiCallType.PUT,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class BlockUserCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    int? userId,
    bool? isBlocked,
    String? adminEmail = '',
  }) async {
    final ffApiRequestBody = '''
{
  "admin_email": "${escapeStringForJson(adminEmail)}",
  "is_blocked": ${isBlocked}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Block User',
      apiUrl:
          'https://xxiz-mxuj-zpyz.n7e.xano.io/api:om78GTVu/user/block/${userId}',
      callType: ApiCallType.PATCH,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteUserCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    String? adminEmail = '',
    int? userId,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Delete User',
      apiUrl:
          'https://xxiz-mxuj-zpyz.n7e.xano.io/api:om78GTVu/user/admin/${userId}',
      callType: ApiCallType.DELETE,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'admin_email': adminEmail,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdatePasswordCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    int? userId,
    String? oldPassword = '',
    String? newPassword = '',
  }) async {
    final ffApiRequestBody = '''
{
  "old_password": "${escapeStringForJson(oldPassword)}",
  "new_password": "${escapeStringForJson(newPassword)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Password',
      apiUrl:
          'https://xxiz-mxuj-zpyz.n7e.xano.io/api:om78GTVu/user/update_password/${userId}',
      callType: ApiCallType.PATCH,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetUserCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    int? userId,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get User',
      apiUrl: 'https://xxiz-mxuj-zpyz.n7e.xano.io/api:om78GTVu/user/${userId}',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/jason',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
