import 'package:flutter/material.dart';

void main() {
  runApp(const ChaplainApp());
}

class ChaplainApp extends StatelessWidget {
  const ChaplainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chaplain Layouts',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: Colors.indigo,
          secondary: Colors.tealAccent[400]!,
          surface: Colors.grey[50]!,
        ),
        cardTheme: CardTheme(
          elevation: 2,
          margin: const EdgeInsets.all(8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        listTileTheme: ListTileThemeData(
          dense: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1.2,
          space: 0,
          color: Colors.grey[300],
        ),
      ),
      home: const ChaplainHomePage(),
    );
  }
}

class ChaplainHomePage extends StatelessWidget {
  const ChaplainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chaplain Layouts'), centerTitle: true),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Layout responsivo - muda conforme a largura da tela
          if (constraints.maxWidth > 600) {
            return _buildWideLayout(context);
          } else {
            return _buildNarrowLayout(context);
          }
        },
      ),
    );
  }

  Widget _buildNarrowLayout(BuildContext context) {
    return ListView(
      children: [
        _buildSection('Cheetah Coding', ['INTEN1', 'INTEN2']),
        _buildSection('Chat', ['INTEN1', 'INTEN2']),
        _buildSection('Dart', ['JavaScript', 'PHP', 'C++']),
      ],
    );
  }

  Widget _buildWideLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                _buildSection('Cheetah Coding', ['INTEN1', 'INTEN2']),
                _buildSection('Chat', ['INTEN1', 'INTEN2']),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(child: _buildSection('Dart', ['JavaScript', 'PHP', 'C++'])),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<String> items) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(),
          ...items
              .map((item) => ListTile(title: Text(item), onTap: () {}))
              .toList(),
        ],
      ),
    );
  }
}
