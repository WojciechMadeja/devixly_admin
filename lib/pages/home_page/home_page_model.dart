import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/option_card_component/option_card_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '/flutter_flow/font_awesome_compat.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Refresh Token)] action in HomePage widget.
  ApiCallResponse? refreshResponse;
  // Stores action output result for [Backend Call - API (Revoke Token)] action in HomePage widget.
  ApiCallResponse? apiResulte31;
  // Stores action output result for [Backend Call - API (Revoke Token)] action in Icon widget.
  ApiCallResponse? apiResultj5z;
  // Model for OptionCardComponent component.
  late OptionCardComponentModel optionCardComponentModel1;
  // Model for OptionCardComponent component.
  late OptionCardComponentModel optionCardComponentModel2;
  // Model for OptionCardComponent component.
  late OptionCardComponentModel optionCardComponentModel3;
  // Model for OptionCardComponent component.
  late OptionCardComponentModel optionCardComponentModel4;
  // Model for OptionCardComponent component.
  late OptionCardComponentModel optionCardComponentModel5;
  // Model for OptionCardComponent component.
  late OptionCardComponentModel optionCardComponentModel6;
  // Model for OptionCardComponent component.
  late OptionCardComponentModel optionCardComponentModel7;
  // Model for OptionCardComponent component.
  late OptionCardComponentModel optionCardComponentModel8;
  // Model for OptionCardComponent component.
  late OptionCardComponentModel optionCardComponentModel9;
  // Model for OptionCardComponent component.
  late OptionCardComponentModel optionCardComponentModel10;
  // Model for OptionCardComponent component.
  late OptionCardComponentModel optionCardComponentModel11;
  // Model for OptionCardComponent component.
  late OptionCardComponentModel optionCardComponentModel12;
  // Model for OptionCardComponent component.
  late OptionCardComponentModel optionCardComponentModel13;
  // Model for OptionCardComponent component.
  late OptionCardComponentModel optionCardComponentModel14;
  // Model for OptionCardComponent component.
  late OptionCardComponentModel optionCardComponentModel15;
  // Model for OptionCardComponent component.
  late OptionCardComponentModel optionCardComponentModel16;
  // Model for OptionCardComponent component.
  late OptionCardComponentModel optionCardComponentModel17;
  // Model for OptionCardComponent component.
  late OptionCardComponentModel optionCardComponentModel18;
  // Model for OptionCardComponent component.
  late OptionCardComponentModel optionCardComponentModel19;
  // Model for OptionCardComponent component.
  late OptionCardComponentModel optionCardComponentModel20;
  // Model for OptionCardComponent component.
  late OptionCardComponentModel optionCardComponentModel21;
  // Model for OptionCardComponent component.
  late OptionCardComponentModel optionCardComponentModel22;

  @override
  void initState(BuildContext context) {
    optionCardComponentModel1 =
        createModel(context, () => OptionCardComponentModel());
    optionCardComponentModel2 =
        createModel(context, () => OptionCardComponentModel());
    optionCardComponentModel3 =
        createModel(context, () => OptionCardComponentModel());
    optionCardComponentModel4 =
        createModel(context, () => OptionCardComponentModel());
    optionCardComponentModel5 =
        createModel(context, () => OptionCardComponentModel());
    optionCardComponentModel6 =
        createModel(context, () => OptionCardComponentModel());
    optionCardComponentModel7 =
        createModel(context, () => OptionCardComponentModel());
    optionCardComponentModel8 =
        createModel(context, () => OptionCardComponentModel());
    optionCardComponentModel9 =
        createModel(context, () => OptionCardComponentModel());
    optionCardComponentModel10 =
        createModel(context, () => OptionCardComponentModel());
    optionCardComponentModel11 =
        createModel(context, () => OptionCardComponentModel());
    optionCardComponentModel12 =
        createModel(context, () => OptionCardComponentModel());
    optionCardComponentModel13 =
        createModel(context, () => OptionCardComponentModel());
    optionCardComponentModel14 =
        createModel(context, () => OptionCardComponentModel());
    optionCardComponentModel15 =
        createModel(context, () => OptionCardComponentModel());
    optionCardComponentModel16 =
        createModel(context, () => OptionCardComponentModel());
    optionCardComponentModel17 =
        createModel(context, () => OptionCardComponentModel());
    optionCardComponentModel18 =
        createModel(context, () => OptionCardComponentModel());
    optionCardComponentModel19 =
        createModel(context, () => OptionCardComponentModel());
    optionCardComponentModel20 =
        createModel(context, () => OptionCardComponentModel());
    optionCardComponentModel21 =
        createModel(context, () => OptionCardComponentModel());
    optionCardComponentModel22 =
        createModel(context, () => OptionCardComponentModel());
  }

  @override
  void dispose() {
    optionCardComponentModel1.dispose();
    optionCardComponentModel2.dispose();
    optionCardComponentModel3.dispose();
    optionCardComponentModel4.dispose();
    optionCardComponentModel5.dispose();
    optionCardComponentModel6.dispose();
    optionCardComponentModel7.dispose();
    optionCardComponentModel8.dispose();
    optionCardComponentModel9.dispose();
    optionCardComponentModel10.dispose();
    optionCardComponentModel11.dispose();
    optionCardComponentModel12.dispose();
    optionCardComponentModel13.dispose();
    optionCardComponentModel14.dispose();
    optionCardComponentModel15.dispose();
    optionCardComponentModel16.dispose();
    optionCardComponentModel17.dispose();
    optionCardComponentModel18.dispose();
    optionCardComponentModel19.dispose();
    optionCardComponentModel20.dispose();
    optionCardComponentModel21.dispose();
    optionCardComponentModel22.dispose();
  }

  /// Action blocks.
  Future refreshToken(BuildContext context) async {}
}
