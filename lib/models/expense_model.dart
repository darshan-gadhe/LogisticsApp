// lib/models/expense_model.dart
enum ExpenseType { Fuel, Food, Maintenance, Road, Other }

class Expense {
  final String id;
  final ExpenseType type;
  final double amount;
  final String description;
  final DateTime date;
  final String? receiptImageUrl; // Optional

  Expense({
    required this.id,
    required this.type,
    required this.amount,
    required this.description,
    required this.date,
    this.receiptImageUrl,
  });
}