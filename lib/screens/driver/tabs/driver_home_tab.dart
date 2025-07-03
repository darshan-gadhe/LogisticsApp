// lib/screens/driver/tabs/driver_home_tab.dart
import 'package:flutter/material.dart';

import '../../../widgets/detail_row.dart';

class DriverHomeTab extends StatefulWidget {
  const DriverHomeTab({super.key});

  @override
  State<DriverHomeTab> createState() => _DriverHomeTabState();
}

class _DriverHomeTabState extends State<DriverHomeTab> {
  // Use this boolean to toggle between active/inactive trip UI
  bool _hasActiveTrip = true;

  @override
  Widget build(BuildContext context) {
    return _hasActiveTrip ? _buildActiveTripView() : _buildNoTripView();
  }

  Widget _buildNoTripView() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.no_transfer, size: 80, color: Colors.grey[400]),
            const SizedBox(height: 20),
            const Text("No Active Trip", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text("You are currently free. Check back later for your next assignment.", textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () { /* TODO: Implement refresh logic */ },
              icon: const Icon(Icons.refresh),
              label: const Text("Check for Trips"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActiveTripView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildRouteCard(),
          const SizedBox(height: 16),
          _buildMapPlaceholder(),
          const SizedBox(height: 16),
          _buildActionButtons(context),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.check_circle_outline),
            label: const Text("Mark as Delivered"),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          ),
        ],
      ),
    );
  }

  Widget _buildRouteCard() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            DetailRow(icon: Icons.location_on, label: "Pickup Point", value: "Reliance Warehouse, Vashi, Navi Mumbai", iconColor: Colors.green),
            Divider(),
            DetailRow(icon: Icons.flag, label: "Destination Point", value: "City Pride Mall, Satara Road, Pune", iconColor: Colors.red),
          ],
        ),
      ),
    );
  }

  Widget _buildMapPlaceholder() {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 4,
      child: Container(
        height: 200,
        color: Colors.grey[300],
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.map_outlined, size: 60, color: Colors.indigo),
              SizedBox(height: 8),
              Text("Live Map / Navigation", style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () => Navigator.pushNamed(context, '/log_expense'),
            icon: const Icon(Icons.add_card),
            label: const Text("Log Expense"),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () { /* TODO: Call support */ },
            icon: const Icon(Icons.call),
            label: const Text("Call Admin"),
          ),
        ),
      ],
    );
  }
}