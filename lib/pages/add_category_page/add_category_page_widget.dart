import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/category_card_component_widget.dart';
import '/components/placeholder_components/placeholder_company_card_componet/placeholder_company_card_componet_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_category_page_model.dart';
export 'add_category_page_model.dart';

class AddCategoryPageWidget extends StatefulWidget {
  const AddCategoryPageWidget({super.key});

  static String routeName = 'AddCategoryPage';
  static String routePath = '/addCategoryPage';

  @override
  State<AddCategoryPageWidget> createState() => _AddCategoryPageWidgetState();
}

class _AddCategoryPageWidgetState extends State<AddCategoryPageWidget> {
  late AddCategoryPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddCategoryPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await action_blocks.refreshTokenAction(context);
      FFAppState().categoryList = [];
      _model.categoryUpdated = await GetCategoriesCall.call(
        authToken: currentAuthenticationToken,
      );

      if ((_model.categoryUpdated?.succeeded ?? true)) {
        for (int loop1Index = 0;
            loop1Index < (_model.categoryUpdated?.jsonBody ?? '').length;
            loop1Index++) {
          final currentLoop1Item =
              (_model.categoryUpdated?.jsonBody ?? '')[loop1Index];
          FFAppState().addToCategoryList(CategoryStruct(
            id: getJsonField(
              currentLoop1Item,
              r'''$.id''',
            ),
            name: getJsonField(
              currentLoop1Item,
              r'''$.name''',
            ).toString(),
            numberOfNews: getJsonField(
              currentLoop1Item,
              r'''$.number_of_news''',
            ),
          ));
          safeSetState(() {});
        }
        safeSetState(() {});
        _model.isLoading = false;
        safeSetState(() {});
      }
    });

    _model.nameTextController ??= TextEditingController();
    _model.nameFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'AddCategoryPage',
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
                          if (!isWeb)
                            FlutterFlowIconButton(
                              borderRadius: 8.0,
                              buttonSize: 50.0,
                              icon: Icon(
                                Icons.arrow_back,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 34.0,
                              ),
                              onPressed: () async {
                                context.safePop();
                              },
                            ),
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
                              GoRouter.of(context).prepareAuthEvent();
                              await authManager.signOut();
                              GoRouter.of(context).clearRedirectLocation();

                              context.goNamedAuth(
                                  LoginPageWidget.routeName, context.mounted);
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
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 20.0),
                              child: Text(
                                'Zarządzaj kategoriami',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 22.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Container(
                              width: 250.0,
                              child: TextFormField(
                                controller: _model.nameTextController,
                                focusNode: _model.nameFocusNode,
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                  hintText: 'Nazwa kategorii',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  hoverColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                cursorColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                enableInteractiveSelection: true,
                                validator: _model.nameTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  await action_blocks
                                      .refreshTokenAction(context);
                                  _model.addedCategory =
                                      await AddCategoriesCall.call(
                                    authToken: currentAuthenticationToken,
                                    name: _model.nameTextController.text,
                                    adminEmail: currentUserData?.email,
                                  );

                                  if ((_model.addedCategory?.succeeded ??
                                      true)) {
                                    safeSetState(() {
                                      _model.nameTextController?.clear();
                                    });
                                    FFAppState()
                                        .addToCategoryList(CategoryStruct(
                                      id: getJsonField(
                                        (_model.addedCategory?.jsonBody ?? ''),
                                        r'''$.id''',
                                      ),
                                      name: valueOrDefault<String>(
                                        getJsonField(
                                          (_model.addedCategory?.jsonBody ??
                                              ''),
                                          r'''$.name''',
                                        )?.toString(),
                                        '\$',
                                      ),
                                      numberOfNews: 0,
                                    ));
                                    safeSetState(() {});
                                  }

                                  safeSetState(() {});
                                },
                                text: 'Zapisz',
                                options: FFButtonOptions(
                                  width: 200.0,
                                  height: 50.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        font: GoogleFonts.interTight(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            if (!_model.isLoading)
                              Expanded(
                                child: Builder(
                                  builder: (context) {
                                    final listOfCategory = FFAppState()
                                        .categoryList
                                        .sortedList(
                                            keyOf: (e) => e.name, desc: false)
                                        .toList();

                                    return SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children:
                                            List.generate(listOfCategory.length,
                                                    (listOfCategoryIndex) {
                                          final listOfCategoryItem =
                                              listOfCategory[
                                                  listOfCategoryIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.selectedIndex =
                                                  listOfCategoryIndex;
                                              safeSetState(() {});
                                            },
                                            onDoubleTap: () async {
                                              _model.selectedIndex = null;
                                              safeSetState(() {});
                                            },
                                            child: wrapWithModel(
                                              model: _model
                                                  .categoryCardComponentModels
                                                  .getModel(
                                                listOfCategoryIndex.toString(),
                                                listOfCategoryIndex,
                                              ),
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child:
                                                  CategoryCardComponentWidget(
                                                key: Key(
                                                  'Keytwm_${listOfCategoryIndex.toString()}',
                                                ),
                                                isSelected:
                                                    listOfCategoryIndex ==
                                                        _model.selectedIndex,
                                                index: listOfCategoryIndex,
                                                category: listOfCategoryItem,
                                              ),
                                            ),
                                          );
                                        })
                                                .divide(SizedBox(height: 5.0))
                                                .around(SizedBox(height: 5.0)),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            if (_model.isLoading)
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  wrapWithModel(
                                    model: _model
                                        .placeholderCompanyCardComponetModel1,
                                    updateCallback: () => safeSetState(() {}),
                                    child:
                                        PlaceholderCompanyCardComponetWidget(),
                                  ),
                                  Opacity(
                                    opacity: 0.5,
                                    child: wrapWithModel(
                                      model: _model
                                          .placeholderCompanyCardComponetModel2,
                                      updateCallback: () => safeSetState(() {}),
                                      child:
                                          PlaceholderCompanyCardComponetWidget(),
                                    ),
                                  ),
                                  Opacity(
                                    opacity: 0.1,
                                    child: wrapWithModel(
                                      model: _model
                                          .placeholderCompanyCardComponetModel3,
                                      updateCallback: () => safeSetState(() {}),
                                      child:
                                          PlaceholderCompanyCardComponetWidget(),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 5.0)),
                              ),
                          ]
                              .divide(SizedBox(height: 20.0))
                              .addToStart(SizedBox(height: 30.0))
                              .addToEnd(SizedBox(height: 30.0)),
                        ),
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 16.0)),
              ),
            ),
          ),
        ));
  }
}
