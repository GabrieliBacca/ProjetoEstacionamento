
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../model/add_register_provider.dart';
import '../model/car.dart';

class CarProvider extends ChangeNotifier {

  numberSharedPreferences() {
    _init();
  }

  int _numberLots = 0;
  int get numberOfLots => _numberLots;

  Future<void> _init() async {
    final prefs = await SharedPreferences.getInstance();
    _numberLots = prefs.getInt('num') ?? 0;
  //  print('get ${prefs.getInt('num')}');
    notifyListeners();
    notifyListeners();
  }

  Future<void> changeNumberOfLots(controller) async {
    final prefs = await SharedPreferences.getInstance();
    final number = int.parse(controller);
    //print('set $number');
    _numberLots = number;
    await prefs.setInt('num', number);
    notifyListeners();
  }

}



class AddRegisterProvider with ChangeNotifier {
  List<Widget> registers = [].cast<Widget>();

  addRegister(String name, String plate, DateTime date, photo) {
    registers.add(
      Register(
        driverName: name,
        licensePlate: plate,
        entryDate: date,
        photo: photo,
      ),
    );
    notifyListeners();
  }
}