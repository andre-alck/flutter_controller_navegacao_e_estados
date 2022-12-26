import 'package:flutter/material.dart';

import 'difficulty.dart';

// ignore: must_be_immutable
class Task extends StatefulWidget {
  final String name;
  final String imageURL;
  final int difficulty;

  Task(this.name, this.imageURL, this.difficulty, {super.key});

  double level = 0;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool isNetwork() {
    return widget.imageURL.contains('https');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.blue),
              height: 140),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1),
                    color: Colors.white),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black26),
                        width: 72,
                        height: 100,
                        child: isNetwork()
                            ? Image.network(widget.imageURL, fit: BoxFit.cover)
                            : Image.asset(widget.imageURL, fit: BoxFit.cover)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(widget.name,
                              style: const TextStyle(
                                  fontSize: 24,
                                  overflow: TextOverflow.ellipsis)),
                        ),
                        Difficulty(dificultyLevel: widget.difficulty),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () => setState(() => widget.level++),
                      child: const Icon(Icons.arrow_drop_up),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                          value: widget.difficulty > 0
                              ? (widget.level / widget.difficulty) / 10
                              : 1,
                          color: Colors.white),
                    ),
                    Text(
                      'Nível: $widget.level',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
