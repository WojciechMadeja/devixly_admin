import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import 'delete_news_confirm_component_widget.dart'
    show DeleteNewsConfirmComponentWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DeleteNewsConfirmComponentModel
    extends FlutterFlowModel<DeleteNewsConfirmComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Delete News)] action in Button widget.
  ApiCallResponse? deleteNewsResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
