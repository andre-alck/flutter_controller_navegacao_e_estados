import 'package:flutter/material.dart';

import '../components/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacity = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tarefas',
        ),
      ),
      body: AnimatedOpacity(
        opacity: opacity ? 1 : 0,
        duration: const Duration(
          milliseconds: 1000,
        ),
        child: ListView(
          children: const [
            Task(
              'Learn Flutter',
              'assets/images/dash.png',
              5,
            ),
            Task(
              'Ride a bike',
              'assets/images/bike.webp',
              2,
            ),
            Task(
              'Meditate',
              'assets/images/meditar.jpeg',
              5,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: opacity
            ? const Icon(
                Icons.visibility_off,
              )
            : const Icon(
                Icons.visibility,
              ),
        onPressed: () {
          setState(
            () {
              opacity = !opacity;
            },
          );
        },
      ),
    );
  }
}
