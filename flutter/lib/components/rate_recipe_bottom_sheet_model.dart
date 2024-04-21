import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'rate_recipe_bottom_sheet_widget.dart' show RateRecipeBottomSheetWidget;
import 'package:flutter/material.dart';

class RateRecipeBottomSheetModel
    extends FlutterFlowModel<RateRecipeBottomSheetWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for Checkbox widget.

  Map<RecipeIngredientsExtendedRow, bool> checkboxValueMap = {};
  List<RecipeIngredientsExtendedRow> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
