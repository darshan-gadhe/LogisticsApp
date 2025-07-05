import 'package:flutter/material.dart';
import 'package:logistic_app/screens/admin/add_edit_trip_screen.dart';
import 'package:logistic_app/screens/admin/admin_dashboard_screen.dart';
import 'package:logistic_app/screens/admin/admin_trip_details_screen.dart';
import 'package:logistic_app/screens/auth/login_screen.dart';
import 'package:logistic_app/screens/driver/driver_main_screen.dart';
import 'package:logistic_app/screens/driver/log_expense_screen.dart';

void main() {
  runApp(const LogisticsApp());
}


class LogisticsApp extends StatelessWidget {
  const LogisticsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      // FIX: Ensure there are no duplicate keys in this map.
      // Every string on the left side of the colon must be unique.
      routes: {
        '/login': (context) => const LoginScreen(),
        '/admin_dashboard': (context) => const AdminDashboardScreen(),
        '/admin_trip_details': (context) => const AdminTripDetailsScreen(),
        '/add_edit_trip': (context) => const AddEditTripScreen(),
        '/driver_main': (context) => const DriverMainScreen(),
        '/log_expense': (context) => const LogExpenseScreen(),
        // Make sure no other route above or below has the same key string.
      },
    );
  }
}