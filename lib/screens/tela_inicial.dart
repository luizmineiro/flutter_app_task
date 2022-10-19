import 'package:alura_flutter_curso_1/components/tasks.dart';
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
                builder: (context) => FormScreen(),
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
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: Tasks(
                  'Estudar Flutter',
                  'assets/images/flutter.png',
                  3,
                ),
              ),
              Tasks(
                'Andar de Bike',
                'assets/images/bike.webp',
                2,
              ),
              Tasks(
                'Ler 50 páginas',
                'assets/images/ler.jpg',
                1,
              ),
              Tasks(
                'Meditar',
                'assets/images/meditar.jpeg',
                4,
              ),
              Tasks(
                'Jogar',
                'assets/images/jogar.jpg',
                3,
              ),
              SizedBox(
                height: 100,
              ),
            ],
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
