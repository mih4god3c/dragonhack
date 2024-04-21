import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'shopping_list_item_model.dart';
export 'shopping_list_item_model.dart';

class ShoppingListItemWidget extends StatefulWidget {
  const ShoppingListItemWidget({
    super.key,
    String? name,
    String? image,
    required this.ingredientId,
  })  : name = name ?? 'no data',
        image = image ??
            'https://s3-alpha-sig.figma.com/img/9afd/ef4b/f515bb538622a9d3c30fd63cef77227e?Expires=1714348800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=QQWhh0GwkcYnED-AlRDWpgYdj6nSw2bBfprFdxwHZyyP7Ye2d8nnuZ7wfrZCCTCwo9-KX3b2qEOtUB8QM7ID5ATYIJHs3P6hmEVf7C5Fu6LC46qvGm~hhHKWxIz6ZTgb16fOvLjWyUlucTI2wTkiBcJCTi6Awa1QOlkCddCzvlPp2fPdVPVNiiZR-17GETqMyozARVRolPVvq2Zan-ecNMjUtr90M0SWzZiijFPBMSI1vTf5ah-LVC0nd3PpsMRGW4y~maRJcMrkTGfo4IUIbz3vnJRNXqWK3v0yskcCIieA82iKbr~qclZ8-Vp67B7Gi5xIBSjSdkGrWsNbj7vIIQ__';

  final String name;
  final String image;
  final int? ingredientId;

  @override
  State<ShoppingListItemWidget> createState() => _ShoppingListItemWidgetState();
}

class _ShoppingListItemWidgetState extends State<ShoppingListItemWidget> {
  late ShoppingListItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShoppingListItemModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 114.0,
          height: 114.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 4.0,
                color: FlutterFlowTheme.of(context).customColor3,
                offset: const Offset(
                  0.0,
                  2.0,
                ),
              )
            ],
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).primaryBackground,
              width: 0.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                widget.image,
                width: 50.0,
                height: 50.0,
                fit: BoxFit.contain,
                alignment: const Alignment(0.0, 0.0),
              ),
            ),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              valueOrDefault<String>(
                widget.name,
                'Ingredient',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Onest',
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontSize: 12.0,
                    letterSpacing: 0.0,
                    useGoogleFonts: false,
                  ),
            ),
          ].divide(const SizedBox(height: 2.0)),
        ),
      ].divide(const SizedBox(height: 8.0)),
    );
  }
}
