import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'display_news_component_model.dart';
export 'display_news_component_model.dart';

class DisplayNewsComponentWidget extends StatefulWidget {
  const DisplayNewsComponentWidget({
    super.key,
    required this.news,
    required this.categoriesName,
  });

  final NewsStruct? news;
  final List<String>? categoriesName;

  @override
  State<DisplayNewsComponentWidget> createState() =>
      _DisplayNewsComponentWidgetState();
}

class _DisplayNewsComponentWidgetState
    extends State<DisplayNewsComponentWidget> {
  late DisplayNewsComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DisplayNewsComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        constraints: BoxConstraints(
          minWidth: 320.0,
          minHeight: 320.0,
          maxWidth: 600.0,
          maxHeight: 700.0,
        ),
        decoration: BoxDecoration(),
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: FlutterFlowTheme.of(context).secondaryBackground,
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            valueOrDefault<double>(
                              functions
                                  .responsiveSizePerPrecent(
                                      MediaQuery.sizeOf(context).width, 6)
                                  .toDouble(),
                              0.0,
                            ),
                            0.0,
                            valueOrDefault<double>(
                              functions
                                  .responsiveSizePerPrecent(
                                      MediaQuery.sizeOf(context).width, 6)
                                  .toDouble(),
                              0.0,
                            ),
                            0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 2.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).accent1,
                          ),
                        ),
                      ),
                      if (functions.returnRatio(widget!.news?.ratio) ==
                          Ratio.horizontal)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            widget!.news!.image,
                            width: 304.0,
                            height: 171.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      if (functions.returnRatio(widget!.news?.ratio) ==
                          Ratio.vertical)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            widget!.news!.image,
                            width: 171.0,
                            height: 304.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      if (functions.returnRatio(widget!.news?.ratio) ==
                          Ratio.square)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            widget!.news!.image,
                            width: 304.0,
                            height: 304.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: Text(
                                  valueOrDefault<String>(
                                    widget!.news?.title,
                                    'Title',
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
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  functions.convertDateFromString(
                                      widget!.news!.date),
                                  'Data',
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
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  widget!.news?.author,
                                  'Wojciech Madeja',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Kategorie: ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              Builder(
                                builder: (context) {
                                  final categories =
                                      widget!.categoriesName!.toList();

                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(categories.length,
                                        (categoriesIndex) {
                                      final categoriesItem =
                                          categories[categoriesIndex];
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (categoriesIndex <
                                              ((widget!.categoriesName!)
                                                      .toList()
                                                      .length -
                                                  1))
                                            Text(
                                              '${categoriesItem}, ',
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                          if (categoriesIndex ==
                                              ((widget!.categoriesName!)
                                                      .toList()
                                                      .length -
                                                  1))
                                            Text(
                                              categoriesItem,
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                        ],
                                      );
                                    }),
                                  );
                                },
                              ),
                            ],
                          ),
                        ].divide(SizedBox(height: 5.0)),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            valueOrDefault<double>(
                              functions
                                  .responsiveSizePerPrecent(
                                      MediaQuery.sizeOf(context).width, 6)
                                  .toDouble(),
                              0.0,
                            ),
                            0.0,
                            valueOrDefault<double>(
                              functions
                                  .responsiveSizePerPrecent(
                                      MediaQuery.sizeOf(context).width, 6)
                                  .toDouble(),
                              0.0,
                            ),
                            0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 2.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).accent1,
                          ),
                        ),
                      ),
                      Text(
                        valueOrDefault<String>(
                          widget!.news?.content,
                          ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur blandit ut mi quis pharetra. In sit amet ligula consectetur, rhoncus est non, elementum dolor. Phasellus vitae blandit magna. Nulla congue vel enim at sollicitudin. Curabitur sed enim a velit gravida dapibus. Integer neque urna, ornare non ipsum at, consectetur posuere urna. Cras placerat tortor a neque lobortis laoreet. Nam nibh ante, sodales ac ante vitae, iaculis dapibus sapien. Morbi blandit metus eu velit vehicula, vel viverra felis imperdiet. Duis malesuada consequat quam. Etiam sit amet laoreet neque.  Quisque feugiat orci in elit malesuada finibus. Aliquam consectetur lobortis felis, sed luctus libero accumsan in. Nam semper mattis dui pellentesque tincidunt. Donec sit amet dignissim arcu. Maecenas venenatis arcu in lacus pharetra venenatis. Nullam rhoncus nibh sed enim egestas, sit amet efficitur justo dignissim. Sed eu sem magna.  Pellentesque id sem at augue auctor venenatis. Maecenas ullamcorper, velit vel facilisis maximus, enim neque faucibus eros, interdum fermentum turpis tellus nec magna. Ut non finibus felis. Pellentesque volutpat nulla ut ligula aliquet, eu bibendum velit pretium. Curabitur nec cursus tortor. Suspendisse quam ex, mattis quis metus et, blandit pulvinar turpis. Praesent cursus fringilla sagittis. Vestibulum sed nulla tristique ex laoreet bibendum. Duis facilisis tortor at ex laoreet tempus. Nulla gravida fermentum eleifend. Praesent quis hendrerit metus, a dignissim turpis. Cras at fermentum ligula, eu vehicula nunc. Mauris urna magna, pharetra ac viverra ac, dictum quis libero.  Aliquam commodo a massa vitae mattis. Nulla nulla dolor, dignissim vel leo ac, laoreet bibendum arcu. Aliquam erat volutpat. Nunc sed pellentesque purus. Proin nec ultricies ligula, eget lacinia nunc. Cras malesuada risus placerat felis porta ornare in non eros. Donec ultricies nunc eu congue rhoncus. In at ante a leo condimentum dapibus vel sed augue. Ut sed feugiat sapien. Nulla sagittis in purus ut maximus. Fusce placerat ante sit amet orci ornare elementum. Nam sit amet maximus est. Suspendisse scelerisque nibh id ex fringilla tincidunt.  Nulla posuere massa ut maximus condimentum. Vestibulum quis libero eros. Sed in sollicitudin mauris. Etiam venenatis tempor nisl. Donec condimentum tellus sed tellus congue, vel pharetra leo iaculis. Nullam congue commodo convallis. Maecenas sit amet nisl in eros porta feugiat. Sed quis turpis a arcu pretium convallis. Phasellus ullamcorper elit nulla, ut maximus orci commodo posuere.',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            valueOrDefault<double>(
                              functions
                                  .responsiveSizePerPrecent(
                                      MediaQuery.sizeOf(context).width, 6)
                                  .toDouble(),
                              0.0,
                            ),
                            0.0,
                            valueOrDefault<double>(
                              functions
                                  .responsiveSizePerPrecent(
                                      MediaQuery.sizeOf(context).width, 6)
                                  .toDouble(),
                              0.0,
                            ),
                            0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 2.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).accent1,
                          ),
                        ),
                      ),
                    ]
                        .divide(SizedBox(height: 20.0))
                        .addToStart(SizedBox(height: 20.0))
                        .addToEnd(SizedBox(height: 20.0)),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(1.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 23.0, 23.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderRadius: 50.0,
                    buttonSize: 35.0,
                    fillColor: FlutterFlowTheme.of(context).accent1,
                    icon: Icon(
                      Icons.close_rounded,
                      color: FlutterFlowTheme.of(context).info,
                      size: 15.0,
                    ),
                    onPressed: () async {
                      context.safePop();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
