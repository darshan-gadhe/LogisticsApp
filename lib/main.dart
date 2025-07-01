// lib/main.dart
import 'package:flutter/material.dart';
import 'package:logistic_app/screens/admin/add_edit_trip_screen.dart';
import 'package:logistic_app/screens/admin/admin_dashboard_screen.dart';
import 'package:logistic_app/screens/admin/admin_trip_details_screen.dart';
import 'package:logistic_app/screens/auth/login_screen.dart';
import 'package:logistic_app/screens/driver/driver_dashboard_screen.dart';
import 'package:logistic_app/screens/driver/driver_trip_details_screen.dart';
import 'package:logistic_app/screens/driver/log_expense_screen.dart';
import 'package:logistic_app/utils/app_theme.dart';

void main() {
  runApp(const LogisticsApp());
}

class LogisticsApp extends StatelessWidget {
  const LogisticsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Logistics Pro',
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        // Admin Routes
        '/admin_dashboard': (context) => const AdminDashboardScreen(),
        '/admin_trip_details': (context) => const AdminTripDetailsScreen(),
        '/add_edit_trip': (context) => const AddEditTripScreen(),
        // Driver Routes
        '/driver_dashboard': (context) => DriverDashboardScreen(),
        '/driver_trip_details': (context) => const DriverTripDetailsScreen(),
        '/log_expense': (context) => const LogExpenseScreen(),
      },
    );
  }
}