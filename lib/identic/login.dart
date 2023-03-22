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
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorMessage = '';
  bool isLoggingIn = false; // ajout de cette variable
  static const String _emailKey = 'email';
  bool _isLoading = false;
  bool _obscureText = true;

  String _errorMessag = '';

  Future<void> _login() async {
    String url = 'https://yakinci.com/misoa/login.php';
    var response = await http.post(url as Uri, body: {
      'email': _emailController.text,
      'password': _passwordController.text
    });

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      if (data['success']) {
        // Stocker l'ID de l'utilisateur dans les SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setInt('id_user', data['id_user']);
        setState(() {
          _errorMessag = data['message'];
        });
      }
    } else {
      setState(() {
        _errorMessag = 'Une erreur s\'est produite lors de la connexion.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
          child: Column(children: [
            Container(
              height: 90,
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
                          size: 40,
                          color: Colors.white,
                        ),
                      )),
                  const Padding(
                    padding: EdgeInsets.only(left: 50, top: 20),
                    child: Text(
                      'CONNEXION',
                      style: TextStyle(
                        fontFamily: 'beroKC',
                        color: Colors.white,
                        fontSize: 25,
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
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      child: Column(children: [
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
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
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                            style: const TextStyle(color: Colors.black),
                            obscureText: _obscureText,
                            controller: _passwordController,
                            decoration: InputDecoration(
                              labelText: 'Mot de passe',
                              labelStyle: const TextStyle(color: Colors.black),
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
                              }
                              return null;
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(280, 50),
                            backgroundColor: Colors.red,
                          ),
                          onPressed: _isLoading
                              ? null
                              : () {
                                  if (_formKey.currentState?.validate() ??
                                      false) {
                                    setState(() {
                                      _isLoading = true;
                                    });
                                    _login();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Menu()),
                                    ).then((value) {
                                      setState(() {
                                        _isLoading = false;
                                      });
                                    });
                                  }
                                },
                          child: _isLoading
                              ? const CircularProgressIndicator()
                              : const Text('Se connecter'),
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
                                  builder: (context) => const forgetPage()),
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
    );
  }
}
