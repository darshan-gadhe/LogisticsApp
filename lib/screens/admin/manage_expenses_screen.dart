// lib/screens/admin/add_edit_expense_screen.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:logistics_app/services/firestore_service.dart';

class AddEditExpenseScreen extends StatefulWidget {
  final String tripId;
  final DocumentSnapshot? expenseDoc;
  const AddEditExpenseScreen({super.key, required this.tripId, this.expenseDoc});

  @override
  State<AddEditExpenseScreen> createState() => _AddEditExpenseScreenState();
}

class _AddEditExpenseScreenState extends State<AddEditExpenseScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firestoreService = FirestoreService();
  bool _isLoading = false;

  late TextEditingController _amountController;
  late TextEditingController _descController;
  String? _selectedType;

  bool get _isEditing => widget.expenseDoc != null;

  @override
  void initState() {
    super.initState();
    final data = _isEditing ? widget.expenseDoc!.data() as Map<String, dynamic> : {};
    _amountController = TextEditingController(text: (data['amount'] ?? '').toString());
    _descController = TextEditingController(text: data['description'] ?? '');
    _selectedType = data['type'] ?? 'Fuel';
  }

  @override
  void dispose() {
    _amountController.dispose();
    _descController.dispose();
    super.dispose();
  }

  Future<void> _saveExpense() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() { _isLoading = true; });

    final expenseData = {
      'type': _selectedType,
      'amount': double.tryParse(_amountController.text) ?? 0.0,
      'description': _descController.text,
      'date': Timestamp.now()
    };

    try {
      if (_isEditing) {
        await _firestoreService.updateExpense(widget.tripId, widget.expenseDoc!.id, expenseData);
      } else {
        await _firestoreService.addExpense(widget.tripId, expenseData);
      }
      Navigator.of(context).pop();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Operation failed: $e")));
    } finally {
      if(mounted){
        setState(() { _isLoading = false; });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_isEditing ? 'Edit Expense' : 'Add Expense')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DropdownButtonFormField<String>(
                value: _selectedType,
                decoration: const InputDecoration(labelText: 'Expense Type'),
                items: ['Fuel', 'Maintenance', 'Driver Payment', 'Food', 'Other']
                    .map((type) => DropdownMenuItem(value: type, child: Text(type)))
                    .toList(),
                onChanged: (val) => setState(() => _selectedType = val),
              ),
              const SizedBox(height: 16),
              TextFormField(controller: _amountController, decoration: const InputDecoration(labelText: 'Amount (₹)'), keyboardType: TextInputType.number, validator: (v) => v!.isEmpty ? 'Amount is required' : null),
              const SizedBox(height: 16),
              TextFormField(controller: _descController, decoration: const InputDecoration(labelText: 'Description'), maxLines: 3),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _isLoading ? null : _saveExpense,
                child: _isLoading ? const CircularProgressIndicator(color: Colors.white) : const Text('Save Expense'),
              )
            ],
          ),
        ),
      ),
    );
  }
}