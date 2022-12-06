import 'dart:collection';
import 'dart:io';
import 'package:estacionamento_projeto_final/view/registration_page.dart';
import 'package:flutter/material.dart';

import '../model/car.dart';

class CarProvider extends ChangeNotifier {
  //CarProvider(){}

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

  remove(Car car) {
    list.remove(car);
    notifyListeners();
  }

  listcar() {
    list.length;
    notifyListeners();
  }
}
