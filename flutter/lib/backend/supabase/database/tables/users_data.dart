import '../database.dart';

class UsersDataTable extends SupabaseTable<UsersDataRow> {
  @override
  String get tableName => 'users_data';

  @override
  UsersDataRow createRow(Map<String, dynamic> data) => UsersDataRow(data);
}

class UsersDataRow extends SupabaseDataRow {
  UsersDataRow(super.data);

  @override
  SupabaseTable get table => UsersDataTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get username => getField<String>('username');
  set username(String? value) => setField<String>('username', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
