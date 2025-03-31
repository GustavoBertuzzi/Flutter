import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(title: const Text('My Home Page')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Hello, World!'),
              const SizedBox(height: 20),
              const Text('SizedBox'),
              const SizedBox(height: 20),
              TextButton(onPressed: () {}, child: const Text('A button')),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
