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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.deepPurple[100],
              borderRadius: BorderRadius.circular(20),
            ),
            width: 350,
            height: 150,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                children: [
                  (photo == null)
                      ? Container(
                          width: 110,
                          height: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.deepPurple[100],
                          ),
                          child: const Icon(
                            Icons.no_photography,
                            color: Colors.white,
                            size: 50,
                          ))
                      :
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Motorista: $driverName',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          'Placa: $licensePlate',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 15),
                        ),
                        Text(
                          'Entrada: ${DateFormat('dd/MM/yyyy HH:mm').format(entryDate)}',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 15),
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
