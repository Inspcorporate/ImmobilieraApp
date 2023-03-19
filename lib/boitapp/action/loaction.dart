import 'package:flutter/material.dart';
import 'package:misoa/boitapp/menu.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  String _selectedOption = 'Louer un(e)';
  List<String> _options = ['Louer un(e)', 'Appartement', 'Villa', 'Autres'];
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
                      padding: EdgeInsets.only(),
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
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
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
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        autocorrect: true,
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
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => Menu()),
                              // );
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
  }
}
