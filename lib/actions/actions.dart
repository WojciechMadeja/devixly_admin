import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_manager.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';

Future refreshTokenAction(BuildContext context) async {
  ApiCallResponse? refreshResponseBlock;
  ApiCallResponse? apiResulte31;
  Function() _navigate = () {};
  if ((currentAuthRefreshToken != null && currentAuthRefreshToken != '') &&
      (currentUserData?.id != null) &&
      (currentUserData?.refreshTokenId != null)) {
    refreshResponseBlock = await RefreshTokenCall.call(
      refreshToken: currentAuthRefreshToken,
      refreshTokenId: currentUserData?.refreshTokenId,
      userId: currentUserData?.id,
    );

    if ((refreshResponseBlock?.succeeded ?? true)) {
      authManager.updateAuthUserData(
        authenticationToken: RefreshTokenCall.authToken(
          (refreshResponseBlock?.jsonBody ?? ''),
        ),
        refreshToken: RefreshTokenCall.refreshToken(
          (refreshResponseBlock?.jsonBody ?? ''),
        ),
        tokenExpiration: functions.convertJSONToTime(RefreshTokenCall.expiresAt(
          (refreshResponseBlock?.jsonBody ?? ''),
        )!),
        authUid: RefreshTokenCall.userId(
          (refreshResponseBlock?.jsonBody ?? ''),
        )?.toString(),
        userData: UserStruct(
          expireAt:
              functions.convertJSONToTime(RefreshTokenCall.authTokenExpireAt(
            (refreshResponseBlock?.jsonBody ?? ''),
          )!),
          id: RefreshTokenCall.userId(
            (refreshResponseBlock?.jsonBody ?? ''),
          ),
          firstName: RefreshTokenCall.firstName(
            (refreshResponseBlock?.jsonBody ?? ''),
          ),
          lastName: RefreshTokenCall.lastName(
            (refreshResponseBlock?.jsonBody ?? ''),
          ),
          email: RefreshTokenCall.email(
            (refreshResponseBlock?.jsonBody ?? ''),
          ),
          refreshTokenId: RefreshTokenCall.refreshTokenId(
            (refreshResponseBlock?.jsonBody ?? ''),
          ),
          phoneNumber: RefreshTokenCall.phoneNumber(
            (refreshResponseBlock?.jsonBody ?? ''),
          ).toString(),
          company: RefreshTokenCall.company(
            (refreshResponseBlock?.jsonBody ?? ''),
          ).toString(),
        ),
      );
    } else {
      if (currentUserData?.refreshTokenId != null) {
        apiResulte31 = await RevokeTokenCall.call(
          refreshTokenId: currentUserData?.refreshTokenId,
        );

        GoRouter.of(context).prepareAuthEvent();
        await authManager.signOut();
        GoRouter.of(context).clearRedirectLocation();

        _navigate = () =>
            context.goNamedAuth(LoginPageWidget.routeName, context.mounted);
      } else {
        GoRouter.of(context).prepareAuthEvent();
        await authManager.signOut();
        GoRouter.of(context).clearRedirectLocation();

        _navigate = () =>
            context.goNamedAuth(LoginPageWidget.routeName, context.mounted);
      }
    }
  } else {
    GoRouter.of(context).prepareAuthEvent();
    await authManager.signOut();
    GoRouter.of(context).clearRedirectLocation();

    _navigate =
        () => context.goNamedAuth(LoginPageWidget.routeName, context.mounted);
  }

  _navigate();
}
