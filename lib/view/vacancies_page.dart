import 'package:estacionamento_projeto_final/control/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:estacionamento_projeto_final/control/shared_preferences.dart';

import '../model/car.dart';

class VacanciesPage extends StatefulWidget {
  const VacanciesPage({Key? key}) : super(key: key);

  @override
  State<VacanciesPage> createState() => _VacanciesPageState();
}

class _VacanciesPageState extends State<VacanciesPage> {
 // final registerLength = context.watch<
     // context.watch<AddRegisterProvider>().registerDatabase.length;
  final _numberController = TextEditingController();
  final  _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<CarProvider>(
      builder: (context, state, child){
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            shadowColor: Colors.purple,
            title: const Text('Número de vagas'),
          ),
          body: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 65, left: 3),
                  child: SizedBox(
                    width: 200,
                    height: 150,
                    child: Column(
                      children: [
                        const Text(
                          "Total de vagas:",
                          style: TextStyle(
                              fontSize: 20),
                        ),
                        Text(
                          ' ${context.watch<CarProvider>().numberOfLots}',
                          style: const TextStyle(
                             fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _numberController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Insira o número';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                        print(_numberController.text);
                        state.changeNumberOfLots(_numberController.text);
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Número mudado'),
                          ),
                        );
                    }
                  },
                  child: const Text('Salvar'),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}

