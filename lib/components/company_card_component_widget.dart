import '/backend/schema/structs/index.dart';
import '/components/confirm_components/block_company_confirm_component/block_company_confirm_component_widget.dart';
import '/components/confirm_components/delete_company_confirm_component/delete_company_confirm_component_widget.dart';
import '/components/confirm_components/unblock_company_confirm_component/unblock_company_confirm_component_widget.dart';
import '/components/confirm_components/update_company_name_component/update_company_name_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import '/flutter_flow/font_awesome_compat.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'company_card_component_model.dart';
export 'company_card_component_model.dart';

class CompanyCardComponentWidget extends StatefulWidget {
  const CompanyCardComponentWidget({
    super.key,
    required this.isSelected,
    required this.company,
    required this.index,
  });

  final bool? isSelected;
  final CompanyStruct? company;
  final int? index;

  @override
  State<CompanyCardComponentWidget> createState() =>
      _CompanyCardComponentWidgetState();
}

class _CompanyCardComponentWidgetState
    extends State<CompanyCardComponentWidget> {
  late CompanyCardComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompanyCardComponentModel());

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
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: widget!.isSelected!
            ? Color(0xFFDDE1E3)
            : FlutterFlowTheme.of(context).secondaryBackground,
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    valueOrDefault<String>(
                      widget!.company?.name,
                      'Company',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                  if (widget!.company?.isBlocked ?? true)
                    Icon(
                      Icons.block_rounded,
                      color: FlutterFlowTheme.of(context).secondary,
                      size: 24.0,
                    ),
                ].divide(SizedBox(width: 5.0)),
              ),
              if (!widget!.isSelected! ||
                  (widget!.company?.name == 'Crowd Empire'))
                Text(
                  'Agentów:  ${widget!.company?.numberOfMembers?.toString()}',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              if (widget!.isSelected! &&
                  (widget!.company?.name != 'Crowd Empire'))
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
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
                                child: UpdateCompanyNameComponentWidget(
                                  company: widget!.company!,
                                  index: widget!.index!,
                                ),
                              );
                            },
                          );
                        },
                        child: FaIcon(
                          FontAwesomeIcons.solidEdit,
                          color: FlutterFlowTheme.of(context).accent1,
                          size: 28.0,
                        ),
                      ),
                    ),
                    Builder(
                      builder: (context) => InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (widget!.company!.isBlocked) {
                            await showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  child: UnblockCompanyConfirmComponentWidget(
                                    company: widget!.company!,
                                  ),
                                );
                              },
                            );
                          } else {
                            await showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  child: BlockCompanyConfirmComponentWidget(
                                    company: widget!.company!,
                                  ),
                                );
                              },
                            );
                          }
                        },
                        child: Icon(
                          Icons.block_sharp,
                          color: FlutterFlowTheme.of(context).tertiary,
                          size: 30.0,
                        ),
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
                                child: DeleteCompanyConfirmComponentWidget(
                                  company: widget!.company!,
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
                  ].divide(SizedBox(width: 10.0)),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
