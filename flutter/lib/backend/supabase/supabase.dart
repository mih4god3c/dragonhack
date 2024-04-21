import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';
export 'storage/storage.dart';

const _kSupabaseUrl = 'https://vwyzqdotxduyrpyvxatc.supabase.co';
const _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZ3eXpxZG90eGR1eXJweXZ4YXRjIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTcxMzQzMjA1OSwiZXhwIjoyMDI5MDA4MDU5fQ.wgLVnbMezwnvk2CsDBiZkwcpJL8G5oTZl1Az1hF8hns';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}
