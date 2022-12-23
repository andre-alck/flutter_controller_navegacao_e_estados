import 'package:alura_app/components/task.dart';
import 'package:alura_app/screens/form_screen.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tarefas')),
      body: ListView(children: const [
        Task('Learn Flutter', 'assets/images/dash.png', 5),
        Task('Ride a bike', 'assets/images/bike.webp', 2),
        Task('Meditate', 'assets/images/meditar.jpeg', 5)
      ]),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            setState(() => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const FormScreen())));
          }),
    );
  }
}
