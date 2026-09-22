import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import 'update_company_name_component_widget.dart'
    show UpdateCompanyNameComponentWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpdateCompanyNameComponentModel
    extends FlutterFlowModel<UpdateCompanyNameComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for CompanyName widget.
  FocusNode? companyNameFocusNode;
  TextEditingController? companyNameTextController;
  String? Function(BuildContext, String?)? companyNameTextControllerValidator;
  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for Address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressTextController;
  String? Function(BuildContext, String?)? addressTextControllerValidator;
  // State field(s) for PostCode widget.
  FocusNode? postCodeFocusNode;
  TextEditingController? postCodeTextController;
  String? Function(BuildContext, String?)? postCodeTextControllerValidator;
  // State field(s) for City widget.
  FocusNode? cityFocusNode;
  TextEditingController? cityTextController;
  String? Function(BuildContext, String?)? cityTextControllerValidator;
  // State field(s) for PhoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  // State field(s) for CompanyRepresentative widget.
  FocusNode? companyRepresentativeFocusNode;
  TextEditingController? companyRepresentativeTextController;
  String? Function(BuildContext, String?)?
      companyRepresentativeTextControllerValidator;
  // Stores action output result for [Backend Call - API (Edit Company)] action in Button widget.
  ApiCallResponse? apiResult5l8;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    companyNameFocusNode?.dispose();
    companyNameTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    addressFocusNode?.dispose();
    addressTextController?.dispose();

    postCodeFocusNode?.dispose();
    postCodeTextController?.dispose();

    cityFocusNode?.dispose();
    cityTextController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();

    companyRepresentativeFocusNode?.dispose();
    companyRepresentativeTextController?.dispose();
  }
}
