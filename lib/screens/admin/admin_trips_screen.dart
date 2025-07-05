import 'package:flutter/material.dart';
import '../../models/trip_model.dart';

class AdminTripsScreen extends StatelessWidget {
  const AdminTripsScreen({super.key});

  // Dummy data
  static final List<Trip> _trips = [
    Trip(id: "TRIP-001", pickupPoint: "Mumbai Port", deliveryPoint: "Pune Warehouse", driverName: "Ravi Kumar", truckId: "MH01-AB1234", status: TripStatus.inProgress, totalKm: 150, startDate: DateTime.now()),
    Trip(id: "TRIP-002", pickupPoint: "Delhi Airport", deliveryPoint: "Noida Sector 62", driverName: "Suresh Singh", truckId: "DL02-CD5678", status: TripStatus.completed, totalKm: 45, startDate: DateTime.now().subtract(const Duration(days: 2))),
    Trip(id: "TRIP-003", pickupPoint: "Chennai Hub", deliveryPoint: "Bangalore IT Park", driverName: "Amit Patel", truckId: "TN03-EF9012", status: TripStatus.pending, totalKm: 350, startDate: DateTime.now().add(const Duration(days: 1))),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: _trips.length,
      itemBuilder: (context, index) {
        final trip = _trips[index];
        return Card(
          child: ListTile(
            leading: Icon(Icons.route, color: _getStatusColor(trip.status)),
            title: Text(trip.id, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text("${trip.pickupPoint} to ${trip.deliveryPoint}"),
            trailing: Chip(
              label: Text(trip.status.name),
              backgroundColor: _getStatusColor(trip.status).withOpacity(0.2),
            ),
            onTap: () => Navigator.pushNamed(context, '/admin_trip_details', arguments: trip),
          ),
        );
      },
    );
  }

  Color _getStatusColor(TripStatus status) {
    switch (status) {
      case TripStatus.pending: return Colors.blue;
      case TripStatus.inProgress: return Colors.orange;
      case TripStatus.completed: return Colors.green;
      case TripStatus.cancelled: return Colors.red;
    }
  }
}