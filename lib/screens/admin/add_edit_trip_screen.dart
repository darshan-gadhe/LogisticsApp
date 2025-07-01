// lib/screens/admin/add_edit_trip_screen.dart
import 'package:flutter/material.dart';

class AddEditTripScreen extends StatelessWidget {
  const AddEditTripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create New Trip')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(decoration: const InputDecoration(labelText: 'Pickup Point', prefixIcon: Icon(Icons.location_on_outlined))),
              const SizedBox(height: 16),
              TextFormField(decoration: const InputDecoration(labelText: 'Delivery Point', prefixIcon: Icon(Icons.location_on))),
              const SizedBox(height: 16),
              DropdownButtonFormField(
                decoration: const InputDecoration(labelText: 'Assign Driver', prefixIcon: Icon(Icons.person_outline)),
                items: const [DropdownMenuItem(value: 'Ravi Kumar', child: Text('Ravi Kumar'))],
                onChanged: (val) {},
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField(
                decoration: const InputDecoration(labelText: 'Assign Truck', prefixIcon: Icon(Icons.local_shipping_outlined)),
                items: const [DropdownMenuItem(value: 'MH01-AB1234', child: Text('MH01-AB1234'))],
                onChanged: (val) {},
              ),
              const SizedBox(height: 16),
              TextFormField(decoration: const InputDecoration(labelText: 'Estimated Total KM', prefixIcon: Icon(Icons.map_outlined)), keyboardType: TextInputType.number),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Trip created successfully!')));
                  Navigator.pop(context);
                },
                child: const Text('Save Trip'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}