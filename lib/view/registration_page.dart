import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../control/provider.dart';
import '../model/car.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController nameController = TextEditingController();
  TextEditingController plateController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<CarProvider>(
      builder: (context, state, child) {
        return Form(
          key: _formKey,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepPurple,
              shadowColor: Colors.purple,
              title: const Text('Cadastro'),
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Container(
                  height: 550,
                  width: 375,
                  //color: Colors.black26,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (String? value) {
                            if (value != null && value.isEmpty) {
                              return 'Insira o nome do condutor';
                            }
                            return null;
                          },


                         controller: nameController,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Nome Condutor",
                            fillColor: Colors.white70,
                            filled: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (String? value) {
                            if (value != null && value.isEmpty) {
                              return 'Insira a placa';
                            }
                            return null;
                          },
                          controller: plateController,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Placa",
                            fillColor: Colors.white70,
                            filled: true,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print(nameController.text);
                            print(plateController.text);
                            print(imageController.text);
                            state.save(
                              Car(
                                name: nameController.text,
                                plate: plateController.text,
                              ),
                            );
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Veiculo Cadastrado'),
                              ),
                            );
                          }
                        },
                        child: Text('Adicionar'),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
