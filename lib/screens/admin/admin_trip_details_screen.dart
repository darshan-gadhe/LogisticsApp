// lib/screens/admin/admin_trip_details_screen.dart
import 'package:flutter/material.dart';

import '../../models/trip_model.dart';
import '../../widgets/detail_row.dart';

class AdminTripDetailsScreen extends StatelessWidget {
  const AdminTripDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // In a real app, fetch trip by ID. Here we use navigation arguments.
    final trip = ModalRoute.of(context)!.settings.arguments as Trip?;
    if (trip == null) {
      return Scaffold(appBar: AppBar(), body: const Center(child: Text("Trip not found.")));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(trip.id),
        actions: [
          IconButton(icon: const Icon(Icons.edit), tooltip: 'Edit Trip', onPressed: () {}),
          IconButton(icon: const Icon(Icons.cancel_outlined), tooltip: 'Cancel Trip', onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _buildTripInfoCard(trip),
              _buildFinancialsCard(),
              _buildMapCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTripInfoCard(Trip trip) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Trip Details", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Divider(height: 24),
            DetailRow(icon: Icons.location_on, label: "Pickup Point", value: trip.pickupPoint, iconColor: Colors.green),
            DetailRow(icon: Icons.flag, label: "Delivery Point", value: trip.deliveryPoint, iconColor: Colors.red),
            DetailRow(icon: Icons.map, label: "Total Distance", value: "${trip.totalKm} km"),
            DetailRow(icon: Icons.person, label: "Assigned Driver", value: trip.driverName),
            DetailRow(icon: Icons.local_shipping, label: "Assigned Truck", value: trip.truckId),
            DetailRow(icon: Icons.timelapse, label: "Status", value: trip.status.name),
          ],
        ),
      ),
    );
  }

  Widget _buildFinancialsCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Expense Summary", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Divider(height: 24),
            DetailRow(icon: Icons.local_gas_station_sharp, label: "Fuel Expenses", value: "₹ 15,000", iconColor: Colors.orange),
            DetailRow(icon: Icons.fastfood, label: "Food & Lodging", value: "₹ 3,500", iconColor: Colors.brown),
            DetailRow(icon: Icons.add_road, label: "Road & Tolls", value: "₹ 2,200", iconColor: Colors.blueGrey),
            DetailRow(icon: Icons.build, label: "Maintenance", value: "₹ 0"),
            Divider(height: 24),
            DetailRow(icon: Icons.summarize, label: "Total Expenses", value: "₹ 20,700"),
          ],
        ),
      ),
    );
  }

  Widget _buildMapCard() {
    return Card(
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: Colors.grey[300],
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.track_changes, size: 50, color: Colors.indigo),
              SizedBox(height: 8),
              Text("Live Location Tracking Placeholder"),
            ],
          ),
        ),
      ),
    );
  }
}