// lib/utils/driver_theme.dart
import 'package:flutter/material.dart';

class DriverAppTheme {
  // --- DEFINE THE DRIVER'S BRAND COLORS ---
  static const Color driverPrimaryColor = Color(0xFFA6CADE); // A deep, reliable navy blue
  static const Color driverAccentColor = Color(0xFFF26419);  // A vibrant, action-oriented orange

  static ThemeData getThemeOverride(BuildContext context) {
    final baseTheme = Theme.of(context);

    return baseTheme.copyWith(

      primaryColor: driverPrimaryColor,
      colorScheme: baseTheme.colorScheme.copyWith(
        primary: driverPrimaryColor,
        secondary: driverAccentColor,
      ),

      // --- APP BAR THEME OVERRIDE ---
      appBarTheme: baseTheme.appBarTheme.copyWith(
        // THIS IS THE FIX: Use the correct backgroundColor property here as well
        backgroundColor: driverPrimaryColor,
      ),

      // --- ELEVATED BUTTON THEME OVERRIDE ---
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: driverPrimaryColor,
          foregroundColor: Colors.white,
          elevation: 5,
          shadowColor: driverPrimaryColor.withOpacity(0.4),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 0.5),
        ),
      ),

      // --- FLOATING ACTION BUTTON OVERRIDE ---
      floatingActionButtonTheme: baseTheme.floatingActionButtonTheme.copyWith(
        backgroundColor: driverAccentColor,
        foregroundColor: Colors.white,
      ),

      // --- BOTTOM NAVIGATION BAR OVERRIDE ---
      bottomNavigationBarTheme: baseTheme.bottomNavigationBarTheme.copyWith(
        backgroundColor: Colors.white,
        selectedItemColor: driverPrimaryColor,
      ),

      // --- CHIP THEME OVERRIDE ---
      chipTheme: baseTheme.chipTheme.copyWith(
        backgroundColor: driverPrimaryColor.withOpacity(0.1),
        labelStyle: const TextStyle(color: driverPrimaryColor, fontWeight: FontWeight.w600),
      ),
    );
  }
}
