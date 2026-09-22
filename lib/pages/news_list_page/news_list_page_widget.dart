import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/display_news_component/display_news_component_widget.dart';
import '/components/news_card_component/news_card_component_widget.dart';
import '/components/placeholder_components/news_card_placeholder_component/news_card_placeholder_component_widget.dart';
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
import 'news_list_page_model.dart';
export 'news_list_page_model.dart';

class NewsListPageWidget extends StatefulWidget {
  const NewsListPageWidget({super.key});

  static String routeName = 'NewsListPage';
  static String routePath = '/newsListPage';

  @override
  State<NewsListPageWidget> createState() => _NewsListPageWidgetState();
}

class _NewsListPageWidgetState extends State<NewsListPageWidget> {
  late NewsListPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewsListPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await action_blocks.refreshTokenAction(context);
      FFAppState().newsList = [];
      safeSetState(() {});
      _model.listOfNews = await GetNewsCall.call(
        authToken: currentAuthenticationToken,
      );

      if ((_model.listOfNews?.succeeded ?? true)) {
        for (int loop1Index = 0;
            loop1Index < (_model.listOfNews?.jsonBody ?? '').length;
            loop1Index++) {
          final currentLoop1Item =
              (_model.listOfNews?.jsonBody ?? '')[loop1Index];
          FFAppState().addToNewsList(NewsStruct(
            id: getJsonField(
              currentLoop1Item,
              r'''$.id''',
            ),
            createdAt: getJsonField(
              currentLoop1Item,
              r'''$.created_at''',
            ),
            title: getJsonField(
              currentLoop1Item,
              r'''$.title''',
            ).toString(),
            content: getJsonField(
              currentLoop1Item,
              r'''$.content''',
            ).toString(),
            image: getJsonField(
              currentLoop1Item,
              r'''$.image.url''',
            ).toString(),
            author: getJsonField(
              currentLoop1Item,
              r'''$.author''',
            ).toString(),
            ratio: getJsonField(
              currentLoop1Item,
              r'''$.ratio''',
            ).toString(),
            categories: (getJsonField(
              currentLoop1Item,
              r'''$.categories''',
              true,
            ) as List?)
                ?.cast<int>(),
            date: getJsonField(
              currentLoop1Item,
              r'''$.date''',
            ).toString(),
          ));
          safeSetState(() {});
        }
        await action_blocks.refreshTokenAction(context);
        FFAppState().categoryList = [];
        _model.categoryUpdatedInNewsPage = await GetCategoriesCall.call(
          authToken: currentAuthenticationToken,
        );

        if ((_model.categoryUpdatedInNewsPage?.succeeded ?? true)) {
          for (int loop2Index = 0;
              loop2Index <
                  (_model.categoryUpdatedInNewsPage?.jsonBody ?? '').length;
              loop2Index++) {
            final currentLoop2Item =
                (_model.categoryUpdatedInNewsPage?.jsonBody ?? '')[loop2Index];
            FFAppState().addToCategoryList(CategoryStruct(
              id: getJsonField(
                currentLoop2Item,
                r'''$.id''',
              ),
              name: getJsonField(
                currentLoop2Item,
                r'''$.name''',
              ).toString(),
              numberOfNews: getJsonField(
                currentLoop2Item,
                r'''$.number_of_news''',
              ),
            ));
          }
          _model.isLoading = false;
          safeSetState(() {});
        }
      }
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
    context.watch<FFAppState>();

    return Title(
        title: 'NewsListPage',
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
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 20.0),
                                child: Text(
                                  'Lista aktualizacji',
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
                              if (!_model.isLoading)
                                Builder(
                                  builder: (context) {
                                    final news = FFAppState()
                                        .newsList
                                        .sortedList(
                                            keyOf: (e) => e.createdAt,
                                            desc: true)
                                        .toList();

                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(news.length,
                                          (newsIndex) {
                                        final newsItem = news[newsIndex];
                                        return Builder(
                                          builder: (context) => InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(
                                                                dialogContext)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child:
                                                          DisplayNewsComponentWidget(
                                                        news: newsItem,
                                                        categoriesName: functions
                                                            .getCategoryNamesByIds(
                                                                newsItem
                                                                    .categories
                                                                    .toList(),
                                                                FFAppState()
                                                                    .categoryList
                                                                    .toList()),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            child: wrapWithModel(
                                              model: _model
                                                  .newsCardComponentModels
                                                  .getModel(
                                                newsItem.id.toString(),
                                                newsIndex,
                                              ),
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: NewsCardComponentWidget(
                                                key: Key(
                                                  'Keydde_${newsItem.id.toString()}',
                                                ),
                                                news: newsItem,
                                                categoriesName: functions
                                                    .getCategoryNamesByIds(
                                                        newsItem.categories
                                                            .toList(),
                                                        FFAppState()
                                                            .categoryList
                                                            .toList()),
                                              ),
                                            ),
                                          ),
                                        );
                                      }).divide(SizedBox(height: 20.0)),
                                    );
                                  },
                                ),
                              if (_model.isLoading)
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    wrapWithModel(
                                      model: _model
                                          .newsCardPlaceholderComponentModel1,
                                      updateCallback: () => safeSetState(() {}),
                                      child:
                                          NewsCardPlaceholderComponentWidget(),
                                    ),
                                    Opacity(
                                      opacity: 0.5,
                                      child: wrapWithModel(
                                        model: _model
                                            .newsCardPlaceholderComponentModel2,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child:
                                            NewsCardPlaceholderComponentWidget(),
                                      ),
                                    ),
                                    Opacity(
                                      opacity: 0.1,
                                      child: wrapWithModel(
                                        model: _model
                                            .newsCardPlaceholderComponentModel3,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child:
                                            NewsCardPlaceholderComponentWidget(),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 20.0)),
                                ),
                            ]
                                .divide(SizedBox(height: 20.0))
                                .addToStart(SizedBox(height: 30.0))
                                .addToEnd(SizedBox(height: 30.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
