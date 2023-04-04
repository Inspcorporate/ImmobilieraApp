import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
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

  void sendData() async {
    final prefs = await SharedPreferences.getInstance();
    final int userId = prefs.getInt("userId") ?? -1;

    var url =
        'https://yakinci.com/misoa/bien.php'; // Replace with the URL of your PHP API
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields['id_user'] = userId.toString();
    request.fields['nature'] = nature.text;
    request.fields['localist'] = localist.text;
    request.fields['descrip'] = descrip.text;

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
      print('Data sent successfully!');
    } else {
      print('Error sending data: ${response.reasonPhrase}');
    }
  }

  void clear() {
    descrip.clear();
    localist.clear();
    nature.clear();
  }

  String name = '';
  String nate = '';
  String tel = '';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: checkConnection(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData && snapshot.data!) {
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
                        key: _formKey,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: nature,
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
                                          decoration: const BoxDecoration(
                                              color: Colors.grey),
                                          width: 80,
                                          height: 80,
                                          child: const Icon(
                                            Icons.camera_alt,
                                            color: Colors.black,
                                            size: 40,
                                          ),
                                        ),
                                      ),
                                const SizedBox(
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
                                          decoration: const BoxDecoration(
                                              color: Colors.grey),
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
                                    if (_formKey.currentState!.validate()) {
                                      sendData();
                                      name = nature.text;
                                      nate = localist.text;
                                      tel = descrip.text;
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: const Text('Recapitulatif'),
                                          content: Text(
                                              "Ci-dessous les informations communiquées a MISOA :Vente d'un(e): $name ; localisation à : $nate ; decrie comme suite  $tel. Cliquez sur suivant si vous êtres sure de la veracité de ceux-ci sinon cliquez sur précédent pour aller les corriger"),
                                          actions: [
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.of(context)
                                                      .pop(false),
                                              child: const Text(
                                                'précédent',
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.of(context)
                                                      .pop(true),
                                              child: const Text(
                                                'suivent',
                                                style: TextStyle(
                                                    color: Colors.green),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ).then(
                                        (confirmed) {
                                          if (confirmed != null && confirmed) {
                                            showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                title: const Text(
                                                  'Confidencialité',
                                                  style: TextStyle(
                                                      color: Colors.green,
                                                      fontSize: 20),
                                                ),
                                                content: const Text(
                                                    "La politique de confidencialité de MISOA lui permet de garder vos données, MISOA vous demande l'autorisation d'utiliser vos données personnelles afin d'améliorer votre expérience client"),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.of(context)
                                                            .pop(false),
                                                    child: const Text(
                                                      'Annuler',
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    ),
                                                  ),
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.of(context)
                                                            .pop(true),
                                                    child: const Text(
                                                      'Valider',
                                                      style: TextStyle(
                                                          color: Colors.green),
                                                    ),
                                                  ),
                                                ],
                                                elevation: 30,
                                                buttonPadding:
                                                    EdgeInsets.all(20),
                                              ),
                                            ).then(
                                              (confirmed) {
                                                if (confirmed != null &&
                                                    confirmed) {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        const AlertDialog(
                                                      title: Text(
                                                        'Vous serez Contacté par le service Client',
                                                        style: TextStyle(
                                                            color: Colors.green,
                                                            fontSize: 20),
                                                      ),
                                                      content: Icon(
                                                        Icons.check_circle,
                                                        color: Colors.green,
                                                        size: 69,
                                                      ),
                                                    ),
                                                  );
                                                }
                                              },
                                            );
                                            clear();
                                          }
                                        },
                                      );
                                    }
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
