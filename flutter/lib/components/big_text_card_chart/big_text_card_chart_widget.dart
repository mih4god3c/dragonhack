import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'big_text_card_chart_model.dart';
export 'big_text_card_chart_model.dart';

class BigTextCardChartWidget extends StatefulWidget {
  const BigTextCardChartWidget({
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
  State<BigTextCardChartWidget> createState() => _BigTextCardChartWidgetState();
}

class _BigTextCardChartWidgetState extends State<BigTextCardChartWidget> {
  late BigTextCardChartModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BigTextCardChartModel());
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
      height: 155.0,
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
        child: Stack(
          children: [
            Icon(
              Icons.fastfood_rounded,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 24.0,
            ),
            Align(
              alignment: const AlignmentDirectional(1.0, 0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/hist.png',
                  width: 105.0,
                  height: 105.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
