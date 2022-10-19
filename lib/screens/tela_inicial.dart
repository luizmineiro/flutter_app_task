import '/components/tasks.dart';
import '/data/task_inherited.dart';
import 'package:flutter/material.dart';

import 'form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  bool opacidade = true;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter: Primeiros Passos'),
        leading: IconButton(
          icon: const Icon(Icons.add_task),
          tooltip: 'Adicionar tarefa',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (contextNew) => FormScreen(
                  taskContext: context,
                ),
              ),
            );
          },
        ),
      ),
      body: AnimatedOpacity(
        opacity: opacidade ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 500),
        child: Container(
          color: Color.fromARGB(255, 208, 221, 237),
          child: ListView(
            children: TaskInherited.of(context).taskList,
            padding: EdgeInsets.only(top: 8, bottom: 70),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacidade = !opacidade;
          });
        },
        backgroundColor: Colors.grey,
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}
