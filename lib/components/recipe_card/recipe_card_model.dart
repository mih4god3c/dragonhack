import '/components/tag/tag_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'recipe_card_widget.dart' show RecipeCardWidget;
import 'package:flutter/material.dart';

class RecipeCardModel extends FlutterFlowModel<RecipeCardWidget> {
  ///  State fields for stateful widgets in this component.

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
