import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import 'delete_user_confirm_component_widget.dart'
    show DeleteUserConfirmComponentWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DeleteUserConfirmComponentModel
    extends FlutterFlowModel<DeleteUserConfirmComponentWidget> {
  ///  Local state fields for this component.

  bool isNotFirstTime = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Confirm widget.
  FocusNode? confirmFocusNode;
  TextEditingController? confirmTextController;
  String? Function(BuildContext, String?)? confirmTextControllerValidator;
  // Stores action output result for [Backend Call - API (Delete User)] action in Button widget.
  ApiCallResponse? deleteUserResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    confirmFocusNode?.dispose();
    confirmTextController?.dispose();
  }
}
