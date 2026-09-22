import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/confirm_components/delete_csv_user_confirm_component/delete_csv_user_confirm_component_widget.dart';
import '/components/confirm_components/update_csv_user_component/update_csv_user_component_widget.dart';
import '/components/ui_popup_components/companies_list_for_select_component/companies_list_for_select_component_widget.dart';
import '/components/ui_popup_components/error_valid_email_component/error_valid_email_component_widget.dart';
import '/components/ui_popup_components/informationon_component/informationon_component_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'add_list_of_users_page_widget.dart' show AddListOfUsersPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddListOfUsersPageModel
    extends FlutterFlowModel<AddListOfUsersPageWidget> {
  ///  Local state fields for this page.

  SortKey? sortKey;

  SortOrder? sortOrder;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get Companies)] action in AddListOfUsersPage widget.
  ApiCallResponse? companyUploaded;
  bool isDataUploading_uploadedListOfUsers = false;
  FFUploadedFile uploadedLocalFile_uploadedListOfUsers =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - findInvalidEmailsInCsv] action in Button widget.
  List<String>? emailErrorList;
  // Stores action output result for [Custom Action - parseDisplayUserCsv] action in Button widget.
  List<DisplayUserStruct>? outputDisplayUser;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<DisplayUserStruct>();
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;
  // Stores action output result for [Backend Call - API (Series Sign Up)] action in Button widget.
  ApiCallResponse? apiResultpjz;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    paginatedDataTableController.dispose();
  }
}
