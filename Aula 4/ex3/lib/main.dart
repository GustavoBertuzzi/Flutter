import 'package:flutter/material.dart';

void main() {
  runApp(TaskApp());
}

class TaskApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Notas de Tarefas', home: TaskHomePage());
  }
}

class TaskHomePage extends StatefulWidget {
  @override
  _TaskHomePageState createState() => _TaskHomePageState();
}

class _TaskHomePageState extends State<TaskHomePage> {
  List<bool> _taskStatus = List.generate(5, (index) => false);

  void _showAlertDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Aviso'),
          content: Text('Você está no App de Notas de Tarefas'),
          actions: [
            ElevatedButton(
              child: Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kindacode.com')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              // Aqui poderia filtrar tarefas concluídas
            },
            child: Text('View Completed Tasks'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('You have 5 uncompleted tasks'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.yellow[200],
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: ListTile(
                    title: Text('Task 2022-07-09 18:08:3${index}52417'),
                    trailing: Checkbox(
                      value: _taskStatus[index],
                      onChanged: (value) {
                        setState(() {
                          _taskStatus[index] = value!;
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAlertDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}
