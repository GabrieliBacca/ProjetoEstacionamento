import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Register extends StatelessWidget {
  const Register(
      {required this.driverName,
      required this.licensePlate,
      required this.entryDate,
      Key? key,
      this.photo})
      : super(key: key);

  final String driverName;
  final String licensePlate;
  final DateTime entryDate;
  final File? photo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                colors: [Colors.deepPurple, Colors.deepPurple, Colors.deepPurple],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            width: 350,
            height: 150,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                children: [
                    SizedBox(
                          width: 110,
                          height: 110,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                              photo!,
                              fit: BoxFit.cover,
                            ),
                          )),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Motorista: $driverName',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20),
                        ),
                        Text(
                          'Placa: $licensePlate',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15),
                        ),
                        Text(
                          'Entrada: ${DateFormat('dd/MM/yyyy HH:mm').format(entryDate)}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
