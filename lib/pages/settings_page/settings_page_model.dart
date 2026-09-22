import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/option_card_component/option_card_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'settings_page_widget.dart' show SettingsPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '/flutter_flow/font_awesome_compat.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingsPageModel extends FlutterFlowModel<SettingsPageWidget> {
  ///  Local state fields for this page.

  DisplayUserStruct? user;
  void updateUserStruct(Function(DisplayUserStruct) updateFn) {
    updateFn(user ??= DisplayUserStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get User)] action in SettingsPage widget.
  ApiCallResponse? displayUserResponse;
  // Stores action output result for [Backend Call - API (Revoke Token)] action in Icon widget.
  ApiCallResponse? apiResultj5z;
  // Model for OptionCardComponent component.
  late OptionCardComponentModel optionCardComponentModel1;
  // Model for OptionCardComponent component.
  late OptionCardComponentModel optionCardComponentModel2;

  @override
  void initState(BuildContext context) {
    optionCardComponentModel1 =
        createModel(context, () => OptionCardComponentModel());
    optionCardComponentModel2 =
        createModel(context, () => OptionCardComponentModel());
  }

  @override
  void dispose() {
    optionCardComponentModel1.dispose();
    optionCardComponentModel2.dispose();
  }

  /// Action blocks.
  Future refreshToken(BuildContext context) async {}
}
