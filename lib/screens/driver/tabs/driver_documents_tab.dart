// lib/screens/driver/tabs/driver_documents_tab.dart
import 'package:flutter/material.dart';

class DriverDocumentsTab extends StatelessWidget {
  const DriverDocumentsTab({super.key});

  final List<Map<String, String>> documents = const [
    {'name': 'Driving License', 'expiry': 'Expires: 15-Jun-2028'},
    {'name': 'Vehicle PUC Certificate', 'expiry': 'Expires: 01-Jan-2024'},
    {'name': 'Vehicle Insurance', 'expiry': 'Expires: 30-Apr-2024'},
    {'name': 'Aadhar Card', 'expiry': 'Lifetime'},
  ];

  @override
  Widget build(BuildContext context) {
    // The Scaffold is removed. This widget now only returns the content.
    // The FloatingActionButton will be handled by the parent screen (DriverMainScreen).
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: documents.length,
      itemBuilder: (context, index) {
        final doc = documents[index];
        return Card(
          // Using a subtle border to match the new theme
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.grey.shade300, width: 1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: const Icon(Icons.description_outlined, color: Color(0xFF2C3E50)), // New Icon Color
            title: Text(doc['name']!, style: const TextStyle(fontWeight: FontWeight.w500)),
            subtitle: Text(doc['expiry']!),
            trailing: IconButton(
              icon: const Icon(Icons.visibility_outlined),
              onPressed: () { /* TODO: Open document viewer */ },
            ),
          ),
        );
      },
    );
  }
}