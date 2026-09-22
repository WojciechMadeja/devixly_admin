import '/backend/api_requests/api_calls.dart';
import '/components/ui_popup_components/informationon_component/informationon_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'send_email_for_reset_password_component_widget.dart'
    show SendEmailForResetPasswordComponentWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SendEmailForResetPasswordComponentModel
    extends FlutterFlowModel<SendEmailForResetPasswordComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for CompanyName widget.
  FocusNode? companyNameFocusNode;
  TextEditingController? companyNameTextController;
  String? Function(BuildContext, String?)? companyNameTextControllerValidator;
  // Stores action output result for [Backend Call - API (Reset Password)] action in Button widget.
  ApiCallResponse? sendedEmail;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    companyNameFocusNode?.dispose();
    companyNameTextController?.dispose();
  }
}
