import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/category_card_component_widget.dart';
import '/components/placeholder_components/placeholder_company_card_componet/placeholder_company_card_componet_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'add_category_page_widget.dart' show AddCategoryPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddCategoryPageModel extends FlutterFlowModel<AddCategoryPageWidget> {
  ///  Local state fields for this page.

  bool isLoading = true;

  int? selectedIndex;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get Categories)] action in AddCategoryPage widget.
  ApiCallResponse? categoryUpdated;
  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // Stores action output result for [Backend Call - API (Add Categories)] action in Button widget.
  ApiCallResponse? addedCategory;
  // Models for CategoryCardComponent dynamic component.
  late FlutterFlowDynamicModels<CategoryCardComponentModel>
      categoryCardComponentModels;
  // Model for PlaceholderCompanyCardComponet component.
  late PlaceholderCompanyCardComponetModel placeholderCompanyCardComponetModel1;
  // Model for PlaceholderCompanyCardComponet component.
  late PlaceholderCompanyCardComponetModel placeholderCompanyCardComponetModel2;
  // Model for PlaceholderCompanyCardComponet component.
  late PlaceholderCompanyCardComponetModel placeholderCompanyCardComponetModel3;

  @override
  void initState(BuildContext context) {
    categoryCardComponentModels =
        FlutterFlowDynamicModels(() => CategoryCardComponentModel());
    placeholderCompanyCardComponetModel1 =
        createModel(context, () => PlaceholderCompanyCardComponetModel());
    placeholderCompanyCardComponetModel2 =
        createModel(context, () => PlaceholderCompanyCardComponetModel());
    placeholderCompanyCardComponetModel3 =
        createModel(context, () => PlaceholderCompanyCardComponetModel());
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    categoryCardComponentModels.dispose();
    placeholderCompanyCardComponetModel1.dispose();
    placeholderCompanyCardComponetModel2.dispose();
    placeholderCompanyCardComponetModel3.dispose();
  }
}
