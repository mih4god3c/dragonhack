import '../database.dart';

class IngredientsTable extends SupabaseTable<IngredientsRow> {
  @override
  String get tableName => 'ingredients';

  @override
  IngredientsRow createRow(Map<String, dynamic> data) => IngredientsRow(data);
}

class IngredientsRow extends SupabaseDataRow {
  IngredientsRow(super.data);

  @override
  SupabaseTable get table => IngredientsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get category => getField<String>('category');
  set category(String? value) => setField<String>('category', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get image => getField<String>('image');
  set image(String? value) => setField<String>('image', value);
}
