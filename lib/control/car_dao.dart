
import 'package:sqflite/sqflite.dart';
import '../model/car.dart';
import 'database.dart';

class CarDao {
  //----------------Criando o Banco de Dados-----------------

  static const String tableSql = 'CREATE TABLE carTable(name TEXT, plate TEXT)';

  //--------Criando os métodos do CRUD para o banco---------

  save(Car car) async {
    print('Acessando o save');

    final Database bancoDados = await getDatabase();
    Map<String, dynamic> taskMap = toMap(car);


    return await bancoDados.update('carTable', taskMap,
        where: 'plate = ?', whereArgs: [car.plate]);
  }

  delete(String plateCar) async {
    print('Acessando o delete');

    final Database bancoDados = await getDatabase();

    return bancoDados
        .delete('carTable', where: 'plate = ?', whereArgs: [plateCar]);
  }

  Future<List<Car>> find(String plateCar) async {
    print('Acessando o find');

    final Database bancoDados = await getDatabase();

    final List<Map<String, dynamic>> result = await bancoDados
        .query('taskTable', where: 'plate = ?', whereArgs: [plateCar]);

    print('Procurando carro... ${toList(result)}');

    return toList(result);
  }

  Future<List<Car>> findAll() async {
    print('Acessando o findALl');

    final Database bancoDados = await getDatabase();

    final List<Map<String, dynamic>> result = await bancoDados.query('carTable');

    print('Procurando dados no banco... $result');

    return toList(result);
  }
}






//----------Metodo toList para transformas listas em tarefas-------------
List<Car> toList(List<Map<String, dynamic>> mapaTarefas) {
  final List<Car> tarefas = [];

  for (Map<String, dynamic> linha in mapaTarefas) {
    final Car tarefa =
    Car(linha['name'], linha['plate']);
    tarefas.add(tarefa);
  }

  print('lista de tarefas $tarefas');

  return tarefas;
}

//----------Metodo toMap para transformas tarefas em lista-------------
Map<String, dynamic> toMap(Car tarefa) {
  print('Convertendo tarefa em Map');
  final Map<String, dynamic> mapaTarefas = {};
  mapaTarefas['name'] = tarefa.plate;
  mapaTarefas['difficulty'] = tarefa.name;

  print('Mapa de tarefas transformada $mapaTarefas');

  return mapaTarefas;
}