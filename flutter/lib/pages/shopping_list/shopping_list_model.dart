import '/flutter_flow/flutter_flow_util.dart';
import 'shopping_list_widget.dart' show ShoppingListWidget;
import 'package:flutter/material.dart';

class ShoppingListModel extends FlutterFlowModel<ShoppingListWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
