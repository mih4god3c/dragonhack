import '../database.dart';

class RecipeIngredientsExtendedTable
    extends SupabaseTable<RecipeIngredientsExtendedRow> {
  @override
  String get tableName => 'recipe_ingredients_extended';

  @override
  RecipeIngredientsExtendedRow createRow(Map<String, dynamic> data) =>
      RecipeIngredientsExtendedRow(data);
}

class RecipeIngredientsExtendedRow extends SupabaseDataRow {
  RecipeIngredientsExtendedRow(super.data);

  @override
  SupabaseTable get table => RecipeIngredientsExtendedTable();

  int? get recipeIngredientId => getField<int>('recipe_ingredient_id');
  set recipeIngredientId(int? value) =>
      setField<int>('recipe_ingredient_id', value);

  int? get recipeId => getField<int>('recipe_id');
  set recipeId(int? value) => setField<int>('recipe_id', value);

  int? get ingredientId => getField<int>('ingredient_id');
  set ingredientId(int? value) => setField<int>('ingredient_id', value);

  String? get quantity => getField<String>('quantity');
  set quantity(String? value) => setField<String>('quantity', value);

  String? get ingredientName => getField<String>('ingredient_name');
  set ingredientName(String? value) =>
      setField<String>('ingredient_name', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  bool? get hasIngredient => getField<bool>('has_ingredient');
  set hasIngredient(bool? value) => setField<bool>('has_ingredient', value);
}
