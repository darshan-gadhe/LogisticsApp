// lib/screens/admin/admin_payments_screen.dart
import 'package:flutter/material.dart';

enum PayoutStatus { Pending, Paid }
enum PaymentMethod { Cash, Online, Card }

class AdminPaymentsScreen extends StatelessWidget {
  const AdminPaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          // Using a PreferredSize widget to create a secondary app bar for tabs
          automaticallyImplyLeading: false, // We don't want a back button
          backgroundColor: Colors.white,
          elevation: 1,
          flexibleSpace: const TabBar(
            tabs: [
              Tab(text: 'Customer Payments'),
              Tab(text: 'Driver Payouts'),
            ],
            labelColor: Colors.indigo,
            unselectedLabelColor: Colors.grey,
          ),
        ),
        body: const TabBarView(
          children: [
            CustomerPaymentsTab(),
            DriverPayoutsTab(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // TODO: Implement a dialog or screen to add a new transaction
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Add New Transaction (UI Placeholder)')),
            );
          },
          tooltip: 'Add Transaction',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

/// WIDGET for Customer Payments Tab
class CustomerPaymentsTab extends StatelessWidget {
  const CustomerPaymentsTab({super.key});

  // Dummy Data for received payments
  final List<Map<String, dynamic>> receivedPayments = const [
    {'id': 'PAY-001', 'tripId': 'TRIP-1024', 'customer': 'Reliance Digital', 'amount': 55000.0, 'method': PaymentMethod.Online},
    {'id': 'PAY-002', 'tripId': 'TRIP-1021', 'customer': 'Chroma Retail', 'amount': 32000.0, 'method': PaymentMethod.Card},
    {'id': 'PAY-003', 'tripId': 'TRIP-1019', 'customer': 'Local Grocers', 'amount': 18000.0, 'method': PaymentMethod.Cash},
    {'id': 'PAY-004', 'tripId': 'TRIP-1015', 'customer': 'Surat Textiles', 'amount': 75000.0, 'method': PaymentMethod.Online},
  ];

  IconData _getPaymentMethodIcon(PaymentMethod method) {
    switch (method) {
      case PaymentMethod.Cash: return Icons.money;
      case PaymentMethod.Card: return Icons.credit_card;
      case PaymentMethod.Online: return Icons.wifi_protected_setup;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: receivedPayments.length,
      itemBuilder: (context, index) {
        final payment = receivedPayments[index];
        return Card(
          child: ListTile(
            leading: Icon(_getPaymentMethodIcon(payment['method']), color: Colors.indigo.shade300, size: 30),
            title: Text('₹ ${payment['amount']}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            subtitle: Text('From: ${payment['customer']}\nFor Trip: ${payment['tripId']}'),
            trailing: Chip(label: Text(payment['method'].toString().split('.').last)),
            isThreeLine: true,
          ),
        );
      },
    );
  }
}

/// WIDGET for Driver Payouts Tab
class DriverPayoutsTab extends StatefulWidget {
  const DriverPayoutsTab({super.key});

  @override
  State<DriverPayoutsTab> createState() => _DriverPayoutsTabState();
}

class _DriverPayoutsTabState extends State<DriverPayoutsTab> {
  // Dummy data for driver payouts
  final List<Map<String, dynamic>> driverPayouts = [
    {'id': 'DPO-001', 'driver': 'Ravi Kumar', 'type': 'Trip Advance', 'amount': 10000.0, 'status': PayoutStatus.Paid},
    {'id': 'DPO-002', 'driver': 'Suresh Singh', 'type': 'Fuel Expense', 'amount': 8500.0, 'status': PayoutStatus.Paid},
    {'id': 'DPO-003', 'driver': 'Vijay Sharma', 'type': 'Salary', 'amount': 25000.0, 'status': PayoutStatus.Pending},
    {'id': 'DPO-004', 'driver': 'Ravi Kumar', 'type': 'Trip Settlement', 'amount': 5000.0, 'status': PayoutStatus.Pending},
  ];

  Color _getPayoutStatusColor(PayoutStatus status) {
    return status == PayoutStatus.Paid ? Colors.green : Colors.orange;
  }

  void _showMarkAsPaidDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Payment'),
          content: Text('Mark the payment of ₹ ${driverPayouts[index]['amount']} to ${driverPayouts[index]['driver']} as PAID?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: const Text('Confirm'),
              onPressed: () {
                setState(() {
                  driverPayouts[index]['status'] = PayoutStatus.Paid;
                });
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Payment marked as paid!'), backgroundColor: Colors.green),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: driverPayouts.length,
      itemBuilder: (context, index) {
        final payout = driverPayouts[index];
        final isPending = payout['status'] == PayoutStatus.Pending;

        return Card(
          child: ListTile(
            leading: Icon(Icons.payments_outlined, color: Colors.indigo.shade300, size: 30),
            title: Text('₹ ${payout['amount']}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            subtitle: Text('To: ${payout['driver']}\nReason: ${payout['type']}'),
            isThreeLine: true,
            trailing: Chip(
              label: Text(payout['status'].toString().split('.').last),
              backgroundColor: _getPayoutStatusColor(payout['status']).withOpacity(0.2),
              labelStyle: TextStyle(color: _getPayoutStatusColor(payout['status']), fontWeight: FontWeight.bold),
            ),
            onTap: isPending ? () => _showMarkAsPaidDialog(index) : null,
          ),
        );
      },
    );
  }
}