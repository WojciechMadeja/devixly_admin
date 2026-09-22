import '/backend/schema/structs/index.dart';
import '/components/company_select_card_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'companies_list_for_select_component_widget.dart'
    show CompaniesListForSelectComponentWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CompaniesListForSelectComponentModel
    extends FlutterFlowModel<CompaniesListForSelectComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for CompanySelectCardComponent dynamic component.
  late FlutterFlowDynamicModels<CompanySelectCardComponentModel>
      companySelectCardComponentModels;

  @override
  void initState(BuildContext context) {
    companySelectCardComponentModels =
        FlutterFlowDynamicModels(() => CompanySelectCardComponentModel());
  }

  @override
  void dispose() {
    companySelectCardComponentModels.dispose();
  }
}
