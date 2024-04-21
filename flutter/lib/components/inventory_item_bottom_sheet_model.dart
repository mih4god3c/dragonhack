import '/flutter_flow/flutter_flow_util.dart';
import 'inventory_item_bottom_sheet_widget.dart'
    show InventoryItemBottomSheetWidget;
import 'package:flutter/material.dart';

class InventoryItemBottomSheetModel
    extends FlutterFlowModel<InventoryItemBottomSheetWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
