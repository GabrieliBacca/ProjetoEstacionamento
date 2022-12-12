import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/add_register_provider.dart';


class ViewRegisterPage extends StatelessWidget {
  const ViewRegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<AddRegisterProvider>(context, listen: false).registers;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          shadowColor: Colors.purple,
          title: const Text('Visualizar veiculos'),
        ),
        body: ListView(
            children: list
        )

    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../control/provider.dart';
//
// class StayPage extends StatelessWidget {
//   const StayPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<CarProvider>(builder: (__, stateCar, _) {
//       print('dentro da tela');
//       print(stateCar.list.length);
//       return Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           backgroundColor: Colors.deepPurple,
//           shadowColor: Colors.purple,
//           title: const Text('Visualizar veiculos'),
//         ),
//         body: Center(
//           child: ListView.separated(
//             separatorBuilder: (context, index) => Divider(),
//             itemCount: stateCar.list.length,
//             itemBuilder: (context, index) {
//               final car = stateCar.list[index];
//
//               return ListTile(
//                 // leading: const Text("fotinho",style:
//                 // TextStyle(color: Colors.purple, fontSize: 18)),
//                 title: Text(car.plate,style:
//                 const TextStyle(color: Colors.purple, fontSize: 18)),
//                 subtitle: Text(car.name,style:
//              const TextStyle(color: Colors.purple, fontSize: 18)),
//               );
//             },
//           ),
//         ),
//       );
//     });
//   }
// }
