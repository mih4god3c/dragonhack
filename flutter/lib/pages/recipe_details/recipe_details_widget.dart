import '/backend/supabase/supabase.dart';
import '/components/ingredient_card/ingredient_card_widget.dart';
import '/components/rate_recipe_bottom_sheet_widget.dart';
import '/components/tag/tag_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:just_audio/just_audio.dart';
import 'recipe_details_model.dart';
export 'recipe_details_model.dart';

class RecipeDetailsWidget extends StatefulWidget {
  const RecipeDetailsWidget({
    super.key,
    required this.recipeId,
  });

  final int? recipeId;

  @override
  State<RecipeDetailsWidget> createState() => _RecipeDetailsWidgetState();
}

class _RecipeDetailsWidgetState extends State<RecipeDetailsWidget>
    with TickerProviderStateMixin {
  late RecipeDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecipeDetailsModel());

    animationsMap.addAll({
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<RecipesRow>>(
      future: RecipesTable().querySingleRow(
        queryFn: (q) => q.eq(
          'id',
          widget.recipeId,
        ),
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
        List<RecipesRow> recipeDetailsRecipesRowList = snapshot.data!;
        final recipeDetailsRecipesRow = recipeDetailsRecipesRowList.isNotEmpty
            ? recipeDetailsRecipesRowList.first
            : null;
        return Scaffold(
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
                context.pop();
              },
            ),
            title: Text(
              valueOrDefault<String>(
                recipeDetailsRecipesRow?.name,
                'No data',
              ),
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
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: CachedNetworkImage(
                              fadeInDuration: const Duration(milliseconds: 500),
                              fadeOutDuration: const Duration(milliseconds: 500),
                              imageUrl: recipeDetailsRecipesRow!.image!,
                              width: MediaQuery.sizeOf(context).width * 0.9,
                              height: 250.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: wrapWithModel(
                          model: _model.tagModel,
                          updateCallback: () => setState(() {}),
                          child: TagWidget(
                            difficulty: recipeDetailsRecipesRow.difficulty,
                            persons: recipeDetailsRecipesRow.persons,
                            duration: recipeDetailsRecipesRow.duration,
                            isReady: false,
                            show: false,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 0.0, 0.0),
                      child: Text(
                        'Ingredients:',
                        style:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Onest',
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                  child: FutureBuilder<List<RecipeIngredientsExtendedRow>>(
                    future: RecipeIngredientsExtendedTable().queryRows(
                      queryFn: (q) => q.eq(
                        'recipe_id',
                        widget.recipeId,
                      ),
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
                      List<RecipeIngredientsExtendedRow>
                          columnRecipeIngredientsExtendedRowList =
                          snapshot.data!;
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                            columnRecipeIngredientsExtendedRowList.length,
                            (columnIndex) {
                          final columnRecipeIngredientsExtendedRow =
                              columnRecipeIngredientsExtendedRowList[
                                  columnIndex];
                          return IngredientCardWidget(
                            key: Key(
                                'Key510_${columnIndex}_of_${columnRecipeIngredientsExtendedRowList.length}'),
                            isInFridge: columnRecipeIngredientsExtendedRow
                                .hasIngredient,
                            title: columnRecipeIngredientsExtendedRow
                                .ingredientName,
                            quantity:
                                columnRecipeIngredientsExtendedRow.quantity,
                            index: columnIndex + 1,
                            ingredientId: columnRecipeIngredientsExtendedRow
                                .ingredientId!,
                          );
                        }),
                      ).animateOnPageLoad(
                          animationsMap['columnOnPageLoadAnimation']!);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Succesfully added all items to shopping list!',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                          ),
                          duration: const Duration(milliseconds: 3000),
                          backgroundColor: FlutterFlowTheme.of(context).success,
                        ),
                      );
                    },
                    text: 'Add all missing items to list',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 52.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: FlutterFlowTheme.of(context)
                          .labelLarge
                          .override(
                            fontFamily: 'Onest',
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                          ),
                      elevation: 1.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                ),
                Divider(
                  height: 36.0,
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).customColor3,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 0.0, 0.0),
                        child: Text(
                          'Directions',
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Onest',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                      if (!_model.isPlaying)
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 8.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                _model.isPlaying = true;
                              });
                              _model.soundPlayer ??= AudioPlayer();
                              if (_model.soundPlayer!.playing) {
                                await _model.soundPlayer!.stop();
                              }
                              _model.soundPlayer!.setVolume(1.0);
                              _model.soundPlayer!
                                  .setUrl(recipeDetailsRecipesRow.mp3File!)
                                  .then((_) => _model.soundPlayer!.play());
                            },
                            child: Icon(
                              Icons.volume_up_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 32.0,
                            ),
                          ),
                        ),
                      if (_model.isPlaying)
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 8.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                _model.isPlaying = false;
                              });
                              _model.soundPlayer?.stop();
                            },
                            child: Icon(
                              Icons.stop,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 32.0,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Builder(
                  builder: (context) {
                    final items =
                        recipeDetailsRecipesRow.descriptionList.toList() ??
                            [];
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: items.length,
                      itemBuilder: (context, itemsIndex) {
                        final itemsItem = items[itemsIndex];
                        return Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Text(
                            '${valueOrDefault<String>(
                              (itemsIndex + 1).toString(),
                              '1',
                            )}. $itemsItem${valueOrDefault<String>(
                              "\n",
                              '\'\\n\'',
                            )}',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Onest',
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                          ),
                        );
                      },
                    );
                  },
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 34.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.6,
                              child: RateRecipeBottomSheetWidget(
                                recipeId: widget.recipeId,
                              ),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                    text: 'Done',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 52.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: FlutterFlowTheme.of(context)
                          .labelLarge
                          .override(
                            fontFamily: 'Onest',
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                          ),
                      elevation: 1.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
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
