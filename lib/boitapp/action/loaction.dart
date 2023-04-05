import 'package:flutter/material.dart';
import 'package:misoa/boitapp/achat.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController locat = TextEditingController();
  TextEditingController localisation = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController budget = TextEditingController();
  bool _isLoading = false;
  String thereponse = "";
  void clear() {
    locat.clear();
    localisation.clear();
    description.clear();
    budget.clear();
  }

  Future location() async {
    thereponse = '';
    final prefs = await SharedPreferences.getInstance();
    final int userId = prefs.getInt("userId") ?? -1;

    final response = await http
        .post(Uri.parse("https://yakinci.com/misoa/louer.php"), body: {
      "nom": userId.toString(),
      "locale": locat.text,
      "maping": localisation.text,
      "descrip": description.text,
      "budget": budget.text,
    });
    setState(() {
      thereponse = response.body.toString();
      if (thereponse == "demande envoyer") {}
    });
  }

  String loca = '';
  String localisatio = '';
  String descriptio = '';
  String argent = '';
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
                              autocorrect: true,
                              controller: locat,
                              decoration: const InputDecoration(
                                label: Text('Vous desiez louer un(e)'),
                                enabledBorder: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Veuillez Exprimer votre desire';
                                }
                                return null;
                              },
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
                            TextFormField(
                              controller: budget,
                              keyboardType: TextInputType.phone,
                              decoration: const InputDecoration(
                                  label: Text('Saisir Votre Budget'),
                                  enabledBorder: OutlineInputBorder()),
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
                                      onPressed: _isLoading
                                          ? null
                                          : () async {
                                              if (_formKey.currentState
                                                      ?.validate() ??
                                                  false) {
                                                setState(() {
                                                  _isLoading = true;
                                                });

                                                location();
                                                clear();
                                                loca = locat.text;
                                                localisatio = localisation.text;
                                                descriptio = description.text;
                                                showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      AlertDialog(
                                                    title: const Text(
                                                        'Recapitulatif'),
                                                    content: Text(
                                                        "Ci-dessous les informations communiquées a MISOA : Location d'un(e) : $loca ; lacaliser à: $localisatio; decri comme suit: $descriptio. Cliquez sur suivant si vous êtres sure de la veracité de ceux-ci sinon cliquez sur précédent pour aller les corriger"),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.of(
                                                                    context)
                                                                .pop(false),
                                                        child: const Text(
                                                          'Précédent',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.red),
                                                        ),
                                                      ),
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.of(
                                                                    context)
                                                                .pop(true),
                                                        child: const Text(
                                                          'Suivant',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.green),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ).then(
                                                  (confirmed) {
                                                    if (confirmed != null &&
                                                        confirmed) {
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) =>
                                                            AlertDialog(
                                                          title: const Text(
                                                            'Confidencialité',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .green,
                                                                fontSize: 20),
                                                          ),
                                                          content: const Text(
                                                              "La politique de confidencialité de MISOA lui permet de garder vos données, MISOA vous demande l'autorisation d'utiliser vos données personnelles afin d'améliorer votre expérience client"),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop(
                                                                          false),
                                                              child: const Text(
                                                                'Annuler',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .red),
                                                              ),
                                                            ),
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop(
                                                                          true),
                                                              child: const Text(
                                                                'Valider',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .green),
                                                              ),
                                                            ),
                                                          ],
                                                          elevation: 30,
                                                          buttonPadding:
                                                              const EdgeInsets
                                                                  .all(20),
                                                        ),
                                                      ).then(
                                                        (confirmed) {
                                                          if (confirmed !=
                                                                  null &&
                                                              confirmed) {
                                                            showDialog(
                                                              context: context,
                                                              builder: (context) =>
                                                                  const AlertDialog(
                                                                title: Text(
                                                                  'Vous serez Contacté par le service Client',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .green,
                                                                      fontSize:
                                                                          20),
                                                                ),
                                                                content: Icon(
                                                                  Icons
                                                                      .check_circle,
                                                                  color: Colors
                                                                      .green,
                                                                  size: 69,
                                                                ),
                                                                actions: [],
                                                              ),
                                                            );
                                                          }
                                                        },
                                                      );
                                                    }
                                                  },
                                                );

                                                // clear form data

                                                // navigate to previous screen
                                                // ignore: use_build_context_synchronously
                                              }
                                            },
                                      child: const Text(
                                        "VALIDER",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontFamily: 'beroKC',
                                        ),
                                      ))),
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
