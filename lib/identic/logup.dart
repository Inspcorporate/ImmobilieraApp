// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:misoa/identic/login.dart';

class LogupPage extends StatefulWidget {
  const LogupPage({super.key});

  @override
  State<LogupPage> createState() => _LogupPageState();
}

class _LogupPageState extends State<LogupPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final emailController = TextEditingController();
  final _countryController = TextEditingController();
  final _cityController = TextEditingController();
  final _communeController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _firstNameController.dispose();
    _phoneController.dispose();
    emailController.dispose();
    _countryController.dispose();
    _cityController.dispose();
    _communeController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // Si le formulaire est valide, envoyer les informations à l'API
      final response = await http
          .post(Uri.parse('https://yakinci.com/misoa/register.php'), body: {
        'name': _nameController.text,
        'first_name': _firstNameController.text,
        'phone': _phoneController.text,
        'email': emailController.text,
        'country': _countryController.text,
        'city': _cityController.text,
        'commune': _communeController.text,
        'password': _passwordController.text,
      });
      if (response.statusCode == 200) {
        // Si la requête a réussi, afficher la réponse
        final jsonData = jsonDecode(response.body);

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Succès'),
              content: Text(jsonData['message']),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ));
                  },
                ),
              ],
            );
          },
        );
      } else {
        // Si la requête a échoué, afficher un message d'erreur
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Erreur'),
              content: const Text(
                  'Une erreur est survenue lors de l\'envoi des informations.'),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }

  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    double hauteur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Inscription'),
        backgroundColor: Color.fromARGB(255, 227, 37, 37),
      ),
      body: SafeArea(
        child: SizedBox(
          height: hauteur,
          width: largeur,
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                  height: MediaQuery.of(context).size.height * 0.3,
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
                      "https://res.cloudinary.com/dgpmogg2w/image/upload/v1681736417/LOGO_INSP_DEF-12_uhbnni.png",
                      height: MediaQuery.of(context).size.height,
                    ),
                  )),
              SingleChildScrollView(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const Text(
                        'Informations personnelles',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: 'Nom',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer votre nom';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _firstNameController,
                        decoration: const InputDecoration(
                          labelText: 'Prénom',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer votre prénom';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: 'Téléphone',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer votre numéro de téléphone';
                          } else if (value.length != 14) {
                            return 'Veuillez entrer un numéro de téléphone valide';
                          } else if (!value.startsWith("+22501") &&
                              !value.startsWith("+22505") &&
                              !value.startsWith("+22507")) {
                            return 'Le numéro doit commencer par +22501, +22505 ou +22507';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer votre adresse email';
                          } else if (!RegExp(
                                  r'^[a-zA-Z0-9+.-]+@[a-zA-Z0-9.-]+$')
                              .hasMatch(value)) {
                            return 'Veuillez entrer une adresse email valide';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          TextButton(
                            child: Text('Annuler'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Container(
                              height: hauteur * 0.05,
                              width: largeur * 0.4,
                              color: Colors.red,
                              child: ElevatedButton(
                                child: Text('Suivant'),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      _formKey.currentState!.reset();
                                    });
                                    _showSecondStep();
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )),
            ]),
          ),
        ),
      ),
    );
  }

  void _showSecondStep() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Informations de connexion'),
          content: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      controller: _countryController,
                      decoration: const InputDecoration(
                        labelText: 'Pays',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer le nom de votre pays';
                        }

                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _cityController,
                      decoration: const InputDecoration(
                        labelText: 'Ville',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer le nom de votre ville';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _communeController,
                      decoration: const InputDecoration(
                        labelText: 'Commune',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer le nom de votre commune';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Mot de passe',
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
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer un mot de passe';
                        } else if (value.length < 6) {
                          return 'Le mot de passe doit contenir au moins 6 caractères';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _confirmPasswordController,
                      decoration: InputDecoration(
                        labelText: 'Confirmer le mot de passe',
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
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez confirmer votre mot de passe';
                        } else if (value != _passwordController.text) {
                          return 'Les mots de passe ne correspondent pas';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Annuler'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                height: 50,
                width: 300,
                color: Colors.red,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text('Envoyer'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _submitForm();
                      // Si le formulaire est valide, envoyer les informations à l'API
                    }
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
