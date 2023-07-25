import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData getThemeData(BuildContext context) {
    return ThemeData(
      textTheme: GoogleFonts.openSansTextTheme(
        Theme.of(context).textTheme,
      ),
      primaryColor: const Color(0xFF1E5229),
    );
  }
}
