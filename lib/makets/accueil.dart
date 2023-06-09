// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  final List<String> _localites = [
    'Bassam',
    'Angre',
    'Yopougon,',
    'Bouaké',
    'Yopougon',
    'Yakro',
    // Ajoutez d'autres localités ici
  ];
  List<String> choipmaison = [
    'Appartement',
    'Villas',
    'Terrain',
    // Ajoutez d'autres localités ici
  ];
  List<String> nombres = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];

  final Dio _dio = Dio();
  String _typeBien = '';
  String _nombreChambres = '';
  String _nombredouche = '';
  late int _prixMax;
  String _selectedLocalite = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.23,
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
                  top: 60,
                  left: 100,
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('images/vrai.png'),
                        radius: 30,
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
                ),
                Positioned(
                    bottom: 20,
                    left: 20,
                    child: Container(
                      height: 20,
                      width: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white),
                      child: const Center(
                        child: Text(
                          'Achat',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.red,
                            fontFamily: 'beroKC',
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ))
              ]),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    child: Column(
                      children: [
                        const Text(
                          'recherche Particulié',
                          style: TextStyle(
                            color: Colors.red,
                            fontFamily: 'beroKC',
                            fontSize: 25,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                              labelText: 'Type de Biens',
                              border: OutlineInputBorder()),
                          value: _typeBien.isNotEmpty ? _typeBien : null,
                          items: choipmaison.map((maisons) {
                            return DropdownMenuItem<String>(
                              value: maisons,
                              child: Text(maisons),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _typeBien = value!;
                            });
                          },
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          children: [
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                decoration: const InputDecoration(
                                    labelText: 'Nombre de Pièces',
                                    border: OutlineInputBorder()),
                                value: _nombreChambres.isNotEmpty
                                    ? _nombreChambres
                                    : null,
                                items: nombres.map((nomb) {
                                  return DropdownMenuItem<String>(
                                    value: nomb,
                                    child: Text(nomb),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _nombreChambres = value!;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(width: 16.0),
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                decoration: const InputDecoration(
                                    labelText: 'Nombre de douche',
                                    border: OutlineInputBorder()),
                                value: _nombredouche.isNotEmpty
                                    ? _nombredouche
                                    : null,
                                items: nombres.map((nomd) {
                                  return DropdownMenuItem<String>(
                                    value: nomd,
                                    child: Text(nomd),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _nombredouche = value!;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: const InputDecoration(
                                    labelText: 'Prix maximum',
                                    border: OutlineInputBorder()),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  setState(() {
                                    _prixMax = int.tryParse(value)!;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(width: 16.0),
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                decoration: const InputDecoration(
                                  labelText: 'Localisation',
                                  border: OutlineInputBorder(),
                                ),
                                value: _selectedLocalite.isNotEmpty
                                    ? _selectedLocalite
                                    : null,
                                items: _localites.map((localite) {
                                  return DropdownMenuItem<String>(
                                    value: localite,
                                    child: Text(localite),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _selectedLocalite = value!;
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(100, 60)),
                          onPressed: () {
                            _rechercherBiens();
                          },
                          child: const Text(
                            'Rechercher',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'beroKC',
                              fontSize: 25,
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
    );
  }

  void _rechercherBiens() async {
    // Effectuer une requête HTTP vers l'API PHP avec les critères de recherche
    try {
      final response = await _dio.post(
        'https://votre-api-php.com/rechercher',
        data: {
          'typeBien': _typeBien,
          'nombreChambres': _nombreChambres,
          'prixMax': _prixMax,
        },
      );

      // Vérifier le code de statut de la réponse
      if (response.statusCode == 200) {
        // Naviguer vers la page des résultats de recherche en passant les résultats de l'API
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultatsRecherchePage(
              resultats: response.data,
            ),
          ),
        );
      } else {
        // Afficher une erreur si la requête a échoué
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text('Erreur de recherche'),
            content: Text('Une erreur s\'est produite lors de la recherche.'),
          ),
        );
      }
    } catch (error) {
      // Gérer les erreurs d'exception
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Erreur de recherche'),
          content:
              Text('Une erreur s\'est produite lors de la recherche : $error'),
        ),
      );
    }
  }
}

class ResultatsRecherchePage extends StatelessWidget {
  final List<dynamic> resultats;

  ResultatsRecherchePage({
    required this.resultats,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Résultats de recherche'),
      ),
      body: ListView.builder(
        itemCount: resultats.length,
        itemBuilder: (context, index) {
          final bien = resultats[index];
          return ListTile(
            title: Text(bien['titre']),
            subtitle: Text(bien['description']),
// Afficher d'autres détails du bien ici
          );
        },
      ),
    );
  }
}
