import '../database.dart';

class RecipesTable extends SupabaseTable<RecipesRow> {
  @override
  String get tableName => 'recipes';

  @override
  RecipesRow createRow(Map<String, dynamic> data) => RecipesRow(data);
}

class RecipesRow extends SupabaseDataRow {
  RecipesRow(super.data);

  @override
  SupabaseTable get table => RecipesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get image => getField<String>('image');
  set image(String? value) => setField<String>('image', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  List<String> get tags => getListField<String>('tags');
  set tags(List<String>? value) => setListField<String>('tags', value);

  int? get difficulty => getField<int>('difficulty');
  set difficulty(int? value) => setField<int>('difficulty', value);

  String? get duration => getField<String>('duration');
  set duration(String? value) => setField<String>('duration', value);

  String? get protein => getField<String>('protein');
  set protein(String? value) => setField<String>('protein', value);

  String? get carbs => getField<String>('carbs');
  set carbs(String? value) => setField<String>('carbs', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get persons => getField<int>('persons');
  set persons(int? value) => setField<int>('persons', value);

  List<String> get descriptionList => getListField<String>('description_list');
  set descriptionList(List<String>? value) =>
      setListField<String>('description_list', value);

  String? get mp3File => getField<String>('mp3_file');
  set mp3File(String? value) => setField<String>('mp3_file', value);
}
