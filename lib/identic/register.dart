// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'package:flutter/services.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:misoa/identic/login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isDark = false;
  bool isActive = false;
  TextEditingController pseudo = TextEditingController();
  TextEditingController localisa = TextEditingController();
  TextEditingController nom = TextEditingController();
  TextEditingController nmero = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController repass = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _areNotificationsEnabled = true;
  int? userId;
  String thereponse = "";
  bool _isLoading = false;

  void clear() {
    localisa.clear();
    pseudo.clear();
    nom.clear();
    email.clear();
    nmero.clear();
    pass.clear();
    repass.clear();
  }

  Future userinf() async {
    thereponse = "";

    setState(() {
      _isLoading = true;
    });

    FormData formData = FormData.fromMap({
      "pseudo": pseudo.text,
      "localisa": localisa.text,
      "nom": nom.text,
      "email": email.text,
      "nmero": nmero.text,
      "pass": pass.text,
    });

    Dio dio = Dio();
    final response = await dio.post(
      'https://s-p4.com/konan/misoa/insert.php',
      data: formData,
    );

    setState(() {
      thereponse = response.data.toString();
      if (thereponse == "New record created successfully") {
        clear();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Circular()),
        );
      } else if (thereponse == "l'email existe déjà") {
        error(context, "Cet email existe déjà");
      }
    });

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Circular()),
    );
  }

  void error(BuildContext context, String error) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(error),
        action: SnackBarAction(
            label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  bool _obscureText = true;
  bool _ferme = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Inscription',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'beroKC',
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/co.jpg'),
              fit: BoxFit.cover,
              opacity: 1.0,
              repeat: ImageRepeat.noRepeat,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.14,
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
                    top: 0,
                    left: 0,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 100, vertical: 50),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage('images/vrai.png'),
                                radius: 23,
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
                        ],
                      ),
                    ),
                  )
                ]),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.06,
                          margin: const EdgeInsets.only(top: 10),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.only(left: 10),
                          child: TextFormField(
                            autocorrect: true,
                            controller: pseudo,
                            decoration: const InputDecoration(
                              label: Text('PRENOM'),
                              enabledBorder: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Veuillez entrer votre prenom svp';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.06,
                          margin: const EdgeInsets.only(top: 10),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.only(left: 10),
                          child: TextFormField(
                            autocorrect: true,
                            controller: nom,
                            decoration: const InputDecoration(
                              label: Text('NOM'),
                              enabledBorder: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Veuillez entrer votre nom svp';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.06,
                          margin: const EdgeInsets.only(top: 10),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.only(left: 10),
                          child: TextFormField(
                            autocorrect: true,
                            controller: localisa,
                            decoration: const InputDecoration(
                              label: Text('Localisation'),
                              hintText: 'Abidjan,Côte D\'Ivoire',
                              enabledBorder: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Veuillez entrer une localisation svp';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.06,
                          margin: const EdgeInsets.only(top: 10),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.only(left: 10),
                          child: TextFormField(
                            controller: nmero,
                            autocorrect: true,
                            decoration: const InputDecoration(
                              label: Text('Numero'),
                              enabledBorder: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Veuillez entrer votre numéro svp';
                              }
                              if (!value.startsWith("+22501") &&
                                  !value.startsWith("+22505") &&
                                  !value.startsWith("+22507")) {
                                return 'Le numéro doit commencer par +22501, +22505 ou +22507';
                              }
                              if (value.length != 14) {
                                return 'Le numéro doit contenir 14 caractères au total';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.06,
                          margin: EdgeInsets.only(top: 10),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.only(left: 10),
                          child: TextFormField(
                            autocorrect: true,
                            controller: email,
                            style: const TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              labelStyle: TextStyle(color: Colors.black),
                              enabledBorder: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Veuillez entrer votre email';
                              } else if (!RegExp(
                                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                  .hasMatch(value)) {
                                return 'Veuillez entrer un email valide';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.06,
                          margin: const EdgeInsets.only(top: 10),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.only(left: 10),
                          child: TextFormField(
                              style: const TextStyle(color: Colors.black),
                              controller: repass,
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                labelText: 'Mot de passe',
                                labelStyle:
                                    const TextStyle(color: Colors.black),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                  icon: Icon(
                                    _obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Veuillez entrer votre mot de passe';
                                } else if (value.length < 6) {
                                  return 'Le mot de passe doit comporter au moins 6 caractères';
                                } else if (value.length > 10) {
                                  return 'Le mot de passe doit etre compris entre 6 et 10 caractères';
                                }
                                return null;
                              }),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.06,
                          margin: EdgeInsets.only(top: 10),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.only(left: 10),
                          child: TextFormField(
                            controller: pass,
                            style: const TextStyle(color: Colors.black),
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Comfirme Mot de passe',
                              labelStyle: TextStyle(color: Colors.black),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _ferme = !_ferme;
                                  });
                                },
                                icon: Icon(
                                  _ferme
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Veuillez entrer votre mot de passe';
                              } else if (value.length < 6) {
                                return 'Le mot de passe doit comporter au moins 6 caractères';
                              } else if (value.length > 10) {
                                return 'Le mot de passe doit etre compris entre 6 et 10 caractères';
                              }

                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                            "J'accepte tout les conditions d'utilisation que l'application  "),
                        SwitchListTile(
                          title: const Text(
                              ' Misao offre pour la securité de vos donnée'),
                          value: _areNotificationsEnabled,
                          onChanged: (value) {
                            setState(() {
                              _areNotificationsEnabled = value;
                            });
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.8,
                            color: Colors.red,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red),
                              onPressed: _isLoading
                                  ? null
                                  : () async {
                                      if (_formKey.currentState?.validate() ??
                                          false) {
                                        setState(() {
                                          _isLoading = true;
                                        });

                                        await userinf().then((value) {
                                          setState(() {
                                            _isLoading = false;
                                          });
                                        });
                                      }
                                    },
                              child: _isLoading
                                  ? const CircularProgressIndicator()
                                  : const Text(
                                      "S'inscrire",
                                      style: TextStyle(
                                          fontSize: 20, fontFamily: 'beroKC'),
                                    ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Circular extends StatefulWidget {
  const Circular({super.key});

  @override
  State<Circular> createState() => _CircularState();
}

class _CircularState extends State<Circular> {
  Future<bool> checkInternetConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    checkInternetConnectivity().then((internet) {
      if (internet == true) {
        Timer(
          const Duration(seconds: 2),
          () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text("Erreur de connexion"),
            content:
                const Text("Vérifiez votre connexion internet et réessayez."),
            actions: [
              TextButton(
                child: const Text("OK"),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.red,
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}
