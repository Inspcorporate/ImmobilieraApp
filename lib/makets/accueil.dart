import 'package:flutter/material.dart';
import 'package:misoa/boitapp/search.dart';
import 'package:misoa/identic/mybtn.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  int _selectedItem = 0;
  int _selectedMode = 0;

  final List<String> _villes = [
    'Cocody',
    'Abobo',
    'Yopougon',
    'Macory',
    'Yakro',
    'Bassam',
    'San Pedro',
    'Angre',
    'Daoukro',
    'Bingeville',
    'Bouake',
    'Koumassi',
    'Plateau',
    'Adjame',
    'Port-Bouet',
    'Ayaman',
    'Vridi',
    'Dabou',
  ];

  // Les 12 premières villes à afficher par défaut
  List<String> _villesAffichees = [];

  // Le nombre de villes supplémentaires à afficher

  @override
  void initState() {
    super.initState();
    // On ajoute les 12 premières villes à la liste affichée par défaut
    _villesAffichees = List<String>.from(_villes.take(15));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
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
            GestureDetector(
              onTap: () {
                // Naviguer vers une autre page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyPage()),
                );
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 10),
                    Text('Rechercher...'),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 255, 255, 255)
                            .withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    border: Border.all(
                        width: 1,
                        color: const Color.fromARGB(255, 204, 201, 201)),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _selectedMode = 1; // update selected item
                                });
                              },
                              child: Row(children: [
                                Image(
                                  image: const AssetImage('images/rel.png'),
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'relooking',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: _selectedMode == 1
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                        color: _selectedMode == 1
                                            ? Colors.red
                                            : Colors.grey,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.25,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                      decoration: BoxDecoration(
                                          color: _selectedMode == 1
                                              ? const Color.fromARGB(
                                                  255, 241, 107, 97)
                                              : Color.fromARGB(
                                                  8, 236, 236, 236)),
                                    )
                                  ],
                                )
                              ]),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                setState(
                                  () {
                                    _selectedMode = 2; // update selected item
                                  },
                                );
                              },
                              child: Row(
                                children: [
                                  Image(
                                    image: const AssetImage('images/loc.png'),
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    width: MediaQuery.of(context).size.width *
                                        0.05,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'location',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: _selectedMode == 2
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                          color: _selectedMode == 2
                                              ? const Color.fromARGB(
                                                  255, 255, 131, 122)
                                              : Colors.grey,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.25,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.01,
                                        decoration: BoxDecoration(
                                            color: _selectedMode == 2
                                                ? const Color.fromARGB(
                                                    255, 255, 129, 120)
                                                : Color.fromARGB(
                                                    8, 236, 236, 236)),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                setState(
                                  () {
                                    _selectedMode = 3; // update selected item
                                  },
                                );
                              },
                              child: Row(
                                children: [
                                  Image(
                                    image: const AssetImage('images/ach.png'),
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    width: MediaQuery.of(context).size.width *
                                        0.05,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'achat',
                                        style: TextStyle(
                                          color: _selectedMode == 3
                                              ? Colors.red
                                              : Colors.grey,
                                          fontSize: 20,
                                          fontWeight: _selectedMode == 3
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.01,
                                        decoration: BoxDecoration(
                                            color: _selectedMode == 3
                                                ? Colors.red
                                                : Color.fromARGB(
                                                    7, 255, 255, 255)),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey[300],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: MediaQuery.of(context).size.width * 0.3,
                              decoration: BoxDecoration(
                                  borderRadius: _selectedItem == 1
                                      ? BorderRadius.circular(20)
                                      : BorderRadius.circular(0),
                                  color: _selectedItem == 1
                                      ? Color.fromARGB(255, 247, 220, 218)
                                      : Colors.white),
                              child: InkWell(
                                onTap: () {
                                  setState(
                                    () {
                                      _selectedItem = 1;
                                    },
                                  );
                                },
                                child: Center(
                                  child: Text(
                                    'Appartements',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: _selectedItem == 1
                                          ? const Color.fromARGB(255, 253, 0, 0)
                                          : Colors.black54,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width * 0.2,
                              decoration: BoxDecoration(
                                  borderRadius: _selectedItem == 2
                                      ? BorderRadius.circular(20)
                                      : BorderRadius.circular(0),
                                  color: _selectedItem == 2
                                      ? Color.fromARGB(255, 247, 220, 218)
                                      : Colors.white),
                              child: InkWell(
                                onTap: () {
                                  setState(
                                    () {
                                      _selectedItem = 2;
                                    },
                                  );
                                },
                                child: Center(
                                  child: Text(
                                    'Villas',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: _selectedItem == 2
                                          ? const Color.fromARGB(255, 253, 0, 0)
                                          : Colors.black54,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width * 0.2,
                              decoration: BoxDecoration(
                                  borderRadius: _selectedItem == 3
                                      ? BorderRadius.circular(20)
                                      : BorderRadius.circular(0),
                                  color: _selectedItem == 3
                                      ? const Color.fromARGB(255, 247, 220, 218)
                                      : Colors.white),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    _selectedItem = 3;
                                  });
                                },
                                child: Center(
                                  child: Text(
                                    'Terrain',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: _selectedItem == 3
                                          ? const Color.fromARGB(255, 253, 0, 0)
                                          : Colors.black54,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: const Color.fromARGB(255, 169, 169, 169),
                          ),
                        ),
                        child: Expanded(
                          child: GridView.count(
                            crossAxisCount: 3,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 10,
                            childAspectRatio: 2,
                            children: _villesAffichees.map((city) {
                              return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Villechoisie(ville: city)),
                                    );
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(city),
                                    ),
                                  ));
                            }).toList(),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
