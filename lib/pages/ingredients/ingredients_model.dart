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
  // Model for IngredientsSelectDialog component.
  late IngredientsSelectDialogModel ingredientsSelectDialogModel;

  @override
  void initState(BuildContext context) {
    ingredientsSelectDialogModel =
        createModel(context, () => IngredientsSelectDialogModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    ingredientsSelectDialogModel.dispose();
  }
}
