import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../control/provider.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController nameController = TextEditingController();
  TextEditingController plateController = TextEditingController();
  ImagePicker imagePicker = ImagePicker();
  File? pickedImage;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<CarProvider>(
      builder: (context, state, child) {
        return Form(
          key: _formKey,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepPurple,
              shadowColor: Colors.purple,
              title: const Text('Cadastro'),
            ),
            body: Center(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: 550,
                  width: 375,
                  //color: Colors.black26,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.deepPurple[100],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: 350,
                          height: 75,
                          child: Center(
                              child: Text(
                                  "Total de vagas: ${Provider.of<CarProvider>(context, listen: false).numberOfLots}",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (String? value) {
                            if (value != null && value.isEmpty) {
                              return 'Insira o nome do condutor';
                            }
                            return null;
                          },
                          controller: nameController,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Nome Condutor",
                            fillColor: Colors.white70,
                            filled: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (String? value) {
                            if (value != null && value.isEmpty) {
                              return 'Insira a placa';
                            }
                            return null;
                          },
                          controller: plateController,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Placa",
                            fillColor: Colors.white70,
                            filled: true,
                          ),
                        ),
                      ),
                      pickedImage == null
                          ? Container(
                              width: 350,
                              height: 150,
                              decoration: BoxDecoration(
                                  color: Colors.deepPurple[100],
                                  borderRadius: BorderRadius.circular(18)),
                              child: const Icon(
                                Icons.image,
                                size: 50,
                                color: Colors.white,
                              ),
                            )
                          : SizedBox(
                              width: 350,
                              height: 150,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                  pickedImage!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                      IconButton(
                          onPressed: () {
                            getImage();
                          },
                          icon: const Icon(
                            Icons.add_a_photo_outlined,
                            color: Colors.deepPurple,
                          )),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (!(Provider.of<CarAddProvider>(context,
                                        listen: false)
                                    .registers
                                    .length ==
                                Provider.of<CarProvider>(context, listen: false)
                                    .numberOfLots)) {
                              Provider.of<CarAddProvider>(context,
                                      listen: false)
                                  .addRegister(
                                      nameController.text,
                                      plateController.text,
                                      DateTime.now(),
                                      pickedImage);
                              Navigator.pop(context);
                            }
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color?>(
                              const Color.fromARGB(100, 209, 196, 233)),
                        ),
                        child: const Text(
                          "Adicionar",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future getImage() async {
    var temporaryImage =
        await imagePicker.pickImage(source: ImageSource.camera);
    if (temporaryImage != null) {
      setState(() {
        pickedImage = File(temporaryImage.path);
      });
    }
  }
}
