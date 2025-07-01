// lib/screens/admin/admin_fleet_screen.dart
import 'package:flutter/material.dart';

class AdminFleetScreen extends StatelessWidget {
  const AdminFleetScreen({super.key});

  final List<Map<String, String>> vehicles = const [
    {'id': 'MH01-AB1234', 'type': '22-Wheeler Truck', 'status': 'On Trip'},
    {'id': 'DL02-CD5678', 'type': 'Tata Ace', 'status': 'Available'},
    {'id': 'TN03-EF9012', 'type': '22-Wheeler Truck', 'status': 'Maintenance'},
    {'id': 'KA04-GH5678', 'type': 'Eicher Pro', 'status': 'On Trip'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: vehicles.length,
        itemBuilder: (context, index) {
          final vehicle = vehicles[index];
          return Card(
            child: ListTile(
              leading: Icon(
                Icons.local_shipping,
                color: _getStatusColor(vehicle['status']!),
                size: 40,
              ),
              title: Text(vehicle['id']!, style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2)),
              subtitle: Text(vehicle['type']!),
              trailing: Chip(label: Text(vehicle['status']!)),
              onTap: () {
                // TODO: Navigate to vehicle details page
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Navigate to Add vehicle screen
        },
        tooltip: 'Add Vehicle',
        child: const Icon(Icons.add),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'On Trip': return Colors.orange;
      case 'Available': return Colors.green;
      case 'Maintenance': return Colors.red;
      default: return Colors.grey;
    }
  }
}