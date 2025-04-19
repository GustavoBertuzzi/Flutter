import 'package:flutter/material.dart';

void main() {
  runApp(const ThemeApp());
}

class ThemeApp extends StatelessWidget {
  const ThemeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demonstração ThemeData',

      // Tema principal (vermelho)
      theme: ThemeData(
        primaryColor: Colors.red[700],
        colorScheme: ColorScheme.light(
          primary: Colors.red[700]!,
          secondary: Colors.red[400]!,
        ),
        cardTheme: CardTheme(
          color: Colors.red[400],
          elevation: 4,
          margin: const EdgeInsets.all(16),
        ),
      ),

      home: const ThemeDemoPage(),
    );
  }
}

class ThemeDemoPage extends StatelessWidget {
  const ThemeDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demonstração ThemeData'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Primeiro Widget (tema principal)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Widget com ThemeData principal',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Segundo Widget (com tema sobrescrito)
            Theme(
              data: Theme.of(context).copyWith(
                primaryColor: Colors.green[700],
                colorScheme: ColorScheme.light(
                  primary: Colors.green[700]!,
                  secondary: Colors.green[400]!,
                ),
                cardTheme: CardTheme(
                  color: Colors.green[400],
                  elevation: 8,
                  margin: const EdgeInsets.all(16),
                ),
              ),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Widget com ThemeData sobrescrito',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
