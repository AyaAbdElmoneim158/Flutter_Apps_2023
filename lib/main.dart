import 'package:flutter/material.dart';
import './views/notes_view.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        textTheme: GoogleFonts.poppinsTextTheme(),
        // useMaterial3: true,
      ),
      home: const NotesView(),
    );
  }
}
