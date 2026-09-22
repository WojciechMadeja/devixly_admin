import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'company_select_card_component_model.dart';
export 'company_select_card_component_model.dart';

class CompanySelectCardComponentWidget extends StatefulWidget {
  const CompanySelectCardComponentWidget({
    super.key,
    required this.company,
  });

  final CompanyStruct? company;

  @override
  State<CompanySelectCardComponentWidget> createState() =>
      _CompanySelectCardComponentWidgetState();
}

class _CompanySelectCardComponentWidgetState
    extends State<CompanySelectCardComponentWidget> {
  late CompanySelectCardComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompanySelectCardComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      constraints: BoxConstraints(
        minWidth: 320.0,
        maxWidth: 600.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: MouseRegion(
        opaque: false,
        cursor: MouseCursor.defer ?? MouseCursor.defer,
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: _model.mouseRegionHovered!
              ? FlutterFlowTheme.of(context).tertiary
              : FlutterFlowTheme.of(context).primaryBackground,
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  valueOrDefault<String>(
                    widget!.company?.name,
                    'Company',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ],
            ),
          ),
        ),
        onEnter: ((event) async {
          safeSetState(() => _model.mouseRegionHovered = true);
        }),
        onExit: ((event) async {
          safeSetState(() => _model.mouseRegionHovered = false);
        }),
      ),
    );
  }
}
