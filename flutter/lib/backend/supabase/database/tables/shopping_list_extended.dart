import '../database.dart';

class ShoppingListExtendedTable extends SupabaseTable<ShoppingListExtendedRow> {
  @override
  String get tableName => 'shopping_list_extended';

  @override
  ShoppingListExtendedRow createRow(Map<String, dynamic> data) =>
      ShoppingListExtendedRow(data);
}

class ShoppingListExtendedRow extends SupabaseDataRow {
  ShoppingListExtendedRow(super.data);

  @override
  SupabaseTable get table => ShoppingListExtendedTable();

  int? get shoppingListId => getField<int>('shopping_list_id');
  set shoppingListId(int? value) => setField<int>('shopping_list_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get ingredientId => getField<int>('ingredient_id');
  set ingredientId(int? value) => setField<int>('ingredient_id', value);

  DateTime? get shoppingListCreatedAt =>
      getField<DateTime>('shopping_list_created_at');
  set shoppingListCreatedAt(DateTime? value) =>
      setField<DateTime>('shopping_list_created_at', value);

  String? get ingredientName => getField<String>('ingredient_name');
  set ingredientName(String? value) =>
      setField<String>('ingredient_name', value);

  String? get ingredientCategory => getField<String>('ingredient_category');
  set ingredientCategory(String? value) =>
      setField<String>('ingredient_category', value);

  String? get ingredientImage => getField<String>('ingredient_image');
  set ingredientImage(String? value) =>
      setField<String>('ingredient_image', value);
}
