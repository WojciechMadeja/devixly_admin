import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/display_news_component/display_news_component_widget.dart';
import '/components/news_card_component/news_card_component_widget.dart';
import '/components/placeholder_components/news_card_placeholder_component/news_card_placeholder_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'news_list_page_widget.dart' show NewsListPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '/flutter_flow/font_awesome_compat.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewsListPageModel extends FlutterFlowModel<NewsListPageWidget> {
  ///  Local state fields for this page.

  bool isLoading = true;

  List<String> categoryNameList = [];
  void addToCategoryNameList(String item) => categoryNameList.add(item);
  void removeFromCategoryNameList(String item) => categoryNameList.remove(item);
  void removeAtIndexFromCategoryNameList(int index) =>
      categoryNameList.removeAt(index);
  void insertAtIndexInCategoryNameList(int index, String item) =>
      categoryNameList.insert(index, item);
  void updateCategoryNameListAtIndex(int index, Function(String) updateFn) =>
      categoryNameList[index] = updateFn(categoryNameList[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get News)] action in NewsListPage widget.
  ApiCallResponse? listOfNews;
  // Stores action output result for [Backend Call - API (Get Categories)] action in NewsListPage widget.
  ApiCallResponse? categoryUpdatedInNewsPage;
  // Models for NewsCardComponent dynamic component.
  late FlutterFlowDynamicModels<NewsCardComponentModel> newsCardComponentModels;
  // Model for NewsCardPlaceholderComponent component.
  late NewsCardPlaceholderComponentModel newsCardPlaceholderComponentModel1;
  // Model for NewsCardPlaceholderComponent component.
  late NewsCardPlaceholderComponentModel newsCardPlaceholderComponentModel2;
  // Model for NewsCardPlaceholderComponent component.
  late NewsCardPlaceholderComponentModel newsCardPlaceholderComponentModel3;

  @override
  void initState(BuildContext context) {
    newsCardComponentModels =
        FlutterFlowDynamicModels(() => NewsCardComponentModel());
    newsCardPlaceholderComponentModel1 =
        createModel(context, () => NewsCardPlaceholderComponentModel());
    newsCardPlaceholderComponentModel2 =
        createModel(context, () => NewsCardPlaceholderComponentModel());
    newsCardPlaceholderComponentModel3 =
        createModel(context, () => NewsCardPlaceholderComponentModel());
  }

  @override
  void dispose() {
    newsCardComponentModels.dispose();
    newsCardPlaceholderComponentModel1.dispose();
    newsCardPlaceholderComponentModel2.dispose();
    newsCardPlaceholderComponentModel3.dispose();
  }
}
