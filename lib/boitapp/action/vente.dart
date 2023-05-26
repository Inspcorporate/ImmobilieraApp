// ignore_for_file: use_build_context_synchronously

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:misoa/boitapp/affiche.dart';
import 'package:misoa/identic/login.dart';
import 'dart:io' as Io;

import 'package:shared_preferences/shared_preferences.dart';

class Vendre extends StatefulWidget {
  const Vendre({super.key});

  @override
  State<Vendre> createState() => _VendreState();
}

class _VendreState extends State<Vendre> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Io.File? image;
  Io.File? file;
  TextEditingController nature = TextEditingController();
  TextEditingController localist = TextEditingController();
  TextEditingController descrip = TextEditingController();
  TextEditingController douche = TextEditingController();
  TextEditingController chambre = TextEditingController();
  TextEditingController garage = TextEditingController();
  bool _isLoading = false;

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

      final fileTemporary = Io.File(file.path);
      setState(() => this.file = fileTemporary);
    } on PlatformException catch (e) {
      print('Failed to $e');
    }
  }

  void clear() {
    descrip.clear();
    localist.clear();
    nature.clear();
    douche.clear();
    chambre.clear();
    garage.clear();
    image = null;
    file = null;
  }

  void sendData() async {
    final prefs = await SharedPreferences.getInstance();
    final int userId = prefs.getInt("userId") ?? -1;
    setState(() {
      _isLoading = true;
    });
    var url = 'https://s-p4.com/konan/misoa/bien.php';
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields['id_user'] = userId.toString();
    request.fields['nature'] = nature.text;
    request.fields['localist'] = localist.text;
    request.fields['descrip'] = descrip.text;
    request.fields['douche'] = douche.text;
    request.fields['chambre'] = chambre.text;
    request.fields['garage'] = garage.text;

    if (image != null) {
      var imageStream = http.ByteStream(image!.openRead());
      var imageLength = await image!.length();
      var multipartFile = http.MultipartFile('image', imageStream, imageLength,
          filename: image!.path.split('/').last);
      request.files.add(multipartFile);
    }

    if (file != null) {
      var fileStream = http.ByteStream(file!.openRead());
      var fileLength = await file!.length();
      var multipartFile = http.MultipartFile('file', fileStream, fileLength,
          filename: file!.path.split('/').last);
      request.files.add(multipartFile);
    }

    var response = await request.send();

    if (response.statusCode == 200) {
      _showCongratulationsDialog();
      clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              Text('La demande n\'a pas pu être envoyée. Veuillez réessayer.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _showCongratulationsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.green,
          title: const Text(
            'Félicitations!',
            style: TextStyle(fontSize: 20, fontFamily: 'devKC'),
          ),
          content: const Text(
            'Vous venez de lancer une procédure de vente de bien. Vous serez contacté prochainement.',
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const AffichPage()),
                );
              },
              child: const Icon(
                Icons.arrow_back,
                size: 30,
              ),
            ),
          ],
        );
      },
    );
  }

  String naturBien = '';
  String nate = '';
  String tel = '';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: checkConnection(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData && snapshot.data!) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.red,
            ),
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
                    Stack(children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.23,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/fon.jpg'),
                              fit: BoxFit.cover,
                              repeat: ImageRepeat.noRepeat),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                        ),
                      ),
                      const Positioned(
                        top: 30,
                        left: 40,
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage('images/vrai.png'),
                              radius: 30,
                            ),
                            Text(
                              'MISOA',
                              style: TextStyle(
                                  fontFamily: 'beroKC',
                                  fontSize: 30,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 20,
                        child: Container(
                          height: 50,
                          width: 120,
                          alignment: Alignment.bottomLeft,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white),
                          child: const Center(
                            child: Text(
                              'Vendre',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.red,
                                fontFamily: 'beroKC',
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: nature,
                                autocorrect: true,
                                onChanged: (value) {
                                  setState(() {
                                    naturBien = value;
                                  });
                                },
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
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: localist,
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
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: descrip,
                                autocorrect: true,
                                style: const TextStyle(color: Colors.black),
                                decoration: const InputDecoration(
                                  labelText: 'Description Du Bien',
                                  hintText:
                                      "Location(caution 200mille*4),vente 2millions)",
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
                              if (naturBien == 'Appartement' ||
                                  naturBien == 'Villa')
                                Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Veuillez entrer votre nom svp';
                                            }
                                            return null;
                                          },
                                          controller: douche,
                                          decoration: const InputDecoration(
                                            labelText: 'Douche',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Veuillez entrer ';
                                            }
                                            return null;
                                          },
                                          controller: chambre,
                                          decoration: const InputDecoration(
                                            labelText: 'Chambre',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Veuillez entrer votre nom svp';
                                            }
                                            return null;
                                          },
                                          controller: garage,
                                          decoration: const InputDecoration(
                                            labelText: 'Garage',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Ajouter des Justificatifs',
                                style: TextStyle(
                                    fontFamily: 'beroKC', fontSize: 20),
                              ),
                              Row(
                                children: [
                                  Column(
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
                                                decoration: const BoxDecoration(
                                                    color: Colors.grey),
                                                width: 80,
                                                height: 80,
                                                child: const Icon(
                                                  Icons.camera_alt,
                                                  color: Color.fromARGB(
                                                      255, 249, 249, 249),
                                                  size: 40,
                                                ),
                                              ),
                                            ),
                                      const Text(
                                        "document du\n Bien",
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Column(
                                    children: [
                                      file != null
                                          ? Image.file(
                                              file!,
                                              width: 170,
                                              height: 190,
                                            )
                                          : GestureDetector(
                                              onTap: () => pickchoose(),
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                    color: Colors.grey),
                                                width: 80,
                                                height: 80,
                                                child: const Icon(
                                                  Icons.add,
                                                  color: Color.fromARGB(
                                                      255, 239, 239, 239),
                                                  size: 40,
                                                ),
                                              ),
                                            ),
                                      const Text(
                                        ' l\' image du \n Bien',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  )
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
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                    ),
                                    onPressed: _isLoading
                                        ? null
                                        : () async {
                                            setState(() {
                                              _isLoading = true;
                                            });
                                            if (_formKey.currentState != null &&
                                                _formKey.currentState!
                                                    .validate()) {
                                              setState(() {
                                                _isLoading = true;
                                              });
                                              sendData();
                                            }
                                            setState(() {
                                              _isLoading = false;
                                            });
                                          },
                                    child: _isLoading
                                        ? const CircularProgressIndicator()
                                        : const Text(
                                            "VALIDER",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontFamily: 'beroKC',
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          // L'utilisateur n'est pas connecté, rediriger vers la page de connexion
          return const LoginPage();
        }
      },
    );
  }

  Future<bool> checkConnection() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool isConnected = prefs.getBool('isConnected') ?? false;
    return isConnected;
  }
}
