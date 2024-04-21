import '../database.dart';

class ShoppingListTable extends SupabaseTable<ShoppingListRow> {
  @override
  String get tableName => 'shopping_list';

  @override
  ShoppingListRow createRow(Map<String, dynamic> data) => ShoppingListRow(data);
}

class ShoppingListRow extends SupabaseDataRow {
  ShoppingListRow(super.data);

  @override
  SupabaseTable get table => ShoppingListTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get ingredientId => getField<int>('ingredient_id');
  set ingredientId(int? value) => setField<int>('ingredient_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
