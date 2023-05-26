// ignore_for_file: unnecessary_null_comparison, use_build_context_synchronously

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:misoa/identic/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profil1 extends StatefulWidget {
  const Profil1({super.key});

  @override
  State<Profil1> createState() => _Profil1State();
}

class _Profil1State extends State<Profil1> {
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
    try {
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
        prenom = data["prenom"] ?? '';
        numero = data["numero"] ?? '';
        localisa = data["localisa"] ?? '';
        email = data["email"] ?? '';
      });
    } catch (e) {
      print("Error: $e");
      // Gérer l'erreur ici, par exemple afficher un message à l'utilisateur ou effectuer une autre action appropriée
    }
  }

  void disconnectUser(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
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
                              title: const Text('Quitter l\'application?'),
                              content: const Text(
                                  'Êtes-vous sûr de vouloir quitter l\'application?'),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Annuler'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: const Text('Quitter'),
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
    ));
  }
}
