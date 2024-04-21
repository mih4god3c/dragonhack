import '/backend/supabase/supabase.dart';
import '/components/recipe_card/recipe_card_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'recipes_model.dart';
export 'recipes_model.dart';

class RecipesWidget extends StatefulWidget {
  const RecipesWidget({
    super.key,
    String? initialChip,
  }) : initialChip = initialChip ?? 'All';

  final String initialChip;

  @override
  State<RecipesWidget> createState() => _RecipesWidgetState();
}

class _RecipesWidgetState extends State<RecipesWidget> {
  late RecipesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecipesModel());

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
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Text(
            'Recipes',
            style: FlutterFlowTheme.of(context).titleLarge.override(
                  fontFamily: 'Onest',
                  letterSpacing: 0.0,
                  useGoogleFonts: false,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
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
                        labelText: 'Search recipes...',
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
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
                            color: FlutterFlowTheme.of(context).primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Onest',
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                          ),
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 44.0,
                      icon: Icon(
                        Icons.search_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
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
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FlutterFlowChoiceChips(
                      options: const [
                        ChipData('All'),
                        ChipData('High Protein'),
                        ChipData('30 min <'),
                        ChipData('Vegan'),
                        ChipData('Ready to go'),
                        ChipData('Ingredient')
                      ],
                      onChanged: (val) => setState(
                          () => _model.choiceChipsValue = val?.firstOrNull),
                      selectedChipStyle: ChipStyle(
                        backgroundColor: FlutterFlowTheme.of(context).alternate,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Onest',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                        iconColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        iconSize: 0.0,
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      unselectedChipStyle: ChipStyle(
                        backgroundColor: FlutterFlowTheme.of(context).tertiary,
                        textStyle: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                              fontFamily: 'Onest',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                              useGoogleFonts: false,
                            ),
                        iconColor: FlutterFlowTheme.of(context).tertiaryText,
                        iconSize: 18.0,
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      chipSpacing: 8.0,
                      rowSpacing: 12.0,
                      multiselect: false,
                      initialized: _model.choiceChipsValue != null,
                      alignment: WrapAlignment.start,
                      controller: _model.choiceChipsValueController ??=
                          FormFieldController<List<String>>(
                        [widget.initialChip],
                      ),
                      wrapped: true,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FutureBuilder<List<RecipesRow>>(
                future: RecipesTable().queryRows(
                  queryFn: (q) => q
                      .contains(
                        'tags',
                        '{${_model.choiceChipsValue}}',
                      )
                      .order('id'),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).alternate,
                          ),
                        ),
                      ),
                    );
                  }
                  List<RecipesRow> columnRecipesRowList = snapshot.data!;
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(columnRecipesRowList.length,
                          (columnIndex) {
                        final columnRecipesRow =
                            columnRecipesRowList[columnIndex];
                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              'RecipeDetails',
                              queryParameters: {
                                'recipeId': serializeParam(
                                  columnRecipesRow.id,
                                  ParamType.int,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: wrapWithModel(
                            model: _model.recipeCardModels.getModel(
                              columnRecipesRow.id.toString(),
                              columnIndex,
                            ),
                            updateCallback: () => setState(() {}),
                            child: RecipeCardWidget(
                              key: Key(
                                'Key8c2_${columnRecipesRow.id.toString()}',
                              ),
                              recipeName: columnRecipesRow.name!,
                              recipeImage: columnRecipesRow.image,
                              difficulty: columnRecipesRow.difficulty,
                              persons: columnRecipesRow.persons,
                              duration: columnRecipesRow.duration,
                            ),
                          ),
                        );
                      }).divide(const SizedBox(height: 8.0)),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
