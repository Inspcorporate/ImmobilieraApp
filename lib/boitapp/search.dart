// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:misoa/boitapp/menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  String _propertyType = '';
  String _sizeDescription = '';
  String _budget = '';
  String _location = '';
  bool _isLoading = false;
  String talke = "";

  final String apiUrl = 'https://s-p4.com/konan/misoa/achat.php';

  Future<void> sendData() async {
    talke = "";
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final int userId = prefs.getInt("userId") ?? -1;
      var response = await http.post(Uri.parse(apiUrl), body: {
        'iduser': userId.toString(),
        'property_type': _propertyType,
        'size_description': _sizeDescription,
        'budget': _budget,
        'location': _location,
      });
      talke = response.body.toString();
      if (talke == "Les données ont été enregistrées avec succès !") {
        _showCongratulationsDialog();
      }
      print(response.body);
    } catch (err) {
      print(err);
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
            'MISOA Prend acte de votre requête et Vous recontactera.',
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Recherche'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
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
              const SizedBox(height: 20),
              TextField(
                onChanged: (value) {
                  setState(() {
                    _propertyType = value;
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Type de bien (appartement, villa, terrain)',
                ),
              ),
              const SizedBox(height: 20),
              if (_propertyType == 'appartement' || _propertyType == 'villa')
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            _sizeDescription = value;
                          });
                        },
                        decoration: const InputDecoration(
                          hintText: 'Nombre de pièces',
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            _budget = value;
                          });
                        },
                        decoration: const InputDecoration(
                          hintText: 'Budget',
                        ),
                      ),
                    ),
                  ],
                ),
              if (_propertyType == 'appartement' || _propertyType == 'villa')
                const SizedBox(height: 20),
              if (_propertyType == 'appartement' || _propertyType == 'villa')
                TextField(
                  onChanged: (value) {
                    setState(() {
                      _location = value;
                    });
                  },
                  decoration: const InputDecoration(
                    hintText: 'Localisation',
                  ),
                ),
              if (_propertyType == 'terrain')
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            _sizeDescription = value;
                          });
                        },
                        decoration: const InputDecoration(
                          hintText: 'Nombre de mètres carrés',
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            _budget = value;
                          });
                        },
                        decoration: const InputDecoration(
                          hintText: 'Budget',
                        ),
                      ),
                    ),
                  ],
                ),
              if (_propertyType == 'terrain') const SizedBox(height: 20),
              if (_propertyType == 'terrain')
                TextField(
                  onChanged: (value) {
                    setState(() {
                      _location = value;
                    });
                  },
                  decoration: const InputDecoration(
                    hintText: 'Localisation',
                  ),
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(280, 50),
                  backgroundColor: Colors.red,
                ),
                onPressed: _isLoading
                    ? null
                    : () async {
                        await sendData().then((value) {
                          setState(() {
                            _isLoading = false;
                          });
                        });
                      },
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : const Text('envoyer',
                        style: TextStyle(fontSize: 20, fontFamily: 'devKC')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
