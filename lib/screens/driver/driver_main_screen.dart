// lib/screens/driver/driver_main_screen.dart
import 'package:flutter/material.dart';
import 'package:logistic_app/screens/driver/tabs/driver_documents_tab.dart';
import 'package:logistic_app/screens/driver/tabs/driver_history_tab.dart';
import 'package:logistic_app/screens/driver/tabs/driver_home_tab.dart';
import 'package:logistic_app/screens/driver/tabs/driver_profile_tab.dart';

class DriverMainScreen extends StatefulWidget {
  const DriverMainScreen({super.key});

  @override
  State<DriverMainScreen> createState() => _DriverMainScreenState();
}

class _DriverMainScreenState extends State<DriverMainScreen> {
  int _selectedIndex = 0;

  // --- DEFINE DRIVER THEME COLORS ---
  static const Color driverPrimaryColor = Color(0xFF85AACC); // Deep Slate Blue
  static const Color driverAccentColor = Color(0xFF1ABC9C);  // Vibrant Teal
  static const Color driverBackgroundColor = Color(0xFFECF0F1); // Soft Grey

  static const List<Widget> _widgetOptions = <Widget>[
    DriverHomeTab(),
    DriverHistoryTab(),
    DriverDocumentsTab(),
    DriverProfileTab(),
  ];

  static const List<String> _appBarTitles = <String>[
    "Current Trip",
    "Trip History",
    "My Documents",
    "My Profile",
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Custom styled AppBar for the Driver section
  PreferredSizeWidget _buildDriverAppBar() {
    return AppBar(
      title: Text(
        _appBarTitles[_selectedIndex],
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
      ),
      backgroundColor: driverPrimaryColor,
      elevation: 0, // A modern, flat look
      actions: [
        IconButton(
          icon: const Icon(Icons.support_agent, size: 28),
          tooltip: 'Contact Support',
          onPressed: () { /* TODO: Implement contact support action */ },
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildDriverAppBar(),
      // The body now has a distinct background color, separating it from the AppBar.
      body: Container(
        color: driverBackgroundColor,
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.description), label: 'Documents'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        // Styling the Bottom Navigation Bar to match the new driver theme
        backgroundColor: Colors.white,
        selectedItemColor: driverPrimaryColor,
        unselectedItemColor: Colors.grey.shade600,
        type: BottomNavigationBarType.fixed,
        elevation: 10,
      ),
      // The FloatingActionButton is now part of the main screen and shows conditionally.
      floatingActionButton: _selectedIndex == 2
          ? FloatingActionButton.extended(
        onPressed: () { /* TODO: Implement file picker to upload document */ },
        label: const Text('Upload'),
        icon: const Icon(Icons.upload_file),
        backgroundColor: driverAccentColor,
        foregroundColor: Colors.white,
      )
          : null,
    );
  }
}