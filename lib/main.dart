import 'package:estacionamento_projeto_final/view/exit_page.dart';
import 'package:estacionamento_projeto_final/view/home_page.dart';
import 'package:estacionamento_projeto_final/view/list_exit_page.dart';
import 'package:estacionamento_projeto_final/view/registration_page.dart';
import 'package:estacionamento_projeto_final/view/stay_page.dart';
import 'package:estacionamento_projeto_final/view/vacancies_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'control/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CarProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/registrationPage': (context) => const Registration(),
        '/stayPage': (context) => const StayPage(),
        //'/exitPage': (context) => const Exit(),
        '/listExitPage': (context) => const ListExitPage(),
        '/vacanciesPage': (context) => const VacanciesPage(),

      },
    );
  }
}
