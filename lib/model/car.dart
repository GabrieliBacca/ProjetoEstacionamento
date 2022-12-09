import 'dart:io';

import 'package:estacionamento_projeto_final/control/provider.dart';
import 'package:estacionamento_projeto_final/view/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Car extends StatelessWidget {
  final String name;
  final String plate;
  //final File image;

  const Car({
    required this.name,
    required this.plate,
    //required this.image,
    Key? key, required String image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CarProvider>(
      builder: (__, stateRegister, ___) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Visualizar estadias',
            ),
            iconTheme: const IconThemeData(color: Colors.indigoAccent),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          body: AnimatedList(
              key: key,
              initialItemCount: stateRegister.registerDatabase.length,
              itemBuilder: (_, index, animation) {
                if (stateRegister.registerDatabase.isEmpty) {
                  return Container();
                }
                final register = stateRegister.registerDatabase[index];
                return SizeTransition(
                  sizeFactor: animation,
                  key: UniqueKey(),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.indigoAccent,
                        ),
                        width: 340,
                        height: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 300,
                              height: 100,
                              child: Row(

                                Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10)),
                                    color: Colors.white,
                                  ),
                                  width: 90,
                                  height: 90,
                                  child: const Icon(
                                    Icons.no_photography,
                                    color: Colors.indigoAccent,
                                    size: 70,
                                  ),
                                )
                                    :
                                SizedBox(
                                width: 90,
                                height: 90,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  child: Image.file(
                                    //prhar imagem
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              )

                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            " Nome Condutor: $name",
                                          ),
                                          Text(
                                            "Placa: $plate",
                                          ),
                                        ]),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        );
      },
    );
  }
}



// child: Padding(
// padding: const EdgeInsets.only(left: 8.0),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Text(
// 'Motorista: $name',
// ),
// Text(
// 'Placa: $plate',
// ),
// Text(
// ''
// ),
// ],
// ),
// ),