import 'package:flutter/material.dart';

class IconPage extends StatelessWidget {
  const IconPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
        title: const Text('Second Route'),
        backgroundColor: Colors.blue,
      ),
      body: Center(child: Icon(Icons.abc_outlined)),
    );
  }
}
