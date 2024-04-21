import '../database.dart';

class InventoryExtendedTable extends SupabaseTable<InventoryExtendedRow> {
  @override
  String get tableName => 'inventory_extended';

  @override
  InventoryExtendedRow createRow(Map<String, dynamic> data) =>
      InventoryExtendedRow(data);
}

class InventoryExtendedRow extends SupabaseDataRow {
  InventoryExtendedRow(super.data);

  @override
  SupabaseTable get table => InventoryExtendedTable();

  int? get inventoryId => getField<int>('inventory_id');
  set inventoryId(int? value) => setField<int>('inventory_id', value);

  int? get ingredientId => getField<int>('ingredient_id');
  set ingredientId(int? value) => setField<int>('ingredient_id', value);

  String? get quantity => getField<String>('quantity');
  set quantity(String? value) => setField<String>('quantity', value);

  DateTime? get expirationDate => getField<DateTime>('expiration_date');
  set expirationDate(DateTime? value) =>
      setField<DateTime>('expiration_date', value);

  DateTime? get inventoryCreatedAt =>
      getField<DateTime>('inventory_created_at');
  set inventoryCreatedAt(DateTime? value) =>
      setField<DateTime>('inventory_created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get ingredientName => getField<String>('ingredient_name');
  set ingredientName(String? value) =>
      setField<String>('ingredient_name', value);

  String? get ingredientCategory => getField<String>('ingredient_category');
  set ingredientCategory(String? value) =>
      setField<String>('ingredient_category', value);

  String? get ingredientImage => getField<String>('ingredient_image');
  set ingredientImage(String? value) =>
      setField<String>('ingredient_image', value);

  int? get expiresIn => getField<int>('expires_in');
  set expiresIn(int? value) => setField<int>('expires_in', value);
}
