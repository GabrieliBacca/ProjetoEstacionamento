import 'dart:collection';
import 'dart:io';
import 'package:estacionamento_projeto_final/view/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'database.dart';
import '../model/add_register_controller.dart';
import '../model/car.dart';

class CarProvider extends ChangeNotifier {

  List<Car> list = [];
  List<Car> registerDatabase = [];


  save(Car car) {
    list.add(car);
    for(final it in list){
      print(it.name);
    }
    print(list.length);
    notifyListeners();
  }

  // Future<void> getRegisters() async {
  //   var db = DatabaseHelper();
  //
  //   registerDatabase = (await db.getRegisters()).cast<Car>();
  //   notifyListeners();
  // }

  removeRegister(int index) {
   list.removeAt(index);
    notifyListeners();
  }

  // Future<void> removeRow(
  //     int? id,
  //     String name,
  //     String plate,
  //     DateTime date,
  //     ) async {
  //   var db = DatabaseHelper();
  //   await db.update(
  //     Register(
  //       id: id,
  //       driverName: name,
  //       licensePlate: plate,
  //       entryDate: date,
  //       exitDate: DateTime.now(),
  //     ),
  //   );
  //
  //   notifyListeners();
  // }
  //
  // Future<void> addRow(
  //     String name,
  //     String plate,
  //     DateTime date,
  //     ) async {
  //   var db = DatabaseHelper();
  //   db.insert(
  //     Register(driverName: name, licensePlate: plate, entryDate: date),
  //   );
  //   notifyListeners();
  // }


  listcar() {
    list.length;
    notifyListeners();
  }
NumberSharedPreferences() {
  _init();
}

int _numberLots = 0;
int get numberOfLots => _numberLots;

Future<void> _init() async {
  final prefs = await SharedPreferences.getInstance();
  _numberLots = prefs.getInt('num') ?? 0;
  print('get ${prefs.getInt('num')}');
  notifyListeners();
  notifyListeners();
}
Future<void> changeNumberOfLots(controller) async {
  final prefs = await SharedPreferences.getInstance();
  final number = int.parse(controller);
  final text = controller.toString();

  print('set $number');
  _numberLots = number;
  await prefs.setInt('num', number);
  notifyListeners();
}

}
