// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:misoa/identic/login.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Relooking extends StatefulWidget {
  const Relooking({super.key});

  @override
  State<Relooking> createState() => _RelookingState();
}

class _RelookingState extends State<Relooking> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController budget = TextEditingController();
  bool _isLoading = false;

  void clear() {
    _nameController.clear();
    _locationController.clear();
    _descriptionController.clear();
    budget.clear();
  }

  Future<void> submitForm() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int userId = prefs.getInt("userId") ?? -1;
    const url = 'https://yakinci.com/misoa/relook.php';
    final response = await http.post(
      Uri.parse(url),
      body: {
        'name': userId.toString(),
        'louer': _nameController.text,
        'location': _locationController.text,
        'description': _descriptionController.text,
        'budget': budget.text,
      },
    );
    if (response.statusCode == 200) {
      // Insert successful, do something
      clear();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Setion Valider vous serez contacté'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Demande Non envoyer . Reprener svp'),
          backgroundColor: Colors.red,
        ),
      );
      // Insert failed, handle error
    }
  }

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
                            padding: const EdgeInsets.only(),
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
                              'Relooking',
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
                            TextFormField(
                              controller: _nameController,
                              autocorrect: true,
                              decoration: const InputDecoration(
                                label: Text('Louer un(e)'),
                                enabledBorder: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Veuillez entrer votre desire svp';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _locationController,
                              autocorrect: true,
                              decoration: const InputDecoration(
                                label: Text('Localisation'),
                                hintText: 'Ou voulez vous avoir votre bien?',
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
                              controller: _descriptionController,
                              autocorrect: true,
                              style: const TextStyle(color: Colors.black),
                              decoration: const InputDecoration(
                                labelText: 'Description',
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
                            TextFormField(
                              controller: budget,
                              keyboardType: TextInputType.phone,
                              decoration: const InputDecoration(
                                  label: Text('Saisir votre budget'),
                                  enabledBorder: OutlineInputBorder()),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Veuillez entrer votre budget svp';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Container(
                                height: 50,
                                width: 300,
                                color: Colors.red,
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
                                            submitForm();
                                            clear();
                                          }
                                          setState(() {
                                            _isLoading = false;
                                          });
                                        },
                                  child: _isLoading
                                      ? const CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Colors.white),
                                        )
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
