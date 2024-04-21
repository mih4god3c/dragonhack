import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ingredient_card_model.dart';
export 'ingredient_card_model.dart';

class IngredientCardWidget extends StatefulWidget {
  const IngredientCardWidget({
    super.key,
    this.isInFridge,
    this.title,
    this.quantity,
    this.index,
    required this.ingredientId,
  });

  final bool? isInFridge;
  final String? title;
  final String? quantity;
  final int? index;
  final int? ingredientId;

  @override
  State<IngredientCardWidget> createState() => _IngredientCardWidgetState();
}

class _IngredientCardWidgetState extends State<IngredientCardWidget> {
  late IngredientCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IngredientCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(8.0),
        shape: BoxShape.rectangle,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
            child: Text(
              formatNumber(
                widget.index,
                formatType: FormatType.custom,
                format: '#.',
                locale: '',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Onest',
                    letterSpacing: 0.0,
                    useGoogleFonts: false,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
            child: Text(
              valueOrDefault<String>(
                widget.title,
                'Paprika',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Onest',
                    letterSpacing: 0.0,
                    useGoogleFonts: false,
                  ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
              child: Text(
                valueOrDefault<String>(
                  widget.quantity,
                  '250g',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Onest',
                      color: FlutterFlowTheme.of(context).tertiaryText,
                      letterSpacing: 0.0,
                      useGoogleFonts: false,
                    ),
              ),
            ),
          ),
          if (widget.isInFridge! && !_model.isInShoppingList)
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
              child: FaIcon(
                FontAwesomeIcons.solidCheckCircle,
                color: FlutterFlowTheme.of(context).success,
                size: 24.0,
              ),
            ),
          if (!widget.isInFridge! && !_model.isInShoppingList)
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
              child: FaIcon(
                FontAwesomeIcons.exclamationCircle,
                color: FlutterFlowTheme.of(context).error,
                size: 24.0,
              ),
            ),
          if (_model.isInShoppingList)
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
              child: Icon(
                Icons.shopping_cart,
                color: FlutterFlowTheme.of(context).primary,
                size: 24.0,
              ),
            ),
          if (!widget.isInFridge! && !_model.isInShoppingList)
            FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 20.0,
              borderWidth: 1.0,
              buttonSize: 40.0,
              fillColor: FlutterFlowTheme.of(context).primary,
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () async {
                await ShoppingListTable().insert({
                  'user_id': currentUserUid,
                  'ingredient_id': widget.ingredientId,
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      '${widget.title} was successfully added to the list!',
                      style: TextStyle(
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                    ),
                    duration: const Duration(milliseconds: 1200),
                    backgroundColor: FlutterFlowTheme.of(context).success,
                  ),
                );
                setState(() {
                  _model.isInShoppingList = true;
                });
              },
            ),
        ].addToEnd(const SizedBox(width: 8.0)),
      ),
    );
  }
}
