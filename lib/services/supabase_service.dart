// lib/services/supabase_service.dart
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class SupabaseService {
  static const String SUPABASE_URL = 'https://dddvtqmrsfmhzgyxynhm.supabase.co';
  static const String SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRkZHZ0cW1yc2ZtaHpneXh5bmhtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzU4NDA4MjUsImV4cCI6MjA1MTQxNjgyNX0.be7tIteI5aYsbdO2hi0mZ17KWCld3Bg8_QiHbeXjImA';
  static bool _isInitialized = false;

  static Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      // Check connectivity first
      final connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        throw Exception('No internet connection');
      }

      await Supabase.initialize(
        url: SUPABASE_URL,
        anonKey: SUPABASE_ANON_KEY,
      );
      _isInitialized = true;
    } catch (e) {
      debugPrint('Supabase initialization error: $e');
      // Handle offline mode or show error
    }
  }

  static SupabaseClient get client => Supabase.instance.client;

  static Future<bool> checkConnection() async {
    try {
      final connectivityResult = await Connectivity().checkConnectivity();
      return connectivityResult != ConnectivityResult.none;
    } catch (e) {
      return false;
    }
  }
}


