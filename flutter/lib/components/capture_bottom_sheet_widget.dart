import '/backend/api_requests/api_calls.dart';
import '/components/food_add_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'capture_bottom_sheet_model.dart';
export 'capture_bottom_sheet_model.dart';

class CaptureBottomSheetWidget extends StatefulWidget {
  const CaptureBottomSheetWidget({
    super.key,
    required this.imageRaw,
  });

  final FFUploadedFile? imageRaw;

  @override
  State<CaptureBottomSheetWidget> createState() =>
      _CaptureBottomSheetWidgetState();
}

class _CaptureBottomSheetWidgetState extends State<CaptureBottomSheetWidget> {
  late CaptureBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CaptureBottomSheetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 5.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: Container(
                  width: 50.0,
                  height: 4.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 32.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.memory(
                            widget.imageRaw?.bytes ?? Uint8List.fromList([]),
                            width: MediaQuery.sizeOf(context).width * 0.9,
                            height: MediaQuery.sizeOf(context).height * 0.7,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                child: FlutterFlowIconButton(
                  borderColor: FlutterFlowTheme.of(context).blueBack,
                  borderRadius: 100.0,
                  borderWidth: 1.0,
                  buttonSize: 75.0,
                  fillColor: FlutterFlowTheme.of(context).blueBack,
                  icon: Icon(
                    Icons.send,
                    color: FlutterFlowTheme.of(context).blueFront,
                    size: 40.0,
                  ),
                  showLoadingIndicator: true,
                  onPressed: () async {
                    await OpenAIChatGPTGroup.imageRecognitionCall.call();
                    Navigator.pop(context);
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      enableDrag: false,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.5,
                            child: FoodAddBottomSheetWidget(
                              foodName: 'Banana',
                              foodType: 'Fruits',
                              expiryDate: getCurrentTimestamp,
                              quantity: '1',
                            ),
                          ),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
