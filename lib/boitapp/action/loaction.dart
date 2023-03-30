import 'package:flutter/material.dart';
import 'package:misoa/boitapp/menu.dart';
import 'package:http/http.dart' as http;
import 'package:misoa/identic/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  TextEditingController nom = TextEditingController();
  TextEditingController typebien = TextEditingController();
  TextEditingController localisation = TextEditingController();
  TextEditingController description = TextEditingController();

  void insertLocation(String nom, String _selectedOption, String localisation,
      String description) async {
    // URL du fichier PHP d'insertion dans la base de données
    var url = Uri.parse('http://votre_site.com/insert_location.php');

    // Envoi de la requête POST avec les données du formulaire
    var response = await http.post(url, body: {
      'nom': nom,
      'type_bien': _selectedOption,
      'localisation': localisation,
      'description': description
    });

    // Affichage de la réponse du serveur
    print('Réponse du serveur : ${response.body}');
  }

  String _selectedOption = 'Louer un(e)';
  final List<String> _options = [
    'Louer un(e)',
    'Appartement',
    'Villa',
    'Autres'
  ];
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
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Menu(),
                                  ),
                                ); // Retourne à la page précédente
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                size: 30,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 50, top: 20),
                            child: Text(
                              'Location',
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
                              controller: nom,
                              decoration: const InputDecoration(
                                label: Text('Votre Nom complét'),
                                enabledBorder: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Veuillez entrer votre Nom svp';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 60,
                              width: 350,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black)),
                              child: DropdownButton<String>(
                                value: _selectedOption,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedOption = newValue!;
                                  });
                                },
                                items: _options.map((String option) {
                                  return DropdownMenuItem<String>(
                                    value: option,
                                    child: Text(option),
                                  );
                                }).toList(),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: localisation,
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
                              autocorrect: true,
                              controller: description,
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
                                    if (Form.of(context).validate()) {
                                      // if form is valid, call insertLocation with form data
                                      String nomValue = nom.text;
                                      String typebienValue = _selectedOption;
                                      String localisationValue =
                                          localisation.text;
                                      String descriptionValue =
                                          description.text;

                                      insertLocation(nomValue, typebienValue,
                                          localisationValue, descriptionValue);

                                      // clear form data
                                      nom.clear();
                                      localisation.clear();
                                      description.clear();

                                      // navigate to previous screen
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const Menu(),
                                        ),
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
