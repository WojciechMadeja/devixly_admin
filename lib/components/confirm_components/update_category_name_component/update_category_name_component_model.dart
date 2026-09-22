import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import 'update_category_name_component_widget.dart'
    show UpdateCategoryNameComponentWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpdateCategoryNameComponentModel
    extends FlutterFlowModel<UpdateCategoryNameComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for CompanyName widget.
  FocusNode? companyNameFocusNode;
  TextEditingController? companyNameTextController;
  String? Function(BuildContext, String?)? companyNameTextControllerValidator;
  // Stores action output result for [Backend Call - API (Edit Categories)] action in Button widget.
  ApiCallResponse? updatedCategory;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    companyNameFocusNode?.dispose();
    companyNameTextController?.dispose();
  }
}
