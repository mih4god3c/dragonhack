import '../database.dart';

class RecipeIngredientsTable extends SupabaseTable<RecipeIngredientsRow> {
  @override
  String get tableName => 'recipe_ingredients';

  @override
  RecipeIngredientsRow createRow(Map<String, dynamic> data) =>
      RecipeIngredientsRow(data);
}

class RecipeIngredientsRow extends SupabaseDataRow {
  RecipeIngredientsRow(super.data);

  @override
  SupabaseTable get table => RecipeIngredientsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get recipeId => getField<int>('recipe_id');
  set recipeId(int? value) => setField<int>('recipe_id', value);

  int? get ingredientId => getField<int>('ingredient_id');
  set ingredientId(int? value) => setField<int>('ingredient_id', value);

  String? get quantity => getField<String>('quantity');
  set quantity(String? value) => setField<String>('quantity', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
