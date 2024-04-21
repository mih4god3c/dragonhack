import '/backend/supabase/supabase.dart';
import '/components/ingredient_item/ingredient_item_widget.dart';
import '/components/ingredients_select_dialog/ingredients_select_dialog_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'ingredients_model.dart';
export 'ingredients_model.dart';

class IngredientsWidget extends StatefulWidget {
  const IngredientsWidget({super.key});

  @override
  State<IngredientsWidget> createState() => _IngredientsWidgetState();
}

class _IngredientsWidgetState extends State<IngredientsWidget> {
  late IngredientsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IngredientsModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<IngredientsRow>>(
      future: IngredientsTable().queryRows(
        queryFn: (q) => q.order('category'),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).alternate,
                  ),
                ),
              ),
            ),
          );
        }
        List<IngredientsRow> ingredientsIngredientsRowList = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 54.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  context.safePop();
                },
              ),
              title: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await showDialog(
                    context: context,
                    builder: (alertDialogContext) {
                      return AlertDialog(
                        content: Text(_model.checked.length.toString()),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(alertDialogContext),
                            child: const Text('Ok'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text(
                  'Ingredients',
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'Onest',
                        letterSpacing: 0.0,
                        useGoogleFonts: false,
                      ),
                ),
              ),
              actions: const [],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 3,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 8.0, 16.0, 12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _model.textController,
                                  focusNode: _model.textFieldFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.textController',
                                    const Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Search ingredients...',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Onest',
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Onest',
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                  validator: _model.textControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 0.0, 0.0),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  borderWidth: 1.0,
                                  buttonSize: 44.0,
                                  icon: Icon(
                                    Icons.search_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 200.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Fruits',
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  fontFamily: 'Onest',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.filter_list_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                    ].divide(const SizedBox(width: 8.0)),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final fruits =
                                          ingredientsIngredientsRowList
                                              .where(
                                                  (e) => e.category == 'Fruits')
                                              .toList();
                                      return ListView.separated(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: fruits.length,
                                        separatorBuilder: (_, __) =>
                                            const SizedBox(width: 16.0),
                                        itemBuilder: (context, fruitsIndex) {
                                          final fruitsItem =
                                              fruits[fruitsIndex];
                                          return Container(
                                            width: 114.0,
                                            height: 90.0,
                                            decoration: const BoxDecoration(),
                                            child: wrapWithModel(
                                              model: _model
                                                  .ingredientItemModels1
                                                  .getModel(
                                                '${fruitsItem.id.toString()}${_model.checked.contains(fruitsItem.id).toString()}',
                                                fruitsIndex,
                                              ),
                                              updateCallback: () =>
                                                  setState(() {}),
                                              updateOnChange: true,
                                              child: IngredientItemWidget(
                                                key: Key(
                                                  'Keydqm_${'${fruitsItem.id.toString()}${_model.checked.contains(fruitsItem.id).toString()}'}',
                                                ),
                                                name: fruitsItem.name,
                                                image: fruitsItem.image,
                                                selected: _model.checked
                                                    .contains(fruitsItem.id),
                                                ingredientId: fruitsItem.id,
                                                addToArray:
                                                    (ingredientId) async {
                                                  setState(() {
                                                    _model.addToChecked(
                                                        ingredientId!);
                                                  });
                                                },
                                                removeFromArray:
                                                    (ingredientId) async {
                                                  setState(() {
                                                    _model.removeFromChecked(
                                                        ingredientId!);
                                                  });
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 200.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Vegetables',
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  fontFamily: 'Onest',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.filter_list_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                    ].divide(const SizedBox(width: 8.0)),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final fruits =
                                          ingredientsIngredientsRowList
                                              .where((e) =>
                                                  e.category == 'Vegetables')
                                              .toList();
                                      return ListView.separated(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: fruits.length,
                                        separatorBuilder: (_, __) =>
                                            const SizedBox(width: 16.0),
                                        itemBuilder: (context, fruitsIndex) {
                                          final fruitsItem =
                                              fruits[fruitsIndex];
                                          return Container(
                                            width: 114.0,
                                            height: 90.0,
                                            decoration: const BoxDecoration(),
                                            child: wrapWithModel(
                                              model: _model
                                                  .ingredientItemModels2
                                                  .getModel(
                                                '${fruitsItem.id.toString()}${_model.checked.contains(fruitsItem.id).toString()}',
                                                fruitsIndex,
                                              ),
                                              updateCallback: () =>
                                                  setState(() {}),
                                              updateOnChange: true,
                                              child: IngredientItemWidget(
                                                key: Key(
                                                  'Keyt6l_${'${fruitsItem.id.toString()}${_model.checked.contains(fruitsItem.id).toString()}'}',
                                                ),
                                                name: fruitsItem.name,
                                                image: fruitsItem.image,
                                                selected: _model.checked
                                                    .contains(fruitsItem.id),
                                                ingredientId: fruitsItem.id,
                                                addToArray:
                                                    (ingredientId) async {
                                                  setState(() {
                                                    _model.addToChecked(
                                                        ingredientId!);
                                                  });
                                                },
                                                removeFromArray:
                                                    (ingredientId) async {
                                                  setState(() {
                                                    _model.removeFromChecked(
                                                        ingredientId!);
                                                  });
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 200.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Grains',
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  fontFamily: 'Onest',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.filter_list_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                    ].divide(const SizedBox(width: 8.0)),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final fruits =
                                          ingredientsIngredientsRowList
                                              .where(
                                                  (e) => e.category == 'Grains')
                                              .toList();
                                      return ListView.separated(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: fruits.length,
                                        separatorBuilder: (_, __) =>
                                            const SizedBox(width: 16.0),
                                        itemBuilder: (context, fruitsIndex) {
                                          final fruitsItem =
                                              fruits[fruitsIndex];
                                          return Container(
                                            width: 114.0,
                                            height: 90.0,
                                            decoration: const BoxDecoration(),
                                            child: wrapWithModel(
                                              model: _model
                                                  .ingredientItemModels3
                                                  .getModel(
                                                '${fruitsItem.id.toString()}${_model.checked.contains(fruitsItem.id).toString()}',
                                                fruitsIndex,
                                              ),
                                              updateCallback: () =>
                                                  setState(() {}),
                                              updateOnChange: true,
                                              child: IngredientItemWidget(
                                                key: Key(
                                                  'Key6ec_${'${fruitsItem.id.toString()}${_model.checked.contains(fruitsItem.id).toString()}'}',
                                                ),
                                                name: fruitsItem.name,
                                                image: fruitsItem.image,
                                                selected: _model.checked
                                                    .contains(fruitsItem.id),
                                                ingredientId: fruitsItem.id,
                                                addToArray:
                                                    (ingredientId) async {
                                                  setState(() {
                                                    _model.addToChecked(
                                                        ingredientId!);
                                                  });
                                                },
                                                removeFromArray:
                                                    (ingredientId) async {
                                                  setState(() {
                                                    _model.removeFromChecked(
                                                        ingredientId!);
                                                  });
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 200.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Proteins',
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  fontFamily: 'Onest',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.filter_list_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                    ].divide(const SizedBox(width: 8.0)),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final fruits =
                                          ingredientsIngredientsRowList
                                              .where((e) =>
                                                  e.category == 'Proteins')
                                              .toList();
                                      return ListView.separated(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: fruits.length,
                                        separatorBuilder: (_, __) =>
                                            const SizedBox(width: 16.0),
                                        itemBuilder: (context, fruitsIndex) {
                                          final fruitsItem =
                                              fruits[fruitsIndex];
                                          return Container(
                                            width: 114.0,
                                            height: 90.0,
                                            decoration: const BoxDecoration(),
                                            child: wrapWithModel(
                                              model: _model
                                                  .ingredientItemModels4
                                                  .getModel(
                                                '${fruitsItem.id.toString()}${_model.checked.contains(fruitsItem.id).toString()}',
                                                fruitsIndex,
                                              ),
                                              updateCallback: () =>
                                                  setState(() {}),
                                              updateOnChange: true,
                                              child: IngredientItemWidget(
                                                key: Key(
                                                  'Keyx93_${'${fruitsItem.id.toString()}${_model.checked.contains(fruitsItem.id).toString()}'}',
                                                ),
                                                name: fruitsItem.name,
                                                image: fruitsItem.image,
                                                selected: _model.checked
                                                    .contains(fruitsItem.id),
                                                ingredientId: fruitsItem.id,
                                                addToArray:
                                                    (ingredientId) async {
                                                  setState(() {
                                                    _model.addToChecked(
                                                        ingredientId!);
                                                  });
                                                },
                                                removeFromArray:
                                                    (ingredientId) async {
                                                  setState(() {
                                                    _model.removeFromChecked(
                                                        ingredientId!);
                                                  });
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 200.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Sweets and Snacks',
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  fontFamily: 'Onest',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.filter_list_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                    ].divide(const SizedBox(width: 8.0)),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final fruits =
                                          ingredientsIngredientsRowList
                                              .where((e) =>
                                                  e.category ==
                                                  'Sweets and Snacks')
                                              .toList();
                                      return ListView.separated(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: fruits.length,
                                        separatorBuilder: (_, __) =>
                                            const SizedBox(width: 16.0),
                                        itemBuilder: (context, fruitsIndex) {
                                          final fruitsItem =
                                              fruits[fruitsIndex];
                                          return Container(
                                            width: 114.0,
                                            height: 90.0,
                                            decoration: const BoxDecoration(),
                                            child: wrapWithModel(
                                              model: _model
                                                  .ingredientItemModels5
                                                  .getModel(
                                                '${fruitsItem.id.toString()}${_model.checked.contains(fruitsItem.id).toString()}',
                                                fruitsIndex,
                                              ),
                                              updateCallback: () =>
                                                  setState(() {}),
                                              updateOnChange: true,
                                              child: IngredientItemWidget(
                                                key: Key(
                                                  'Key1y4_${'${fruitsItem.id.toString()}${_model.checked.contains(fruitsItem.id).toString()}'}',
                                                ),
                                                name: fruitsItem.name,
                                                image: fruitsItem.image,
                                                selected: _model.checked
                                                    .contains(fruitsItem.id),
                                                ingredientId: fruitsItem.id,
                                                addToArray:
                                                    (ingredientId) async {
                                                  setState(() {
                                                    _model.addToChecked(
                                                        ingredientId!);
                                                  });
                                                },
                                                removeFromArray:
                                                    (ingredientId) async {
                                                  setState(() {
                                                    _model.removeFromChecked(
                                                        ingredientId!);
                                                  });
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 200.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Fats and Oils',
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  fontFamily: 'Onest',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.filter_list_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                    ].divide(const SizedBox(width: 8.0)),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final fruits =
                                          ingredientsIngredientsRowList
                                              .where((e) =>
                                                  e.category == 'Fats and Oils')
                                              .toList();
                                      return ListView.separated(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: fruits.length,
                                        separatorBuilder: (_, __) =>
                                            const SizedBox(width: 16.0),
                                        itemBuilder: (context, fruitsIndex) {
                                          final fruitsItem =
                                              fruits[fruitsIndex];
                                          return Container(
                                            width: 114.0,
                                            height: 90.0,
                                            decoration: const BoxDecoration(),
                                            child: wrapWithModel(
                                              model: _model
                                                  .ingredientItemModels6
                                                  .getModel(
                                                '${fruitsItem.id.toString()}${_model.checked.contains(fruitsItem.id).toString()}',
                                                fruitsIndex,
                                              ),
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: IngredientItemWidget(
                                                key: Key(
                                                  'Key6t1_${'${fruitsItem.id.toString()}${_model.checked.contains(fruitsItem.id).toString()}'}',
                                                ),
                                                name: fruitsItem.name,
                                                image: fruitsItem.image,
                                                selected: _model.checked
                                                    .contains(fruitsItem.id),
                                                ingredientId: fruitsItem.id,
                                                addToArray:
                                                    (ingredientId) async {
                                                  setState(() {
                                                    _model.addToChecked(
                                                        ingredientId!);
                                                  });
                                                },
                                                removeFromArray:
                                                    (ingredientId) async {
                                                  setState(() {
                                                    _model.removeFromChecked(
                                                        ingredientId!);
                                                  });
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 200.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Bevarages',
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  fontFamily: 'Onest',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.filter_list_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                    ].divide(const SizedBox(width: 8.0)),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final fruits =
                                          ingredientsIngredientsRowList
                                              .where((e) =>
                                                  e.category == 'Beverages')
                                              .toList();
                                      return ListView.separated(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: fruits.length,
                                        separatorBuilder: (_, __) =>
                                            const SizedBox(width: 16.0),
                                        itemBuilder: (context, fruitsIndex) {
                                          final fruitsItem =
                                              fruits[fruitsIndex];
                                          return Container(
                                            width: 114.0,
                                            height: 90.0,
                                            decoration: const BoxDecoration(),
                                            child: wrapWithModel(
                                              model: _model
                                                  .ingredientItemModels7
                                                  .getModel(
                                                '${fruitsItem.id.toString()}${_model.checked.contains(fruitsItem.id).toString()}',
                                                fruitsIndex,
                                              ),
                                              updateCallback: () =>
                                                  setState(() {}),
                                              updateOnChange: true,
                                              child: IngredientItemWidget(
                                                key: Key(
                                                  'Key8uz_${'${fruitsItem.id.toString()}${_model.checked.contains(fruitsItem.id).toString()}'}',
                                                ),
                                                name: fruitsItem.name,
                                                image: fruitsItem.image,
                                                selected: _model.checked
                                                    .contains(fruitsItem.id),
                                                ingredientId: fruitsItem.id,
                                                addToArray:
                                                    (ingredientId) async {
                                                  setState(() {
                                                    _model.addToChecked(
                                                        ingredientId!);
                                                  });
                                                },
                                                removeFromArray:
                                                    (ingredientId) async {
                                                  setState(() {
                                                    _model.removeFromChecked(
                                                        ingredientId!);
                                                  });
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 200.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Dairy',
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  fontFamily: 'Onest',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.filter_list_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                    ].divide(const SizedBox(width: 8.0)),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final fruits =
                                          ingredientsIngredientsRowList
                                              .where(
                                                  (e) => e.category == 'Dairy')
                                              .toList();
                                      return ListView.separated(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: fruits.length,
                                        separatorBuilder: (_, __) =>
                                            const SizedBox(width: 16.0),
                                        itemBuilder: (context, fruitsIndex) {
                                          final fruitsItem =
                                              fruits[fruitsIndex];
                                          return Container(
                                            width: 114.0,
                                            height: 90.0,
                                            decoration: const BoxDecoration(),
                                            child: wrapWithModel(
                                              model: _model
                                                  .ingredientItemModels8
                                                  .getModel(
                                                '${fruitsItem.id.toString()}${_model.checked.contains(fruitsItem.id).toString()}',
                                                fruitsIndex,
                                              ),
                                              updateCallback: () =>
                                                  setState(() {}),
                                              updateOnChange: true,
                                              child: IngredientItemWidget(
                                                key: Key(
                                                  'Keyd6q_${'${fruitsItem.id.toString()}${_model.checked.contains(fruitsItem.id).toString()}'}',
                                                ),
                                                name: fruitsItem.name,
                                                image: fruitsItem.image,
                                                selected: _model.checked
                                                    .contains(fruitsItem.id),
                                                ingredientId: fruitsItem.id,
                                                addToArray:
                                                    (ingredientId) async {
                                                  setState(() {
                                                    _model.addToChecked(
                                                        ingredientId!);
                                                  });
                                                },
                                                removeFromArray:
                                                    (ingredientId) async {
                                                  setState(() {
                                                    _model.removeFromChecked(
                                                        ingredientId!);
                                                  });
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 200.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Herbs',
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  fontFamily: 'Onest',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.filter_list_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                    ].divide(const SizedBox(width: 8.0)),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final fruits =
                                          ingredientsIngredientsRowList
                                              .where(
                                                  (e) => e.category == 'Herbs')
                                              .toList();
                                      return ListView.separated(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: fruits.length,
                                        separatorBuilder: (_, __) =>
                                            const SizedBox(width: 16.0),
                                        itemBuilder: (context, fruitsIndex) {
                                          final fruitsItem =
                                              fruits[fruitsIndex];
                                          return Container(
                                            width: 114.0,
                                            height: 90.0,
                                            decoration: const BoxDecoration(),
                                            child: wrapWithModel(
                                              model: _model
                                                  .ingredientItemModels9
                                                  .getModel(
                                                '${fruitsItem.id.toString()}${_model.checked.contains(fruitsItem.id).toString()}',
                                                fruitsIndex,
                                              ),
                                              updateCallback: () =>
                                                  setState(() {}),
                                              updateOnChange: true,
                                              child: IngredientItemWidget(
                                                key: Key(
                                                  'Key8xo_${'${fruitsItem.id.toString()}${_model.checked.contains(fruitsItem.id).toString()}'}',
                                                ),
                                                name: fruitsItem.name,
                                                image: fruitsItem.image,
                                                selected: _model.checked
                                                    .contains(fruitsItem.id),
                                                ingredientId: fruitsItem.id,
                                                addToArray:
                                                    (ingredientId) async {
                                                  setState(() {
                                                    _model.addToChecked(
                                                        ingredientId!);
                                                  });
                                                },
                                                removeFromArray:
                                                    (ingredientId) async {
                                                  setState(() {
                                                    _model.removeFromChecked(
                                                        ingredientId!);
                                                  });
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
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
                if (_model.checked.isNotEmpty)
                  Flexible(
                    child: wrapWithModel(
                      model: _model.ingredientsSelectDialogModel,
                      updateCallback: () => setState(() {}),
                      updateOnChange: true,
                      child: IngredientsSelectDialogWidget(
                        itemsSelected: _model.checked.length,
                        addToList: () async {
                          setState(() {
                            _model.checked = [];
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Ingredients added to shopping list!',
                                style: TextStyle(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                              ),
                              duration: const Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).accent4,
                            ),
                          );
                        },
                        deselect: () async {
                          setState(() {
                            _model.checked = [];
                          });
                        },
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
