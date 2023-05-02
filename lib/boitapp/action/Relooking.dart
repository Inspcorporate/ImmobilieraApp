// ignore_for_file: file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:misoa/boitapp/menu.dart';
import 'package:misoa/identic/login.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Relooking extends StatefulWidget {
  const Relooking({super.key});

  @override
  State<Relooking> createState() => _RelookingState();
}

class _RelookingState extends State<Relooking> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _budgetController = TextEditingController();
  bool _isLoading = false;

  void clear() {
    _nameController.clear();
    _locationController.clear();
    _descriptionController.clear();
    _budgetController.clear();
  }

  Future<void> _submitForm() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int userId = prefs.getInt("userId") ?? -1;
    const url = 'https://s-p4.com/konan/misoa/relook.php';
    final response = await http.post(
      Uri.parse(url),
      body: {
        'name': userId.toString(),
        'louer': _nameController.text,
        'location': _locationController.text,
        'description': _descriptionController.text,
        'budget': _budgetController.text,
      },
    );

    if (response.statusCode == 200) {
      // traitement de la réponse si besoin
      print(response.body);
      _showCongratulationsDialog();
    } else {
      // gestion de l'erreur
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Demande Non envoyer . Reprener svp'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _showCongratulationsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.green,
          title: const Text(
            'Félicitations!',
            style: TextStyle(fontSize: 20, fontFamily: 'devKC'),
          ),
          content: const Text(
            'Vous venez de lancer une Procedure de Relooking de bien.',
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Menu()),
                );
              },
              child: const Icon(
                Icons.arrow_back,
                size: 30,
              ),
            ),
          ],
        );
      },
    );
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
                title: const Text('Relooking'),
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
                  child: Column(
                    children: [
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
                              "https://res.cloudinary.com/dgpmogg2w/image/upload/v1681736417/LOGO_INSP_DEF-12_uhbnni.png",
                              height: MediaQuery.of(context).size.height,
                            ),
                          )),
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
                                  controller: _nameController,
                                  autocorrect: true,
                                  decoration: const InputDecoration(
                                    label: Text('Relooker un(e)'),
                                    enabledBorder: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Veuillez entrer votre désir svp';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: _locationController,
                                  autocorrect: true,
                                  decoration: const InputDecoration(
                                    label: Text('Localisation'),
                                    hintText:
                                        'Où voulez-vous avoir votre bien ?',
                                    enabledBorder: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Veuillez entrer la localisation svp';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: _descriptionController,
                                  autocorrect: true,
                                  style: const TextStyle(color: Colors.black),
                                  decoration: const InputDecoration(
                                    labelText: 'Description',
                                    labelStyle: TextStyle(color: Colors.black),
                                    enabledBorder: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Veuillez décrire votre bien svp';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: _budgetController,
                                  keyboardType: TextInputType.phone,
                                  decoration: const InputDecoration(
                                      label: Text('Saisir votre budget'),
                                      enabledBorder: OutlineInputBorder()),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Veuillez entrer votre budget svp';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Container(
                                    height: 50,
                                    width: 300,
                                    color: Colors.red,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                      ),
                                      onPressed: _isLoading
                                          ? null
                                          : () async {
                                              setState(() {
                                                _isLoading = true;
                                              });
                                              if (_formKey.currentState !=
                                                      null &&
                                                  _formKey.currentState!
                                                      .validate()) {
                                                setState(() {
                                                  _isLoading = true;
                                                });
                                                _submitForm();
                                              }
                                              setState(() {
                                                _isLoading = false;
                                              });
                                            },
                                      child: _isLoading
                                          ? const CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      Colors.white),
                                            )
                                          : const Text(
                                              "VALIDER",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontFamily: 'beroKC',
                                              ),
                                            ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
