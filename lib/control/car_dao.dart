
import 'package:sqflite/sqflite.dart';

import '../model/car.dart';
import 'database.dart';

class CarDao {
  //----------------Criando o Banco de Dados-----------------

  static const String tableSql = 'CREATE TABLE taskTable(name TEXT, difficulty INTEGER, image TEXT)';

  //--------Criando os métodos do CRUD para o banco---------

  save(Car car) async {
    print('Acessando o save');

    final Database bancoDados = await getDatabase();
    var itemExist = await find(car.name);
    Map<String, dynamic> taskMap = toMap(car);

    if (itemExist.isEmpty) {
      print('A tarefa não existe');

      return await bancoDados.insert('taskTable', taskMap);
    } else {
      print('A terefa já existia');

      return await bancoDados.update('taskTable', taskMap,
          where: 'name = ?', whereArgs: [car.name]);
    }
  }

  delete(String nomeTarefa) async {
    print('Acessando o delete');

    final Database bancoDados = await getDatabase();

    return bancoDados
        .delete('taskTable', where: 'name = ?', whereArgs: [nomeTarefa]);
  }

  Future<List> find(String nomeTarefa) async {
    print('Acessando o find');

    final Database bancoDados = await getDatabase();

    final List<Map<String, dynamic>> result = await bancoDados
        .query('taskTable', where: 'name = ?', whereArgs: [nomeTarefa]);

    print('Procurando tarefa... ${toList(result)}');

    return toList(result);
  }

  Future<List> findAll() async {
    print('Acessando o findALl');

    final Database bancoDados = await getDatabase();

    final List<Map<String, dynamic>> result = await bancoDados.query('taskTable');

    print('Procurando dados no banco... $result');

    return toList(result);
  }
}


//----------Metodo toList para transformas listas em tarefas-------------
List<Car> toList(List<Map<String, dynamic>> mapaTarefas) {
  final List<Car> tarefas = [];

  // for (Map<String, dynamic> linha in mapaTarefas) {
  //   final Car tarefa =
  //  // Car(name: '',image: '',plate: '',key: '',);
  // //  tarefas.add(tarefa);
  // }

  print('lista de tarefas $tarefas');

  return tarefas;
}

//----------Metodo toMap para transformas tarefas em lista-------------
Map<String, dynamic> toMap(Car tarefa) {
  print('Convertendo tarefa em Map');
  final Map<String, dynamic> mapaTarefas = {};
  mapaTarefas['name'] = tarefa.name;
  mapaTarefas['difficulty'] = tarefa.image;
  mapaTarefas['image'] = tarefa.plate;

  print('Mapa de tarefas transformada $mapaTarefas');

  return mapaTarefas;
}
