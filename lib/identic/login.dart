// ignore_for_file: use_build_context_synchronously

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:misoa/boitapp/menu.dart';
import 'package:misoa/identic/forget.dart';
import 'package:misoa/identic/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _obscureText = true;
  bool _isLoading = false;

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final response = await http.post(
        Uri.parse("https://s-p4.com/konan/misoa/present.php"),
        body: {
          "email": _email.text,
          "password": _password.text,
        },
      );

      final data = jsonDecode(response.body);

      setState(() {
        _isLoading = false;
      });
      if (data["success"] == 1) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setInt("userId", int.parse(data["id_user"].toString()));
        prefs.setBool('isConnected', true);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Menu(),
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.red,
              title: const Text("Echec de la connexion"),
              content: const Text(
                "L'email ou le mot de passe est incorrect",
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("OK"),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    double hauteur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;
    return FutureBuilder<bool>(
      future: checkConnection(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData && snapshot.data!) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text('Connexion'),
              ),
              body: SingleChildScrollView(
                child: Container(
                  height: hauteur,
                  width: largeur,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/user.jpg'),
                      fit: BoxFit.cover,
                      opacity: 1.0,
                      repeat: ImageRepeat.noRepeat,
                    ),
                  ),
                  child: Column(children: [
                    SizedBox(
                      height: hauteur * 0.1,
                    ),
                    const Text(
                      'MISOA',
                      style: TextStyle(
                          fontFamily: 'beroKC',
                          fontSize: 30,
                          color: Colors.white),
                    ),
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://res.cloudinary.com/dgpmogg2w/image/upload/v1683569192/vrai_vsctog.png'),
                      radius: 70,
                    ),
                    SizedBox(
                      height: hauteur * 0.1,
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Form(
                              key: _formKey,
                              child: Column(children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: _email,
                                  style: const TextStyle(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: Colors.white,
                                            style: BorderStyle.solid)),
                                    labelText: 'Email',
                                    labelStyle: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)),
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
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)),
                                    obscureText: _obscureText,
                                    controller: _password,
                                    decoration: InputDecoration(
                                      hoverColor: Colors.white,
                                      border: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255))),
                                      labelText: 'Mot de passe',
                                      labelStyle: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255)),
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
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
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
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: largeur * 0.8,
                                  height: largeur * 0.13,
                                  margin: EdgeInsets.only(top: 10),
                                  padding: EdgeInsets.only(left: 10),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 255, 255, 255),
                                    ),
                                    onPressed: _isLoading
                                        ? null
                                        : () async {
                                            if (_formKey.currentState
                                                    ?.validate() ??
                                                false) {
                                              setState(() {
                                                _isLoading = true;
                                              });

                                              await _login().then((value) {
                                                setState(() {
                                                  _isLoading = false;
                                                });
                                              });
                                            }
                                          },
                                    child: _isLoading
                                        ? const CircularProgressIndicator()
                                        : const Text('Se connecter',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontFamily: 'beroKC')),
                                  ),
                                ),
                                SizedBox(height: 10),
                                InkWell(
                                  child: const Text(
                                    "Mot de pass oublié?",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 253, 253, 253),
                                      fontFamily: 'beroKC',
                                      fontSize: 15,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const forgetPage()),
                                    );
                                  },
                                ),
                                const SizedBox(height: 10),
                                InkWell(
                                  child: const Text(
                                    "Je suis nouveau",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 253, 253, 253),
                                      fontFamily: 'beroKC',
                                      fontSize: 15,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const RegisterPage()),
                                    );
                                  },
                                ),
                                const SizedBox(height: 20),
                                const Row(
                                  children: [
                                    SizedBox(width: 60),
                                    InkWell(
                                      child: CircleAvatar(
                                        backgroundImage:
                                            AssetImage('images/ikon.png'),
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    InkWell(
                                      child: CircleAvatar(
                                        backgroundImage:
                                            AssetImage('images/insta.png'),
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    InkWell(
                                      child: CircleAvatar(
                                        backgroundImage:
                                            AssetImage('images/in.png'),
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    InkWell(
                                      child: CircleAvatar(
                                        backgroundImage:
                                            AssetImage('images/go.png'),
                                      ),
                                    )
                                  ],
                                )
                              ]),
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
                ),
              ),
            ),
          );
        } else {
          // L'utilisateur n'est pas connecté, rediriger vers la page de connexion
          return const Menu();
        }
      },
    );
  }

  Future<bool> checkConnection() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool isConnected = prefs.getBool('isConnected') ?? true;
    return isConnected;
  }
}
