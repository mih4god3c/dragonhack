import '/components/recipe_card/recipe_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'recipes_widget.dart' show RecipesWidget;
import 'package:flutter/material.dart';

class RecipesModel extends FlutterFlowModel<RecipesWidget> {
  ///  Local state fields for this page.

  String initialChip = 'All';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Models for RecipeCard dynamic component.
  late FlutterFlowDynamicModels<RecipeCardModel> recipeCardModels;

  @override
  void initState(BuildContext context) {
    recipeCardModels = FlutterFlowDynamicModels(() => RecipeCardModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    recipeCardModels.dispose();
  }
}
