import '/backend/schema/structs/index.dart';
import '/components/confirm_components/delete_news_confirm_component/delete_news_confirm_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'news_card_component_model.dart';
export 'news_card_component_model.dart';

class NewsCardComponentWidget extends StatefulWidget {
  const NewsCardComponentWidget({
    super.key,
    required this.news,
    required this.categoriesName,
  });

  final NewsStruct? news;
  final List<String>? categoriesName;

  @override
  State<NewsCardComponentWidget> createState() =>
      _NewsCardComponentWidgetState();
}

class _NewsCardComponentWidgetState extends State<NewsCardComponentWidget> {
  late NewsCardComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewsCardComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(
          valueOrDefault<double>(
            functions
                .responsiveSizePerPrecent(MediaQuery.sizeOf(context).width, 10)
                .toDouble(),
            10.0,
          ),
          0.0,
          valueOrDefault<double>(
            functions
                .responsiveSizePerPrecent(MediaQuery.sizeOf(context).width, 15)
                .toDouble(),
            10.0,
          ),
          0.0),
      child: Container(
        constraints: BoxConstraints(
          minHeight: 100.0,
          maxWidth: 600.0,
          maxHeight: 120.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(28.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 4,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 107.0,
                      height: 60.0,
                      decoration: BoxDecoration(),
                      child: Visibility(
                        visible: widget!.news?.image != null &&
                            widget!.news?.image != '',
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            widget!.news!.image,
                            width: 107.0,
                            height: 60.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 4,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            valueOrDefault<String>(
                              functions
                                  .convertDateFromString(widget!.news!.date),
                              '2026-01-01',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              widget!.news?.title,
                              'Artykuł o domku pod kurzą łapką w dubajskiej czekoladzie wypchane orzechami',
                            ).maybeHandleOverflow(
                              maxChars: 75,
                              replacement: '…',
                            ),
                            maxLines: 3,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              widget!.news?.author,
                              'Woj',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ].divide(SizedBox(height: 5.0)),
                      ),
                    ),
                  ].divide(SizedBox(width: 10.0)),
                ),
              ),
              Flexible(
                flex: 1,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          EditNewsPageWidget.routeName,
                          queryParameters: {
                            'news': serializeParam(
                              widget!.news,
                              ParamType.DataStruct,
                            ),
                          }.withoutNulls,
                        );
                      },
                      child: FaIcon(
                        FontAwesomeIcons.solidEdit,
                        color: FlutterFlowTheme.of(context).accent1,
                        size: 28.0,
                      ),
                    ),
                    Builder(
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
                                insetPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                alignment: AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                child: DeleteNewsConfirmComponentWidget(
                                  news: widget!.news!,
                                ),
                              );
                            },
                          );
                        },
                        child: Icon(
                          Icons.delete,
                          color: FlutterFlowTheme.of(context).accent3,
                          size: 30.0,
                        ),
                      ),
                    ),
                  ].divide(SizedBox(width: 20.0)),
                ),
              ),
            ].divide(SizedBox(width: 15.0)),
          ),
        ),
      ),
    );
  }
}
