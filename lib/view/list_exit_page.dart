// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../control/provider.dart';
//
// class ListExitPage extends StatelessWidget {
//   const ListExitPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<CarProvider>(builder: (__, stateCar, _) {
//
//       return Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           backgroundColor: Colors.deepPurple,
//           shadowColor: Colors.purple,
//           title: const Text('Visualizar veiculos'),
//         ),
//         body: Center(
//           child: ListView.separated(
//             separatorBuilder: (context, index) => const Divider(),
//             itemCount: stateCar.list.length,
//             itemBuilder: (context, index) {
//               final car = stateCar.list[index];
//               return ListTile(
//                 leading: Text(car.name),
//                 title: Text(car.plate),
//                 subtitle: const Text("carrinhozinho"),
//               );
//             },
//           ),
//         ),
//       );
//     });
//   }
// }
