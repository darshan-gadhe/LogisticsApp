// lib/screens/driver/tabs/driver_profile_tab.dart
import 'package:flutter/material.dart';
import '../../../widgets/detail_row.dart';

class DriverProfileTab extends StatelessWidget {
  const DriverProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildProfileHeader(),
          const SizedBox(height: 24),
          _buildTruckDetailsCard(),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false),
            icon: const Icon(Icons.logout),
            label: const Text("Logout"),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade700),
          )
        ],
      ),
    );
  }

  // ... inside _buildProfileHeader() in driver_profile_tab.dart
  Widget _buildProfileHeader() {
    return Column(
      children: const [
        CircleAvatar(
          radius: 50,
          // Use primary color from the new theme
          backgroundColor: Color(0xFF2C3E50),
          foregroundColor: Colors.white,
          child: Text("RK", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
        ),
        // ... rest of the widget
      ],
    );
  }

  Widget _buildTruckDetailsCard() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Assigned Truck Details", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Divider(height: 24),
            DetailRow(icon: Icons.numbers, label: "Truck Number", value: "MH01-AB1234"),
            DetailRow(icon: Icons.local_shipping_outlined, label: "Truck Model", value: "Eicher Pro 2095XP"),
            DetailRow(icon: Icons.build_circle_outlined, label: "Next Maintenance", value: "In 2,500 km"),
          ],
        ),
      ),
    );
  }
}