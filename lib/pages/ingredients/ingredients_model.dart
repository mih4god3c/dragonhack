import '/components/ingredient_item/ingredient_item_widget.dart';
import '/components/ingredients_select_dialog/ingredients_select_dialog_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ingredients_widget.dart' show IngredientsWidget;
import 'package:flutter/material.dart';

class IngredientsModel extends FlutterFlowModel<IngredientsWidget> {
  ///  Local state fields for this page.

  List<int> checked = [];
  void addToChecked(int item) => checked.add(item);
  void removeFromChecked(int item) => checked.remove(item);
  void removeAtIndexFromChecked(int index) => checked.removeAt(index);
  void insertAtIndexInChecked(int index, int item) =>
      checked.insert(index, item);
  void updateCheckedAtIndex(int index, Function(int) updateFn) =>
      checked[index] = updateFn(checked[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Models for IngredientItem dynamic component.
  late FlutterFlowDynamicModels<IngredientItemModel> ingredientItemModels1;
  // Models for IngredientItem dynamic component.
  late FlutterFlowDynamicModels<IngredientItemModel> ingredientItemModels2;
  // Models for IngredientItem dynamic component.
  late FlutterFlowDynamicModels<IngredientItemModel> ingredientItemModels3;
  // Models for IngredientItem dynamic component.
  late FlutterFlowDynamicModels<IngredientItemModel> ingredientItemModels4;
  // Models for IngredientItem dynamic component.
  late FlutterFlowDynamicModels<IngredientItemModel> ingredientItemModels5;
  // Models for IngredientItem dynamic component.
  late FlutterFlowDynamicModels<IngredientItemModel> ingredientItemModels6;
  // Models for IngredientItem dynamic component.
  late FlutterFlowDynamicModels<IngredientItemModel> ingredientItemModels7;
  // Models for IngredientItem dynamic component.
  late FlutterFlowDynamicModels<IngredientItemModel> ingredientItemModels8;
  // Models for IngredientItem dynamic component.
  late FlutterFlowDynamicModels<IngredientItemModel> ingredientItemModels9;
  // Model for IngredientsSelectDialog component.
  late IngredientsSelectDialogModel ingredientsSelectDialogModel;

  @override
  void initState(BuildContext context) {
    ingredientItemModels1 =
        FlutterFlowDynamicModels(() => IngredientItemModel());
    ingredientItemModels2 =
        FlutterFlowDynamicModels(() => IngredientItemModel());
    ingredientItemModels3 =
        FlutterFlowDynamicModels(() => IngredientItemModel());
    ingredientItemModels4 =
        FlutterFlowDynamicModels(() => IngredientItemModel());
    ingredientItemModels5 =
        FlutterFlowDynamicModels(() => IngredientItemModel());
    ingredientItemModels6 =
        FlutterFlowDynamicModels(() => IngredientItemModel());
    ingredientItemModels7 =
        FlutterFlowDynamicModels(() => IngredientItemModel());
    ingredientItemModels8 =
        FlutterFlowDynamicModels(() => IngredientItemModel());
    ingredientItemModels9 =
        FlutterFlowDynamicModels(() => IngredientItemModel());
    ingredientsSelectDialogModel =
        createModel(context, () => IngredientsSelectDialogModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    ingredientItemModels1.dispose();
    ingredientItemModels2.dispose();
    ingredientItemModels3.dispose();
    ingredientItemModels4.dispose();
    ingredientItemModels5.dispose();
    ingredientItemModels6.dispose();
    ingredientItemModels7.dispose();
    ingredientItemModels8.dispose();
    ingredientItemModels9.dispose();
    ingredientsSelectDialogModel.dispose();
  }
}
