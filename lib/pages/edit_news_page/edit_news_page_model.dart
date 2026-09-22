import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/category_chip_placeholder_component_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'edit_news_page_widget.dart' show EditNewsPageWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditNewsPageModel extends FlutterFlowModel<EditNewsPageWidget> {
  ///  Local state fields for this page.

  Ratio? ratio = Ratio.horizontal;

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

  // Stores action output result for [Backend Call - API (Get Categories)] action in EditNewsPage widget.
  ApiCallResponse? categoryUpdatedInEditNewsPage;
  bool isDataUploading_uploadEditImage = false;
  FFUploadedFile uploadedLocalFile_uploadEditImage =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleTextController;
  String? Function(BuildContext, String?)? titleTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for Description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  List<String>? get choiceChipsValues => choiceChipsValueController?.value;
  set choiceChipsValues(List<String>? val) =>
      choiceChipsValueController?.value = val;
  // Model for CategoryChipPlaceholderComponent component.
  late CategoryChipPlaceholderComponentModel
      categoryChipPlaceholderComponentModel1;
  // Model for CategoryChipPlaceholderComponent component.
  late CategoryChipPlaceholderComponentModel
      categoryChipPlaceholderComponentModel2;
  // Model for CategoryChipPlaceholderComponent component.
  late CategoryChipPlaceholderComponentModel
      categoryChipPlaceholderComponentModel3;
  // Model for CategoryChipPlaceholderComponent component.
  late CategoryChipPlaceholderComponentModel
      categoryChipPlaceholderComponentModel4;
  // Model for CategoryChipPlaceholderComponent component.
  late CategoryChipPlaceholderComponentModel
      categoryChipPlaceholderComponentModel5;
  // Stores action output result for [Backend Call - API (Edit News)] action in Button widget.
  ApiCallResponse? editNewsWithImageResponse;
  // Stores action output result for [Backend Call - API (Edit News)] action in Button widget.
  ApiCallResponse? editNewsResponse;

  @override
  void initState(BuildContext context) {
    categoryChipPlaceholderComponentModel1 =
        createModel(context, () => CategoryChipPlaceholderComponentModel());
    categoryChipPlaceholderComponentModel2 =
        createModel(context, () => CategoryChipPlaceholderComponentModel());
    categoryChipPlaceholderComponentModel3 =
        createModel(context, () => CategoryChipPlaceholderComponentModel());
    categoryChipPlaceholderComponentModel4 =
        createModel(context, () => CategoryChipPlaceholderComponentModel());
    categoryChipPlaceholderComponentModel5 =
        createModel(context, () => CategoryChipPlaceholderComponentModel());
  }

  @override
  void dispose() {
    titleFocusNode?.dispose();
    titleTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    categoryChipPlaceholderComponentModel1.dispose();
    categoryChipPlaceholderComponentModel2.dispose();
    categoryChipPlaceholderComponentModel3.dispose();
    categoryChipPlaceholderComponentModel4.dispose();
    categoryChipPlaceholderComponentModel5.dispose();
  }
}
