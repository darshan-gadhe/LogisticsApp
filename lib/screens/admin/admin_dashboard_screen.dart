// lib/screens/admin/admin_dashboard_screen.dart
import 'package:flutter/material.dart';
import 'package:logistic_app/screens/admin/admin_drivers_screen.dart';
import 'package:logistic_app/screens/admin/admin_fleet_screen.dart';
import 'package:logistic_app/screens/admin/admin_payments_screen.dart'; // <-- Import the new screen
import 'package:logistic_app/screens/admin/admin_profile_screen.dart';
import 'package:logistic_app/screens/admin/admin_trips_screen.dart';
import 'package:logistic_app/utils/constants.dart';
import 'package:logistic_app/widgets/stat_card.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  int _selectedIndex = 0;

  // Add the new Payments screen to the list of widgets
  static const List<Widget> _widgetOptions = <Widget>[
    AdminHomeTab(),
    AdminTripsScreen(),
    AdminPaymentsScreen(), // <-- Add the Payments screen here
    AdminDriversScreen(),
    AdminFleetScreen(),
    AdminProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Ensure all labels are visible
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.route), label: 'Trips'),
          BottomNavigationBarItem(icon: Icon(Icons.payment), label: 'Payments'), // <-- Add the Payments icon
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Drivers'),
          BottomNavigationBarItem(icon: Icon(Icons.local_shipping), label: 'Fleet'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      floatingActionButton: _selectedIndex == 1 // Show FAB only on Trips tab
          ? FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/add_edit_trip'),
        child: const Icon(Icons.add),
        tooltip: 'Create Trip',
      )
          : null,
    );
  }
}

// ... The AdminHomeTab class remains unchanged ...
class AdminHomeTab extends StatelessWidget {
  const AdminHomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("This Month's Overview", style: kHeadingStyle),
          const SizedBox(height: 16),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 1,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            children: const [
              StatCard(title: 'Total Revenue', value: '₹12,50,000', icon: Icons.attach_money, iconColor: kSuccessColor),
              StatCard(title: 'Total Profit', value: '₹3,20,000', icon: Icons.trending_up, iconColor: kSuccessColor),
              StatCard(title: 'Fuel Expenses', value: '₹4,10,000', icon: Icons.local_gas_station, iconColor: kErrorColor),
              StatCard(title: 'Driver Payments', value: '₹2,80,000', icon: Icons.payments, iconColor: kWarningColor),
            ],
          ),
          const SizedBox(height: 24),
          const Text("Live Status", style: kHeadingStyle),
          const SizedBox(height: 16),
          _buildLiveStatusCard(context, Icons.route, "Active Trips", "5", "View Trips", () {}),
          _buildLiveStatusCard(context, Icons.local_shipping, "Trucks on Road", "5 / 8", "Track Fleet", () {}),
          _buildLiveStatusCard(context, Icons.build_circle, "Maintenance Due", "2 Trucks", "View Fleet", () {}),
        ],
      ),
    );
  }

  Widget _buildLiveStatusCard(BuildContext context, IconData icon, String title, String value, String actionText, VoidCallback onTap) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, color: kPrimaryColor, size: 30),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text(value, style: TextStyle(color: Colors.grey[700], fontSize: 14)),
              ],
            ),
            const Spacer(),
            TextButton(child: Text(actionText), onPressed: onTap)
          ],
        ),
      ),
    );
  }
}