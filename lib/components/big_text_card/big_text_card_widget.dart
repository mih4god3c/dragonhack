import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'big_text_card_model.dart';
export 'big_text_card_model.dart';

class BigTextCardWidget extends StatefulWidget {
  const BigTextCardWidget({
    super.key,
    String? title,
    this.titleIcon,
    String? description,
    Color? color,
    bool? showIcon,
  })  : title = title ?? 'Title',
        description = description ?? '',
        color = color ?? const Color(0xFFFF9F1C),
        showIcon = showIcon ?? false;

  final String title;
  final Widget? titleIcon;
  final String description;
  final Color color;
  final bool showIcon;

  @override
  State<BigTextCardWidget> createState() => _BigTextCardWidgetState();
}

class _BigTextCardWidgetState extends State<BigTextCardWidget> {
  late BigTextCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BigTextCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: 160.0,
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
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                  child: Text(
                    '37',
                    style: FlutterFlowTheme.of(context).displaySmall.override(
                          fontFamily: 'Onest',
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                Flexible(
                  child: Text(
                    'pcs',
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Onest',
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
              ].divide(const SizedBox(width: 2.0)),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.description != '')
                  Text(
                    'Food saved this',
                    maxLines: 3,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Onest',
                          color: Colors.white,
                          fontSize: 12.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                  ),
                if (widget.description != '')
                  Text(
                    'Month',
                    maxLines: 3,
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Onest',
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
