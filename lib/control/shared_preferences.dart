import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NumberSharedPreferences extends ChangeNotifier {


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







