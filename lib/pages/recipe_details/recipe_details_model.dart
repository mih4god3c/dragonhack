import '/components/tag/tag_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'recipe_details_widget.dart' show RecipeDetailsWidget;
import 'package:flutter/material.dart';

class RecipeDetailsModel extends FlutterFlowModel<RecipeDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Tag component.
  late TagModel tagModel;

  @override
  void initState(BuildContext context) {
    tagModel = createModel(context, () => TagModel());
  }

  @override
  void dispose() {
    tagModel.dispose();
  }
}
