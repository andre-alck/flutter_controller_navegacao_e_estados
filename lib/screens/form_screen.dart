import 'package:alura_app/data/task_inherited.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  final BuildContext taskContext;

  const FormScreen({super.key, required this.taskContext});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool valueValidator(String? value) {
    return value != null && value.isEmpty;
  }

  bool difficultyValidator(String? value) {
    if (value != null && value.isEmpty) {
      if (int.parse(value) > 5 || int.parse(value) < 1) {
        return true;
      }
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(title: const Text("Nova Tarefa")),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              height: 650,
              width: 375,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(width: 3)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        controller: nameController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Nome',
                            fillColor: Colors.white70,
                            filled: true),
                        validator: (String? value) {
                          if (valueValidator(value)) {
                            return 'Insira o nome da Tarefa.';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          textAlign: TextAlign.center,
                          controller: difficultyController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Dificuldade',
                              fillColor: Colors.white70,
                              filled: true),
                          validator: (value) {
                            if (difficultyValidator(value)) {
                              return 'Insira uma dificuldade entre 1 e 5.';
                            }
                            return null;
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        onChanged: (value) => setState(() {}),
                        textAlign: TextAlign.center,
                        controller: imageController,
                        keyboardType: TextInputType.url,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Imagem',
                            fillColor: Colors.white70,
                            filled: true),
                        validator: (value) {
                          if (valueValidator(value)) {
                            return 'Insira um URL de Imagem.';
                          }

                          return null;
                        },
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 72,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 2, color: Colors.blue)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(imageController.text.trim(),
                            errorBuilder: (context, error, stackTrace) =>
                                Image.network('assets/images/dash.png'),
                            fit: BoxFit.cover,
                            semanticLabel: imageController.text.trim()),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            TaskInherited.of(widget.taskContext).newTask(
                                nameController.text.trim(),
                                imageController.text.trim(),
                                int.parse(difficultyController.text.trim()));
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Nova tarefa salva.')));

                            Navigator.pop(context);
                          }
                        },
                        child: const Text('Adicionar')),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
