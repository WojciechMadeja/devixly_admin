import '/backend/schema/structs/index.dart';
import '/components/company_select_card_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'companies_list_for_select_component_model.dart';
export 'companies_list_for_select_component_model.dart';

class CompaniesListForSelectComponentWidget extends StatefulWidget {
  const CompaniesListForSelectComponentWidget({super.key});

  @override
  State<CompaniesListForSelectComponentWidget> createState() =>
      _CompaniesListForSelectComponentWidgetState();
}

class _CompaniesListForSelectComponentWidgetState
    extends State<CompaniesListForSelectComponentWidget> {
  late CompaniesListForSelectComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompaniesListForSelectComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 320.0,
      constraints: BoxConstraints(
        maxHeight: 700.0,
      ),
      decoration: BoxDecoration(),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: FlutterFlowTheme.of(context).secondaryBackground,
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (FFAppState().companyList.isNotEmpty)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final companiesForSelect = FFAppState()
                          .companyList
                          .where((e) => !e.isBlocked)
                          .toList()
                          .sortedList(keyOf: (e) => e.name, desc: false)
                          .toList();

                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(companiesForSelect.length,
                            (companiesForSelectIndex) {
                          final companiesForSelectItem =
                              companiesForSelect[companiesForSelectIndex];
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              FFAppState().selectedCompany =
                                  companiesForSelectItem;
                              _model.updatePage(() {});
                              Navigator.pop(context);
                            },
                            child: wrapWithModel(
                              model: _model.companySelectCardComponentModels
                                  .getModel(
                                companiesForSelectIndex.toString(),
                                companiesForSelectIndex,
                              ),
                              updateCallback: () => safeSetState(() {}),
                              child: CompanySelectCardComponentWidget(
                                key: Key(
                                  'Keygvt_${companiesForSelectIndex.toString()}',
                                ),
                                company: companiesForSelectItem,
                              ),
                            ),
                          );
                        }).divide(SizedBox(height: 5.0)),
                      );
                    },
                  ),
                ),
              if (!(FFAppState().companyList.isNotEmpty))
                Text(
                  'Nie masz  jeszcze dodanych firm',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              FFButtonWidget(
                onPressed: () async {
                  context.pushNamed(AddCompanyPageWidget.routeName);
                },
                text: 'Dodaj firmę',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.interTight(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                        color: Colors.white,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ]
                .divide(SizedBox(height: 15.0))
                .addToStart(SizedBox(height: 10.0))
                .addToEnd(SizedBox(height: 10.0)),
          ),
        ),
      ),
    );
  }
}
