import 'package:flutter/material.dart';
import 'package:misoa/boitapp/menu.dart';
import 'package:misoa/identic/forget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool isLoggingIn = false; // ajout de cette variable
  static const String _emailKey = 'email';
  bool _isLoading = false;
  bool _obscureText = true;
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
                        icon: Icon(
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
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  child: Column(children: [
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      autocorrect: true,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Veuillez entrer votre email';
                        } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
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
                        decoration: InputDecoration(
                          labelText: 'Mot de passe',
                          labelStyle: TextStyle(color: Colors.black),
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
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(280, 50),
                          backgroundColor: Colors.red),
                      onPressed: _isLoading
                          ? null
                          : () {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  _isLoading = true;
                                });

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
                              builder: (context) => const Forgetpage()),
                        );
                      },
                    )
                  ]),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
