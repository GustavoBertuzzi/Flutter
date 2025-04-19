import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App com Background Azul',
      theme: ThemeData(
        // Define a cor de fundo primária como azul
        primaryColor: Colors.blue,
        // Define o scaffoldBackgroundColor para azul (fundo das páginas)
        scaffoldBackgroundColor: Colors.blue[100], // Azul mais claro
        // Outras configurações de tema podem ser adicionadas aqui
        appBarTheme: AppBarTheme(
          color: Colors.blue, // Cor da AppBar
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('App com Background Azul')),
      body: Center(
        child: Text(
          'Este app tem um tema com background azul!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
