// lib/services/supabase_service.dart
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static const String SUPABASE_URL = 'https://dddvtqmrsfmhzgyxynhm.supabase.co';
  static const String SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRkZHZ0cW1yc2ZtaHpneXh5bmhtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzU4NDA4MjUsImV4cCI6MjA1MTQxNjgyNX0.be7tIteI5aYsbdO2hi0mZ17KWCld3Bg8_QiHbeXjImA';

  static Future<void> initialize() async {
    await Supabase.initialize(
      url: SUPABASE_URL,
      anonKey: SUPABASE_ANON_KEY,
    );
  }

  static SupabaseClient get client => Supabase.instance.client;
}