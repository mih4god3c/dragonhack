import '/components/tag/tag_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'recipe_details_widget.dart' show RecipeDetailsWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class RecipeDetailsModel extends FlutterFlowModel<RecipeDetailsWidget> {
  ///  Local state fields for this page.

  bool isPlaying = true;

  ///  State fields for stateful widgets in this page.

  // Model for Tag component.
  late TagModel tagModel;
  AudioPlayer? soundPlayer;

  @override
  void initState(BuildContext context) {
    tagModel = createModel(context, () => TagModel());
  }

  @override
  void dispose() {
    tagModel.dispose();
  }
}
