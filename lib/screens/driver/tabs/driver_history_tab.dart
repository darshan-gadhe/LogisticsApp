// lib/screens/driver/tabs/driver_history_tab.dart
import 'package:flutter/material.dart';

class DriverHistoryTab extends StatelessWidget {
  const DriverHistoryTab({super.key});

  // Dummy data for completed trips
  final List<Map<String, String>> completedTrips = const [
    {'id': 'TRIP-1024', 'route': 'Mumbai -> Pune', 'date': '25-Oct-2023', 'km': '155'},
    {'id': 'TRIP-1021', 'route': 'Pune -> Nashik', 'date': '22-Oct-2023', 'km': '210'},
    {'id': 'TRIP-1019', 'route': 'Nashik -> Mumbai', 'date': '20-Oct-2023', 'km': '165'},
    {'id': 'TRIP-1015', 'route': 'Mumbai -> Surat', 'date': '15-Oct-2023', 'km': '290'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildStatsCard(),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Completed Trips", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemCount: completedTrips.length,
            itemBuilder: (context, index) {
              final trip = completedTrips[index];
              return Card(
                child: ListTile(
                  leading: const Icon(Icons.check_circle, color: Colors.green),
                  title: Text(trip['id']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(trip['route']!),
                  trailing: Text("${trip['km']} km\n${trip['date']}", textAlign: TextAlign.right),
                  isThreeLine: false,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildStatsCard() {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: const [
                Text("32", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.indigo)),
                SizedBox(height: 4),
                Text("Total Trips"),
              ],
            ),
            const SizedBox(height: 40, child: VerticalDivider(thickness: 1)),
            Column(
              children: const [
                Text("8,450", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.indigo)),
                SizedBox(height: 4),
                Text("Total KM Driven"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}