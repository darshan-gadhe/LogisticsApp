// lib/screens/admin/admin_drivers_screen.dart
import 'package:flutter/material.dart';

class AdminDriversScreen extends StatelessWidget {
  const AdminDriversScreen({super.key});

  // Dummy Data for UI demonstration
  final List<Map<String, String>> drivers = const [
    {'name': 'Ravi Kumar', 'status': 'On Trip', 'vehicle': 'MH01-AB1234', 'phone': '+91 98765 43210'},
    {'name': 'Suresh Singh', 'status': 'Available', 'vehicle': 'DL02-CD5678', 'phone': '+91 98765 43211'},
    {'name': 'Amit Patel', 'status': 'Available', 'vehicle': 'Unassigned', 'phone': '+91 98765 43212'},
    {'name': 'Vijay Sharma', 'status': 'On Break', 'vehicle': 'KA04-GH5678', 'phone': '+91 98765 43213'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: drivers.length,
        itemBuilder: (context, index) {
          final driver = drivers[index];
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.indigo.shade100,
                  foregroundColor: Colors.indigo.shade800,
                  child: Text(driver['name']![0], style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
                title: Text(driver['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('Vehicle: ${driver['vehicle']}'),
                trailing: Chip(
                  avatar: Icon(
                    Icons.circle,
                    size: 12,
                    color: _getStatusColor(driver['status']!),
                  ),
                  label: Text(driver['status']!),
                ),
                onTap: () {
                  // TODO: Navigate to driver details page
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Navigate to Add Driver screen
        },
        tooltip: 'Add Driver',
        child: const Icon(Icons.person_add),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'On Trip': return Colors.orange;
      case 'Available': return Colors.green;
      case 'On Break': return Colors.blue;
      default: return Colors.grey;
    }
  }
}