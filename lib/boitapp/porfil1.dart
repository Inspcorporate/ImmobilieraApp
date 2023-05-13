// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Profil1 extends StatefulWidget {
  const Profil1({super.key});

  @override
  State<Profil1> createState() => _Profil1State();
}

class _Profil1State extends State<Profil1> {
  String _username = "";
  String prenom = "";
  String numero = "";
  String email = "";
  String localisa = "";
  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int userId = prefs.getInt("userId") ?? -1;

    final response = await http.post(
      Uri.parse("https://s-p4.com/konan/misoa/mobile.php"),
      body: {
        "id": userId.toString(),
      },
    );

    final data = jsonDecode(response.body);

    setState(() {
      _username = data["username"] ?? '';
      prenom = data["prenom"] ?? '';
      localisa = data["localisa"] ?? '';
      numero = data["numero"] ?? '';
      email = data["email"] ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: _username != null
          ? Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.phone_callback_outlined,
                              size: 30,
                              color: Colors.white,
                            ),
                            Text(
                              ' $numero',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 17),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.email_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                            Text(
                              ' $email',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 17),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: Colors.white,
                              size: 30,
                            ),
                            Text(
                              ' $localisa',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 255, 254, 254),
                                  fontSize: 17),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.exit_to_app,
                                color: Colors.redAccent,
                              ),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title:
                                          const Text('Quitter l\'application?'),
                                      content: const Text(
                                          'Êtes-vous sûr de vouloir quitter l\'application?'),
                                      actions: <Widget>[
                                        TextButton(
                                          child: Text('Annuler'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        TextButton(
                                          child: Text('Quitter'),
                                          onPressed: () {
                                            SystemNavigator.pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                            const Text(
                              "Quitter l'application",
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          : const Center(
              child: Text(
                'Username does not exist',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
    );
  }
}
