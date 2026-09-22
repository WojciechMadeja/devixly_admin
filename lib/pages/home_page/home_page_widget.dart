import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/option_card_component/option_card_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  static String routeName = 'HomePage';
  static String routePath = '/homePage';

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      Function() _navigate = () {};
      if (currentUserData!.expireAt! <= getCurrentTimestamp) {
        if ((currentAuthRefreshToken != null &&
                currentAuthRefreshToken != '') &&
            (currentUserData?.id != null) &&
            (currentUserData?.refreshTokenId != null)) {
          _model.refreshResponse = await RefreshTokenCall.call(
            refreshToken: currentAuthRefreshToken,
            refreshTokenId: currentUserData?.refreshTokenId,
            userId: currentUserData?.id,
          );

          if ((_model.refreshResponse?.succeeded ?? true)) {
            authManager.updateAuthUserData(
              authenticationToken: RefreshTokenCall.authToken(
                (_model.refreshResponse?.jsonBody ?? ''),
              ),
              refreshToken: RefreshTokenCall.refreshToken(
                (_model.refreshResponse?.jsonBody ?? ''),
              ),
              tokenExpiration:
                  functions.convertJSONToTime(RefreshTokenCall.expiresAt(
                (_model.refreshResponse?.jsonBody ?? ''),
              )!),
              authUid: RefreshTokenCall.userId(
                (_model.refreshResponse?.jsonBody ?? ''),
              )?.toString(),
              userData: UserStruct(
                expireAt: functions
                    .convertJSONToTime(RefreshTokenCall.authTokenExpireAt(
                  (_model.refreshResponse?.jsonBody ?? ''),
                )!),
                id: RefreshTokenCall.userId(
                  (_model.refreshResponse?.jsonBody ?? ''),
                ),
                firstName: RefreshTokenCall.firstName(
                  (_model.refreshResponse?.jsonBody ?? ''),
                ),
                lastName: RefreshTokenCall.lastName(
                  (_model.refreshResponse?.jsonBody ?? ''),
                ),
                email: RefreshTokenCall.email(
                  (_model.refreshResponse?.jsonBody ?? ''),
                ),
                refreshTokenId: RefreshTokenCall.refreshTokenId(
                  (_model.refreshResponse?.jsonBody ?? ''),
                ),
              ),
            );
          } else {
            if (currentUserData?.refreshTokenId != null) {
              _model.apiResulte31 = await RevokeTokenCall.call(
                refreshTokenId: currentUserData?.refreshTokenId,
              );

              GoRouter.of(context).prepareAuthEvent();
              await authManager.signOut();
              GoRouter.of(context).clearRedirectLocation();

              _navigate = () => context.goNamedAuth(
                  LoginPageWidget.routeName, context.mounted);
            } else {
              GoRouter.of(context).prepareAuthEvent();
              await authManager.signOut();
              GoRouter.of(context).clearRedirectLocation();

              _navigate = () => context.goNamedAuth(
                  LoginPageWidget.routeName, context.mounted);
            }
          }
        } else {
          GoRouter.of(context).prepareAuthEvent();
          await authManager.signOut();
          GoRouter.of(context).clearRedirectLocation();

          _navigate = () =>
              context.goNamedAuth(LoginPageWidget.routeName, context.mounted);
        }
      } else {
        return;
      }

      _navigate();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'HomePage',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: 100.0,
                    height: 120.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10.0,
                          color: Color(0x33000000),
                          offset: Offset(
                            0.0,
                            2.0,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.only(),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          valueOrDefault<double>(
                            MediaQuery.sizeOf(context).width > 600.0
                                ? functions
                                    .responsiveSizePerPrecent(
                                        MediaQuery.sizeOf(context).width, 15)
                                    .toDouble()
                                : functions
                                    .responsiveSizePerPrecent(
                                        MediaQuery.sizeOf(context).width, 5)
                                    .toDouble(),
                            0.0,
                          ),
                          0.0,
                          valueOrDefault<double>(
                            MediaQuery.sizeOf(context).width > 600.0
                                ? functions
                                    .responsiveSizePerPrecent(
                                        MediaQuery.sizeOf(context).width, 15)
                                    .toDouble()
                                : functions
                                    .responsiveSizePerPrecent(
                                        MediaQuery.sizeOf(context).width, 5)
                                    .toDouble(),
                            0.0,
                          ),
                          0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/logo_admin_horizontal.png',
                              width: MediaQuery.sizeOf(context).width > 600.0
                                  ? 200.0
                                  : 140.0,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.apiResultj5z = await RevokeTokenCall.call(
                                refreshTokenId: currentUserData?.refreshTokenId,
                              );

                              GoRouter.of(context).prepareAuthEvent();
                              await authManager.signOut();
                              GoRouter.of(context).clearRedirectLocation();

                              context.goNamedAuth(
                                  LoginPageWidget.routeName, context.mounted);

                              safeSetState(() {});
                            },
                            child: FaIcon(
                              FontAwesomeIcons.signOutAlt,
                              color: FlutterFlowTheme.of(context).primary,
                              size: MediaQuery.sizeOf(context).width > 600.0
                                  ? 45.0
                                  : 34.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (MediaQuery.sizeOf(context).width > 600.0 ? true : false)
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            valueOrDefault<double>(
                              functions
                                  .responsiveSizePerPrecent(
                                      MediaQuery.sizeOf(context).width, 15)
                                  .toDouble(),
                              0.0,
                            ),
                            0.0,
                            valueOrDefault<double>(
                              functions
                                  .responsiveSizePerPrecent(
                                      MediaQuery.sizeOf(context).width, 15)
                                  .toDouble(),
                              0.0,
                            ),
                            0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Wrap(
                                spacing: 30.0,
                                runSpacing: 30.0,
                                alignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.start,
                                direction: Axis.horizontal,
                                runAlignment: WrapAlignment.start,
                                verticalDirection: VerticalDirection.down,
                                clipBehavior: Clip.none,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                          AddNewsPageWidget.routeName);
                                    },
                                    child: wrapWithModel(
                                      model: _model.optionCardComponentModel1,
                                      updateCallback: () => safeSetState(() {}),
                                      child: OptionCardComponentWidget(
                                        optionIcon: Icon(
                                          Icons.note_add,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 55.0,
                                        ),
                                        optionText: 'Dodaj do aktualności',
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                          NewsListPageWidget.routeName);
                                    },
                                    child: wrapWithModel(
                                      model: _model.optionCardComponentModel2,
                                      updateCallback: () => safeSetState(() {}),
                                      child: OptionCardComponentWidget(
                                        optionIcon: Icon(
                                          Icons.newspaper_sharp,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 55.0,
                                        ),
                                        optionText: 'Lista aktualności',
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                          AddCategoryPageWidget.routeName);
                                    },
                                    child: wrapWithModel(
                                      model: _model.optionCardComponentModel3,
                                      updateCallback: () => safeSetState(() {}),
                                      child: OptionCardComponentWidget(
                                        optionIcon: FaIcon(
                                          FontAwesomeIcons.tags,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 55.0,
                                        ),
                                        optionText: 'Zarządzaj kategoriami',
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                          AddCompanyPageWidget.routeName);
                                    },
                                    child: wrapWithModel(
                                      model: _model.optionCardComponentModel4,
                                      updateCallback: () => safeSetState(() {}),
                                      child: OptionCardComponentWidget(
                                        optionIcon: FaIcon(
                                          FontAwesomeIcons.city,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 55.0,
                                        ),
                                        optionText: 'Zarządzaj firmami',
                                      ),
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.optionCardComponentModel5,
                                    updateCallback: () => safeSetState(() {}),
                                    child: OptionCardComponentWidget(
                                      optionIcon: Icon(
                                        Icons.other_houses,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 55.0,
                                      ),
                                      optionText: 'Dodaj jednostki',
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                          AddUserPageWidget.routeName);
                                    },
                                    child: wrapWithModel(
                                      model: _model.optionCardComponentModel6,
                                      updateCallback: () => safeSetState(() {}),
                                      child: OptionCardComponentWidget(
                                        optionIcon: Icon(
                                          Icons.person_add,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 55.0,
                                        ),
                                        optionText: 'Dodaj użytkownika',
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                          AddListOfUsersPageWidget.routeName);
                                    },
                                    child: wrapWithModel(
                                      model: _model.optionCardComponentModel7,
                                      updateCallback: () => safeSetState(() {}),
                                      child: OptionCardComponentWidget(
                                        optionIcon: Icon(
                                          Icons.group_add,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 55.0,
                                        ),
                                        optionText: 'Dodaj użytkowników z CSV',
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                          UsersListPageWidget.routeName);
                                    },
                                    child: wrapWithModel(
                                      model: _model.optionCardComponentModel8,
                                      updateCallback: () => safeSetState(() {}),
                                      child: OptionCardComponentWidget(
                                        optionIcon: Icon(
                                          Icons.list,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 55.0,
                                        ),
                                        optionText: 'Lista użytkowników',
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                          AddAdminPageWidget.routeName);
                                    },
                                    child: wrapWithModel(
                                      model: _model.optionCardComponentModel9,
                                      updateCallback: () => safeSetState(() {}),
                                      child: OptionCardComponentWidget(
                                        optionIcon: Icon(
                                          Icons.admin_panel_settings,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 55.0,
                                        ),
                                        optionText: 'Dodaj administratora',
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      authManager.updateAuthUserData(
                                        userData: UserStruct(),
                                      );
                                    },
                                    child: wrapWithModel(
                                      model: _model.optionCardComponentModel10,
                                      updateCallback: () => safeSetState(() {}),
                                      child: OptionCardComponentWidget(
                                        optionIcon: Icon(
                                          Icons.house,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 55.0,
                                        ),
                                        optionText: 'Oferty',
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                          SettingsPageWidget.routeName);
                                    },
                                    child: wrapWithModel(
                                      model: _model.optionCardComponentModel11,
                                      updateCallback: () => safeSetState(() {}),
                                      child: OptionCardComponentWidget(
                                        optionIcon: Icon(
                                          Icons.settings_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 55.0,
                                        ),
                                        optionText: 'Ustawienia',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ]
                                .divide(SizedBox(height: 30.0))
                                .addToStart(SizedBox(height: 50.0)),
                          ),
                        ),
                      ),
                    ),
                  if (MediaQuery.sizeOf(context).width <= 600.0 ? true : false)
                    Expanded(
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        decoration: BoxDecoration(),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Wrap(
                                spacing: 30.0,
                                runSpacing: 30.0,
                                alignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.start,
                                direction: Axis.horizontal,
                                runAlignment: WrapAlignment.start,
                                verticalDirection: VerticalDirection.down,
                                clipBehavior: Clip.none,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                          AddNewsPageWidget.routeName);
                                    },
                                    child: wrapWithModel(
                                      model: _model.optionCardComponentModel12,
                                      updateCallback: () => safeSetState(() {}),
                                      child: OptionCardComponentWidget(
                                        optionIcon: Icon(
                                          Icons.note_add,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 55.0,
                                        ),
                                        optionText: 'Dodaj do aktualności',
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                          NewsListPageWidget.routeName);
                                    },
                                    child: wrapWithModel(
                                      model: _model.optionCardComponentModel13,
                                      updateCallback: () => safeSetState(() {}),
                                      child: OptionCardComponentWidget(
                                        optionIcon: Icon(
                                          Icons.newspaper_sharp,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 55.0,
                                        ),
                                        optionText: 'Lista aktualności',
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                          AddCategoryPageWidget.routeName);
                                    },
                                    child: wrapWithModel(
                                      model: _model.optionCardComponentModel14,
                                      updateCallback: () => safeSetState(() {}),
                                      child: OptionCardComponentWidget(
                                        optionIcon: FaIcon(
                                          FontAwesomeIcons.tags,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 55.0,
                                        ),
                                        optionText: 'Zarządzaj kategoriami',
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                          AddCompanyPageWidget.routeName);
                                    },
                                    child: wrapWithModel(
                                      model: _model.optionCardComponentModel15,
                                      updateCallback: () => safeSetState(() {}),
                                      child: OptionCardComponentWidget(
                                        optionIcon: FaIcon(
                                          FontAwesomeIcons.city,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 55.0,
                                        ),
                                        optionText: 'Zarządzaj firmami',
                                      ),
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.optionCardComponentModel16,
                                    updateCallback: () => safeSetState(() {}),
                                    child: OptionCardComponentWidget(
                                      optionIcon: Icon(
                                        Icons.other_houses_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 55.0,
                                      ),
                                      optionText: 'Dodaj jednostki',
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                          AddUserPageWidget.routeName);
                                    },
                                    child: wrapWithModel(
                                      model: _model.optionCardComponentModel17,
                                      updateCallback: () => safeSetState(() {}),
                                      child: OptionCardComponentWidget(
                                        optionIcon: Icon(
                                          Icons.person_add,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 55.0,
                                        ),
                                        optionText: 'Dodaj użytkownika',
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                          AddListOfUsersPageWidget.routeName);
                                    },
                                    child: wrapWithModel(
                                      model: _model.optionCardComponentModel18,
                                      updateCallback: () => safeSetState(() {}),
                                      child: OptionCardComponentWidget(
                                        optionIcon: Icon(
                                          Icons.group_add,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 55.0,
                                        ),
                                        optionText: 'Dodaj użytkowników z CSV',
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                          UsersListPageWidget.routeName);
                                    },
                                    child: wrapWithModel(
                                      model: _model.optionCardComponentModel19,
                                      updateCallback: () => safeSetState(() {}),
                                      child: OptionCardComponentWidget(
                                        optionIcon: Icon(
                                          Icons.list,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 55.0,
                                        ),
                                        optionText: 'Lista użytkowników',
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                          AddAdminPageWidget.routeName);
                                    },
                                    child: wrapWithModel(
                                      model: _model.optionCardComponentModel20,
                                      updateCallback: () => safeSetState(() {}),
                                      child: OptionCardComponentWidget(
                                        optionIcon: Icon(
                                          Icons.admin_panel_settings,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 55.0,
                                        ),
                                        optionText: 'Dodaj administratora',
                                      ),
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.optionCardComponentModel21,
                                    updateCallback: () => safeSetState(() {}),
                                    child: OptionCardComponentWidget(
                                      optionIcon: Icon(
                                        Icons.house,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 55.0,
                                      ),
                                      optionText: 'Oferty',
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                          SettingsPageWidget.routeName);
                                    },
                                    child: wrapWithModel(
                                      model: _model.optionCardComponentModel22,
                                      updateCallback: () => safeSetState(() {}),
                                      child: OptionCardComponentWidget(
                                        optionIcon: Icon(
                                          Icons.settings_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 55.0,
                                        ),
                                        optionText: 'Ustawienia',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ]
                                .divide(SizedBox(height: 30.0))
                                .addToEnd(SizedBox(height: 20.0)),
                          ),
                        ),
                      ),
                    ),
                ].divide(SizedBox(height: 30.0)),
              ),
            ),
          ),
        ));
  }
}
