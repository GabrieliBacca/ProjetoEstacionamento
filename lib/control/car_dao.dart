//
// import 'package:sqflite/sqflite.dart';
// import '../model/car.dart';
// import 'database.dart';
//
// class CarDao {
//   // Banco de Dados
//
//   static const String tableSql = 'CREATE TABLE carTable(name TEXT, plate TEXT)';
//
//   //métodos
//
//   save(Car car) async {
//     print('Acessando o save');
//
//     final Database bancoDados = await getDatabase();
//     Map<String, dynamic> taskMap = toMap(car);
//
//
//     return await bancoDados.update('carTable', taskMap,
//         where: 'plate = ?', whereArgs: [car.plate]);
//   }
//
//   delete(String plateCar) async {
//     print('Acessando o delete');
//
//     final Database bancoDados = await getDatabase();
//
//     return bancoDados
//         .delete('carTable', where: 'plate = ?', whereArgs: [plateCar]);
//   }
//
//   Future<List<Car>> find(String plateCar) async {
//     print('Acessando o find');
//
//     final Database bancoDados = await getDatabase();
//
//     final List<Map<String, dynamic>> result = await bancoDados
//         .query('taskTable', where: 'plate = ?', whereArgs: [plateCar]);
//
//     print('Procurando carro... ${toList(result)}');
//
//     return toList(result);
//   }
//
//   Future<List<Car>> findAll() async {
//     print('Acessando o findALl');
//
//     final Database bancoDados = await getDatabase();
//
//     final List<Map<String, dynamic>> result = await bancoDados.query('carTable');
//
//     print('Procurando dados no banco... $result');
//
//     return toList(result);
//   }
// }
// }