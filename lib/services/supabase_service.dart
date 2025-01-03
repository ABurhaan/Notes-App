// lib/services/supabase_service.dart
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class SupabaseService {
  static const String SUPABASE_URL = '';
  static const String SUPABASE_ANON_KEY = '';
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


