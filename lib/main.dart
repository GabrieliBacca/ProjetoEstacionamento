import 'package:estacionamento_projeto_final/view/home_page.dart';
import 'package:estacionamento_projeto_final/view/registrations_page.dart';
import 'package:estacionamento_projeto_final/view/stay_page.dart';
import 'package:estacionamento_projeto_final/view/vacancies_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'control/provider.dart';
import 'control/add_car_provider.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CarAddProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CarProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
  // runApp(
  //   ChangeNotifierProvider(
  //     create: (context) => CarProvider(),
  //     child: const MyApp(),
  //   ),
  // );
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
        '/registrationPage': (context) => const  Registration(),
        '/stayPage': (context) => const ViewRegisterPage(),
        //'/exitPage': (context) => const Exit(),
        //'/listExitPage': (context) => const ListExitPage(),
        '/vacanciesPage': (context) => const VacanciesPage(),

      },
    );
  }
}
