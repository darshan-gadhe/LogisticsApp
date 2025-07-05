// lib/screens/driver/log_expense_screen.dart
import 'package:flutter/material.dart';
import '../../models/expense_model.dart';
import '../../utils/constants.dart';

class LogExpenseScreen extends StatelessWidget {
  const LogExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Log an Expense')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DropdownButtonFormField<ExpenseType>(
                decoration: const InputDecoration(labelText: 'Expense Type', prefixIcon: Icon(Icons.category_outlined)),
                items: ExpenseType.values
                    .map((type) => DropdownMenuItem(value: type, child: Text(type.name)))
                    .toList(),
                onChanged: (val) {},
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Amount (₹)', prefixIcon: Icon(Icons.money)),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Description / Notes', prefixIcon: Icon(Icons.notes)),
                maxLines: 3,
              ),
              const SizedBox(height: 24),
              OutlinedButton.icon(
                onPressed: () {
                  // TODO: Implement image picker
                },
                icon: const Icon(Icons.camera_alt_outlined),
                label: const Text('Upload Receipt'),
                style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    foregroundColor: kPrimaryColor
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Expense logged successfully!')));
                  Navigator.pop(context);
                },
                child: const Text('Save Expense'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}