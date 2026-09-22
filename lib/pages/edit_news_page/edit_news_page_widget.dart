import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/category_chip_placeholder_component_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '/flutter_flow/font_awesome_compat.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_news_page_model.dart';
export 'edit_news_page_model.dart';

class EditNewsPageWidget extends StatefulWidget {
  const EditNewsPageWidget({
    super.key,
    required this.news,
  });

  final NewsStruct? news;

  static String routeName = 'EditNewsPage';
  static String routePath = '/editNewsPage';

  @override
  State<EditNewsPageWidget> createState() => _EditNewsPageWidgetState();
}

class _EditNewsPageWidgetState extends State<EditNewsPageWidget> {
  late EditNewsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditNewsPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.ratio = functions.returnRatio(widget!.news?.ratio);
      safeSetState(() {});
      await action_blocks.refreshTokenAction(context);
      FFAppState().categoryList = [];
      _model.categoryUpdatedInEditNewsPage = await GetCategoriesCall.call(
        authToken: currentAuthenticationToken,
      );

      if ((_model.categoryUpdatedInEditNewsPage?.succeeded ?? true)) {
        for (int loop1Index = 0;
            loop1Index <
                (_model.categoryUpdatedInEditNewsPage?.jsonBody ?? '').length;
            loop1Index++) {
          final currentLoop1Item =
              (_model.categoryUpdatedInEditNewsPage?.jsonBody ??
                  '')[loop1Index];
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
          _model.addToCategoryNameList(getJsonField(
            currentLoop1Item,
            r'''$.name''',
          ).toString());
        }
        safeSetState(() {});
      }
    });

    _model.titleTextController ??=
        TextEditingController(text: widget!.news?.title);
    _model.titleFocusNode ??= FocusNode();

    _model.descriptionTextController ??=
        TextEditingController(text: widget!.news?.content);
    _model.descriptionFocusNode ??= FocusNode();

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
        title: 'EditNewsPage',
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
                        child: SingleChildScrollView(
                          primary: false,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 20.0),
                                child: Text(
                                  'Edytuj aktualność',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  final selectedMedia = await selectMedia(
                                    maxWidth: 450.00,
                                    maxHeight: 450.00,
                                    mediaSource: MediaSource.photoGallery,
                                    multiImage: false,
                                  );
                                  if (selectedMedia != null &&
                                      selectedMedia.every((m) =>
                                          validateFileFormat(
                                              m.storagePath, context))) {
                                    safeSetState(() =>
                                        _model.isDataUploading_uploadEditImage =
                                            true);
                                    var selectedUploadedFiles =
                                        <FFUploadedFile>[];

                                    try {
                                      selectedUploadedFiles = selectedMedia
                                          .map((m) => FFUploadedFile(
                                                name: m.storagePath
                                                    .split('/')
                                                    .last,
                                                bytes: m.bytes,
                                                height: m.dimensions?.height,
                                                width: m.dimensions?.width,
                                                blurHash: m.blurHash,
                                                originalFilename:
                                                    m.originalFilename,
                                              ))
                                          .toList();
                                    } finally {
                                      _model.isDataUploading_uploadEditImage =
                                          false;
                                    }
                                    if (selectedUploadedFiles.length ==
                                        selectedMedia.length) {
                                      safeSetState(() {
                                        _model.uploadedLocalFile_uploadEditImage =
                                            selectedUploadedFiles.first;
                                      });
                                    } else {
                                      safeSetState(() {});
                                      return;
                                    }
                                  }
                                },
                                child: Container(
                                  width: 304.0,
                                  constraints: BoxConstraints(
                                    minHeight: 171.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Stack(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Icon(
                                                Icons.camera_alt,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                size: 55.0,
                                              ),
                                            ),
                                            Text(
                                              'Dodaj zdjęcie',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(height: 5.0)),
                                        ),
                                      ),
                                      if ((_model.uploadedLocalFile_uploadEditImage ==
                                                  null ||
                                              (_model.uploadedLocalFile_uploadEditImage
                                                      .bytes?.isEmpty ??
                                                  true)) &&
                                          (_model.ratio == Ratio.horizontal))
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          child: Image.network(
                                            widget!.news!.image,
                                            width: 304.0,
                                            height: 171.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      if ((_model.uploadedLocalFile_uploadEditImage ==
                                                  null ||
                                              (_model.uploadedLocalFile_uploadEditImage
                                                      .bytes?.isEmpty ??
                                                  true)) &&
                                          (_model.ratio == Ratio.vertical))
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                            child: Image.network(
                                              widget!.news!.image,
                                              width: 171.0,
                                              height: 304.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      if ((_model.uploadedLocalFile_uploadEditImage ==
                                                  null ||
                                              (_model.uploadedLocalFile_uploadEditImage
                                                      .bytes?.isEmpty ??
                                                  true)) &&
                                          (_model.ratio == Ratio.square))
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                            child: Image.network(
                                              widget!.news!.image,
                                              width: 304.0,
                                              height: 304.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      if ((_model.uploadedLocalFile_uploadEditImage !=
                                                  null &&
                                              (_model.uploadedLocalFile_uploadEditImage
                                                      .bytes?.isNotEmpty ??
                                                  false)) &&
                                          (_model.ratio == Ratio.horizontal))
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          child: Image.memory(
                                            _model.uploadedLocalFile_uploadEditImage
                                                    .bytes ??
                                                Uint8List.fromList([]),
                                            width: 304.0,
                                            height: 171.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      if ((_model.uploadedLocalFile_uploadEditImage !=
                                                  null &&
                                              (_model.uploadedLocalFile_uploadEditImage
                                                      .bytes?.isNotEmpty ??
                                                  false)) &&
                                          (_model.ratio == Ratio.vertical))
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                            child: Image.memory(
                                              _model.uploadedLocalFile_uploadEditImage
                                                      .bytes ??
                                                  Uint8List.fromList([]),
                                              width: 171.0,
                                              height: 304.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      if ((_model.uploadedLocalFile_uploadEditImage !=
                                                  null &&
                                              (_model.uploadedLocalFile_uploadEditImage
                                                      .bytes?.isNotEmpty ??
                                                  false)) &&
                                          (_model.ratio == Ratio.square))
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                            child: Image.memory(
                                              _model.uploadedLocalFile_uploadEditImage
                                                      .bytes ??
                                                  Uint8List.fromList([]),
                                              width: 304.0,
                                              height: 304.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: 320.0,
                                decoration: BoxDecoration(),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderRadius: 8.0,
                                      buttonSize: 60.0,
                                      fillColor: _model.ratio ==
                                              Ratio.horizontal
                                          ? FlutterFlowTheme.of(context).accent1
                                          : FlutterFlowTheme.of(context)
                                              .secondary,
                                      icon: FaIcon(
                                        FontAwesomeIcons.arrowsAltH,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        _model.ratio = Ratio.horizontal;
                                        safeSetState(() {});
                                      },
                                    ),
                                    FlutterFlowIconButton(
                                      borderRadius: 8.0,
                                      buttonSize: 60.0,
                                      fillColor: _model.ratio == Ratio.vertical
                                          ? FlutterFlowTheme.of(context).accent1
                                          : FlutterFlowTheme.of(context)
                                              .secondary,
                                      icon: FaIcon(
                                        FontAwesomeIcons.arrowsAltV,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        _model.ratio = Ratio.vertical;
                                        safeSetState(() {});
                                      },
                                    ),
                                    FlutterFlowIconButton(
                                      borderRadius: 8.0,
                                      buttonSize: 60.0,
                                      fillColor: _model.ratio == Ratio.square
                                          ? FlutterFlowTheme.of(context).accent1
                                          : FlutterFlowTheme.of(context)
                                              .secondary,
                                      icon: Icon(
                                        Icons.square_rounded,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        _model.ratio = Ratio.square;
                                        safeSetState(() {});
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 320.0,
                                child: TextFormField(
                                  controller: _model.titleTextController,
                                  focusNode: _model.titleFocusNode,
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
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                    hintText: 'Tytuł',
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
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                                        color: FlutterFlowTheme.of(context)
                                            .accent1,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
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
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                                  maxLines: 2,
                                  minLines: 1,
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  enableInteractiveSelection: true,
                                  validator: _model.titleTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Container(
                                width: 320.0,
                                decoration: BoxDecoration(),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        _model.datePicked != null
                                            ? dateTimeFormat(
                                                "d MMMM y",
                                                _model.datePicked,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              )
                                            : functions.convertDateFromString(
                                                widget!.news!.date),
                                        'Wybierz datę',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    FlutterFlowIconButton(
                                      borderRadius: 8.0,
                                      buttonSize: 40.0,
                                      fillColor:
                                          FlutterFlowTheme.of(context).primary,
                                      icon: Icon(
                                        Icons.calendar_today,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        final _datePickedDate =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: getCurrentTimestamp,
                                          firstDate: DateTime(1900),
                                          lastDate: DateTime(2050),
                                          builder: (context, child) {
                                            return wrapInMaterialDatePickerTheme(
                                              context,
                                              child!,
                                              headerBackgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              headerForegroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              headerTextStyle: FlutterFlowTheme
                                                      .of(context)
                                                  .headlineLarge
                                                  .override(
                                                    font:
                                                        GoogleFonts.interTight(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineLarge
                                                              .fontStyle,
                                                    ),
                                                    fontSize: 32.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineLarge
                                                            .fontStyle,
                                                  ),
                                              pickerBackgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              pickerForegroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              selectedDateTimeBackgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              selectedDateTimeForegroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              actionButtonForegroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              iconSize: 24.0,
                                            );
                                          },
                                        );

                                        if (_datePickedDate != null) {
                                          safeSetState(() {
                                            _model.datePicked = DateTime(
                                              _datePickedDate.year,
                                              _datePickedDate.month,
                                              _datePickedDate.day,
                                            );
                                          });
                                        } else if (_model.datePicked != null) {
                                          safeSetState(() {
                                            _model.datePicked =
                                                getCurrentTimestamp;
                                          });
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 320.0,
                                child: TextFormField(
                                  controller: _model.descriptionTextController,
                                  focusNode: _model.descriptionFocusNode,
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
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                    hintText: 'Opis',
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
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                                        color: FlutterFlowTheme.of(context)
                                            .accent1,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
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
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                                  maxLines: null,
                                  minLines: 10,
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  enableInteractiveSelection: true,
                                  validator: _model
                                      .descriptionTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              if (_model.categoryNameList.isNotEmpty)
                                Container(
                                  constraints: BoxConstraints(
                                    maxWidth: 800.0,
                                  ),
                                  decoration: BoxDecoration(),
                                  child: FlutterFlowChoiceChips(
                                    options: _model.categoryNameList
                                        .map((label) => ChipData(label))
                                        .toList(),
                                    onChanged: (val) => safeSetState(
                                        () => _model.choiceChipsValues = val),
                                    selectedChipStyle: ChipStyle(
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).tertiary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                      iconColor:
                                          FlutterFlowTheme.of(context).info,
                                      iconSize: 16.0,
                                      labelPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              10.0, 5.0, 10.0, 5.0),
                                      elevation: 4.0,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    unselectedChipStyle: ChipStyle(
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                      iconColor: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      iconSize: 16.0,
                                      labelPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              10.0, 5.0, 10.0, 5.0),
                                      elevation: 4.0,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    chipSpacing: 15.0,
                                    rowSpacing: 8.0,
                                    multiselect: true,
                                    initialized:
                                        _model.choiceChipsValues != null,
                                    alignment: WrapAlignment.spaceEvenly,
                                    controller:
                                        _model.choiceChipsValueController ??=
                                            FormFieldController<List<String>>(
                                      functions.getCategoryNamesByIds(
                                          widget!.news!.categories.toList(),
                                          FFAppState().categoryList.toList()),
                                    ),
                                    wrapped: true,
                                  ),
                                ),
                              if (!(_model.categoryNameList.isNotEmpty))
                                Container(
                                  constraints: BoxConstraints(
                                    maxWidth: 800.0,
                                  ),
                                  decoration: BoxDecoration(),
                                  child: Wrap(
                                    spacing: 15.0,
                                    runSpacing: 8.0,
                                    alignment: WrapAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    direction: Axis.horizontal,
                                    runAlignment: WrapAlignment.start,
                                    verticalDirection: VerticalDirection.down,
                                    clipBehavior: Clip.none,
                                    children: [
                                      wrapWithModel(
                                        model: _model
                                            .categoryChipPlaceholderComponentModel1,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child:
                                            CategoryChipPlaceholderComponentWidget(),
                                      ),
                                      Opacity(
                                        opacity: 0.7,
                                        child: wrapWithModel(
                                          model: _model
                                              .categoryChipPlaceholderComponentModel2,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child:
                                              CategoryChipPlaceholderComponentWidget(),
                                        ),
                                      ),
                                      Opacity(
                                        opacity: 0.5,
                                        child: wrapWithModel(
                                          model: _model
                                              .categoryChipPlaceholderComponentModel3,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child:
                                              CategoryChipPlaceholderComponentWidget(),
                                        ),
                                      ),
                                      Opacity(
                                        opacity: 0.3,
                                        child: wrapWithModel(
                                          model: _model
                                              .categoryChipPlaceholderComponentModel4,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child:
                                              CategoryChipPlaceholderComponentWidget(),
                                        ),
                                      ),
                                      Opacity(
                                        opacity: 0.1,
                                        child: wrapWithModel(
                                          model: _model
                                              .categoryChipPlaceholderComponentModel5,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child:
                                              CategoryChipPlaceholderComponentWidget(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        context.goNamed(
                                            NewsListPageWidget.routeName);
                                      },
                                      text: 'Anuluj',
                                      options: FFButtonOptions(
                                        width: 140.0,
                                        height: 50.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
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
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        await action_blocks
                                            .refreshTokenAction(context);
                                        if (_model.uploadedLocalFile_uploadEditImage !=
                                                null &&
                                            (_model.uploadedLocalFile_uploadEditImage
                                                    .bytes?.isNotEmpty ??
                                                false)) {
                                          _model.editNewsWithImageResponse =
                                              await EditNewsCall.call(
                                            authToken:
                                                currentAuthenticationToken,
                                            title:
                                                _model.titleTextController.text,
                                            content: _model
                                                .descriptionTextController.text,
                                            author: widget!.news?.author,
                                            newsId: widget!.news?.id,
                                            ratio: _model.ratio?.name,
                                            image: _model
                                                .uploadedLocalFile_uploadEditImage,
                                            categoriesList: functions
                                                .returnIdCategoriesList(
                                                    _model.choiceChipsValues!
                                                        .toList(),
                                                    FFAppState()
                                                        .categoryList
                                                        .toList()),
                                            date: _model.datePicked != null
                                                ? dateTimeFormat(
                                                    "y-MM-d",
                                                    _model.datePicked,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  )
                                                : widget!.news?.date,
                                          );

                                          if ((_model.editNewsWithImageResponse
                                                  ?.succeeded ??
                                              true)) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Udało się edytować',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent2,
                                              ),
                                            );
                                            FFAppState().removeFromNewsList(
                                                widget!.news!);
                                            FFAppState()
                                                .addToNewsList(NewsStruct(
                                              id: getJsonField(
                                                (_model.editNewsWithImageResponse
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.id''',
                                              ),
                                              createdAt: getJsonField(
                                                (_model.editNewsWithImageResponse
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.created_at''',
                                              ),
                                              date: getJsonField(
                                                (_model.editNewsWithImageResponse
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.date''',
                                              ).toString(),
                                              title: getJsonField(
                                                (_model.editNewsWithImageResponse
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.title''',
                                              ).toString(),
                                              content: getJsonField(
                                                (_model.editNewsWithImageResponse
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.content''',
                                              ).toString(),
                                              image: getJsonField(
                                                (_model.editNewsWithImageResponse
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.image.url''',
                                              ).toString(),
                                              author: getJsonField(
                                                (_model.editNewsWithImageResponse
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.author''',
                                              ).toString(),
                                              ratio: getJsonField(
                                                (_model.editNewsWithImageResponse
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.ratio''',
                                              ).toString(),
                                              categories: (getJsonField(
                                                (_model.editNewsWithImageResponse
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.categories''',
                                                true,
                                              ) as List?)
                                                  ?.cast<int>(),
                                            ));
                                            FFAppState().update(() {});

                                            context.goNamed(
                                                NewsListPageWidget.routeName);

                                            safeSetState(() {});
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Nie udało sie dodac aktualności ze zdjęciem',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent3,
                                              ),
                                            );
                                          }
                                        } else {
                                          _model.editNewsResponse =
                                              await EditNewsCall.call(
                                            authToken:
                                                currentAuthenticationToken,
                                            title:
                                                _model.titleTextController.text,
                                            content: _model
                                                .descriptionTextController.text,
                                            author: widget!.news?.author,
                                            newsId: widget!.news?.id,
                                            ratio: _model.ratio?.name,
                                            categoriesList: functions
                                                .returnIdCategoriesList(
                                                    _model.choiceChipsValues!
                                                        .toList(),
                                                    FFAppState()
                                                        .categoryList
                                                        .toList()),
                                            date: _model.datePicked != null
                                                ? dateTimeFormat(
                                                    "y-MM-d",
                                                    _model.datePicked,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  )
                                                : widget!.news?.date,
                                          );

                                          if ((_model.editNewsResponse
                                                  ?.succeeded ??
                                              true)) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Udało się edytować',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent2,
                                              ),
                                            );
                                            FFAppState().removeFromNewsList(
                                                widget!.news!);
                                            FFAppState()
                                                .addToNewsList(NewsStruct(
                                              id: getJsonField(
                                                (_model.editNewsResponse
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.id''',
                                              ),
                                              createdAt: getJsonField(
                                                (_model.editNewsResponse
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.created_at''',
                                              ),
                                              date: getJsonField(
                                                (_model.editNewsResponse
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.date''',
                                              ).toString(),
                                              title: getJsonField(
                                                (_model.editNewsResponse
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.title''',
                                              ).toString(),
                                              content: getJsonField(
                                                (_model.editNewsResponse
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.content''',
                                              ).toString(),
                                              image: getJsonField(
                                                (_model.editNewsResponse
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.image.url''',
                                              ).toString(),
                                              author: getJsonField(
                                                (_model.editNewsResponse
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.auth''',
                                              ).toString(),
                                              ratio: getJsonField(
                                                (_model.editNewsResponse
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.ratio''',
                                              ).toString(),
                                              categories: (getJsonField(
                                                (_model.editNewsResponse
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.categories''',
                                                true,
                                              ) as List?)
                                                  ?.cast<int>(),
                                            ));
                                            FFAppState().update(() {});

                                            context.goNamed(
                                                NewsListPageWidget.routeName);

                                            safeSetState(() {});
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Nie udało sie dodac aktualności',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent3,
                                              ),
                                            );
                                          }
                                        }

                                        safeSetState(() {});
                                      },
                                      text: 'Edytuj',
                                      options: FFButtonOptions(
                                        width: 140.0,
                                        height: 50.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .accent1,
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
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 40.0)),
                              ),
                            ]
                                .divide(SizedBox(height: 25.0))
                                .addToStart(SizedBox(height: 30.0))
                                .addToEnd(SizedBox(height: 30.0)),
                          ),
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
