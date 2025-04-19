import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Form Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const FormScreen(),
    );
  }
}

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _dobController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text;
      final phone = _phoneController.text;
      final dob = _dobController.text;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Name: $name\nPhone: $phone\nDOB: $dob')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Form Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                children: const [
                  Icon(Icons.person),
                  SizedBox(width: 8),
                  Expanded(child: Text('Name')),
                ],
              ),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(hintText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              Row(
                children: const [
                  Icon(Icons.phone),
                  SizedBox(width: 8),
                  Expanded(child: Text('Phone')),
                ],
              ),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(hintText: 'Phone'),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 12),
              Row(
                children: const [
                  Icon(Icons.date_range),
                  SizedBox(width: 8),
                  Expanded(child: Text('DOB')),
                ],
              ),
              TextFormField(
                controller: _dobController,
                decoration: const InputDecoration(hintText: 'Date of Birth'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
