import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'services/supabase_service.dart';
import 'screens/notes_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Load and cache the font
  await _loadAndCacheFont();
  
  // Initialize Supabase
  await SupabaseService.initialize();
  
  runApp(MyApp());
}

Future<void> _loadAndCacheFont() async {
  await GoogleFonts.pendingFonts([
    GoogleFonts.poppins(),
  ]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        useMaterial3: true,
      ),
      home: NotesScreen(),
    );
  }
}