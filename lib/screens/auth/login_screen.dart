// lib/screens/auth/login_screen.dart
import 'package:flutter/material.dart';
import '../../utils/constants.dart';

enum UserRole { admin, driver }

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  UserRole _selectedRole = UserRole.admin;

  void _login() {
    // In a real app, you would validate credentials here
    if (_selectedRole == UserRole.admin) {
      Navigator.pushReplacementNamed(context, '/admin_dashboard');
    } else {
      Navigator.pushReplacementNamed(context, '/driver_dashboard');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(Icons.local_shipping, size: 80, color: kPrimaryColor),
                  const SizedBox(height: 20),
                  const Text("Logistics Pro", textAlign: TextAlign.center, style: kHeadingStyle),
                  const Text("Sign in to your account", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.grey)),
                  const SizedBox(height: 40),
                  ToggleButtons(
                    isSelected: [_selectedRole == UserRole.admin, _selectedRole == UserRole.driver],
                    onPressed: (index) {
                      setState(() {
                        _selectedRole = index == 0 ? UserRole.admin : UserRole.driver;
                      });
                    },
                    borderRadius: BorderRadius.circular(12),
                    selectedColor: Colors.white,
                    fillColor: kPrimaryColor,
                    color: kPrimaryColor,
                    constraints: BoxConstraints(minHeight: 45.0, minWidth: (MediaQuery.of(context).size.width - 60) / 2),
                    children: const [
                      Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: Text('Admin')),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: Text('Driver')),
                    ],
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'User ID / Email', prefixIcon: Icon(Icons.person_outline)),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'Password', prefixIcon: Icon(Icons.lock_outline)),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _login,
                    child: const Text('Login'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}