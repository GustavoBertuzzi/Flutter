import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyHomePage()));
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onFabPressed() {
    showModalBottomSheet(
      context: context,
      builder:
          (context) => Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.message),
                title: Text('Mensagem'),
                onTap: () => Navigator.of(context).pop(),
              ),
              ListTile(
                leading: Icon(Icons.mail),
                title: Text('Email'),
                onTap: () => Navigator.of(context).pop(),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('Telefone'),
                onTap: () => Navigator.of(context).pop(),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BottomAppBar com FAB')),
      body: Center(child: Text('TAB: $_selectedIndex')),
      floatingActionButton: FloatingActionButton(
        onPressed: _onFabPressed,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () => _onItemTapped(0),
            ),
            SizedBox(width: 48), // espaço pro FAB
            IconButton(
              icon: Icon(Icons.business),
              onPressed: () => _onItemTapped(1),
            ),
          ],
        ),
      ),
    );
  }
}
