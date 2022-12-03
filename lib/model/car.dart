import 'package:flutter/material.dart';

class Car extends StatelessWidget {
  const Car({
    required this.name,
    required this.plate,
    Key? key,
  }) : super(key: key);

  final String name;
  final String plate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            color: Colors.purple,
            width: 350,
            height: 150,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                children: [
                  Container(
                    width: 110,
                    height: 110,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Motorista: $name',
                        ),
                        Text(
                          'Placa: $plate',
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