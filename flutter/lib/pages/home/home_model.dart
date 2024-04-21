import '/components/big_text_card/big_text_card_widget.dart';
import '/components/big_text_card_chart/big_text_card_chart_widget.dart';
import '/components/big_text_card_progress/big_text_card_progress_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for BigTextCard component.
  late BigTextCardModel bigTextCardModel1;
  // Model for BigTextCard component.
  late BigTextCardModel bigTextCardModel2;
  // Model for BigTextCardChart component.
  late BigTextCardChartModel bigTextCardChartModel;
  // Model for BigTextCardProgress component.
  late BigTextCardProgressModel bigTextCardProgressModel;
  // Model for BigTextCard component.
  late BigTextCardModel bigTextCardModel3;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  @override
  void initState(BuildContext context) {
    bigTextCardModel1 = createModel(context, () => BigTextCardModel());
    bigTextCardModel2 = createModel(context, () => BigTextCardModel());
    bigTextCardChartModel = createModel(context, () => BigTextCardChartModel());
    bigTextCardProgressModel =
        createModel(context, () => BigTextCardProgressModel());
    bigTextCardModel3 = createModel(context, () => BigTextCardModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    bigTextCardModel1.dispose();
    bigTextCardModel2.dispose();
    bigTextCardChartModel.dispose();
    bigTextCardProgressModel.dispose();
    bigTextCardModel3.dispose();
  }
}
