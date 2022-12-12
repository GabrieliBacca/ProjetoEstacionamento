import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../control/provider.dart';

class StayPage extends StatelessWidget {
  const StayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<CarAddProvider>(context, listen: false).registers;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          shadowColor: Colors.purple,
          title: const Text('Visualizar veiculos'),
        ),
        body: ListView(children: list));
  }
}
