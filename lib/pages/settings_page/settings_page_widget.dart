import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/option_card_component/option_card_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '/flutter_flow/font_awesome_compat.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'settings_page_model.dart';
export 'settings_page_model.dart';

class SettingsPageWidget extends StatefulWidget {
  const SettingsPageWidget({super.key});

  static String routeName = 'SettingsPage';
  static String routePath = '/settingsPage';

  @override
  State<SettingsPageWidget> createState() => _SettingsPageWidgetState();
}

class _SettingsPageWidgetState extends State<SettingsPageWidget>
    with TickerProviderStateMixin {
  late SettingsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await action_blocks.refreshTokenAction(context);
      _model.displayUserResponse = await GetUserCall.call(
        authToken: currentAuthenticationToken,
        userId: currentUserData?.id,
      );

      if ((_model.displayUserResponse?.succeeded ?? true)) {
        _model.updateUserStruct(
          (e) => e
            ..id = getJsonField(
              (_model.displayUserResponse?.jsonBody ?? ''),
              r'''$.id''',
            )
            ..firstName = getJsonField(
              (_model.displayUserResponse?.jsonBody ?? ''),
              r'''$.first_name''',
            ).toString()
            ..lastName = getJsonField(
              (_model.displayUserResponse?.jsonBody ?? ''),
              r'''$.last_name''',
            ).toString()
            ..email = getJsonField(
              (_model.displayUserResponse?.jsonBody ?? ''),
              r'''$.email''',
            ).toString()
            ..isAdministrator = getJsonField(
              (_model.displayUserResponse?.jsonBody ?? ''),
              r'''$.is_administrator''',
            )
            ..phoneNumber = getJsonField(
              (_model.displayUserResponse?.jsonBody ?? ''),
              r'''$.phone_number''',
            ).toString()
            ..isBlocked = getJsonField(
              (_model.displayUserResponse?.jsonBody ?? ''),
              r'''$.is_blocked''',
            )
            ..updateCompany(
              (e) => e
                ..id = getJsonField(
                  (_model.displayUserResponse?.jsonBody ?? ''),
                  r'''$.company.id''',
                )
                ..name = getJsonField(
                  (_model.displayUserResponse?.jsonBody ?? ''),
                  r'''$.company.name''',
                ).toString()
                ..incrementNumberOfMembers(0)
                ..isBlocked = getJsonField(
                  (_model.displayUserResponse?.jsonBody ?? ''),
                  r'''$.company.is_blocked''',
                ),
            ),
        );
        safeSetState(() {});
      }
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation4': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
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
        title: 'SettingsPage',
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
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.goNamed(HomePageWidget.routeName);
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/logo_admin_horizontal.png',
                                width: MediaQuery.sizeOf(context).width > 600.0
                                    ? 200.0
                                    : 140.0,
                                fit: BoxFit.fitWidth,
                              ),
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
                            if (_model.user != null)
                              Container(
                                constraints: BoxConstraints(
                                  minWidth: 320.0,
                                  maxWidth: 350.0,
                                ),
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.factory,
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          size: 32.0,
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            _model.user?.company?.name,
                                            'Firma',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ].divide(SizedBox(width: 10.0)),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.email_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          size: 32.0,
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            _model.user?.email,
                                            'Email',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ].divide(SizedBox(width: 10.0)),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.person_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          size: 32.0,
                                        ),
                                        Text(
                                          '${_model.user?.firstName} ${_model.user?.lastName}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ].divide(SizedBox(width: 10.0)),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.phone_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          size: 32.0,
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            _model.user?.phoneNumber,
                                            'Numer Telefonu',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ].divide(SizedBox(width: 10.0)),
                                    ),
                                  ].divide(SizedBox(height: 10.0)),
                                ),
                              ),
                            if (_model.user == null)
                              Container(
                                constraints: BoxConstraints(
                                  minWidth: 320.0,
                                  maxWidth: 350.0,
                                ),
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.factory,
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          size: 32.0,
                                        ),
                                        Container(
                                          width: 150.0,
                                          height: 20.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'containerOnPageLoadAnimation1']!),
                                      ].divide(SizedBox(width: 10.0)),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.email_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          size: 32.0,
                                        ),
                                        Container(
                                          width: 150.0,
                                          height: 18.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'containerOnPageLoadAnimation2']!),
                                      ].divide(SizedBox(width: 10.0)),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.person_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          size: 32.0,
                                        ),
                                        Container(
                                          width: 150.0,
                                          height: 18.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'containerOnPageLoadAnimation3']!),
                                      ].divide(SizedBox(width: 10.0)),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.phone_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          size: 32.0,
                                        ),
                                        Container(
                                          width: 150.0,
                                          height: 18.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'containerOnPageLoadAnimation4']!),
                                      ].divide(SizedBox(width: 10.0)),
                                    ),
                                  ].divide(SizedBox(height: 10.0)),
                                ),
                              ),
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
                                        EditPersonDataPageWidget.routeName);
                                  },
                                  child: wrapWithModel(
                                    model: _model.optionCardComponentModel1,
                                    updateCallback: () => safeSetState(() {}),
                                    child: OptionCardComponentWidget(
                                      optionIcon: Icon(
                                        Icons.perm_contact_cal_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 55.0,
                                      ),
                                      optionText: 'Edytuj dane osobowe',
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
                                        UpdatePasswordPageWidget.routeName);
                                  },
                                  child: wrapWithModel(
                                    model: _model.optionCardComponentModel2,
                                    updateCallback: () => safeSetState(() {}),
                                    child: OptionCardComponentWidget(
                                      optionIcon: Icon(
                                        Icons.password_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 55.0,
                                      ),
                                      optionText: 'Zmień hasło',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ]
                              .divide(SizedBox(height: 40.0))
                              .addToStart(SizedBox(height: 20.0)),
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
