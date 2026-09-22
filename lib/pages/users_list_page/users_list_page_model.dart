import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/confirm_components/block_user_confirm_component/block_user_confirm_component_widget.dart';
import '/components/confirm_components/delete_admin_user_confirm_component/delete_admin_user_confirm_component_widget.dart';
import '/components/confirm_components/delete_user_confirm_component/delete_user_confirm_component_widget.dart';
import '/components/confirm_components/unblock_user_confirm_component/unblock_user_confirm_component_widget.dart';
import '/components/confirm_components/update_user_component/update_user_component_widget.dart';
import '/components/display_user_component/display_user_component_widget.dart';
import '/components/ui_popup_components/informationon_component/informationon_component_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'users_list_page_widget.dart' show UsersListPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UsersListPageModel extends FlutterFlowModel<UsersListPageWidget> {
  ///  Local state fields for this page.

  bool isLoading = true;

  SortKey? sortKey;

  SortOrder? sortOrder;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get Users)] action in UsersListPage widget.
  ApiCallResponse? listOfDisplayUser;
  // Stores action output result for [Backend Call - API (Get Companies)] action in UsersListPage widget.
  ApiCallResponse? companyForUserListUploaded;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<DisplayUserStruct>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    paginatedDataTableController.dispose();
  }
}
