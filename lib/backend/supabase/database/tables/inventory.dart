import '../database.dart';

class InventoryTable extends SupabaseTable<InventoryRow> {
  @override
  String get tableName => 'inventory';

  @override
  InventoryRow createRow(Map<String, dynamic> data) => InventoryRow(data);
}

class InventoryRow extends SupabaseDataRow {
  InventoryRow(super.data);

  @override
  SupabaseTable get table => InventoryTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get ingredientId => getField<int>('ingredient_id');
  set ingredientId(int? value) => setField<int>('ingredient_id', value);

  String? get quantity => getField<String>('quantity');
  set quantity(String? value) => setField<String>('quantity', value);

  DateTime? get expirationDate => getField<DateTime>('expiration_date');
  set expirationDate(DateTime? value) =>
      setField<DateTime>('expiration_date', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);
}
