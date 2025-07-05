// lib/utils/app_theme.dart
import 'package:flutter/material.dart';

class AppTheme {
  // --- DEFINE YOUR BRAND COLORS HERE ---
  static const Color primaryColor = Color(0xFF1B4965);     // A deep, professional blue-green
  static const Color accentColor = Color(0xFFF7B538);      // A vibrant, attention-grabbing amber/gold
  static const Color backgroundColor = Color(0xFFF8F9FA);  // A very light, clean grey for the background
  static const Color surfaceColor = Colors.white;          // For cards and surfaces
  static const Color textColor = Color(0xFF333333);        // A dark grey for primary text for better readability
  static const Color subtleTextColor = Color(0xFF6c757d);    // A softer grey for secondary text

  // --- THEME DEFINITION ---
  static ThemeData get theme {
    return ThemeData(
      // --- CORE COLORS ---
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        primary: primaryColor,
        secondary: accentColor,
        background: backgroundColor,
        surface: surfaceColor,
      ),

      // --- APP BAR THEME ---
      appBarTheme: const AppBarTheme(
        // THIS IS THE FIX: Use backgroundColor instead of flexibleSpace
        backgroundColor: primaryColor,
        elevation: 4,
        shadowColor: Colors.black26,
        titleTextStyle: TextStyle(
          fontFamily: 'sans-serif',
          color: Colors.white,
          fontSize: 21,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),

      // ... The rest of the theme file is correct and remains the same ...
      cardTheme: CardTheme(
        elevation: 1,
        shadowColor: Colors.black.withOpacity(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        clipBehavior: Clip.antiAlias,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          elevation: 5,
          shadowColor: primaryColor.withOpacity(0.4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 0.5),
        ),
      ),

      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: accentColor,
        foregroundColor: textColor,
        elevation: 8,
        splashColor: Colors.white24,
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: accentColor, width: 2.5),
        ),
        labelStyle: const TextStyle(color: subtleTextColor),
        prefixIconColor: subtleTextColor,
      ),

      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: primaryColor,
        unselectedItemColor: subtleTextColor,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        type: BottomNavigationBarType.fixed,
        elevation: 10,
      ),

      chipTheme: ChipThemeData(
        backgroundColor: primaryColor.withOpacity(0.1),
        labelStyle: const TextStyle(color: primaryColor, fontWeight: FontWeight.w600),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        side: BorderSide.none,
      ),

      textTheme: const TextTheme(
        displayLarge: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        displayMedium: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        headlineSmall: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 24),
        titleLarge: TextStyle(color: textColor, fontWeight: FontWeight.w600, fontSize: 18),
        bodyLarge: TextStyle(color: textColor, fontSize: 16, height: 1.5),
        bodyMedium: TextStyle(color: subtleTextColor, fontSize: 14, height: 1.5),
      ),
    );
  }
}