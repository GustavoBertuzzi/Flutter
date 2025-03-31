import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Exemplo de Interface Flutter')),
        body: const Center(child: InteractiveContainer()),
      ),
    );
  }
}

class InteractiveContainer extends StatefulWidget {
  const InteractiveContainer({super.key});

  @override
  _InteractiveContainerState createState() => _InteractiveContainerState();
}

class _InteractiveContainerState extends State<InteractiveContainer> {
  Color _containerColor = Colors.blue;

  void _changeColor() {
    setState(() {
      _containerColor = Colors.green;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(20.0),
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: _containerColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: const Text(
            'Olá, Flutter!',
            style: TextStyle(color: Colors.white, fontSize: 24.0),
          ),
        ),
        const SizedBox(height: 20), // Espaço entre o Container e o botão
        ElevatedButton(onPressed: _changeColor, child: const Text('Mudar Cor')),
      ],
    );
  }
}
