import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/company_card_component_widget.dart';
import '/components/placeholder_components/placeholder_company_card_componet/placeholder_company_card_componet_widget.dart';
import '/components/ui_popup_components/companies_list_for_select_component/companies_list_for_select_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'add_company_page_widget.dart' show AddCompanyPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '/flutter_flow/font_awesome_compat.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddCompanyPageModel extends FlutterFlowModel<AddCompanyPageWidget> {
  ///  Local state fields for this page.

  bool isLoading = true;

  int? selectedIndex;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get Companies)] action in AddCompanyPage widget.
  ApiCallResponse? companyUploaded;
  // Stores action output result for [Backend Call - API (Get Users)] action in AddCompanyPage widget.
  ApiCallResponse? usersResponse;
  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
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
  // State field(s) for CompanyRepresentative widget.
  FocusNode? companyRepresentativeFocusNode;
  TextEditingController? companyRepresentativeTextController;
  String? Function(BuildContext, String?)?
      companyRepresentativeTextControllerValidator;
  // State field(s) for PhoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;
  // Stores action output result for [Backend Call - API (Add Company)] action in Button widget.
  ApiCallResponse? addedCompany;
  // Models for CompanyCardComponent dynamic component.
  late FlutterFlowDynamicModels<CompanyCardComponentModel>
      companyCardComponentModels;
  // Model for PlaceholderCompanyCardComponet component.
  late PlaceholderCompanyCardComponetModel placeholderCompanyCardComponetModel1;
  // Model for PlaceholderCompanyCardComponet component.
  late PlaceholderCompanyCardComponetModel placeholderCompanyCardComponetModel2;
  // Model for PlaceholderCompanyCardComponet component.
  late PlaceholderCompanyCardComponetModel placeholderCompanyCardComponetModel3;

  @override
  void initState(BuildContext context) {
    companyCardComponentModels =
        FlutterFlowDynamicModels(() => CompanyCardComponentModel());
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

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    addressFocusNode?.dispose();
    addressTextController?.dispose();

    postCodeFocusNode?.dispose();
    postCodeTextController?.dispose();

    cityFocusNode?.dispose();
    cityTextController?.dispose();

    companyRepresentativeFocusNode?.dispose();
    companyRepresentativeTextController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();

    companyCardComponentModels.dispose();
    placeholderCompanyCardComponetModel1.dispose();
    placeholderCompanyCardComponetModel2.dispose();
    placeholderCompanyCardComponetModel3.dispose();
  }
}
