import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../control/provider.dart';

class StayPage extends StatelessWidget {
  const StayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CarProvider>(builder: (__, stateCar, _) {
      print('dentro da tela');
      print(stateCar.list.length);
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          shadowColor: Colors.purple,
          title: const Text('Visualizar veiculos'),
        ),
        body: Center(
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            itemCount: stateCar.list.length,
            itemBuilder: (context, index) {
              final car = stateCar.list[index];
              return ListTile(
                leading: Text(car.name),
                title: Text(car.plate),
                subtitle: Text("carrinhozinho"),
              );
            },
          ),
        ),
      );
    });
  }
}
