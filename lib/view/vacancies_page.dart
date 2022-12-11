

import 'package:estacionamento_projeto_final/control/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class VacanciesPage extends StatefulWidget {
  const VacanciesPage({Key? key}) : super(key: key);

  @override
  State<VacanciesPage> createState() => _VacanciesPageState();
}

class _VacanciesPageState extends State<VacanciesPage> {

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
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            '${context.watch<CarProvider>().numberOfLots}',
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
                        Provider.of<CarProvider>(context, listen: false).changeNumberOfLots(_numberController.text);
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


// import 'package:estacionamento_projeto_final/control/provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class NumberOfLotsPage extends StatefulWidget {
//   const NumberOfLotsPage({Key? key}) : super(key: key);
//
//   @override
//   State<NumberOfLotsPage> createState() => _NumberOfLotsPageState();
// }
//
// class _NumberOfLotsPageState extends State<NumberOfLotsPage> {
//   final _numberController = TextEditingController();
//   final  _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text(
//           'Número de vagas',
//           style: TextStyle(color: Colors.indigoAccent, fontFamily: 'Poppins'),
//         ),
//         iconTheme: const IconThemeData(color: Colors.indigoAccent),
//         backgroundColor: Colors.transparent,
//         shadowColor: Colors.transparent,
//         shape: const ContinuousRectangleBorder(
//           borderRadius: BorderRadius.only(
//             bottomLeft: Radius.circular(40),
//             bottomRight: Radius.circular(40),
//           ),
//         ),
//       ),
//       body: Form(
//         key: _formKey,
//         child: Column(
//           children: [
//             TextFormField(
//               keyboardType: TextInputType.number,
//               controller: _numberController,
//               validator: (value) {
//                 if (value!.isEmpty) {
//                   return 'Campo obrigatório.';
//                 }
//                 return null;
//               },
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 if (_formKey.currentState!.validate()) {
//                   showDialog(context: context, builder: (context) => AlertDialog(
//                     title: const Text("Alterar número de vagas",),
//                     content: Text("Deseja alterar o número atual de vagas (${Provider.of<CarProvider>(context).numberOfLots})?"),
//
//                     actions: [
//                       TextButton(onPressed: () {
//                         Provider.of<CarProvider>(context, listen: false).changeNumberOfLots(_numberController.text);
//                         Navigator.pop(context);
//                       }, child: const Text("Sim")),
//                       TextButton(onPressed: () {
//                         Navigator.pop(context);
//                       }, child: const Text("Não")),
//                     ],
//                   ));
//                 }
//               },
//               child: const Text('Confirmar'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
