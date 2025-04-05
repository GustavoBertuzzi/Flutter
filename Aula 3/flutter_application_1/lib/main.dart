import 'package:flutter_application_1/icon_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

final _formKey = GlobalKey<FormState>();

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Login Page'),
          backgroundColor: Colors.blue,
        ),
        body: Form(
          key: _formKey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    FlutterLogo(),
                    SizedBox(width: 10),
                    Text("Flutter", style: TextStyle(fontSize: 32)),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Usuário",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value != 'admin') {
                        return 'Wrong e-mail or password';
                      }
                      return null;
                    },
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const IconPage(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Dados inválidos"),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
