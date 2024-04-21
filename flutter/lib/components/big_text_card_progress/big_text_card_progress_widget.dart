import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'big_text_card_progress_model.dart';
export 'big_text_card_progress_model.dart';

class BigTextCardProgressWidget extends StatefulWidget {
  const BigTextCardProgressWidget({
    super.key,
    String? title,
    this.titleIcon,
    String? description,
    Color? color,
    bool? showIcon,
  })  : title = title ?? 'Title',
        description = description ?? 'kurba',
        color = color ?? const Color(0xFFFF9F1C),
        showIcon = showIcon ?? false;

  final String title;
  final Widget? titleIcon;
  final String description;
  final Color color;
  final bool showIcon;

  @override
  State<BigTextCardProgressWidget> createState() =>
      _BigTextCardProgressWidgetState();
}

class _BigTextCardProgressWidgetState extends State<BigTextCardProgressWidget> {
  late BigTextCardProgressModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BigTextCardProgressModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: 140.0,
        decoration: BoxDecoration(
          color: widget.color,
          boxShadow: const [
            BoxShadow(
              blurRadius: 6.0,
              color: Color(0x4B1A1F24),
              offset: Offset(
                0.0,
                2.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      widget.title,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Onest',
                            color: Colors.white,
                            fontSize: 24.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 4.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularPercentIndicator(
                      percent: 0.73,
                      radius: 30.0,
                      lineWidth: 5.0,
                      animation: true,
                      animateFromLastPercent: true,
                      progressColor: FlutterFlowTheme.of(context).accent4,
                      backgroundColor: FlutterFlowTheme.of(context).tertiary,
                      center: Text(
                        '73',
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Onest',
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
