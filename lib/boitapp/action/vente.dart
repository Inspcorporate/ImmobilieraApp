import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as Io;

class Vendre extends StatefulWidget {
  const Vendre({super.key});

  @override
  State<Vendre> createState() => _VendreState();
}

class _VendreState extends State<Vendre> {
  Io.File? image;
  Io.File? file;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;

      final imageTemporary = Io.File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to $e');
    }
  }

  Future pickchoose() async {
    try {
      final file = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (file == null) return;

      final imageTemporary = Io.File(file.path);
      setState(() => this.file = imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/blan.jpg'),
              fit: BoxFit.cover,
              opacity: 1.0,
              repeat: ImageRepeat.noRepeat,
            ),
          ),
          child: Column(
            children: [
              Container(
                height: 80,
                width: 420,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/bkgr.jpg'),
                    fit: BoxFit.cover,
                    opacity: 1.0,
                    repeat: ImageRepeat.noRepeat,
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(
                              context); // Retourne à la page précédente
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 50, top: 20),
                      child: Text(
                        'Vendre du Bien',
                        style: TextStyle(
                          fontFamily: 'beroKC',
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Image(
                image: AssetImage('images/mo.png'),
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                  child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        autocorrect: true,
                        decoration: const InputDecoration(
                          label: Text('Votre Nom complét'),
                          enabledBorder: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Veuillez entrer votre PRENOM svp';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        autocorrect: true,
                        decoration: const InputDecoration(
                          label: Text('Nature Du Bien'),
                          enabledBorder: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Veuillez entrer La Nature de votre bien svp';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        autocorrect: true,
                        decoration: const InputDecoration(
                          label: Text('Localisation du Bien'),
                          enabledBorder: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Veuillez entrer la Localisation svp';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        autocorrect: true,
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          labelText: 'Description Du Bien',
                          labelStyle: TextStyle(color: Colors.black),
                          enabledBorder: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Veuillez decrire  votre bien svp';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          image != null
                              ? Image.file(
                                  image!,
                                  width: 170,
                                  height: 190,
                                )
                              : GestureDetector(
                                  onTap: () => pickImage(),
                                  child: Container(
                                    decoration:
                                        const BoxDecoration(color: Colors.grey),
                                    width: 80,
                                    height: 80,
                                    child: const Icon(
                                      Icons.camera_alt,
                                      color: Colors.black,
                                      size: 40,
                                    ),
                                  ),
                                ),
                          SizedBox(
                            width: 30,
                          ),
                          file != null
                              ? Image.file(
                                  file!,
                                  width: 170,
                                  height: 190,
                                )
                              : GestureDetector(
                                  onTap: () => pickchoose(),
                                  child: Container(
                                    decoration:
                                        const BoxDecoration(color: Colors.grey),
                                    width: 80,
                                    height: 80,
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.black,
                                      size: 40,
                                    ),
                                  ),
                                ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Container(
                          height: 50,
                          width: 300,
                          color: Colors.red,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                            child: const Text(
                              "VALIDER",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'beroKC',
                              ),
                            ),
                            onPressed: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => Menu()),
                              // );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
