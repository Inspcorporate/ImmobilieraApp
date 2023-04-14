// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:misoa/boitapp/menu.dart';
import 'package:misoa/identic/forget.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  bool _isLoading = false;

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });
    final response = await http.post(
      Uri.parse("https://yakinci.com/misoa/loginn.php"),
      body: {
        "email": _emailController.text,
        "password": _passwordController.text,
      },
    );
    final data = jsonDecode(response.body);

    setState(() {
      _isLoading = false;
    });
    if (data["success"] == 1) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setInt("userId", data["id"]);
      prefs.setBool('isConnected', true);
      Navigator.push(
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
              "L'email ou le mot de pass est incorrect",
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
  }

  @override
  Widget build(BuildContext context) {
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
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/blan.jpg'),
                      fit: BoxFit.cover,
                      opacity: 1.0,
                      repeat: ImageRepeat.noRepeat,
                    ),
                  ),
                  child: Column(children: [
                    Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.red, Colors.redAccent],
                              end: Alignment.bottomCenter,
                              begin: Alignment.topCenter),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(100),
                              bottomRight: Radius.circular(100)),
                        ),
                        child: Center(
                          child: Image.network(
                            "https://res.cloudinary.com/dgpmogg2w/image/upload/v1680881810/mo_gwvrih.png",
                            height: 200,
                          ),
                        )),
                    const SizedBox(
                      height: 20,
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
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    color: Colors.white,
                                  ),
                                  padding: EdgeInsets.only(left: 10),
                                  child: TextFormField(
                                    controller: _emailController,
                                    style: const TextStyle(color: Colors.black),
                                    decoration: const InputDecoration(
                                      labelText: 'Email',
                                      labelStyle:
                                          TextStyle(color: Colors.black),
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
                                  height: 20,
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    color: Colors.white,
                                  ),
                                  padding: EdgeInsets.only(left: 10),
                                  child: TextFormField(
                                      style:
                                          const TextStyle(color: Colors.black),
                                      obscureText: _obscureText,
                                      controller: _passwordController,
                                      decoration: InputDecoration(
                                        labelText: 'Mot de passe',
                                        labelStyle: const TextStyle(
                                            color: Colors.black),
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
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
                                  height: 20,
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    color: Colors.white,
                                  ),
                                  padding: EdgeInsets.only(left: 10),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: const Size(280, 50),
                                      backgroundColor: Colors.red,
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
                                                fontSize: 20,
                                                fontFamily: 'devKC')),
                                  ),
                                ),
                                SizedBox(height: 20),
                                InkWell(
                                  child: const Text(
                                    "Mot de pass oublié",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'beroKC',
                                      fontSize: 22,
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
